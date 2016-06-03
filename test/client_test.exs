defmodule Frex.ClientTest do
  use ExUnit.Case, async: true
  alias Frex.Client

  test ".opts_to_builder turns a map into a builder tuple" do
    assert Client.opts_to_builder(%{foo: :bar}) == [{:foo, %{}, :bar}]
  end

  test ".opts_to_builder turns a map with multiple items into a builder tuple" do
    assert Client.opts_to_builder(%{foo: "bar", baz: "bat"}) == [{:foo, %{}, "bar"}, {:baz, %{}, "bat"}]
  end
end
