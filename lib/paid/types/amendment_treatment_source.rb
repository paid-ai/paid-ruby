# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentTreatmentSource
      extend Paid::Internal::Types::Enum

      REQUEST = "request"
      REQUEST_DEFAULT = "requestDefault"
      DEFAULT = "default"
    end
  end
end
