module PagerDuty
  module Resource

    class Escalation < PagerDuty::Full

      def list_policies(query = nil)
        api_call("escalation_policies/on_call", {
            query: query
        })
      end

      def policy_details(id, query = nil, requester_id = nil)
        api_call("escalation_policies/#{id}")
      end
    end
  end
end