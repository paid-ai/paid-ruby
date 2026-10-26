# frozen_string_literal: true

module Paid
  module Credits
    module Types
      class UpdateCreditCurrencyRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: true

        field :status, -> { Paid::Credits::Types::UpdateCreditCurrencyRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
