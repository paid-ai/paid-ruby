# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class BackfillResponse < Internal::Types::Model
      field :value_model_id, -> { String }, optional: false, nullable: false, api_name: "valueModelId"

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
