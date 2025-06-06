# frozen_string_literal: true

require_relative "charge_type"
require_relative "price_point"
require_relative "pricing_model_type"
require_relative "billing_frequency"
require "ostruct"
require "json"

module Paid
  class OrderLineAttributePricing
    # @return [String]
    attr_reader :event_name
    # @return [Paid::ChargeType]
    attr_reader :charge_type
    # @return [Paid::PricePoint]
    attr_reader :price_point
    # @return [Paid::PricingModelType]
    attr_reader :pricing_model
    # @return [Paid::BillingFrequency]
    attr_reader :billing_frequency
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_name [String]
    # @param charge_type [Paid::ChargeType]
    # @param price_point [Paid::PricePoint]
    # @param pricing_model [Paid::PricingModelType]
    # @param billing_frequency [Paid::BillingFrequency]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::OrderLineAttributePricing]
    def initialize(event_name: OMIT, charge_type: OMIT, price_point: OMIT, pricing_model: OMIT,
                   billing_frequency: OMIT, additional_properties: nil)
      @event_name = event_name if event_name != OMIT
      @charge_type = charge_type if charge_type != OMIT
      @price_point = price_point if price_point != OMIT
      @pricing_model = pricing_model if pricing_model != OMIT
      @billing_frequency = billing_frequency if billing_frequency != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "eventName": event_name,
        "chargeType": charge_type,
        "pricePoint": price_point,
        "pricingModel": pricing_model,
        "billingFrequency": billing_frequency
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OrderLineAttributePricing
    #
    # @param json_object [String]
    # @return [Paid::OrderLineAttributePricing]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_name = parsed_json["eventName"]
      charge_type = parsed_json["chargeType"]
      if parsed_json["pricePoint"].nil?
        price_point = nil
      else
        price_point = parsed_json["pricePoint"].to_json
        price_point = Paid::PricePoint.from_json(json_object: price_point)
      end
      pricing_model = parsed_json["pricingModel"]
      billing_frequency = parsed_json["billingFrequency"]
      new(
        event_name: event_name,
        charge_type: charge_type,
        price_point: price_point,
        pricing_model: pricing_model,
        billing_frequency: billing_frequency,
        additional_properties: struct
      )
    end

    # Serialize an instance of OrderLineAttributePricing to a JSON object
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
      obj.event_name&.is_a?(String) != false || raise("Passed value for field obj.event_name is not the expected type, validation failed.")
      obj.charge_type&.is_a?(Paid::ChargeType) != false || raise("Passed value for field obj.charge_type is not the expected type, validation failed.")
      obj.price_point.nil? || Paid::PricePoint.validate_raw(obj: obj.price_point)
      obj.pricing_model&.is_a?(Paid::PricingModelType) != false || raise("Passed value for field obj.pricing_model is not the expected type, validation failed.")
      obj.billing_frequency&.is_a?(Paid::BillingFrequency) != false || raise("Passed value for field obj.billing_frequency is not the expected type, validation failed.")
    end
  end
end
