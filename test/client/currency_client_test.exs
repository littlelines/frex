defmodule Frex.Client.CurrencyTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Currency
  import Credentials

  test "Currency.list calls are successful" do
    {status, _} = Currency.list(credentials)
    assert status == :ok
  end
end
