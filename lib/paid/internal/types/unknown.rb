# frozen_string_literal: true

module Paid
  module Internal
    module Types
      module Unknown
        include Paid::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
