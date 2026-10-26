# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionExternalReference < Internal::Types::Model
      field :source, -> { Paid::Types::ProvisionExternalReferenceSource }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
