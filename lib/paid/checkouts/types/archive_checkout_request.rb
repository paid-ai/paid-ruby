# frozen_string_literal: true

module Paid
  module Checkouts
    module Types
      class ArchiveCheckoutRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
