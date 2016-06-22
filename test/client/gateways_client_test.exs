defmodule Frex.Client.GatewaysTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Gateways
  import Credentials

  test "Gateways.list calls are successful" do
    {status, _, _} = Gateways.list(credentials)
    assert status == :ok
  end
end
