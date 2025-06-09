# frozen_string_literal: true
require_relative "salutation"
require "ostruct"
require "json"

module Paid
  class Contact
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :external_id
  # @return [String] 
    attr_reader :organization_id
  # @return [String] 
    attr_reader :customer_id
  # @return [String] 
    attr_reader :customer_external_id
  # @return [Paid::Salutation] 
    attr_reader :salutation
  # @return [String] 
    attr_reader :first_name
  # @return [String] 
    attr_reader :last_name
  # @return [String] 
    attr_reader :email
  # @return [String] 
    attr_reader :phone
  # @return [String] 
    attr_reader :billing_street
  # @return [String] 
    attr_reader :billing_city
  # @return [String] 
    attr_reader :billing_state_province
  # @return [String] 
    attr_reader :billing_country
  # @return [String] 
    attr_reader :billing_postal_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param external_id [String] 
    # @param organization_id [String] 
    # @param customer_id [String] 
    # @param customer_external_id [String] 
    # @param salutation [Paid::Salutation] 
    # @param first_name [String] 
    # @param last_name [String] 
    # @param email [String] 
    # @param phone [String] 
    # @param billing_street [String] 
    # @param billing_city [String] 
    # @param billing_state_province [String] 
    # @param billing_country [String] 
    # @param billing_postal_code [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Paid::Contact]
    def initialize(id: OMIT, external_id: OMIT, organization_id: OMIT, customer_id: OMIT, customer_external_id: OMIT, salutation: OMIT, first_name: OMIT, last_name: OMIT, email: OMIT, phone: OMIT, billing_street: OMIT, billing_city: OMIT, billing_state_province: OMIT, billing_country: OMIT, billing_postal_code: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @external_id = external_id if external_id != OMIT
      @organization_id = organization_id if organization_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @customer_external_id = customer_external_id if customer_external_id != OMIT
      @salutation = salutation if salutation != OMIT
      @first_name = first_name if first_name != OMIT
      @last_name = last_name if last_name != OMIT
      @email = email if email != OMIT
      @phone = phone if phone != OMIT
      @billing_street = billing_street if billing_street != OMIT
      @billing_city = billing_city if billing_city != OMIT
      @billing_state_province = billing_state_province if billing_state_province != OMIT
      @billing_country = billing_country if billing_country != OMIT
      @billing_postal_code = billing_postal_code if billing_postal_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "externalId": external_id, "organizationId": organization_id, "customerId": customer_id, "customerExternalId": customer_external_id, "salutation": salutation, "firstName": first_name, "lastName": last_name, "email": email, "phone": phone, "billingStreet": billing_street, "billingCity": billing_city, "billingStateProvince": billing_state_province, "billingCountry": billing_country, "billingPostalCode": billing_postal_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Contact
    #
    # @param json_object [String] 
    # @return [Paid::Contact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      external_id = parsed_json["externalId"]
      organization_id = parsed_json["organizationId"]
      customer_id = parsed_json["customerId"]
      customer_external_id = parsed_json["customerExternalId"]
      salutation = parsed_json["salutation"]
      first_name = parsed_json["firstName"]
      last_name = parsed_json["lastName"]
      email = parsed_json["email"]
      phone = parsed_json["phone"]
      billing_street = parsed_json["billingStreet"]
      billing_city = parsed_json["billingCity"]
      billing_state_province = parsed_json["billingStateProvince"]
      billing_country = parsed_json["billingCountry"]
      billing_postal_code = parsed_json["billingPostalCode"]
      new(
        id: id,
        external_id: external_id,
        organization_id: organization_id,
        customer_id: customer_id,
        customer_external_id: customer_external_id,
        salutation: salutation,
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone: phone,
        billing_street: billing_street,
        billing_city: billing_city,
        billing_state_province: billing_state_province,
        billing_country: billing_country,
        billing_postal_code: billing_postal_code,
        additional_properties: struct
      )
    end
# Serialize an instance of Contact to a JSON object
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
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.organization_id&.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.customer_external_id&.is_a?(String) != false || raise("Passed value for field obj.customer_external_id is not the expected type, validation failed.")
      obj.salutation&.is_a?(Paid::Salutation) != false || raise("Passed value for field obj.salutation is not the expected type, validation failed.")
      obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.billing_street&.is_a?(String) != false || raise("Passed value for field obj.billing_street is not the expected type, validation failed.")
      obj.billing_city&.is_a?(String) != false || raise("Passed value for field obj.billing_city is not the expected type, validation failed.")
      obj.billing_state_province&.is_a?(String) != false || raise("Passed value for field obj.billing_state_province is not the expected type, validation failed.")
      obj.billing_country&.is_a?(String) != false || raise("Passed value for field obj.billing_country is not the expected type, validation failed.")
      obj.billing_postal_code&.is_a?(String) != false || raise("Passed value for field obj.billing_postal_code is not the expected type, validation failed.")
    end
  end
end