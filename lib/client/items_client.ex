defmodule Frex.Client.Items do
  @moduledoc """
  Client module for interacting with the Freshbooks items endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API items endpoint.
  
  Get an existing item with the given item_id.

  ## Parameters

  * `item_id` (**required**) -- items ID
  """
  def get(credentials, item_id) do
    "item.get"
    |> Request.build({:item_id, %{}, item_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API items endpoint.
  
  Returns a list of items, ordered by descending item_id.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `page`
    * `per_page`
    * `folder`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "item.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
