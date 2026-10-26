# frozen_string_literal: true

module Paid
  module Contacts
    module Types
      class UpdateContactByExternalIDRequest < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :body, -> { Paid::Types::UpdateContactRequest }, optional: false, nullable: false
      end
    end
  end
end
