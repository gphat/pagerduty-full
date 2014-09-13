module PagerDuty
  module Resource

    class Service < PagerDuty::Full

      def find(id)
        api_call("services/#{id}", {})
      end

      def search
        api_call("services", {:limit => 100})
      end
    end
  end
end
