defmodule Frex.Client.Contractors do
  @moduledoc """
  Contractor API calls are only available to an account’s
  administrator, not to staff members.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API contractors endpoint.

  ## Parameters

  * `contractor_id` (**required**) -- contractor ID
  """
  def get(credentials, contractor_id) do
    "contractor.get"
    |> Request.build({:contractor_id, %{}, contractor_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API contractors endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "contractor.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
