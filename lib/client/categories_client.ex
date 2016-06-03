defmodule Frex.Client.Categories do
  @moduledoc """
  Client module for interacting with the Freshbooks categories endpoint.
  
  Staff have access to the get, list and create API calls listed below
  if the Expenses tab is enabled for staff. Staff cannot delete or
  update Categories.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Return the complete category details associated with the given category_id.

  ## Parameters

  * `category_id` (**required**) -- categories ID
  """
  def get(credentials, category_id) do
    Request.build("category.get", {:category_id, %{}, category_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of expense categories.

  ## Parameters
  """
  def list(credentials) do
    Request.build("category.list")
    |> HTTP.request!(credentials)
  end
end
