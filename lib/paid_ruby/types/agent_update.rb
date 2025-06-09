# frozen_string_literal: true
require_relative "agent_attribute"
require "ostruct"
require "json"

module Paid
  class AgentUpdate
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :external_id
  # @return [Boolean] 
    attr_reader :active
  # @return [String] 
    attr_reader :agent_code
  # @return [Array<Paid::AgentAttribute>] 
    attr_reader :agent_attributes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param description [String] 
    # @param external_id [String] 
    # @param active [Boolean] 
    # @param agent_code [String] 
    # @param agent_attributes [Array<Paid::AgentAttribute>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::AgentUpdate]
    def initialize(name: OMIT, description: OMIT, external_id: OMIT, active: OMIT, agent_code: OMIT, agent_attributes: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @description = description if description != OMIT
      @external_id = external_id if external_id != OMIT
      @active = active if active != OMIT
      @agent_code = agent_code if agent_code != OMIT
      @agent_attributes = agent_attributes if agent_attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "description": description, "externalId": external_id, "active": active, "agentCode": agent_code, "agentAttributes": agent_attributes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AgentUpdate
    #
    # @param json_object [String] 
    # @return [Paid::AgentUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      external_id = parsed_json["externalId"]
      active = parsed_json["active"]
      agent_code = parsed_json["agentCode"]
      agent_attributes = parsed_json["agentAttributes"]&.map do | item |
  item = item.to_json
  Paid::AgentAttribute.from_json(json_object: item)
end
      new(
        name: name,
        description: description,
        external_id: external_id,
        active: active,
        agent_code: agent_code,
        agent_attributes: agent_attributes,
        additional_properties: struct
      )
    end
# Serialize an instance of AgentUpdate to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.active&.is_a?(Boolean) != false || raise("Passed value for field obj.active is not the expected type, validation failed.")
      obj.agent_code&.is_a?(String) != false || raise("Passed value for field obj.agent_code is not the expected type, validation failed.")
      obj.agent_attributes&.is_a?(Array) != false || raise("Passed value for field obj.agent_attributes is not the expected type, validation failed.")
    end
  end
end