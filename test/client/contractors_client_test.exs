defmodule Frex.Client.ContractorsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Contractors
  import Credentials

  test "Contractors.get calls are successful" do
    {status, _} = Contractors.get(credentials, 41077)
    assert status == :ok
  end

  test "Contractors.list calls are successful" do
    {status, _, _} = Contractors.list(credentials)
    assert status == :ok
  end
end
