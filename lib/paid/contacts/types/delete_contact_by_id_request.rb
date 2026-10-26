# frozen_string_literal: true

module Paid
  module Contacts
    module Types
      class DeleteContactByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
