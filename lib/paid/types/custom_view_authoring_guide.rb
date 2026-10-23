# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class CustomViewAuthoringGuide < Internal::Types::Model
      field :guide, -> { String }, optional: false, nullable: false

      field :sample_bundle, -> { String }, optional: false, nullable: false, api_name: "sampleBundle"
    end
  end
end
