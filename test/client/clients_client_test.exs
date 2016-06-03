defmodule Frex.Client.ClientsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Clients
  import Credentials

  test "Clients.get calls are successful" do
    {status, _} = Clients.get(credentials, 33794)
    assert status == :ok
  end

  test "Clients.list calls are successful" do
    {status, _} = Clients.list(credentials)
    assert status == :ok
  end
end
