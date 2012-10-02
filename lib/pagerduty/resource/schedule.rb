module PagerDuty
  module Resource

    class Schedule < PagerDuty::Full

      def search(query = nil, requester_id = nil)
        res = api_call("schedules", {
          :query => query,
          :requester_id => requester_id
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