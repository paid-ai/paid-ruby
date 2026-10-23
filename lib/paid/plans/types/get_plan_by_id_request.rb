# frozen_string_literal: true

module Paid
  module Plans
    module Types
      class GetPlanByIDRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
