# frozen_string_literal: true

module Paid
  module Signals
    module Types
      class CreateSignalSummaryExportRequest < Internal::Types::Model
        field :spec, -> { Paid::Types::SignalSummarySpecInput }, optional: true, nullable: false

        field :copy_from, -> { String }, optional: true, nullable: false, api_name: "copyFrom"

        field :from, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false

        field :customer_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "customerIds"

        field :format, -> { Paid::Signals::Types::CreateSignalSummaryExportRequestFormat }, optional: true, nullable: false
      end
    end
  end
end
