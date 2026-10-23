# frozen_string_literal: true

require_relative "../../../paid"

module Paid
  module ValueReceipts
    module Types
      module ListValueReceiptsRequestArchived
        extend Paid::Internal::Types::Enum

        TRUE = "true"
        FALSE = "false"
      end
    end
  end
end
