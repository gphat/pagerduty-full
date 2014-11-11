module PagerDuty
  module Resource

    class Schedule < PagerDuty::Full

      def entries(id, since_date = nil, until_date = nil, overflow = false)
        api_call("schedules/#{id}/entries", {
         :since => since_date,
         :until => until_date,
         :overflow => (overflow ? "true" : "false")
        })
      end

      def find(id, since_date = nil, until_date = nil)
        api_call("schedules/#{id}", {
            :since => since_date,
            :until => until_date
        })
      end

      def search(query = nil, requester_id = nil)
        api_call("schedules", {
            :query => query,
            :requester_id => requester_id
        })
      end

      def users(id, since_date = nil, until_date = nil)
        api_call("schedules/#{id}/users", {
            :since => since_date,
            :until => until_date
        })
      end
    end
  end
end
