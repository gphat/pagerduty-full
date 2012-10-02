module PagerDuty
  module Resource

    class Schedule < PagerDuty::Full

      def find(id, since_date = nil, until_date = nil)
        res = api_call("schedules/#{id}", {
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

      def users(id, since_date = nil, until_date = nil)
        res = api_call("schedules/#{id}/users", {
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