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
  # Object containing all metric names returned and their associated metadata.
  class MetricsQueryResponseSeries
    # Aggregation type.
    attr_accessor :aggr

    # Display name of the metric.
    attr_accessor :display_name

    # End of the time window, milliseconds since Unix epoch.
    attr_accessor :_end

    # Metric expression.
    attr_accessor :expression

    # Number of seconds between data samples.
    attr_accessor :interval

    # Number of data samples.
    attr_accessor :length

    # Metric name.
    attr_accessor :metric

    # List of points of the time series.
    attr_accessor :pointlist

    # Metric scope, comma separated list of tags.
    attr_accessor :scope

    # Start of the time window, milliseconds since Unix epoch.
    attr_accessor :start

    # Detailed information about the metric unit. First element describes the \"primary unit\" (for example, `bytes` in `bytes per second`), second describes the \"per unit\" (for example, `second` in `bytes per second`).
    attr_accessor :unit

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'aggr' => :'aggr',
        :'display_name' => :'display_name',
        :'_end' => :'end',
        :'expression' => :'expression',
        :'interval' => :'interval',
        :'length' => :'length',
        :'metric' => :'metric',
        :'pointlist' => :'pointlist',
        :'scope' => :'scope',
        :'start' => :'start',
        :'unit' => :'unit'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'aggr' => :'String',
        :'display_name' => :'String',
        :'_end' => :'Integer',
        :'expression' => :'String',
        :'interval' => :'Integer',
        :'length' => :'Integer',
        :'metric' => :'String',
        :'pointlist' => :'Array<Array>',
        :'scope' => :'String',
        :'start' => :'Integer',
        :'unit' => :'Array<MetricsQueryResponseUnit>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::MetricsQueryResponseSeries` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::MetricsQueryResponseSeries`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'aggr')
        self.aggr = attributes[:'aggr']
      end

      if attributes.key?(:'display_name')
        self.display_name = attributes[:'display_name']
      end

      if attributes.key?(:'_end')
        self._end = attributes[:'_end']
      end

      if attributes.key?(:'expression')
        self.expression = attributes[:'expression']
      end

      if attributes.key?(:'interval')
        self.interval = attributes[:'interval']
      end

      if attributes.key?(:'length')
        self.length = attributes[:'length']
      end

      if attributes.key?(:'metric')
        self.metric = attributes[:'metric']
      end

      if attributes.key?(:'pointlist')
        if (value = attributes[:'pointlist']).is_a?(Array)
          self.pointlist = value
        end
      end

      if attributes.key?(:'scope')
        self.scope = attributes[:'scope']
      end

      if attributes.key?(:'start')
        self.start = attributes[:'start']
      end

      if attributes.key?(:'unit')
        if (value = attributes[:'unit']).is_a?(Array)
          self.unit = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          aggr == o.aggr &&
          display_name == o.display_name &&
          _end == o._end &&
          expression == o.expression &&
          interval == o.interval &&
          length == o.length &&
          metric == o.metric &&
          pointlist == o.pointlist &&
          scope == o.scope &&
          start == o.start &&
          unit == o.unit
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [aggr, display_name, _end, expression, interval, length, metric, pointlist, scope, start, unit].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        DatadogAPIClient::V1.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end