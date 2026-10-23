# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class BulkSignalsResponse < Internal::Types::Model
      field :ingested, -> { Integer }, optional: false, nullable: false

      field :duplicates, -> { Integer }, optional: false, nullable: false

      field :failed, -> { Integer }, optional: false, nullable: false
    end
  end
end
