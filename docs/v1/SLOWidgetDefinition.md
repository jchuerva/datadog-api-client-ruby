# DatadogAPIClient::V1::SLOWidgetDefinition

## Properties

| Name                   | Type                                                       | Description                           | Notes                         |
| ---------------------- | ---------------------------------------------------------- | ------------------------------------- | ----------------------------- |
| **global_time_target** | **String**                                                 | Defined global time target.           | [optional]                    |
| **show_error_budget**  | **Boolean**                                                | Defined error budget.                 | [optional]                    |
| **slo_id**             | **String**                                                 | ID of the SLO displayed.              | [optional]                    |
| **time_windows**       | [**Array&lt;WidgetTimeWindows&gt;**](WidgetTimeWindows.md) | Times being monitored.                | [optional]                    |
| **title**              | **String**                                                 | Title of the widget.                  | [optional]                    |
| **title_align**        | [**WidgetTextAlign**](WidgetTextAlign.md)                  |                                       | [optional]                    |
| **title_size**         | **String**                                                 | Size of the title.                    | [optional]                    |
| **type**               | [**SLOWidgetDefinitionType**](SLOWidgetDefinitionType.md)  |                                       | [default to &#39;slo&#39;]    |
| **view_mode**          | [**WidgetViewMode**](WidgetViewMode.md)                    |                                       | [optional]                    |
| **view_type**          | **String**                                                 | Type of view displayed by the widget. | [default to &#39;detail&#39;] |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::SLOWidgetDefinition.new(
  global_time_target: null,
  show_error_budget: null,
  slo_id: null,
  time_windows: null,
  title: null,
  title_align: null,
  title_size: null,
  type: null,
  view_mode: null,
  view_type: detail
)
```
