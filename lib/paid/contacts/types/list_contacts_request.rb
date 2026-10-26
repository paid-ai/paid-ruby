# frozen_string_literal: true

module Paid
  module Contacts
    module Types
      class ListContactsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
