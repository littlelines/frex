defmodule Frex.Client.Recurring do
  @moduledoc """
  Client module for interacting with the Freshbooks recurring endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Return the details of an existing recurring profile, including
  auto-bill information if this recurring profile has auto-billing
  enabled.

  ## Parameters

  * `recurring_id` (**required**) -- recurring ID
  """
  def get(credentials, recurring_id) do
    "recurring.get"
    |> Request.build({:recurring_id, %{}, recurring_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of recurring profile summaries. Results are ordered
  by descending recurring_id.

  Note: A list request that returns no results (i.e. page 999), will
  return an empty result set, not an error.

  Note: The response will include an empty autobill tag if the recurring
  profile does not have auto-billing enabled, otherwise the response
  will include an autobill element with the gateway name and card
  element.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `client_id`
    * `autobill` -- boolean 1 or 0
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "recurring.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
