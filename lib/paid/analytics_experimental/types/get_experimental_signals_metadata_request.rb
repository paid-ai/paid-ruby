# frozen_string_literal: true

module Paid
  module AnalyticsExperimental
    module Types
      class GetExperimentalSignalsMetadataRequest < Internal::Types::Model
        field :signal_name, -> { String }, optional: true, nullable: false, api_name: "signalName"

        field :from_date, -> { String }, optional: true, nullable: false, api_name: "fromDate"

        field :to_date, -> { String }, optional: true, nullable: false, api_name: "toDate"
      end
    end
  end
end
