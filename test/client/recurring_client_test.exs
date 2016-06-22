defmodule Frex.Client.RecurringTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Recurring
  import Credentials

  test "Recurring.get calls are successful" do
    {status, _} = Recurring.get(credentials, 00000000656)
    assert status == :ok
  end

  test "Recurring.list calls are successful" do
    {status, _, _} = Recurring.list(credentials)
    assert status == :ok
  end
end
