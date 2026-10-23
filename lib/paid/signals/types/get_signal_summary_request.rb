# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class GetSignalSummaryRequest < Internal::Types::Model
        field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"

        field :interval, -> { Paid::Signals::Types::GetSignalSummaryRequestInterval }, optional: false, nullable: false

        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

        field :external_customer_id, -> { String }, optional: true, nullable: false, api_name: "externalCustomerId"

        field :signal_names, -> { String }, optional: true, nullable: false, api_name: "signalNames"

        field :group_by, -> { Paid::Signals::Types::GetSignalSummaryRequestGroupBy }, optional: true, nullable: false, api_name: "groupBy"

        field :dimension_key, -> { String }, optional: true, nullable: false, api_name: "dimensionKey"

        field :format, -> { Paid::Signals::Types::GetSignalSummaryRequestFormat }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
