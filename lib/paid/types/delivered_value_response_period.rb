# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    # The resolved period, echoing date-only inputs expanded to full UTC date-times.
    class DeliveredValueResponsePeriod < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

      field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"
    end
  end
end
