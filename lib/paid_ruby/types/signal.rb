# frozen_string_literal: true
require "ostruct"
require "json"

module Paid
  class Signal
  # @return [String] 
    attr_reader :event_name
  # @return [String] 
    attr_reader :agent_id
  # @return [String] 
    attr_reader :customer_id
  # @return [Hash{String => Object}] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_name [String] 
    # @param agent_id [String] 
    # @param customer_id [String] 
    # @param data [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Signal]
    def initialize(event_name: OMIT, agent_id: OMIT, customer_id: OMIT, data: OMIT, additional_properties: nil)
      @event_name = event_name if event_name != OMIT
      @agent_id = agent_id if agent_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event_name": event_name, "agent_id": agent_id, "customer_id": customer_id, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Signal
    #
    # @param json_object [String] 
    # @return [Paid::Signal]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_name = parsed_json["event_name"]
      agent_id = parsed_json["agent_id"]
      customer_id = parsed_json["customer_id"]
      data = parsed_json["data"]
      new(
        event_name: event_name,
        agent_id: agent_id,
        customer_id: customer_id,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of Signal to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.event_name&.is_a?(String) != false || raise("Passed value for field obj.event_name is not the expected type, validation failed.")
      obj.agent_id&.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end