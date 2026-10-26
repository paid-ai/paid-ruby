# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomerAliasCreateRequest < Internal::Types::Model
      field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
