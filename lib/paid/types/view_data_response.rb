# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ViewDataResponse < Internal::Types::Model
      field :context, -> { Paid::Types::CustomViewDataContext }, optional: true, nullable: false

      field :data, -> { Internal::Types::Hash[String, Internal::Types::Array[Internal::Types::Hash[String, Object]]] }, optional: false, nullable: false
    end
  end
end
