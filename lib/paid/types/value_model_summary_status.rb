# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module ValueModelSummaryStatus
      extend Paid::Internal::Types::Enum

      DRAFT = "draft"
      ACTIVE = "active"
      ARCHIVED = "archived"
    end
  end
end
