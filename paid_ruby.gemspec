# frozen_string_literal: true
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"

Gem::Specification.new do | spec |
  spec.name = "paid_ruby"
  spec.version = "0.1.1-rc3"
  spec.authors = Paid::Gemconfig::AUTHORS
  spec.email = Paid::Gemconfig::EMAIL
  spec.summary = Paid::Gemconfig::SUMMARY
  spec.description = Paid::Gemconfig::DESCRIPTION
  spec.homepage = Paid::Gemconfig::HOMEPAGE
  spec.required_ruby_version = ">= 2.7.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = Paid::Gemconfig::SOURCE_CODE_URI
  spec.metadata["changelog_uri"] = Paid::Gemconfig::CHANGELOG_URI
  spec.files = Dir.glob("lib/**/*")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "opentelemetry-api", "~> 1.5"
  spec.add_dependency "opentelemetry-exporter-otlp", "~> 0.30.0"
  spec.add_dependency "opentelemetry-sdk", "~> 1.8"
  spec.add_dependency "ruby-openai", "~> 8.1"
  spec.add_dependency "faraday", ">= 1.10", "< 3.0"
  spec.add_dependency "faraday-net_http", ">= 1.0", "< 4.0"
  spec.add_dependency "faraday-retry", ">= 1.0", "< 3.0"
  spec.add_dependency "async-http-faraday", ">= 0.0", "< 1.0"
end