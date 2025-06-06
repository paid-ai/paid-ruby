# frozen_string_literal: true

require_relative "creation_state"
require_relative "agent"
require_relative "order_line_attribute"
require "ostruct"
require "json"

module Paid
  class OrderLine
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :order_id
    # @return [String]
    attr_reader :agent_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @return [String]
    attr_reader :start_date
    # @return [String]
    attr_reader :end_date
    # @return [Float]
    attr_reader :total_amount
    # @return [Float]
    attr_reader :billed_amount_without_tax
    # @return [Float]
    attr_reader :billed_tax
    # @return [Float]
    attr_reader :total_billed_amount
    # @return [Paid::CreationState]
    attr_reader :creation_state
    # @return [Paid::Agent]
    attr_reader :agent
    # @return [Array<Paid::OrderLineAttribute>]
    attr_reader :order_line_attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param order_id [String]
    # @param agent_id [String]
    # @param name [String]
    # @param description [String]
    # @param start_date [String]
    # @param end_date [String]
    # @param total_amount [Float]
    # @param billed_amount_without_tax [Float]
    # @param billed_tax [Float]
    # @param total_billed_amount [Float]
    # @param creation_state [Paid::CreationState]
    # @param agent [Paid::Agent]
    # @param order_line_attributes [Array<Paid::OrderLineAttribute>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::OrderLine]
    def initialize(id: OMIT, order_id: OMIT, agent_id: OMIT, name: OMIT, description: OMIT, start_date: OMIT,
                   end_date: OMIT, total_amount: OMIT, billed_amount_without_tax: OMIT, billed_tax: OMIT, total_billed_amount: OMIT, creation_state: OMIT, agent: OMIT, order_line_attributes: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @order_id = order_id if order_id != OMIT
      @agent_id = agent_id if agent_id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @start_date = start_date if start_date != OMIT
      @end_date = end_date if end_date != OMIT
      @total_amount = total_amount if total_amount != OMIT
      @billed_amount_without_tax = billed_amount_without_tax if billed_amount_without_tax != OMIT
      @billed_tax = billed_tax if billed_tax != OMIT
      @total_billed_amount = total_billed_amount if total_billed_amount != OMIT
      @creation_state = creation_state if creation_state != OMIT
      @agent = agent if agent != OMIT
      @order_line_attributes = order_line_attributes if order_line_attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orderId": order_id,
        "agentId": agent_id,
        "name": name,
        "description": description,
        "startDate": start_date,
        "endDate": end_date,
        "totalAmount": total_amount,
        "billedAmountWithoutTax": billed_amount_without_tax,
        "billedTax": billed_tax,
        "totalBilledAmount": total_billed_amount,
        "creationState": creation_state,
        "agent": agent,
        "orderLineAttributes": order_line_attributes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OrderLine
    #
    # @param json_object [String]
    # @return [Paid::OrderLine]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      order_id = parsed_json["orderId"]
      agent_id = parsed_json["agentId"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      start_date = parsed_json["startDate"]
      end_date = parsed_json["endDate"]
      total_amount = parsed_json["totalAmount"]
      billed_amount_without_tax = parsed_json["billedAmountWithoutTax"]
      billed_tax = parsed_json["billedTax"]
      total_billed_amount = parsed_json["totalBilledAmount"]
      creation_state = parsed_json["creationState"]
      if parsed_json["agent"].nil?
        agent = nil
      else
        agent = parsed_json["agent"].to_json
        agent = Paid::Agent.from_json(json_object: agent)
      end
      order_line_attributes = parsed_json["orderLineAttributes"]&.map do |item|
        item = item.to_json
        Paid::OrderLineAttribute.from_json(json_object: item)
      end
      new(
        id: id,
        order_id: order_id,
        agent_id: agent_id,
        name: name,
        description: description,
        start_date: start_date,
        end_date: end_date,
        total_amount: total_amount,
        billed_amount_without_tax: billed_amount_without_tax,
        billed_tax: billed_tax,
        total_billed_amount: total_billed_amount,
        creation_state: creation_state,
        agent: agent,
        order_line_attributes: order_line_attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of OrderLine to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.agent_id&.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.billed_amount_without_tax&.is_a?(Float) != false || raise("Passed value for field obj.billed_amount_without_tax is not the expected type, validation failed.")
      obj.billed_tax&.is_a?(Float) != false || raise("Passed value for field obj.billed_tax is not the expected type, validation failed.")
      obj.total_billed_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_billed_amount is not the expected type, validation failed.")
      obj.creation_state&.is_a?(Paid::CreationState) != false || raise("Passed value for field obj.creation_state is not the expected type, validation failed.")
      obj.agent.nil? || Paid::Agent.validate_raw(obj: obj.agent)
      obj.order_line_attributes&.is_a?(Array) != false || raise("Passed value for field obj.order_line_attributes is not the expected type, validation failed.")
    end
  end
end
