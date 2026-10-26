# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewPreviewHarness < Internal::Types::Model
      field :harness, -> { String }, optional: false, nullable: false
    end
  end
end
