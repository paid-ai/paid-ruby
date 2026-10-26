# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class Pagination < Internal::Types::Model
      field :limit, -> { Integer }, optional: false, nullable: false

      field :offset, -> { Integer }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"
    end
  end
end
