# frozen_string_literal: true
require_relative "charge_type"
require_relative "pricing_model_type"
require_relative "billing_frequency"
require "ostruct"
require "json"

module Paid
  class Pricing
  # @return [String] 
    attr_reader :event_name
  # @return [Boolean] 
    attr_reader :taxable
  # @return [Float] 
    attr_reader :credit_cost
  # @return [Paid::ChargeType] 
    attr_reader :charge_type
  # @return [Paid::PricingModelType] 
    attr_reader :pricing_model
  # @return [Paid::BillingFrequency] 
    attr_reader :billing_frequency
  # @return [Hash{String => Paid::AgentPricePoint}] 
    attr_reader :price_points
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_name [String] 
    # @param taxable [Boolean] 
    # @param credit_cost [Float] 
    # @param charge_type [Paid::ChargeType] 
    # @param pricing_model [Paid::PricingModelType] 
    # @param billing_frequency [Paid::BillingFrequency] 
    # @param price_points [Hash{String => Paid::AgentPricePoint}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Pricing]
    def initialize(event_name: OMIT, taxable:, credit_cost: OMIT, charge_type:, pricing_model:, billing_frequency:, price_points:, additional_properties: nil)
      @event_name = event_name if event_name != OMIT
      @taxable = taxable
      @credit_cost = credit_cost if credit_cost != OMIT
      @charge_type = charge_type
      @pricing_model = pricing_model
      @billing_frequency = billing_frequency
      @price_points = price_points
      @additional_properties = additional_properties
      @_field_set = { "eventName": event_name, "taxable": taxable, "creditCost": credit_cost, "chargeType": charge_type, "pricingModel": pricing_model, "billingFrequency": billing_frequency, "pricePoints": price_points }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Pricing
    #
    # @param json_object [String] 
    # @return [Paid::Pricing]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_name = parsed_json["eventName"]
      taxable = parsed_json["taxable"]
      credit_cost = parsed_json["creditCost"]
      charge_type = parsed_json["chargeType"]
      pricing_model = parsed_json["pricingModel"]
      billing_frequency = parsed_json["billingFrequency"]
      price_points = parsed_json["pricePoints"]&.transform_values do | value |
  value = value.to_json
  Paid::AgentPricePoint.from_json(json_object: value)
end
      new(
        event_name: event_name,
        taxable: taxable,
        credit_cost: credit_cost,
        charge_type: charge_type,
        pricing_model: pricing_model,
        billing_frequency: billing_frequency,
        price_points: price_points,
        additional_properties: struct
      )
    end
# Serialize an instance of Pricing to a JSON object
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
      obj.taxable.is_a?(Boolean) != false || raise("Passed value for field obj.taxable is not the expected type, validation failed.")
      obj.credit_cost&.is_a?(Float) != false || raise("Passed value for field obj.credit_cost is not the expected type, validation failed.")
      obj.charge_type.is_a?(Paid::ChargeType) != false || raise("Passed value for field obj.charge_type is not the expected type, validation failed.")
      obj.pricing_model.is_a?(Paid::PricingModelType) != false || raise("Passed value for field obj.pricing_model is not the expected type, validation failed.")
      obj.billing_frequency.is_a?(Paid::BillingFrequency) != false || raise("Passed value for field obj.billing_frequency is not the expected type, validation failed.")
      obj.price_points.is_a?(Hash) != false || raise("Passed value for field obj.price_points is not the expected type, validation failed.")
    end
  end
end