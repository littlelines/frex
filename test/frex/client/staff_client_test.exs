defmodule Frex.Client.StaffTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Staff

  test "Staff.current calls are successful" do
    {status, _} = Staff.current
    assert status == :ok
  end

  test "Staff.get calls are successful" do
    {status, _} = Staff.get(1)
    assert status == :ok
  end

  test "Staff.list calls are successful" do
    {status, _} = Staff.list
    assert status == :ok
  end
end
