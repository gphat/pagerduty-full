require 'json'
require 'net/http'
require 'uri'
require 'openssl'

module PagerDuty
  class Full

    attr_reader :apikey, :subdomain

    def initialize(apikey, subdomain)
      @apikey = apikey
      @subdomain = subdomain
    end

    def api_call(path, params)

      uri = URI.parse("https://#{@subdomain}.pagerduty.com/api/v1/#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      finished = false
      whole_output = {}
      while (!finished)
        output = []
        params.each_pair do |key,val|
          if (!val.nil?)
            output << "#{URI.encode(key.to_s)}=#{URI.encode(val.to_s)}"
          end
        end
        uri.query = "#{output.join("&")}"
        req = Net::HTTP::Get.new(uri.request_uri)

        res = http.get(uri.to_s, {
            'Content-type'  => 'application/json',
            'Authorization' => "Token token=#{@apikey}"
        })

        case res
          when Net::HTTPSuccess
            output = JSON.parse(res.body)
            whole_output.each_key do |key|
              if (key != "limit" and key != "offset" and key != "total")
                if (output.has_key?(key))
                  output[key].each do |o|
                    whole_output[key].push(o)
                  end
                end
              end
            end
            whole_output = output if (whole_output.empty?)
          else
            finished = true
            res.error!
        end

        if (!output["limit"].nil? and !output["offset"].nil? and !output["total"].nil?)
          if (output["offset"] + output["limit"] < output["total"])
            params["limit"] = 100
            params["offset"] = output["offset"] + output["limit"]
          else
            finished = true
          end
        else
          finished = true
        end
      end
      whole_output
    end

    def Incident()
      PagerDuty::Resource::Incident.new(@apikey, @subdomain)
    end

    def Schedule()
      PagerDuty::Resource::Schedule.new(@apikey, @subdomain)
    end

    def Escalation()
      PagerDuty::Resource::Escalation.new(@apikey, @subdomain)
    end
  end
end
