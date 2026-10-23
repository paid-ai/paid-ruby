# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class RenderBundleEdit < Internal::Types::Model
      field :old_text, -> { String }, optional: false, nullable: false, api_name: "oldText"

      field :new_text, -> { String }, optional: false, nullable: false, api_name: "newText"

      field :replace_all, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "replaceAll"
    end
  end
end
