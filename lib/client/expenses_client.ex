defmodule Frex.Client.Expenses do
  use Frex.Endpoint, :client

  @moduledoc """
  Client module for interacting with the Freshbooks API.
  """

  @doc """
  Sends a get request to the Freshbooks API expenses endpoint.
  
  ## Parameters

  * `expense_id` (**required**) -- expense ID
  """
  def get(credentials, expense_id) do
    Request.build("expense.get", {:expense_id, %{}, expense_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API expenses endpoint.
  
  ## Parameters
  
  * `filters` (**optional**) -- a map of filters for the list request
      * `client_id`
      * `date_from`
      * `date_to`
      * `folder`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("expense.list", opts)
    |> HTTP.request!(credentials)
  end
end
