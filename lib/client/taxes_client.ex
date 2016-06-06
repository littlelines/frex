defmodule Frex.Client.Taxes do
  @moduledoc """
  Client module for interacting with the Freshbooks taxes endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API taxes endpoint.

  ## Parameters

  * `tax_id` (**required**) -- tax ID
  """
  def get(credentials, tax_id) do
    "tax.get"
    |> Request.build({:tax_id, %{}, tax_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API taxes endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "tax.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
