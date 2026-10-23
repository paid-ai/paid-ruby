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

See the full API docs at [docs.paid.ai](https://docs.paid.ai). Every client method is listed in [reference.md](./reference.md).

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

Requires Ruby 3.3 or later.

## Usage

The client needs to be configured with your account's API key, which is available in the [Paid dashboard](https://app.paid.ai/agent-integration/api-keys).

```ruby
require 'paid_ruby'

client = Paid::Client.new(token: "API_KEY")

client.customers.create_customer(name: "Acme", external_id: "acme-corp")
```

`require 'paid'` also works if you only need the API client without the tracing helpers.

## Sending signals

```ruby
client.signals.create_signals(signals: [{
  event_name: "email_sent",
  customer: { external_customer_id: "acme-corp" },
  data: { recipients: 3 },
  idempotency_key: "email_sent_msg_8f3a2c"
}])
```

## Errors

When the API returns a non-success status code, the SDK raises an error you can rescue.

```ruby
begin
  client.customers.get_customer_by_external_id(external_id: "acme-corp")
rescue Paid::Errors::ResponseError => e
  puts e.code
  puts e.message
rescue Paid::Errors::ApiError => e
  puts e.message
end
```

## Upgrading from 0.1.x

0.5.0 is generated from the Paid v2 API (`https://api.agentpaid.io/api/v2`) and is not backwards compatible with 0.1.x:

- Methods are named after the API operation, for example `customers.create` is now `customers.create_customer` and `customers.get_by_external_id` is now `customers.get_customer_by_external_id`.
- `client.agents` is gone: use `client.products`.
- `client.usage.record_usage` and `client.usage.flush` are gone: use `client.signals.create_signals`, or `client.costs.create_costs` for costs.
- `Paid::AsyncClient` is gone.
- The client options are `token:`, `base_url:`, `max_retries:` and `timeout:`. `environment:` and `timeout_in_seconds:` are removed.
- Errors are raised as `Paid::Errors::*` classes.
- Ruby 3.3 or later is required.

## Logging

Supported log levels are `DEBUG`, `INFO`, `WARN`, `ERROR`, and `FATAL`.

For example, to set the log level to debug, you can set the environment variable:
```bash
export PAID_LOG_LEVEL=DEBUG
```
Falls back to `FATAL`, which effectively disables logging.

## Cost Tracking

It's possible to track usage costs by using Paid wrappers around you AI provider API.
As of now, the following OpenAI APIs are supported:
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

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
