# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AnalyticsQueryResponse < Internal::Types::Model
      field :columns, -> { Internal::Types::Array[Paid::Types::AnalyticsColumn] }, optional: false, nullable: false

      field :rows, -> { Internal::Types::Array[Internal::Types::Array[Object]] }, optional: false, nullable: false

      field :meta, -> { Paid::Types::AnalyticsQueryResponseMeta }, optional: false, nullable: false
    end
  end
end
