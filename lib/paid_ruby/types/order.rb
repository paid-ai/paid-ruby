# frozen_string_literal: true
require_relative "creation_state"
require_relative "order_line"
require_relative "customer"
require "ostruct"
require "json"

module Paid
  class Order
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :customer_id
  # @return [String] 
    attr_reader :organization_id
  # @return [String] 
    attr_reader :start_date
  # @return [String] 
    attr_reader :end_date
  # @return [Float] 
    attr_reader :total_amount
  # @return [Float] 
    attr_reader :estimated_tax
  # @return [Float] 
    attr_reader :billed_amount_no_tax
  # @return [Float] 
    attr_reader :billed_tax
  # @return [Float] 
    attr_reader :total_billed_amount
  # @return [Float] 
    attr_reader :pending_billing_amount
  # @return [Paid::CreationState] 
    attr_reader :creation_state
  # @return [Array<Paid::OrderLine>] 
    attr_reader :order_lines
  # @return [Paid::Customer] 
    attr_reader :customer
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] 
    # @param description [String] 
    # @param customer_id [String] 
    # @param organization_id [String] 
    # @param start_date [String] 
    # @param end_date [String] 
    # @param total_amount [Float] 
    # @param estimated_tax [Float] 
    # @param billed_amount_no_tax [Float] 
    # @param billed_tax [Float] 
    # @param total_billed_amount [Float] 
    # @param pending_billing_amount [Float] 
    # @param creation_state [Paid::CreationState] 
    # @param order_lines [Array<Paid::OrderLine>] 
    # @param customer [Paid::Customer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Order]
    def initialize(id: OMIT, name: OMIT, description: OMIT, customer_id: OMIT, organization_id: OMIT, start_date: OMIT, end_date: OMIT, total_amount: OMIT, estimated_tax: OMIT, billed_amount_no_tax: OMIT, billed_tax: OMIT, total_billed_amount: OMIT, pending_billing_amount: OMIT, creation_state: OMIT, order_lines: OMIT, customer: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @organization_id = organization_id if organization_id != OMIT
      @start_date = start_date if start_date != OMIT
      @end_date = end_date if end_date != OMIT
      @total_amount = total_amount if total_amount != OMIT
      @estimated_tax = estimated_tax if estimated_tax != OMIT
      @billed_amount_no_tax = billed_amount_no_tax if billed_amount_no_tax != OMIT
      @billed_tax = billed_tax if billed_tax != OMIT
      @total_billed_amount = total_billed_amount if total_billed_amount != OMIT
      @pending_billing_amount = pending_billing_amount if pending_billing_amount != OMIT
      @creation_state = creation_state if creation_state != OMIT
      @order_lines = order_lines if order_lines != OMIT
      @customer = customer if customer != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "description": description, "customerId": customer_id, "organizationId": organization_id, "startDate": start_date, "endDate": end_date, "totalAmount": total_amount, "estimatedTax": estimated_tax, "billedAmountNoTax": billed_amount_no_tax, "billedTax": billed_tax, "totalBilledAmount": total_billed_amount, "pendingBillingAmount": pending_billing_amount, "creationState": creation_state, "orderLines": order_lines, "customer": customer }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Order
    #
    # @param json_object [String] 
    # @return [Paid::Order]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      customer_id = parsed_json["customerId"]
      organization_id = parsed_json["organizationId"]
      start_date = parsed_json["startDate"]
      end_date = parsed_json["endDate"]
      total_amount = parsed_json["totalAmount"]
      estimated_tax = parsed_json["estimatedTax"]
      billed_amount_no_tax = parsed_json["billedAmountNoTax"]
      billed_tax = parsed_json["billedTax"]
      total_billed_amount = parsed_json["totalBilledAmount"]
      pending_billing_amount = parsed_json["pendingBillingAmount"]
      creation_state = parsed_json["creationState"]
      order_lines = parsed_json["orderLines"]&.map do | item |
  item = item.to_json
  Paid::OrderLine.from_json(json_object: item)
end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Paid::Customer.from_json(json_object: customer)
      else
        customer = nil
      end
      new(
        id: id,
        name: name,
        description: description,
        customer_id: customer_id,
        organization_id: organization_id,
        start_date: start_date,
        end_date: end_date,
        total_amount: total_amount,
        estimated_tax: estimated_tax,
        billed_amount_no_tax: billed_amount_no_tax,
        billed_tax: billed_tax,
        total_billed_amount: total_billed_amount,
        pending_billing_amount: pending_billing_amount,
        creation_state: creation_state,
        order_lines: order_lines,
        customer: customer,
        additional_properties: struct
      )
    end
# Serialize an instance of Order to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.organization_id&.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.estimated_tax&.is_a?(Float) != false || raise("Passed value for field obj.estimated_tax is not the expected type, validation failed.")
      obj.billed_amount_no_tax&.is_a?(Float) != false || raise("Passed value for field obj.billed_amount_no_tax is not the expected type, validation failed.")
      obj.billed_tax&.is_a?(Float) != false || raise("Passed value for field obj.billed_tax is not the expected type, validation failed.")
      obj.total_billed_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_billed_amount is not the expected type, validation failed.")
      obj.pending_billing_amount&.is_a?(Float) != false || raise("Passed value for field obj.pending_billing_amount is not the expected type, validation failed.")
      obj.creation_state&.is_a?(Paid::CreationState) != false || raise("Passed value for field obj.creation_state is not the expected type, validation failed.")
      obj.order_lines&.is_a?(Array) != false || raise("Passed value for field obj.order_lines is not the expected type, validation failed.")
      obj.customer.nil? || Paid::Customer.validate_raw(obj: obj.customer)
    end
  end
end