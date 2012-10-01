require 'rubygems'
require 'json'
require 'net/http'

module PagerDuty
  class Full

    attr_reader :apikey, :subdomain

    def initialize(apikey, subdomain)
      @apikey = apikey
      @subdomain = subdomain
    end

    def api_call(path)

      url = URI.parse("http://#{@subdomain}.pagerduty.com/api/v1/#{path}")
      http = Net::HTTP.new(url.host, url.port)

      puts(url.to_s)
      res = http.get(url.to_s, {
        'Content-type'  => 'application/json',
        'Authorization' => "Token token=#{@apikey}"
      })

      res
    end

    def get_incidents()
      res = api_call("incidents")
      puts(res.body)
      case res
      when Net::HTTPSuccess
        JSON.parse(res.body)
      else
        res.error!
      end
    end
  end
end