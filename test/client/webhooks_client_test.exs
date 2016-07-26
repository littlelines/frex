defmodule Frex.Client.WebhooksTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Webhooks
  import Credentials

  test "Webhooks.create calls are successful" do
    {status, _} = Webhooks.create(credentials, "all", "http://example.com/callback")
    assert status == :ok
  end
end
