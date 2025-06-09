# frozen_string_literal: true
require "ostruct"
require "json"

module Paid
  class Tier
  # @return [Float] 
    attr_reader :lower_bound
  # @return [Float] 
    attr_reader :upper_bound
  # @return [Float] 
    attr_reader :price
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param lower_bound [Float] 
    # @param upper_bound [Float] 
    # @param price [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Tier]
    def initialize(lower_bound: OMIT, upper_bound: OMIT, price: OMIT, additional_properties: nil)
      @lower_bound = lower_bound if lower_bound != OMIT
      @upper_bound = upper_bound if upper_bound != OMIT
      @price = price if price != OMIT
      @additional_properties = additional_properties
      @_field_set = { "lowerBound": lower_bound, "upperBound": upper_bound, "price": price }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Tier
    #
    # @param json_object [String] 
    # @return [Paid::Tier]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      lower_bound = parsed_json["lowerBound"]
      upper_bound = parsed_json["upperBound"]
      price = parsed_json["price"]
      new(
        lower_bound: lower_bound,
        upper_bound: upper_bound,
        price: price,
        additional_properties: struct
      )
    end
# Serialize an instance of Tier to a JSON object
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
      obj.lower_bound&.is_a?(Float) != false || raise("Passed value for field obj.lower_bound is not the expected type, validation failed.")
      obj.upper_bound&.is_a?(Float) != false || raise("Passed value for field obj.upper_bound is not the expected type, validation failed.")
      obj.price&.is_a?(Float) != false || raise("Passed value for field obj.price is not the expected type, validation failed.")
    end
  end
end