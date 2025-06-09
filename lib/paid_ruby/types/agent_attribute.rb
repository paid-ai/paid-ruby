# frozen_string_literal: true
require_relative "pricing"
require "ostruct"
require "json"

module Paid
  class AgentAttribute
  # @return [String] 
    attr_reader :name
  # @return [Boolean] 
    attr_reader :active
  # @return [Paid::Pricing] 
    attr_reader :pricing
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param active [Boolean] 
    # @param pricing [Paid::Pricing] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::AgentAttribute]
    def initialize(name:, active:, pricing:, additional_properties: nil)
      @name = name
      @active = active
      @pricing = pricing
      @additional_properties = additional_properties
      @_field_set = { "name": name, "active": active, "pricing": pricing }
    end
# Deserialize a JSON object to an instance of AgentAttribute
    #
    # @param json_object [String] 
    # @return [Paid::AgentAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      active = parsed_json["active"]
      unless parsed_json["pricing"].nil?
        pricing = parsed_json["pricing"].to_json
        pricing = Paid::Pricing.from_json(json_object: pricing)
      else
        pricing = nil
      end
      new(
        name: name,
        active: active,
        pricing: pricing,
        additional_properties: struct
      )
    end
# Serialize an instance of AgentAttribute to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.active.is_a?(Boolean) != false || raise("Passed value for field obj.active is not the expected type, validation failed.")
      Paid::Pricing.validate_raw(obj: obj.pricing)
    end
  end
end