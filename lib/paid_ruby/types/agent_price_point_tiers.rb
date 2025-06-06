# frozen_string_literal: true

require "ostruct"
require "json"

module Paid
  class AgentPricePointTiers
    # @return [Float]
    attr_reader :min_quantity
    # @return [Float]
    attr_reader :max_quantity
    # @return [Float]
    attr_reader :unit_price
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param min_quantity [Float]
    # @param max_quantity [Float]
    # @param unit_price [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::AgentPricePointTiers]
    def initialize(unit_price:, min_quantity: OMIT, max_quantity: OMIT, additional_properties: nil)
      @min_quantity = min_quantity if min_quantity != OMIT
      @max_quantity = max_quantity if max_quantity != OMIT
      @unit_price = unit_price
      @additional_properties = additional_properties
      @_field_set = {
        "minQuantity": min_quantity,
        "maxQuantity": max_quantity,
        "unitPrice": unit_price
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AgentPricePointTiers
    #
    # @param json_object [String]
    # @return [Paid::AgentPricePointTiers]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      min_quantity = parsed_json["minQuantity"]
      max_quantity = parsed_json["maxQuantity"]
      unit_price = parsed_json["unitPrice"]
      new(
        min_quantity: min_quantity,
        max_quantity: max_quantity,
        unit_price: unit_price,
        additional_properties: struct
      )
    end

    # Serialize an instance of AgentPricePointTiers to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.min_quantity&.is_a?(Float) != false || raise("Passed value for field obj.min_quantity is not the expected type, validation failed.")
      obj.max_quantity&.is_a?(Float) != false || raise("Passed value for field obj.max_quantity is not the expected type, validation failed.")
      obj.unit_price.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
    end
  end
end
