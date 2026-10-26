# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class PendingCreditConsumptionListResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Paid::Types::PendingCreditConsumption] }, optional: false, nullable: false

      field :pagination, -> { Paid::Types::Pagination }, optional: false, nullable: false
    end
  end
end
