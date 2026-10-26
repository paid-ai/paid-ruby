# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module AmendmentCreditEffectKind
      extend Paid::Internal::Types::Enum

      END_ENTITLEMENT = "endEntitlement"
      GRANT_ON_ACTIVATION = "grantOnActivation"
    end
  end
end
