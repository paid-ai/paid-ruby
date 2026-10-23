# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    module CustomViewPreviewHarnessColumnType
      extend Paid::Internal::Types::Enum

      DATE = "date"
      NUMBER = "number"
      STRING = "string"
      BOOLEAN = "boolean"
    end
  end
end
