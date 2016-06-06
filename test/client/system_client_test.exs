defmodule Frex.Client.SystemTest do
  use ExUnit.Case, async: true
  alias Frex.Client.System
  import Credentials

  test "System.current calls are successful" do
    {status, _} = System.current(credentials)
    assert status == :ok
  end
end
