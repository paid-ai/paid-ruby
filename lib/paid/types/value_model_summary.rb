# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false

      field :status, -> { Paid::Types::ValueModelSummaryStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :activated_at, -> { String }, optional: false, nullable: true, api_name: "activatedAt"

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"

      field :effective_from, -> { String }, optional: false, nullable: true, api_name: "effectiveFrom"

      field :effective_to, -> { String }, optional: false, nullable: true, api_name: "effectiveTo"
    end
  end
end
