defmodule Frex.HTTPTest do
  use ExUnit.Case, async: true

  import Credentials

  test "can't send a request without ALL oauth credentials" do
    assert_raise ArgumentError, "Missing OAuth consumer credentials", fn ->
      Application.put_env(:frex, :freshbooks_oauth_consumer_key, nil)
      credentials |> Frex.Client.Staff.current
    end

    Application.put_env(:frex, :freshbooks_oauth_consumer_key, "rubyrags")
  end
end
