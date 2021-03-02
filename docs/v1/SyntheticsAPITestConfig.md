# DatadogAPIClient::V1::SyntheticsAPITestConfig

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assertions** | [**Array&lt;SyntheticsAssertion&gt;**](SyntheticsAssertion.md) | Array of assertions used for the test. |  |
| **config_variables** | [**Array&lt;SyntheticsConfigVariable&gt;**](SyntheticsConfigVariable.md) | Array of variables used for the test. | [optional] |
| **request** | [**SyntheticsTestRequest**](SyntheticsTestRequest.md) |  |  |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::SyntheticsAPITestConfig.new(
  assertions: [],
  config_variables: null,
  request: null
)
```
