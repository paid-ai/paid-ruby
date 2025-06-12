# frozen_string_literal: true
require "ostruct"
require "json"

module Paid
# An API error response from the Paid API
  class ApiError
  # @return [String] A human-readable message providing more details about the error.
    attr_reader :message
  # @return [String] 
    attr_reader :code
  # @return [String] 
    attr_reader :details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] A human-readable message providing more details about the error.
    # @param code [String] 
    # @param details [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::ApiError]
    def initialize(message: OMIT, code: OMIT, details: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @code = code if code != OMIT
      @details = details if details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "code": code, "details": details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApiError
    #
    # @param json_object [String] 
    # @return [Paid::ApiError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      code = parsed_json["code"]
      details = parsed_json["details"]
      new(
        message: message,
        code: code,
        details: details,
        additional_properties: struct
      )
    end
# Serialize an instance of ApiError to a JSON object
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
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.details&.is_a?(String) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
    end
  end
end