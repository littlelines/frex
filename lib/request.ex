defmodule Frex.Request do
  @moduledoc """
  Handles the building of requests for sending to the Freshbooks API.
  """

  @doc """
  Builds an XML request from a given method and XML list.
  
  ## Examples

  ```
  Frex.Request.build("expenses.get", {:expense_id, %{}, 433})
  
  # => "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<request method=\"expenses.get\">\n\t<expense_id>433</expense_id>\n</request>"
  """
  def build(method) do
    {:request, %{method: method}, ""}
    |> XmlBuilder.doc
  end

  def build(method, []) do
    {:request, %{method: method}, ""}
    |> XmlBuilder.doc
  end

  def build(method, builder_list) do
    builder_tuple = List.flatten([builder_list])

    {:request, %{method: method}, builder_tuple}
    |> XmlBuilder.doc
  end
end
