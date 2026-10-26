# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class UpdatePlanByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :body, -> { Paid::Types::UpdatePlanRequest }, optional: false, nullable: false
      end
    end
  end
end
