=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'cgi'

module DatadogAPIClient::V1
  class MonitorsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Check if a monitor can be deleted
    # Check if the given monitors can be deleted.
    # @param monitor_ids [Array<Integer>] The IDs of the monitor to check.
    # @param [Hash] opts the optional parameters
    # @return [CheckCanDeleteMonitorResponse]
    def check_can_delete_monitor(monitor_ids, opts = {})
      data, _status_code, _headers = check_can_delete_monitor_with_http_info(monitor_ids, opts)
      data
    end

    # Check if a monitor can be deleted
    # Check if the given monitors can be deleted.
    # @param monitor_ids [Array<Integer>] The IDs of the monitor to check.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CheckCanDeleteMonitorResponse, Integer, Hash)>] CheckCanDeleteMonitorResponse data, response status code and response headers
    def check_can_delete_monitor_with_http_info(monitor_ids, opts = {})

      if @api_client.config.unstable_operations.has_key?(:check_can_delete_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:check_can_delete_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "check_can_delete_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "check_can_delete_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.check_can_delete_monitor ...'
      end
      # verify the required parameter 'monitor_ids' is set
      if @api_client.config.client_side_validation && monitor_ids.nil?
        fail ArgumentError, "Missing the required parameter 'monitor_ids' when calling MonitorsApi.check_can_delete_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor/can_delete'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'monitor_ids'] = @api_client.build_collection_param(monitor_ids, :multi)

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CheckCanDeleteMonitorResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.check_can_delete_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#check_can_delete_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a monitor
    # Create a monitor using the specified options.  #### Monitor Types  The type of monitor chosen from:  - anomaly: `query alert` - APM: `query alert` or `trace-analytics alert` - composite: `composite` - custom: `service check` - event: `event alert` - forecast: `query alert` - host: `service check` - integration: `query alert` or `service check` - live process: `process alert` - logs: `log alert` - metric: `metric alert` - network: `service check` - outlier: `query alert` - process: `service check` - rum: `rum alert` - watchdog: `event alert`  #### Query Types  **Metric Alert Query**  Example: `time_aggr(time_window):space_aggr:metric{tags} [by {key}] operator #`  - `time_aggr`: avg, sum, max, min, change, or pct_change - `time_window`: `last_#m` (with `#` between 1 and 2880 depending on the monitor type) or `last_#h`(with `#` between 1 and 48 depending on the monitor type), or `last_1d` - `space_aggr`: avg, sum, min, or max - `tags`: one or more tags (comma-separated), or * - `key`: a 'key' in key:value tag syntax; defines a separate alert for each tag in the group (multi-alert) - `operator`: <, <=, >, >=, ==, or != - `#`: an integer or decimal number used to set the threshold  If you are using the `_change_` or `_pct_change_` time aggregator, instead use `change_aggr(time_aggr(time_window), timeshift):space_aggr:metric{tags} [by {key}] operator #` with:  - `change_aggr` change, pct_change - `time_aggr` avg, sum, max, min [Learn more](https://docs.datadoghq.com/monitors/monitor_types/#define-the-conditions) - `time_window` last\\_#m (between 1 and 2880 depending on the monitor type), last\\_#h (between 1 and 48 depending on the monitor type), or last_#d (1 or 2) - `timeshift` #m_ago (5, 10, 15, or 30), #h_ago (1, 2, or 4), or 1d_ago  Use this to create an outlier monitor using the following query: `avg(last_30m):outliers(avg:system.cpu.user{role:es-events-data} by {host}, 'dbscan', 7) > 0`  **Service Check Query**  Example: `\"check\".over(tags).last(count).count_by_status()`  - **`check`** name of the check, e.g. `datadog.agent.up` - **`tags`** one or more quoted tags (comma-separated), or \"*\". e.g.: `.over(\"env:prod\", \"role:db\")` - **`count`** must be at >= your max threshold (defined in the `options`). e.g. if you want to notify on 1 critical, 3 ok and 2 warn statuses count should be 3. It is limited to 100.  **Event Alert Query**  Example: `events('sources:nagios status:error,warning priority:normal tags: \"string query\"').rollup(\"count\").last(\"1h\")\"`  - **`event`**, the event query string: - **`string_query`** free text query to match against event title and text. - **`sources`** event sources (comma-separated). - **`status`** event statuses (comma-separated). Valid options: error, warn, and info. - **`priority`** event priorities (comma-separated). Valid options: low, normal, all. - **`host`** event reporting host (comma-separated). - **`tags`** event tags (comma-separated). - **`excluded_tags`** excluded event tags (comma-separated). - **`rollup`** the stats roll-up method. `count` is the only supported method now. - **`last`** the timeframe to roll up the counts. Examples: 45m, 4h. Supported timeframes: m, h and d. This value should not exceed 48 hours.  **Process Alert Query**  Example: `processes(search).over(tags).rollup('count').last(timeframe) operator #`  - **`search`** free text search string for querying processes. Matching processes match results on the [Live Processes](https://docs.datadoghq.com/infrastructure/process/?tab=linuxwindows) page. - **`tags`** one or more tags (comma-separated) - **`timeframe`** the timeframe to roll up the counts. Examples: 10m, 4h. Supported timeframes: s, m, h and d - **`operator`** <, <=, >, >=, ==, or != - **`#`** an integer or decimal number used to set the threshold  **Logs Alert Query**  Example: `logs(query).index(index_name).rollup(rollup_method[, measure]).last(time_window) operator #`  - **`query`** The search query - following the [Log search syntax](https://docs.datadoghq.com/logs/search_syntax/). - **`index_name`** For multi-index organizations, the log index in which the request is performed. - **`rollup_method`** The stats roll-up method - supports `count`, `avg` and `cardinality`. - **`measure`** For `avg` and cardinality `rollup_method` - specify the measure or the facet name you want to use. - **`time_window`** #m (between 1 and 2880), #h (between 1 and 48) - **`operator`** `<`, `<=`, `>`, `>=`, `==`, or `!=`. - **`#`** an integer or decimal number used to set the threshold.  **Composite Query**  Example: `12345 && 67890`, where `12345` and `67890` are the IDs of non-composite monitors  * **`name`** [*required*, *default* = **dynamic, based on query**]: The name of the alert. * **`message`** [*required*, *default* = **dynamic, based on query**]: A message to include with notifications for this monitor. Email notifications can be sent to specific users by using the same '@username' notation as events. * **`tags`** [*optional*, *default* = **empty list**]: A list of tags to associate with your monitor. When getting all monitor details via the API, use the `monitor_tags` argument to filter results by these tags. It is only available via the API and isn't visible or editable in the Datadog UI.
    # @param body [Monitor] Create a monitor request body.
    # @param [Hash] opts the optional parameters
    # @return [Monitor]
    def create_monitor(body, opts = {})
      data, _status_code, _headers = create_monitor_with_http_info(body, opts)
      data
    end

    # Create a monitor
    # Create a monitor using the specified options.  #### Monitor Types  The type of monitor chosen from:  - anomaly: &#x60;query alert&#x60; - APM: &#x60;query alert&#x60; or &#x60;trace-analytics alert&#x60; - composite: &#x60;composite&#x60; - custom: &#x60;service check&#x60; - event: &#x60;event alert&#x60; - forecast: &#x60;query alert&#x60; - host: &#x60;service check&#x60; - integration: &#x60;query alert&#x60; or &#x60;service check&#x60; - live process: &#x60;process alert&#x60; - logs: &#x60;log alert&#x60; - metric: &#x60;metric alert&#x60; - network: &#x60;service check&#x60; - outlier: &#x60;query alert&#x60; - process: &#x60;service check&#x60; - rum: &#x60;rum alert&#x60; - watchdog: &#x60;event alert&#x60;  #### Query Types  **Metric Alert Query**  Example: &#x60;time_aggr(time_window):space_aggr:metric{tags} [by {key}] operator #&#x60;  - &#x60;time_aggr&#x60;: avg, sum, max, min, change, or pct_change - &#x60;time_window&#x60;: &#x60;last_#m&#x60; (with &#x60;#&#x60; between 1 and 2880 depending on the monitor type) or &#x60;last_#h&#x60;(with &#x60;#&#x60; between 1 and 48 depending on the monitor type), or &#x60;last_1d&#x60; - &#x60;space_aggr&#x60;: avg, sum, min, or max - &#x60;tags&#x60;: one or more tags (comma-separated), or * - &#x60;key&#x60;: a &#39;key&#39; in key:value tag syntax; defines a separate alert for each tag in the group (multi-alert) - &#x60;operator&#x60;: &lt;, &lt;&#x3D;, &gt;, &gt;&#x3D;, &#x3D;&#x3D;, or !&#x3D; - &#x60;#&#x60;: an integer or decimal number used to set the threshold  If you are using the &#x60;_change_&#x60; or &#x60;_pct_change_&#x60; time aggregator, instead use &#x60;change_aggr(time_aggr(time_window), timeshift):space_aggr:metric{tags} [by {key}] operator #&#x60; with:  - &#x60;change_aggr&#x60; change, pct_change - &#x60;time_aggr&#x60; avg, sum, max, min [Learn more](https://docs.datadoghq.com/monitors/monitor_types/#define-the-conditions) - &#x60;time_window&#x60; last\\_#m (between 1 and 2880 depending on the monitor type), last\\_#h (between 1 and 48 depending on the monitor type), or last_#d (1 or 2) - &#x60;timeshift&#x60; #m_ago (5, 10, 15, or 30), #h_ago (1, 2, or 4), or 1d_ago  Use this to create an outlier monitor using the following query: &#x60;avg(last_30m):outliers(avg:system.cpu.user{role:es-events-data} by {host}, &#39;dbscan&#39;, 7) &gt; 0&#x60;  **Service Check Query**  Example: &#x60;\&quot;check\&quot;.over(tags).last(count).count_by_status()&#x60;  - **&#x60;check&#x60;** name of the check, e.g. &#x60;datadog.agent.up&#x60; - **&#x60;tags&#x60;** one or more quoted tags (comma-separated), or \&quot;*\&quot;. e.g.: &#x60;.over(\&quot;env:prod\&quot;, \&quot;role:db\&quot;)&#x60; - **&#x60;count&#x60;** must be at &gt;&#x3D; your max threshold (defined in the &#x60;options&#x60;). e.g. if you want to notify on 1 critical, 3 ok and 2 warn statuses count should be 3. It is limited to 100.  **Event Alert Query**  Example: &#x60;events(&#39;sources:nagios status:error,warning priority:normal tags: \&quot;string query\&quot;&#39;).rollup(\&quot;count\&quot;).last(\&quot;1h\&quot;)\&quot;&#x60;  - **&#x60;event&#x60;**, the event query string: - **&#x60;string_query&#x60;** free text query to match against event title and text. - **&#x60;sources&#x60;** event sources (comma-separated). - **&#x60;status&#x60;** event statuses (comma-separated). Valid options: error, warn, and info. - **&#x60;priority&#x60;** event priorities (comma-separated). Valid options: low, normal, all. - **&#x60;host&#x60;** event reporting host (comma-separated). - **&#x60;tags&#x60;** event tags (comma-separated). - **&#x60;excluded_tags&#x60;** excluded event tags (comma-separated). - **&#x60;rollup&#x60;** the stats roll-up method. &#x60;count&#x60; is the only supported method now. - **&#x60;last&#x60;** the timeframe to roll up the counts. Examples: 45m, 4h. Supported timeframes: m, h and d. This value should not exceed 48 hours.  **Process Alert Query**  Example: &#x60;processes(search).over(tags).rollup(&#39;count&#39;).last(timeframe) operator #&#x60;  - **&#x60;search&#x60;** free text search string for querying processes. Matching processes match results on the [Live Processes](https://docs.datadoghq.com/infrastructure/process/?tab&#x3D;linuxwindows) page. - **&#x60;tags&#x60;** one or more tags (comma-separated) - **&#x60;timeframe&#x60;** the timeframe to roll up the counts. Examples: 10m, 4h. Supported timeframes: s, m, h and d - **&#x60;operator&#x60;** &lt;, &lt;&#x3D;, &gt;, &gt;&#x3D;, &#x3D;&#x3D;, or !&#x3D; - **&#x60;#&#x60;** an integer or decimal number used to set the threshold  **Logs Alert Query**  Example: &#x60;logs(query).index(index_name).rollup(rollup_method[, measure]).last(time_window) operator #&#x60;  - **&#x60;query&#x60;** The search query - following the [Log search syntax](https://docs.datadoghq.com/logs/search_syntax/). - **&#x60;index_name&#x60;** For multi-index organizations, the log index in which the request is performed. - **&#x60;rollup_method&#x60;** The stats roll-up method - supports &#x60;count&#x60;, &#x60;avg&#x60; and &#x60;cardinality&#x60;. - **&#x60;measure&#x60;** For &#x60;avg&#x60; and cardinality &#x60;rollup_method&#x60; - specify the measure or the facet name you want to use. - **&#x60;time_window&#x60;** #m (between 1 and 2880), #h (between 1 and 48) - **&#x60;operator&#x60;** &#x60;&lt;&#x60;, &#x60;&lt;&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;&gt;&#x3D;&#x60;, &#x60;&#x3D;&#x3D;&#x60;, or &#x60;!&#x3D;&#x60;. - **&#x60;#&#x60;** an integer or decimal number used to set the threshold.  **Composite Query**  Example: &#x60;12345 &amp;&amp; 67890&#x60;, where &#x60;12345&#x60; and &#x60;67890&#x60; are the IDs of non-composite monitors  * **&#x60;name&#x60;** [*required*, *default* &#x3D; **dynamic, based on query**]: The name of the alert. * **&#x60;message&#x60;** [*required*, *default* &#x3D; **dynamic, based on query**]: A message to include with notifications for this monitor. Email notifications can be sent to specific users by using the same &#39;@username&#39; notation as events. * **&#x60;tags&#x60;** [*optional*, *default* &#x3D; **empty list**]: A list of tags to associate with your monitor. When getting all monitor details via the API, use the &#x60;monitor_tags&#x60; argument to filter results by these tags. It is only available via the API and isn&#39;t visible or editable in the Datadog UI.
    # @param body [Monitor] Create a monitor request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Monitor, Integer, Hash)>] Monitor data, response status code and response headers
    def create_monitor_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:create_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:create_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "create_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "create_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.create_monitor ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MonitorsApi.create_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'Monitor'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.create_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#create_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a monitor
    # Delete the specified monitor
    # @param monitor_id [Integer] The ID of the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :force Delete the monitor even if it&#39;s referenced by other resources (e.g. SLO, composite monitor).
    # @return [DeletedMonitor]
    def delete_monitor(monitor_id, opts = {})
      data, _status_code, _headers = delete_monitor_with_http_info(monitor_id, opts)
      data
    end

    # Delete a monitor
    # Delete the specified monitor
    # @param monitor_id [Integer] The ID of the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :force Delete the monitor even if it&#39;s referenced by other resources (e.g. SLO, composite monitor).
    # @return [Array<(DeletedMonitor, Integer, Hash)>] DeletedMonitor data, response status code and response headers
    def delete_monitor_with_http_info(monitor_id, opts = {})

      if @api_client.config.unstable_operations.has_key?(:delete_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:delete_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "delete_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "delete_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.delete_monitor ...'
      end
      # verify the required parameter 'monitor_id' is set
      if @api_client.config.client_side_validation && monitor_id.nil?
        fail ArgumentError, "Missing the required parameter 'monitor_id' when calling MonitorsApi.delete_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor/{monitor_id}'.sub('{' + 'monitor_id' + '}', CGI.escape(monitor_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'force'] = opts[:'force'] if !opts[:'force'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'DeletedMonitor'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.delete_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#delete_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a monitor's details
    # Get details about the specified monitor from your organization.
    # @param monitor_id [Integer] The ID of the monitor
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_states When specified, shows additional information about the group states. Choose one or more from &#x60;all&#x60;, &#x60;alert&#x60;, &#x60;warn&#x60;, and &#x60;no data&#x60;.
    # @return [Monitor]
    def get_monitor(monitor_id, opts = {})
      data, _status_code, _headers = get_monitor_with_http_info(monitor_id, opts)
      data
    end

    # Get a monitor&#39;s details
    # Get details about the specified monitor from your organization.
    # @param monitor_id [Integer] The ID of the monitor
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_states When specified, shows additional information about the group states. Choose one or more from &#x60;all&#x60;, &#x60;alert&#x60;, &#x60;warn&#x60;, and &#x60;no data&#x60;.
    # @return [Array<(Monitor, Integer, Hash)>] Monitor data, response status code and response headers
    def get_monitor_with_http_info(monitor_id, opts = {})

      if @api_client.config.unstable_operations.has_key?(:get_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:get_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "get_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "get_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.get_monitor ...'
      end
      # verify the required parameter 'monitor_id' is set
      if @api_client.config.client_side_validation && monitor_id.nil?
        fail ArgumentError, "Missing the required parameter 'monitor_id' when calling MonitorsApi.get_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor/{monitor_id}'.sub('{' + 'monitor_id' + '}', CGI.escape(monitor_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'group_states'] = opts[:'group_states'] if !opts[:'group_states'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Monitor'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.get_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#get_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all monitor details
    # Get details about the specified monitor from your organization.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_states When specified, shows additional information about the group states. Choose one or more from &#x60;all&#x60;, &#x60;alert&#x60;, &#x60;warn&#x60;, and &#x60;no data&#x60;.
    # @option opts [String] :name A string to filter monitors by name.
    # @option opts [String] :tags A comma separated list indicating what tags, if any, should be used to filter the list of monitors by scope. For example, &#x60;host:host0&#x60;.
    # @option opts [String] :monitor_tags A comma separated list indicating what service and/or custom tags, if any, should be used to filter the list of monitors. Tags created in the Datadog UI automatically have the service key prepended. For example, &#x60;service:my-app&#x60;.
    # @option opts [Boolean] :with_downtimes If this argument is set to true, then the returned data includes all current downtimes for each monitor.
    # @option opts [Integer] :id_offset Monitor ID offset.
    # @option opts [Integer] :page The page to start paginating from. If this argument is not specified, the request returns all monitors without pagination.
    # @option opts [Integer] :page_size The number of monitors to return per page. If the page argument is not specified, the default behavior returns all monitors without a &#x60;page_size&#x60; limit. However, if page is specified and &#x60;page_size&#x60; is not, the argument defaults to 100.
    # @return [Array<Monitor>]
    def list_monitors(opts = {})
      data, _status_code, _headers = list_monitors_with_http_info(opts)
      data
    end

    # Get all monitor details
    # Get details about the specified monitor from your organization.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_states When specified, shows additional information about the group states. Choose one or more from &#x60;all&#x60;, &#x60;alert&#x60;, &#x60;warn&#x60;, and &#x60;no data&#x60;.
    # @option opts [String] :name A string to filter monitors by name.
    # @option opts [String] :tags A comma separated list indicating what tags, if any, should be used to filter the list of monitors by scope. For example, &#x60;host:host0&#x60;.
    # @option opts [String] :monitor_tags A comma separated list indicating what service and/or custom tags, if any, should be used to filter the list of monitors. Tags created in the Datadog UI automatically have the service key prepended. For example, &#x60;service:my-app&#x60;.
    # @option opts [Boolean] :with_downtimes If this argument is set to true, then the returned data includes all current downtimes for each monitor.
    # @option opts [Integer] :id_offset Monitor ID offset.
    # @option opts [Integer] :page The page to start paginating from. If this argument is not specified, the request returns all monitors without pagination.
    # @option opts [Integer] :page_size The number of monitors to return per page. If the page argument is not specified, the default behavior returns all monitors without a &#x60;page_size&#x60; limit. However, if page is specified and &#x60;page_size&#x60; is not, the argument defaults to 100.
    # @return [Array<(Array<Monitor>, Integer, Hash)>] Array<Monitor> data, response status code and response headers
    def list_monitors_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:list_monitors)
        unstable_enabled = @api_client.config.unstable_operations[:list_monitors]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "list_monitors")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "list_monitors"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.list_monitors ...'
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling MonitorsApi.list_monitors, must be smaller than or equal to 1000.'
      end

      # resource path
      local_var_path = '/api/v1/monitor'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'group_states'] = opts[:'group_states'] if !opts[:'group_states'].nil?
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
      query_params[:'tags'] = opts[:'tags'] if !opts[:'tags'].nil?
      query_params[:'monitor_tags'] = opts[:'monitor_tags'] if !opts[:'monitor_tags'].nil?
      query_params[:'with_downtimes'] = opts[:'with_downtimes'] if !opts[:'with_downtimes'].nil?
      query_params[:'id_offset'] = opts[:'id_offset'] if !opts[:'id_offset'].nil?
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'page_size'] = opts[:'page_size'] if !opts[:'page_size'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<Monitor>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.list_monitors",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#list_monitors\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Edit a monitor
    # Edit the specified monitor.
    # @param monitor_id [Integer] The ID of the monitor.
    # @param body [MonitorUpdateRequest] Edit a monitor request body.
    # @param [Hash] opts the optional parameters
    # @return [Monitor]
    def update_monitor(monitor_id, body, opts = {})
      data, _status_code, _headers = update_monitor_with_http_info(monitor_id, body, opts)
      data
    end

    # Edit a monitor
    # Edit the specified monitor.
    # @param monitor_id [Integer] The ID of the monitor.
    # @param body [MonitorUpdateRequest] Edit a monitor request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Monitor, Integer, Hash)>] Monitor data, response status code and response headers
    def update_monitor_with_http_info(monitor_id, body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:update_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:update_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "update_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "update_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.update_monitor ...'
      end
      # verify the required parameter 'monitor_id' is set
      if @api_client.config.client_side_validation && monitor_id.nil?
        fail ArgumentError, "Missing the required parameter 'monitor_id' when calling MonitorsApi.update_monitor"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MonitorsApi.update_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor/{monitor_id}'.sub('{' + 'monitor_id' + '}', CGI.escape(monitor_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'Monitor'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.update_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#update_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Validate a monitor
    # Validate the monitor provided in the request.
    # @param body [Monitor] Monitor request object
    # @param [Hash] opts the optional parameters
    # @return [Monitor]
    def validate_monitor(body, opts = {})
      data, _status_code, _headers = validate_monitor_with_http_info(body, opts)
      data
    end

    # Validate a monitor
    # Validate the monitor provided in the request.
    # @param body [Monitor] Monitor request object
    # @param [Hash] opts the optional parameters
    # @return [Array<(Monitor, Integer, Hash)>] Monitor data, response status code and response headers
    def validate_monitor_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:validate_monitor)
        unstable_enabled = @api_client.config.unstable_operations[:validate_monitor]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "validate_monitor")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "validate_monitor"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsApi.validate_monitor ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MonitorsApi.validate_monitor"
      end
      # resource path
      local_var_path = '/api/v1/monitor/validate'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'Monitor'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"MonitorsApi.validate_monitor",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MonitorsApi#validate_monitor\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
