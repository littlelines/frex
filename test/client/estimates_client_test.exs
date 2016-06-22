defmodule Frex.Client.EstimatesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Estimates
  import Credentials

  test "Estimates.get calls are successful" do
    {status, _} = Estimates.get(credentials, 00000001170)
    assert status == :ok
  end

  test "Estimates.list calls are successful" do
    {status, _, _} = Estimates.list(credentials)
    assert status == :ok
  end
end
