# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalLookupResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::SignalListItem] }, optional: false, nullable: false

      field :not_found, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "notFound"
    end
  end
end
