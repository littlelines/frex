defmodule Frex.Client.ItemsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Items
  import Credentials

  test "Items.get calls are successful" do
    {status, _} = Items.get(credentials, 18552)
    assert status == :ok
  end

  test "Items.list calls are successful" do
    {status, _} = Items.list(credentials)
    assert status == :ok
  end
end
