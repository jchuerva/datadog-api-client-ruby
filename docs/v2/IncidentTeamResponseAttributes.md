# DatadogAPIClient::V2::IncidentTeamResponseAttributes

## Properties

| Name         | Type       | Description                                       | Notes                |
| ------------ | ---------- | ------------------------------------------------- | -------------------- |
| **created**  | **Time**   | Timestamp of when the incident team was created.  | [optional][readonly] |
| **modified** | **Time**   | Timestamp of when the incident team was modified. | [optional][readonly] |
| **name**     | **String** | Name of the incident team.                        | [optional]           |

## Example

```ruby
require 'datadog_api_client/v2'

instance = DatadogAPIClient::V2::IncidentTeamResponseAttributes.new(
  created: null,
  modified: null,
  name: team name
)
```
