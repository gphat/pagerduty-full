module PagerDuty
  module Resource

    class Incident < PagerDuty::Full

      def search(status = nil, service = nil, since_date = nil, until_date = nil)
        res = api_call("incidents", {
          :service  => service,
          :since    => since_date,
          :status   => status,
          :until    => until_date,
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