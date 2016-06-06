defmodule Frex.Client.TaxesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Taxes
  import Credentials

  test "Taxes.get calls are successful" do
    {status, _} = Taxes.get(credentials, 10819)
    assert status == :ok
  end

  test "Taxes.list calls are successful" do
    {status, _} = Taxes.list(credentials)
    assert status == :ok
  end
end
