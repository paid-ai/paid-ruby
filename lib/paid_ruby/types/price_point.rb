# frozen_string_literal: true

require_relative "tier"
require "ostruct"
require "json"

module Paid
  class PricePoint
    # @return [String]
    attr_reader :currency
    # @return [Float]
    attr_reader :unit_price
    # @return [Float]
    attr_reader :min_quantity
    # @return [Array<Paid::Tier>]
    attr_reader :tiers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param currency [String]
    # @param unit_price [Float]
    # @param min_quantity [Float]
    # @param tiers [Array<Paid::Tier>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::PricePoint]
    def initialize(currency: OMIT, unit_price: OMIT, min_quantity: OMIT, tiers: OMIT, additional_properties: nil)
      @currency = currency if currency != OMIT
      @unit_price = unit_price if unit_price != OMIT
      @min_quantity = min_quantity if min_quantity != OMIT
      @tiers = tiers if tiers != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "currency": currency,
        "unitPrice": unit_price,
        "minQuantity": min_quantity,
        "tiers": tiers
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PricePoint
    #
    # @param json_object [String]
    # @return [Paid::PricePoint]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      currency = parsed_json["currency"]
      unit_price = parsed_json["unitPrice"]
      min_quantity = parsed_json["minQuantity"]
      tiers = parsed_json["tiers"]&.map do |item|
        item = item.to_json
        Paid::Tier.from_json(json_object: item)
      end
      new(
        currency: currency,
        unit_price: unit_price,
        min_quantity: min_quantity,
        tiers: tiers,
        additional_properties: struct
      )
    end

    # Serialize an instance of PricePoint to a JSON object
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
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
      obj.min_quantity&.is_a?(Float) != false || raise("Passed value for field obj.min_quantity is not the expected type, validation failed.")
      obj.tiers&.is_a?(Array) != false || raise("Passed value for field obj.tiers is not the expected type, validation failed.")
    end
  end
end
