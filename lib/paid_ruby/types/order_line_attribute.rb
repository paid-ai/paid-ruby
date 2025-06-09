# frozen_string_literal: true
require_relative "order_line_attribute_pricing"
require "ostruct"
require "json"

module Paid
  class OrderLineAttribute
  # @return [String] 
    attr_reader :agent_attribute_id
  # @return [Float] 
    attr_reader :quantity
  # @return [String] 
    attr_reader :currency
  # @return [Paid::OrderLineAttributePricing] 
    attr_reader :pricing
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param agent_attribute_id [String] 
    # @param quantity [Float] 
    # @param currency [String] 
    # @param pricing [Paid::OrderLineAttributePricing] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::OrderLineAttribute]
    def initialize(agent_attribute_id: OMIT, quantity: OMIT, currency: OMIT, pricing: OMIT, additional_properties: nil)
      @agent_attribute_id = agent_attribute_id if agent_attribute_id != OMIT
      @quantity = quantity if quantity != OMIT
      @currency = currency if currency != OMIT
      @pricing = pricing if pricing != OMIT
      @additional_properties = additional_properties
      @_field_set = { "agentAttributeId": agent_attribute_id, "quantity": quantity, "currency": currency, "pricing": pricing }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderLineAttribute
    #
    # @param json_object [String] 
    # @return [Paid::OrderLineAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      agent_attribute_id = parsed_json["agentAttributeId"]
      quantity = parsed_json["quantity"]
      currency = parsed_json["currency"]
      unless parsed_json["pricing"].nil?
        pricing = parsed_json["pricing"].to_json
        pricing = Paid::OrderLineAttributePricing.from_json(json_object: pricing)
      else
        pricing = nil
      end
      new(
        agent_attribute_id: agent_attribute_id,
        quantity: quantity,
        currency: currency,
        pricing: pricing,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineAttribute to a JSON object
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
      obj.agent_attribute_id&.is_a?(String) != false || raise("Passed value for field obj.agent_attribute_id is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.pricing.nil? || Paid::OrderLineAttributePricing.validate_raw(obj: obj.pricing)
    end
  end
end