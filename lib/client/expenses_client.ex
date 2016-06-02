defmodule Frex.Client.Expenses do
  @moduledoc """
  Client module for interacting with the Freshbooks API.
  """

  @doc """
  Sends a get request to the Freshbooks API expenses endpoint.
  """

  def get(expense_id) do
    Frex.Request.build("expense.get", [{:expense_id, %{}, expense_id}])
    |> Frex.HTTP.request!
  end
end
