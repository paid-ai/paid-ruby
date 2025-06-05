# frozen_string_literal: true

require "ostruct"
require "json"

module PaidApiClient
  class OrderLineCreate
    # @return [String]
    attr_reader :agent_id
    # @return [String]
    attr_reader :agent_external_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param agent_id [String]
    # @param agent_external_id [String]
    # @param name [String]
    # @param description [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PaidApiClient::OrderLineCreate]
    def initialize(agent_id: OMIT, agent_external_id: OMIT, name: OMIT, description: OMIT, additional_properties: nil)
      @agent_id = agent_id if agent_id != OMIT
      @agent_external_id = agent_external_id if agent_external_id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "agentId": agent_id,
        "agentExternalId": agent_external_id,
        "name": name,
        "description": description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OrderLineCreate
    #
    # @param json_object [String]
    # @return [PaidApiClient::OrderLineCreate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      agent_id = parsed_json["agentId"]
      agent_external_id = parsed_json["agentExternalId"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      new(
        agent_id: agent_id,
        agent_external_id: agent_external_id,
        name: name,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of OrderLineCreate to a JSON object
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
      obj.agent_id&.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
      obj.agent_external_id&.is_a?(String) != false || raise("Passed value for field obj.agent_external_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
