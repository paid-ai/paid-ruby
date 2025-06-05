# frozen_string_literal: true

require_relative "tax_exempt_status"
require_relative "creation_source"
require_relative "creation_state"
require_relative "address"
require "ostruct"
require "json"

module PaidApiClient
  class Customer
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :organization_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :external_id
    # @return [String]
    attr_reader :phone
    # @return [Float]
    attr_reader :employee_count
    # @return [Float]
    attr_reader :annual_revenue
    # @return [PaidApiClient::TaxExemptStatus]
    attr_reader :tax_exempt_status
    # @return [PaidApiClient::CreationSource]
    attr_reader :creation_source
    # @return [PaidApiClient::CreationState]
    attr_reader :creation_state
    # @return [String]
    attr_reader :website
    # @return [PaidApiClient::Address]
    attr_reader :billing_address
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param organization_id [String]
    # @param name [String]
    # @param external_id [String]
    # @param phone [String]
    # @param employee_count [Float]
    # @param annual_revenue [Float]
    # @param tax_exempt_status [PaidApiClient::TaxExemptStatus]
    # @param creation_source [PaidApiClient::CreationSource]
    # @param creation_state [PaidApiClient::CreationState]
    # @param website [String]
    # @param billing_address [PaidApiClient::Address]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PaidApiClient::Customer]
    def initialize(id:, organization_id:, name:, external_id: OMIT, phone: OMIT, employee_count: OMIT,
                   annual_revenue: OMIT, tax_exempt_status: OMIT, creation_source: OMIT, creation_state: OMIT, website: OMIT, billing_address: OMIT, additional_properties: nil)
      @id = id
      @organization_id = organization_id
      @name = name
      @external_id = external_id if external_id != OMIT
      @phone = phone if phone != OMIT
      @employee_count = employee_count if employee_count != OMIT
      @annual_revenue = annual_revenue if annual_revenue != OMIT
      @tax_exempt_status = tax_exempt_status if tax_exempt_status != OMIT
      @creation_source = creation_source if creation_source != OMIT
      @creation_state = creation_state if creation_state != OMIT
      @website = website if website != OMIT
      @billing_address = billing_address if billing_address != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "organizationId": organization_id,
        "name": name,
        "externalId": external_id,
        "phone": phone,
        "employeeCount": employee_count,
        "annualRevenue": annual_revenue,
        "taxExemptStatus": tax_exempt_status,
        "creationSource": creation_source,
        "creationState": creation_state,
        "website": website,
        "billingAddress": billing_address
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Customer
    #
    # @param json_object [String]
    # @return [PaidApiClient::Customer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      organization_id = parsed_json["organizationId"]
      name = parsed_json["name"]
      external_id = parsed_json["externalId"]
      phone = parsed_json["phone"]
      employee_count = parsed_json["employeeCount"]
      annual_revenue = parsed_json["annualRevenue"]
      tax_exempt_status = parsed_json["taxExemptStatus"]
      creation_source = parsed_json["creationSource"]
      creation_state = parsed_json["creationState"]
      website = parsed_json["website"]
      if parsed_json["billingAddress"].nil?
        billing_address = nil
      else
        billing_address = parsed_json["billingAddress"].to_json
        billing_address = PaidApiClient::Address.from_json(json_object: billing_address)
      end
      new(
        id: id,
        organization_id: organization_id,
        name: name,
        external_id: external_id,
        phone: phone,
        employee_count: employee_count,
        annual_revenue: annual_revenue,
        tax_exempt_status: tax_exempt_status,
        creation_source: creation_source,
        creation_state: creation_state,
        website: website,
        billing_address: billing_address,
        additional_properties: struct
      )
    end

    # Serialize an instance of Customer to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.employee_count&.is_a?(Float) != false || raise("Passed value for field obj.employee_count is not the expected type, validation failed.")
      obj.annual_revenue&.is_a?(Float) != false || raise("Passed value for field obj.annual_revenue is not the expected type, validation failed.")
      obj.tax_exempt_status&.is_a?(PaidApiClient::TaxExemptStatus) != false || raise("Passed value for field obj.tax_exempt_status is not the expected type, validation failed.")
      obj.creation_source&.is_a?(PaidApiClient::CreationSource) != false || raise("Passed value for field obj.creation_source is not the expected type, validation failed.")
      obj.creation_state&.is_a?(PaidApiClient::CreationState) != false || raise("Passed value for field obj.creation_state is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
      obj.billing_address.nil? || PaidApiClient::Address.validate_raw(obj: obj.billing_address)
    end
  end
end
