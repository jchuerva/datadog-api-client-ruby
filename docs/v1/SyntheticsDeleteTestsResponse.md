# DatadogAPIClient::V1::SyntheticsDeleteTestsResponse

## Properties

| Name              | Type                                                               | Description                                                                                     | Notes      |
| ----------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ---------- |
| **deleted_tests** | [**Array&lt;SyntheticsDeletedTest&gt;**](SyntheticsDeletedTest.md) | Array of objects containing a deleted Synthetic test ID with the associated deletion timestamp. | [optional] |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::SyntheticsDeleteTestsResponse.new(
  deleted_tests: null
)
```
