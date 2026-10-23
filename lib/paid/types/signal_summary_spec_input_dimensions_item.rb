# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummarySpecInputDimensionsItem < Internal::Types::Model
      extend Paid::Internal::Types::Union

      discriminant :kind

      member -> { Paid::Types::SignalSummaryPresenceDimension }, key: "PRESENCE"

      member -> { Paid::Types::SignalSummaryBandsDimension }, key: "BANDS"
    end
  end
end
