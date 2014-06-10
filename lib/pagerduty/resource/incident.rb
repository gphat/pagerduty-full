module PagerDuty
  module Resource

    class Incident < PagerDuty::Full

      def count(
          assigned_to_user = nil, incident_key = nil, status = nil, service = nil,
              since_date = nil, sort_by = nil, until_date = nil
      )
        api_call("incidents/count", {
            :assigned_to_user => assigned_to_user,
            :incident_key => incident_key,
            :service  => service,
            :since    => since_date,
            :sort_by  => sort_by,
            :status   => status,
            :until    => until_date,
        })
      end

      def search(
          assigned_to_user = nil, incident_key = nil, status = nil, service = nil,
              since_date = nil, sort_by = nil, until_date = nil
      )
        api_call("incidents", {
            :assigned_to_user => assigned_to_user,
            :incident_key => incident_key,
            :service  => service,
            :since    => since_date,
            :sort_by  => sort_by,
            :status   => status,
            :until    => until_date,
        })
      end


      def create(service_key,description,incident_key = nil,client = nil, client_url = nil, details = nil)
        json = {
            "service_key" => service_key,
            "event_type" => "trigger",
            "description" => description,
        }
        json.merge!({"client" => client}) if !client.nil?
        json.merge!({"incident_key" => incident_key}) if !incident_key.nil?
        json.merge!({"client_url" => client_url}) if !client_url.nil?
        json.merge!({"details" => details}) if !details.nil?
        integration_api_call(json)
      end

      def notes(id)
        api_call("incidents/#{id}/notes", {})
      end

    end
  end
end