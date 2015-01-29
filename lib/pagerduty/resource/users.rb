module PagerDuty
  module Resource
    class Users < PagerDuty::Full
      def list_users(query = nil, include_details = nil)
        api_call("users", {
            query: query,
            include: include_details,
        })
      end

      def get_user(id, include_details = nil)
        api_call("users/#{id}", {
            include: include_details,
        })
      end

      def get_user_on_call(id, include_details = nil)
        api_call("users/#{id}/on_call", {
            include: include_details,
        })
      end

      def create_user(name, email, role = nil, job_title = nil, time_zone = nil, requester_id = nil)
        post_api_call("users", {
            name: name,
            email: email,
            role: role,
            job_title: job_title,
            time_zone: time_zone,
            requester_id: requester_id,
        })
      end

      def update_user(id, name = nil, email = nil, role = nil, job_title = nil, time_zone = nil)
        put_api_call("users/#{id}", {
            name: name,
            email: email,
            role: role,
            job_title: job_title,
            time_zone: time_zone,
        })
      end

      def remove_user(id)
        delete_api_call("users/#{id}")
      end
    end
  end
end
