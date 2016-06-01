defmodule Frex.Request do
  @moduledoc """
  Handles the building of requests for sending to the Freshbooks API.
  """

  def build(method, builder_tuple) do
    {:request, %{method: method}, builder_tuple}
    |> XmlBuilder.doc
  end
end
