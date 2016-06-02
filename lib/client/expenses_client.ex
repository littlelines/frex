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
  def get(expense_id) do
    Request.build("expense.get", [{:expense_id, %{}, expense_id}])
    |> HTTP.request!
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
  def list(filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("expense.list", opts)
    |> HTTP.request!
  end
end
