# DatadogAPIClient::V1::FreeTextWidgetDefinition

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**color** | **String** | Color of the text. | [optional] 
**font_size** | **String** | Size of the text. | [optional] 
**text** | **String** | Text to display. | 
**text_align** | [**WidgetTextAlign**](WidgetTextAlign.md) |  | [optional] 
**type** | [**FreeTextWidgetDefinitionType**](FreeTextWidgetDefinitionType.md) |  | 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::FreeTextWidgetDefinition.new(color: null,
                                 font_size: null,
                                 text: null,
                                 text_align: null,
                                 type: null)
```

