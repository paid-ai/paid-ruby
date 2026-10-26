# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewPreviewHarnessRequest < Internal::Types::Model
      field :context, -> { Paid::Types::CustomViewDataContext }, optional: true, nullable: false

      field :render_bundle, -> { String }, optional: false, nullable: false, api_name: "renderBundle"

      field :data, -> { Internal::Types::Hash[String, Internal::Types::Array[Internal::Types::Hash[String, Object]]] }, optional: true, nullable: false

      field :synthetic, -> { Internal::Types::Hash[String, Internal::Types::Array[Paid::Types::CustomViewPreviewHarnessColumn]] }, optional: true, nullable: false

      field :sample_data, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sampleData"
    end
  end
end
