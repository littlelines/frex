defmodule Frex.Client.ExpensesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Expenses
  import Credentials

  test "Expenses.list calls are successful" do
    {status, _} = Expenses.list(credentials)
    assert status == :ok
  end
end
