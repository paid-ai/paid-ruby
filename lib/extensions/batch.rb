
# frozen_string_literal: true

module Paid
  class BatchUsageClient < Paid::UsageClient
    def flush(request_options: nil)
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
  end


  class AsyncBatchUsageClient < Paid::AsyncUsageClient
    def flush(request_options: nil)
      Async do
        record_bulk(signals: @signals, request_options: request_options)
        @signals = []
      end
    end

    def record_usage(signal: nil, request_options: nil)
      Async do
        @signals ||= []
        @signals << signal
        if @signals.length >= 100
            record_bulk(signals: @signals, request_options: request_options)
            @signals = []
        end
      end
    end
  end

  UsageClient = BatchUsageClient
  AsyncUsageClient = AsyncBatchUsageClient

end
