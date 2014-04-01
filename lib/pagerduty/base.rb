require 'json'
require 'net/http'
require 'uri'

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

      # This is probably stupid
      query_string = ""
      params.each do |key, val|
        next unless val != nil
        query_string << '&' unless key == params.keys.first
        query_string << "#{URI.encode(key.to_s)}=#{URI.encode(params[key])}"
      end
      uri.query = query_string

      req = Net::HTTP::Get.new(uri.request_uri)

      res = http.get(uri.to_s, {
        'Content-type'  => 'application/json',
        'Authorization' => "Token token=#{@apikey}"
      })
    end

    def Incident()
      PagerDuty::Resource::Incident.new(@apikey, @subdomain)
    end

    def Schedule()
      PagerDuty::Resource::Schedule.new(@apikey, @subdomain)
    end
  end
end
