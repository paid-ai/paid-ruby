# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummarySignalSelection < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :group, -> { String }, optional: false, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
