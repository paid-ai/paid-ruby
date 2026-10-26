# frozen_string_literal: true

module Paid
  module Credits
    module Types
      class CreateCreditCurrencyRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :key, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: true
      end
    end
  end
end
