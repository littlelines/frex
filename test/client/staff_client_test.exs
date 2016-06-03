defmodule Frex.Client.StaffTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Staff

  test "Staff.current calls are successful" do
    {status, _} = Staff.current
    assert status == :ok
  end
end
