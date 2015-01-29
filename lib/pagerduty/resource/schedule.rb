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

      def list_overrides(id, since_date = nil, until_date = nil, editable = false, overflow = false)
        api_call("schedules/#{id}/overrides", {
            :since => since_date,
            :until => until_date,
            :editable => (editable ? "true" : "false"),
            :overflow => (overflow ? "true" : "false"),
        })
      end

      def create_override(id, start_date = nil, end_date = nil, user_id = nil)
        post_api_call("schedules/#{id}/overrides", {
            :start => start_date,
            :end => end_date,
            :user_id => user_id,
        })
      end

      def remove_override(id, override_id)
        delete_api_call("schedules/#{id}/overrides/#{override_id}")
      end
    end
  end
end
