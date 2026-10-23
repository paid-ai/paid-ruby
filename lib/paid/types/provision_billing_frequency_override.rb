# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ProvisionBillingFrequencyOverride < Internal::Types::Model
      field :frequency, -> { Paid::Types::ProvisionBillingFrequencyOverrideFrequency }, optional: false, nullable: false

      field :custom_months, -> { Integer }, optional: true, nullable: true, api_name: "customMonths"
    end
  end
end
