defmodule Frex.Client.Gateways do
  @moduledoc """
  Client module for interacting with the Freshbooks gateways endpoint.
  
  The Gateway API provides access to the Online Payment Gateways enabled in the application.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Returns a list of payment gateways enabled in your FreshBooks
  account that can process transactions. You can optionally filter by
  autobill_capable to return only gateways that support auto-bills.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `autobill_capable` (boolean, 1 = true, 0 = false)
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "gateway.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
