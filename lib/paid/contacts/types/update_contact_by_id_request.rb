# frozen_string_literal: true

module Paid
  module Contacts
    module Types
      class UpdateContactByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::UpdateContactRequest }, optional: false, nullable: false
      end
    end
  end
end
