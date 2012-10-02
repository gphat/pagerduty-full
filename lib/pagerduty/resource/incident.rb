module PagerDuty
  module Resource

    class Incident < PagerDuty::Full

      def search(since_date = nil, until_date = nil)
        res = api_call("incidents", {
          :since => since_date,
          :until => until_date
        })
        case res
        when Net::HTTPSuccess
          JSON.parse(res.body)
        else
          res.error!
        end
      end
    end
  end
end