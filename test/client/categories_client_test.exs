defmodule Frex.Client.CategoriesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Categories
  import Credentials

  test "Categories.get calls are successful" do
    {status, _} = Categories.get(credentials, 00001602877)
    assert status == :ok
  end

  test "Categories.list calls are successful" do
    {status, _} = Categories.list(credentials)
    assert status == :ok
  end
end
