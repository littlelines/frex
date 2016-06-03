defmodule Frex.Client.GatewaysTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Gateways
  import Credentials

  test "Gateways.get calls are successful" do
    {status, _} = Gateways.get(credentials, 1)
    assert status == :ok
  end

  test "Gateways.list calls are successful" do
    {status, _} = Gateways.list(credentials)
    assert status == :ok
  end
end
