# DatadogAPIClient::V2::UserCreateData

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**attributes** | [**UserCreateAttributes**](UserCreateAttributes.md) |  | 
**relationships** | [**UserRelationships**](UserRelationships.md) |  | [optional] 
**type** | [**UsersType**](UsersType.md) |  | [default to &#39;users&#39;]

## Code Sample

```ruby
require 'DatadogAPIClient::V2'

instance = DatadogAPIClient::V2::UserCreateData.new(attributes: null,
                                 relationships: null,
                                 type: null)
```

