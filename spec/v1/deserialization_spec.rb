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

require 'json'

describe 'Deserialization', skip_before: true do
  describe 'synthetics_test deserialization test' do
    before do
      # run before each test
      @api_instance = DatadogAPIClient::V1::SyntheticsAPI.new
      @base_path = @api_instance.api_client.build_request_url('')
    end

    it 'should deserialize unknown nested oneOf in list' do
      fixture = File.read('spec/fixtures/synthetics_unknown_nested_oneof_in_list.json')
      stub_request(:get, "#{@base_path}api/v1/synthetics/tests/api/public_id")
        .to_return(:body => fixture, :headers => [{"Content-Type": "application/json"}], :status => 299)

      data = @api_instance.get_api_test("public_id")

      expect(data).to be_a DatadogAPIClient::V1::SyntheticsAPITest
      expect(data.config.assertions.length).to be 3
      expect(data.config._unparsed).to be true
      expect(data.config.assertions[2].data[:operator]).to eq "A non existent operator"
    end

    it 'should deserialize unknown nested enum in list' do
      fixture = File.read('spec/fixtures/synthetics_unknown_nested_enum_in_list.json')
      stub_request(:get, "#{@base_path}api/v1/synthetics/tests/api/public_id")
        .to_return(:body => fixture, :headers => [{"Content-Type": "application/json"}], :status => 299)

      data = @api_instance.get_api_test("public_id")

      expect(data).to be_a DatadogAPIClient::V1::SyntheticsAPITest
      expect(data.options.device_ids.length).to be 3
      expect(data.options._unparsed).to be true
      expect(data.options.device_ids[2].to_hash).to eq DatadogAPIClient::V1::SyntheticsDeviceID.build_from_hash("A non existent device ID").to_hash
    end

    it 'should deserialize unknown top level enum' do
      fixture = File.read('spec/fixtures/synthetics_unknown_top_level_enum.json')
      stub_request(:get, "#{@base_path}api/v1/synthetics/tests/api/public_id")
        .to_return(:body => fixture, :headers => [{"Content-Type": "application/json"}], :status => 299)

      data = @api_instance.get_api_test("public_id")

      expect(data).to be_a DatadogAPIClient::V1::SyntheticsAPITest
      expect(data.type.to_hash).to eq "A non existent test type"
      expect(data.name).to eq "Check on www.10.0.0.1.xip.io"
    end

    it 'should deserialize unknown nested enum' do
      fixture = File.read('spec/fixtures/synthetics_unknown_nested_enum.json')
      stub_request(:get, "#{@base_path}api/v1/synthetics/tests/api/public_id")
        .to_return(:body => fixture, :headers => [{"Content-Type": "application/json"}], :status => 299)

      data = @api_instance.get_api_test("public_id")

      expect(data).to be_a DatadogAPIClient::V1::SyntheticsAPITest
      expect(data.config.request).to be_a DatadogAPIClient::V1::SyntheticsTestRequest
      expect(data.config.request._unparsed).to be true
      expect(data.config.request.timeout).to eq 30
      expect(data.config.request.method.to_hash).to eq "A non existent method"
    end
  end

  describe 'logs_archive deserialization test' do
    before do
      # run before each test
      @api_instance = DatadogAPIClient::V2::LogsArchivesAPI.new
      @base_path = @api_instance.api_client.build_request_url('')
      @body = DatadogAPIClient::V2::LogsArchiveCreateRequest.new
    end

    it 'should deserialize unknown nested OneOf' do
    fixture = File.read('spec/fixtures/logs_archive_unknown_nested_oneof.json')
    stub_request(:post, "#{@base_path}api/v2/logs/config/archives")
      .to_return(:body => fixture, :headers => [{"Content-Type": "application/json"}], :status => 299)

    data = @api_instance.create_logs_archive(@body)

    expect(data).to be_a DatadogAPIClient::V2::LogsArchive
    expect(data.data.attributes._unparsed).to be true
    expect(data.data.attributes.destination.data[:type]).to eq "A non existent destination"
    end
  end
end