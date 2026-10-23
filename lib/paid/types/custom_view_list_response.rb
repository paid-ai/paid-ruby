# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewListResponse < Internal::Types::Model
      field :views, -> { Internal::Types::Array[Paid::Types::CustomViewSummary] }, optional: false, nullable: false
    end
  end
end
