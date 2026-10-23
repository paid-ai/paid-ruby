# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomViewStatus
      extend Paid::Internal::Types::Enum

      DRAFT = "DRAFT"
      PUBLISHED = "PUBLISHED"
    end
  end
end
