# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    module Types
      class PublishCustomViewRequest < Internal::Types::Model
        field :display_id, -> { String }, optional: false, nullable: false, api_name: "displayId"
      end
    end
  end
end
