defmodule Frex.Client.Categories do
  @moduledoc """
  Client module for interacting with the Freshbooks categories endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API categories endpoint.

  ## Parameters

  * `category_id` (**required**) -- categories ID
  """
  def get(category_id) do
    Request.build("category.get", {:category_id, %{}, category_id})
    |> HTTP.request!
  end

  @doc """
  Sends a list request to the Freshbooks API categories endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("category.list", opts)
    |> HTTP.request!
  end
end
