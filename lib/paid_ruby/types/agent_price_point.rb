# frozen_string_literal: true
require_relative "agent_price_point_tiers"
require "ostruct"
require "json"

module Paid
  class AgentPricePoint
  # @return [Float] 
    attr_reader :unit_price
  # @return [Float] 
    attr_reader :min_quantity
  # @return [Float] 
    attr_reader :included_quantity
  # @return [Array<Paid::AgentPricePointTiers>] 
    attr_reader :tiers
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param unit_price [Float] 
    # @param min_quantity [Float] 
    # @param included_quantity [Float] 
    # @param tiers [Array<Paid::AgentPricePointTiers>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::AgentPricePoint]
    def initialize(unit_price: OMIT, min_quantity: OMIT, included_quantity: OMIT, tiers: OMIT, additional_properties: nil)
      @unit_price = unit_price if unit_price != OMIT
      @min_quantity = min_quantity if min_quantity != OMIT
      @included_quantity = included_quantity if included_quantity != OMIT
      @tiers = tiers if tiers != OMIT
      @additional_properties = additional_properties
      @_field_set = { "unitPrice": unit_price, "minQuantity": min_quantity, "includedQuantity": included_quantity, "tiers": tiers }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AgentPricePoint
    #
    # @param json_object [String] 
    # @return [Paid::AgentPricePoint]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unit_price = parsed_json["unitPrice"]
      min_quantity = parsed_json["minQuantity"]
      included_quantity = parsed_json["includedQuantity"]
      tiers = parsed_json["tiers"]&.map do | item |
  item = item.to_json
  Paid::AgentPricePointTiers.from_json(json_object: item)
end
      new(
        unit_price: unit_price,
        min_quantity: min_quantity,
        included_quantity: included_quantity,
        tiers: tiers,
        additional_properties: struct
      )
    end
# Serialize an instance of AgentPricePoint to a JSON object
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
      obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
      obj.min_quantity&.is_a?(Float) != false || raise("Passed value for field obj.min_quantity is not the expected type, validation failed.")
      obj.included_quantity&.is_a?(Float) != false || raise("Passed value for field obj.included_quantity is not the expected type, validation failed.")
      obj.tiers&.is_a?(Array) != false || raise("Passed value for field obj.tiers is not the expected type, validation failed.")
    end
  end
end