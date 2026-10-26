# frozen_string_literal: true

# Entry point for `require "paid_ruby"`, the name the gem is published under.
# It loads the generated client (lib/paid.rb) and the hand-written tracing helpers.

require_relative "paid"
require_relative "paid/version"
require_relative "paid_ruby/tracing/tracing"
require_relative "paid_ruby/tracing/wrappers/open_ai_wrapper"

module Paid
  # Adds the tracing helpers to the generated client.
  module ClientTracing
    def initialize(token:, **)
      @tracing_token = token
      super
    end

    def initialize_tracing
      api_key = @tracing_token.to_s.sub(/\ABearer /, "")
      Paid::Tracing.initialize_tracing(api_key: api_key)
    end

    # @param external_customer_id [String]
    def capture(*, external_customer_id:, &)
      Paid::Tracing.capture(*, external_customer_id: external_customer_id, &)
    end
  end

  Client.prepend(ClientTracing)
end
