defmodule Frex.Client.Clients do
  @moduledoc """
  Client module for interacting with the Freshbooks clients endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API clients endpoint.

  ## Parameters

  * `client_id` (**required**) -- clients ID
  """
  def get(credentials, client_id) do
    "client.get"
    |> Request.build({:client_id, %{}, client_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of client summaries in order of descending client_id.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `email`
    * `username`
    * `updated_from`
    * `updated_to`
    * `page`
    * `per_page`
    * `folder`
    * `notes`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "client.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
