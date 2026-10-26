# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class ValueModelContentFlowsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :grouping_key_id, -> { String }, optional: false, nullable: false, api_name: "groupingKeyId"

      field :value, -> { String }, optional: false, nullable: false

      field :completion_event_name, -> { String }, optional: true, nullable: false, api_name: "completionEventName"

      field :run_noun, -> { String }, optional: true, nullable: false, api_name: "runNoun"

      field :run_name_field, -> { String }, optional: true, nullable: false, api_name: "runNameField"
    end
  end
end
