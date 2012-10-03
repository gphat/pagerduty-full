module PagerDuty
  module Resource

    class Incident < PagerDuty::Full

      def search(
        assigned_to_user = nil, incident_key = nil, status = nil, service = nil,
        since_date = nil, until_date = nil
      )
        res = api_call("incidents", {
          :assigned_to_user => assigned_to_user,
          :incident_key => incident_key,
          :service  => service,
          :since    => since_date,
          :sort_by  => sort_by,
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