defmodule Frex.Client.Gateways do
  @moduledoc """
  Client module for interacting with the Freshbooks gateways endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API gateways endpoint.

  ## Parameters

  * `gateway_id` (**required**) -- gateways ID
  """
  def get(credentials, gateway_id) do
    Request.build("gateway.get", {:gateway_id, %{}, gateway_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API gateways endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("gateway.list", opts)
    |> HTTP.request!(credentials)
  end
end
