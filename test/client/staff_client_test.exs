defmodule Frex.Client.StaffTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Staff
  import Credentials

  test "Staff.current calls are successful" do
    {status, _} = Staff.current(credentials)
    assert status == :ok
  end

  test "Staff.get calls are successful" do
    {status, _} = Staff.get(credentials, 1)
    assert status == :ok
  end

  test "Staff.list calls are successful" do
    {status, _} = Staff.list(credentials)
    assert status == :ok
  end
end
