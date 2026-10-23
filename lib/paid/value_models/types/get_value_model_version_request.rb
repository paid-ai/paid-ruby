# frozen_string_literal: true

module Paid
  module ValueModels
    module Types
      class GetValueModelVersionRequest < Internal::Types::Model
        field :version, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
