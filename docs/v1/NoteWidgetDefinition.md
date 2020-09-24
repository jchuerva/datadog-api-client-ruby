# DatadogAPIClient::V1::NoteWidgetDefinition

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**background_color** | **String** | Background color of the note. | [optional] 
**content** | **String** | Content of the note. | 
**font_size** | **String** | Size of the text. | [optional] 
**show_tick** | **Boolean** | Whether to show a tick or not. | [optional] 
**text_align** | [**WidgetTextAlign**](WidgetTextAlign.md) |  | [optional] 
**tick_edge** | [**WidgetTickEdge**](WidgetTickEdge.md) |  | [optional] 
**tick_pos** | **String** | Where to position the tick on an edge. | [optional] 
**type** | [**NoteWidgetDefinitionType**](NoteWidgetDefinitionType.md) |  | 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::NoteWidgetDefinition.new(background_color: null,
                                 content: null,
                                 font_size: null,
                                 show_tick: null,
                                 text_align: null,
                                 tick_edge: null,
                                 tick_pos: null,
                                 type: null)
```

