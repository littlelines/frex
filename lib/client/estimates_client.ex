defmodule Frex.Client.Estimates do
  @moduledoc """
  Client module for interacting with the Freshbooks estimates endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API estimates endpoint.

  ## Parameters

  * `estimate_id` (**required**) -- estimates ID
  """
  def get(credentials, estimate_id) do
    Request.build("estimate.get", {:estimate_id, %{}, estimate_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API estimates endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("estimate.list", opts)
    |> HTTP.request!(credentials)
  end
end
