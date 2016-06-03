defmodule Frex.Client.StaffTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Expenses

  test "Expenses.get calls are successful" do
    {status, _} = Expenses.get
    assert status == :ok
  end

  test "Expenses.list calls are successful" do
    {status, _} = Expenses.list
    assert status == :ok
  end
end
