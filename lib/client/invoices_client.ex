defmodule Frex.Client.Invoices do
  use Frex.Endpoint, :client

  @moduledoc """
  Staff have access to the API calls listed below if
  the Invoices tab is enabled for staff. Staff users can only access
  invoices that belong to clients they are assigned to.
  """

  @doc """
  Return the complete invoice details associated with the given
  invoice_id.

  * You can use the value to provide your customers with a direct link to
    their invoice.
  * You can use the element to provide your customers with direct
    links to the invoice for editing, viewing by the client and viewing
    by an administrator.
  
  ## Parameters

  * `invoice_id` (**required**) -- invoice ID

  """
  def get(credentials, invoice_id) do
    "invoice.get"
    |> Request.build({:invoice_id, %{}, invoice_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of invoice summaries. Results are ordered by descending
  invoice_id.

  Note: This method uses pagination.

  The value used for `status’ can be `disputed’, `draft’, `sent’,
  `viewed’, `paid’, `auto-paid’, `retry’, `failed’ or the special status
  `unpaid’ which will retrieve all invoices with a status of `disputed’,
  `sent’, `viewed’, `retry’ or `failed’.
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "invoice.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
