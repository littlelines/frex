defmodule Frex.Client.Currency do
  @moduledoc """
  Client module for interacting with the Freshbooks currency endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Returns a list of currently supported currencies.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "currency.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
