defmodule Frex.Client.Payments do
  @moduledoc """
  Client module for interacting with the Freshbooks payments endpoint.
  
  Staff have access to the API calls listed below if the Invoices tab is
  enabled for staff. Staff users can only access payments that belong to
  clients they are assigned to.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Retrieve payment details according to payment_id.

  ## Parameters

  * `payment_id` (**required**) -- payments ID
  """
  def get(credentials, payment_id) do
    Request.build("payment.get", {:payment_id, %{}, payment_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of recorded payments. You can optionally
  filter by `invoice_id` or `client_id`.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `invoice_id`
    * `client_id`
    * `updated_from`
    * `updated_to`
    * `page`
    * `per_page`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("payment.list", opts)
    |> HTTP.request!(credentials)
  end
end
