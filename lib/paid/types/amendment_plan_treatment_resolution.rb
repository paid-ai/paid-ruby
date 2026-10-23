# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class AmendmentPlanTreatmentResolution < Internal::Types::Model
      field :intent_index, -> { Integer }, optional: false, nullable: false, api_name: "intentIndex"

      field :axis, -> { Paid::Types::AmendmentAxisID }, optional: false, nullable: false

      field :value, -> { Paid::Types::AmendmentAxisChoiceValue }, optional: false, nullable: false

      field :source, -> { Paid::Types::AmendmentTreatmentSource }, optional: false, nullable: false

      field :reason, -> { String }, optional: false, nullable: false
    end
  end
end
