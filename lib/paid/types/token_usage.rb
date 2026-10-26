# frozen_string_literal: true

require_relative "../../paid"

module Paid
  module Types
    class TokenUsage < Internal::Types::Model
      field :input_tokens, -> { Integer }, optional: true, nullable: false, api_name: "inputTokens"

      field :output_tokens, -> { Integer }, optional: true, nullable: false, api_name: "outputTokens"

      field :cache_read_input_tokens, -> { Integer }, optional: true, nullable: false, api_name: "cacheReadInputTokens"

      field :cache_creation_input_tokens, -> { Integer }, optional: true, nullable: false, api_name: "cacheCreationInputTokens"

      field :reasoning_output_tokens, -> { Integer }, optional: true, nullable: false, api_name: "reasoningOutputTokens"
    end
  end
end
