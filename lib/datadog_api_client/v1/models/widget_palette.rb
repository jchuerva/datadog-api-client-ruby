=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module DatadogAPIClient::V1
  class WidgetPalette
    BLUE = "blue".freeze
    CUSTOM_BACKGROUND = "custom_bg".freeze
    CUSTOM_IMAGE = "custom_image".freeze
    CUSTOM_TEXT = "custom_text".freeze
    GRAY_ON_WHITE = "gray_on_white".freeze
    GREY = "grey".freeze
    GREEN = "green".freeze
    ORANGE = "orange".freeze
    RED = "red".freeze
    RED_ON_WHITE = "red_on_white".freeze
    WHITE_ON_GRAY = "white_on_gray".freeze
    WHITE_ON_GREEN = "white_on_green".freeze
    GREEN_ON_WHITE = "green_on_white".freeze
    WHITE_ON_RED = "white_on_red".freeze
    WHITE_ON_YELLOW = "white_on_yellow".freeze
    YELLOW_ON_WHITE = "yellow_on_white".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = WidgetPalette.constants.select { |c| WidgetPalette::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #WidgetPalette" if constantValues.empty?
      value
    end
  end
end