=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'cgi'

module DatadogAPIClient::V1
  class IPRangesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # List IP Ranges
    # Get information about Datadog IP ranges.
    # @param [Hash] opts the optional parameters
    # @return [IPRanges]
    def get_ip_ranges(opts = {})
      data, _status_code, _headers = get_ip_ranges_with_http_info(opts)
      data
    end

    # List IP Ranges
    # Get information about Datadog IP ranges.
    # @param [Hash] opts the optional parameters
    # @return [Array<(IPRanges, Integer, Hash)>] IPRanges data, response status code and response headers
    def get_ip_ranges_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IPRangesApi.get_ip_ranges ...'
      end
      # resource path
      local_var_path = '/'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}
      # return_type
      return_type = opts[:return_type] || 'IPRanges' 

      # auth_names
      auth_names = opts[:auth_names] || []

      new_options = opts.merge(
        :operation => :"IPRangesApi.get_ip_ranges",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => nil,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IPRangesApi#get_ip_ranges\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end