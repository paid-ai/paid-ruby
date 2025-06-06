
# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/signal"
require "json"
require "async"

module Paid
  class BatchUsageClient < Paid::UsageClient
    def initialize(request_client:, )
      super(request_client: request_client)
      @signals = []
    end

    def flush()
      record_bulk(signals: @signals, request_options: request_options)
      @signals = []
    end

    def record_usage(signal: nil, request_options: nil)
      @signals ||= []
      @signals << signal
      if @signals.length >= 100
        record_bulk(signals: @signals, request_options: request_options)
        @signals = []
      end
    end

    def record_bulk(signals: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), signals: signals }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/usage/signals/bulk"
      end
      JSON.parse(response.body)
    end
  end


  UsageClient = BatchUsageClient


end
