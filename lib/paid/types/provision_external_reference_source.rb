# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ProvisionExternalReferenceSource
      extend Paid::Internal::Types::Enum

      SALESFORCE = "salesforce"
      HUBSPOT = "hubspot"
      SALESBRICKS = "salesbricks"
      STANDARD = "standard"
    end
  end
end
