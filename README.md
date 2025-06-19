<div align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./assets/paid_light.svg" width=600>
        <source media="(prefers-color-scheme: light)" srcset="./assets/paid_dark.svg" width=600>
        <img alt="Fallback image description" src="./assets/paid_light.svg" width=600>
    </picture>
</div>

# 

<div align="center">
    <a href="https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2FAgentPaid%2Fpaid-ruby">
        <img src="https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen" alt="fern shield">
    </a>
    <a href="https://rubygems.org/gems/paid_ruby">
        <img src="https://img.shields.io/gem/v/paid_ruby" alt="rubygems shield">
    </a>
</div>

Paid is the all-in-one, drop-in Business Engine for AI Agents that handles your pricing, subscriptions, margins, billing, and renewals with just 5 lines of code. 
The Paid Ruby library provides convenient access to the Paid API from Ruby applications.

## Documentation

See the full API docs [here](https://paid.docs.buildwithfern.com/api-reference/api-reference/customers/list)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paid_ruby'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install paid_ruby
```

## Usage

The client needs to be configured with your account's API key, which is available in the [Paid dashboard](https://app.paid.ai/agent-integration/api-keys). 

```ruby
require 'paid_ruby'

client = Paid::Client.new(token: "API_KEY")

client.customers.create(
  name: "name"
)
```

## Request And Response Types

The SDK provides Ruby classes for all request and response types. These are automatically handled when making API calls.

```ruby
# Example of creating a customer
response = client.customers.create(
  name: "John Doe",
)

# Access response data
puts response.name
puts response.email
```

## Exception Handling

When the API returns a non-success status code (4xx or 5xx response), the SDK will raise an appropriate error.

```ruby
begin
  client.customers.create(...)
rescue Paid::Error => e
  puts e.status_code
  puts e.message
  puts e.body
  puts e.raw_response
end
```

## Logging

Supported log levels are `DEBUG`, `INFO`, `WARN`, `ERROR`, and `FATAL`.

For example, to set the log level to debug, you can set the environment variable:
```bash
export PAID_LOG_LEVEL=DEBUG
```
Falls back to `FATAL`, which effectively disables logging.

## Cost Tracking

It's possible to track usage costs by using Paid wrappers around you AI provider API.
As of now, the following OpenAI python APIs are supported:
```
chat()
embeddings()
images.generate()
```

Example usage:

```ruby
require 'paid_ruby'
require 'openai'

# 1. Initialize the Paid client and tracing
# Replace with your actual Paid API token
paid_client = Paid::Client.new(token: "<your_paid_api_key>")

# 2. initialize cost tracking
paid_client.initialize_tracing

# 3. Initialize the standard OpenAI client
openai_client = OpenAI::Client.new(
    access_token: "<your_openai_api_key>"
)

# 4. Instantiate the wrapper using its full module path
paid_openai_client = Paid::Tracing::Wrappers::PaidOpenAI.new(openai_client: openai_client)

def create_image(client)
  image_response = client.images.generate(
    parameters: {
      prompt: "A cute baby sea otter programming in Ruby",
      size: "256x256"
    }
  )
end

paid_client.capture(external_customer_id: "<your_external_customer_id>") do
  create_image(paid_openai_client)
end
```

## Manual cost tracking

Manual cost tracking allow to insert your own costs to the usage data and
cost traces will be created based on that info.

```ruby
require 'paid_ruby'

client = Paid::Client.new(token: "<your_paid_api_key>")

client.usage.record_usage(
  signal: {
    event_name: "<your_signal_name>",
    agent_id: "<your_agent_id>",
    customer_id: "<your_customer_id>",
    data: {
        "costData": {
            "vendor": "<vendor_name>", # can be anything
            "cost": {
                "amount": 0.003,
                "currency": "USD"
            }
        }
    }
  }
)

client.usage.flush
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
