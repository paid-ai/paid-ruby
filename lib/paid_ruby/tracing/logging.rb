# frozen_string_literal: true

require "logger"

module Paid
  module Tracing
    # Provides a central logger for the gem.
    # The log level can be configured via the PAID_LOG_LEVEL environment variable.
    # Supported levels are DEBUG, INFO, WARN, ERROR, FATAL.
    # If the variable is not set, the level defaults to FATAL to suppress output.
    module Logging
      def self.logger
        @logger ||= begin
          log_level_str = ENV["PAID_LOG_LEVEL"]&.upcase
          level = if log_level_str && Logger.const_defined?(log_level_str)
                    Logger.const_get(log_level_str)
                  else
                    # Default to a level that shows no logs unless explicitly configured.
                    Logger::FATAL
                  end

          logger = Logger.new($stdout)
          logger.level = level
          logger.formatter = proc do |severity, _datetime, _progname, msg|
            "[Paid SDK] #{severity}: #{msg}\n"
          end
          logger
        end
      end
    end
  end
end
