defmodule Frex.Client.ExpensesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Expenses

  test "Expenses.list calls are successful" do
    {status, _} = Expenses.list
    assert status == :ok
  end
end
