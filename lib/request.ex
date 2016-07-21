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

  @doc """
  Paginates through a list to get all data in one big list.
  
  Returns a list.
  """
  def list_all(creds, list_fun, acc \\ [], inc \\ 1) do
    args = %{page: inc}
    {:ok, body, page_data} = list_fun.(creds, args)

    data = acc ++ body

    if more_pages?(page_data) do
      list_all(creds, list_fun, data, inc + 1)
    else
      data
    end
  end

  @doc """
  Checks the current page data to see if more pages need to be loaded.

  Returns a boolean.
  """
  def more_pages?(%{page: page, per_page: per_page, pages: pages, total: total})
    when per_page < total and page < pages do

    true
  end

  def more_pages?(_), do: false
end
