# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class SignalSummaryExport < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Paid::Types::SignalSummaryExportStatus }, optional: false, nullable: false

      field :spec, -> { Paid::Types::SignalSummaryDefinitionSpec }, optional: false, nullable: false

      field :columns, -> { Internal::Types::Array[Paid::Types::SignalSummaryColumn] }, optional: false, nullable: false

      field :format, -> { Paid::Types::SignalSummaryExportFormat }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :row_count, -> { Integer }, optional: false, nullable: true, api_name: "rowCount"

      field :download_url, -> { String }, optional: false, nullable: true, api_name: "downloadUrl"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :error, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :completed_at, -> { String }, optional: false, nullable: true, api_name: "completedAt"
    end
  end
end
