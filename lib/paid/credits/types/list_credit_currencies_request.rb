# frozen_string_literal: true

module Paid
  module Credits
    module Types
      class ListCreditCurrenciesRequest < Internal::Types::Model
        field :status, -> { Paid::Credits::Types::ListCreditCurrenciesRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
