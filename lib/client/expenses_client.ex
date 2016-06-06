defmodule Frex.Client.Expenses do
  use Frex.Endpoint, :client

  @moduledoc """
  Client module for interacting with the Freshbooks API.
  
  Expenses that are not associated with a client are represented by
  client_id as 0. Staff have access to the API calls listed below, but
  they can only access expenses that belong to them or are assigned to
  clients they are assigned to.

  IMPORTANT: Expense amounts include taxes. If Expense amount = $100 and
  tax percent = 5%, then tax amount should be $4.76. This is because
  the before tax amount is $95.24 and the 5% tax is $4.76, which
  yields a total of $100, the expense amount.
  """

  @doc """
  Return the complete expense details associated with the given expense_id.
  
  ## Parameters

  * `expense_id` (**required**) -- expense ID
  """
  def get(credentials, expense_id) do
    "expense.get"
    |> Request.build({:expense_id, %{}, expense_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of expense summaries. You can filter by
  client_id, category_id, project_id, date_from, date_to or vendor
  optionally.
  
  ## Parameters
  
  * `filters` (**optional**) -- a map of filters for the list request
      * `client_id`
      * `date_from`
      * `date_to`
      * `folder`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "expense.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
