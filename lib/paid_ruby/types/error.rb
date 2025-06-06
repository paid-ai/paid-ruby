# frozen_string_literal: true

require_relative "api_error"
require "ostruct"
require "json"

module Paid
  # An error response from the Paid API
  class Error
    # @return [Paid::ApiError]
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [Paid::ApiError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Error]
    def initialize(error:, additional_properties: nil)
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "error": error }
    end

    # Deserialize a JSON object to an instance of Error
    #
    # @param json_object [String]
    # @return [Paid::Error]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = Paid::ApiError.from_json(json_object: error)
      end
      new(error: error, additional_properties: struct)
    end

    # Serialize an instance of Error to a JSON object
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
      Paid::ApiError.validate_raw(obj: obj.error)
    end
  end
end
