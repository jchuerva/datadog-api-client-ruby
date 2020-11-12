# DatadogAPIClient::V1::SLOHistoryResponse

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | [**SLOHistoryResponseData**](SLOHistoryResponseData.md) |  | [optional] 
**errors** | [**Array&lt;SLOHistoryResponseError&gt;**](SLOHistoryResponseError.md) | A list of errors while querying the history data for the service level objective. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::SLOHistoryResponse.new(data: null,
                                 errors: null)
```

