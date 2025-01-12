# DatadogAPIClient::V2::LogsArchiveDestinationGCS

## Properties

| Name            | Type                                                                  | Description                                  | Notes                      |
| --------------- | --------------------------------------------------------------------- | -------------------------------------------- | -------------------------- |
| **bucket**      | **String**                                                            | The bucket where the archive will be stored. |                            |
| **integration** | [**LogsArchiveIntegrationGCS**](LogsArchiveIntegrationGCS.md)         |                                              |                            |
| **path**        | **String**                                                            | The archive path.                            | [optional]                 |
| **type**        | [**LogsArchiveDestinationGCSType**](LogsArchiveDestinationGCSType.md) |                                              | [default to &#39;gcs&#39;] |

## Example

```ruby
require 'datadog_api_client/v2'

instance = DatadogAPIClient::V2::LogsArchiveDestinationGCS.new(
  bucket: bucket-name,
  integration: null,
  path: null,
  type: null
)
```
