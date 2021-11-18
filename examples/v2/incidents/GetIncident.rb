# Get the details of an incident returns "OK" response

require 'datadog_api_client'
api_instance = DatadogAPIClient::V2::IncidentsAPI.new

# there is a valid "incident" in the system
INCIDENT_DATA_ID = ENV["INCIDENT_DATA_ID"]
p api_instance.get_incident(INCIDENT_DATA_ID)