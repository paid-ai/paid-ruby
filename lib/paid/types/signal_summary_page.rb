# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryPage < Internal::Types::Model
      field :limit, -> { Float }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :next_cursor, -> { String }, optional: false, nullable: true, api_name: "nextCursor"
    end
  end
end
