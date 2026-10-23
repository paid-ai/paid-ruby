# frozen_string_literal: true

require_relative "../lib/paid_ruby"

describe "require paid_ruby" do
  it "loads the generated client and the version" do
    client = Paid::Client.new(token: "test-token")

    assert_instance_of Paid::Signals::Client, client.signals
    refute_empty Paid::VERSION
  end

  it "adds the tracing helpers to the client" do
    client = Paid::Client.new(token: "test-token")

    assert_respond_to client, :initialize_tracing
    assert_respond_to client, :capture
  end

  it "runs the block when tracing is not initialized" do
    client = Paid::Client.new(token: "test-token")

    assert_equal 42, client.capture(external_customer_id: "cus_1") { 42 }
  end
end
