defmodule Frex.Client.CategoriesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Categories

  test "Categories.get calls are successful" do
    {status, _} = Categories.get(00001602877)
    assert status == :ok
  end

  test "Categories.list calls are successful" do
    {status, _} = Categories.list
    assert status == :ok
  end
end
