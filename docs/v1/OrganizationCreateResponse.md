# DatadogAPIClient::V1::OrganizationCreateResponse

## Properties

| Name                | Type                                    | Description | Notes      |
| ------------------- | --------------------------------------- | ----------- | ---------- |
| **api_key**         | [**ApiKey**](ApiKey.md)                 |             | [optional] |
| **application_key** | [**ApplicationKey**](ApplicationKey.md) |             | [optional] |
| **org**             | [**Organization**](Organization.md)     |             | [optional] |
| **user**            | [**User**](User.md)                     |             | [optional] |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::OrganizationCreateResponse.new(
  api_key: null,
  application_key: null,
  org: null,
  user: null
)
```
