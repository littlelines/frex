defmodule Frex.Client.DefaultTerms do
  @moduledoc """
  Staff have access to the API calls listed below if the Invoices tab
  is enabled for staff.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Return default terms for the specified class of object
  (invoice, estimate or credit).


  ## Parameters

  * `type` (**required**) -- `invoice`/`estimate`/`credit`
  """
  def get(credentials, type) do
    "default_terms.get"
    |> Request.build({:type, %{}, type})
    |> HTTP.request!(credentials)
  end

  @doc """
  Return a list of default terms for invoices, estimates and credits. 
  """
  def list(credentials) do
    "default_terms.list"
    |> Request.build
    |> HTTP.request!(credentials)
  end
end
