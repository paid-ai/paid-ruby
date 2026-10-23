# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelAuthoringGuideExamplesItem < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :explanation, -> { String }, optional: false, nullable: false

      field :request, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
