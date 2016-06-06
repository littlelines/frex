defmodule Frex.Client.Reports do
  @moduledoc """
  Provides access to the most commonly used reports and information.
  """

  use Frex.Endpoint, :client

  @doc """
  Returns profit and account standing details for the specified client.
  
  ## Parameters
  
  * `client_id`
  """
  def get_client_details(credentials, client_id, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "report.getClientDetails"
    |> Request.build([{:client_id, %{}, client_id}, opts])
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns total estimated, accepted and invoiced values for invoices;
  broken down by currency.

  ## Parameters
  
  * `client_id`
  """
  def get_estimate_details(credentials, client_id, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "report.getEstimateDetails"
    |> Request.build([{:client_id, %{}, client_id}, opts])
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns information about all, or a filtered set of expenses.

  ## Parameters
  
  * `client_id` (optional)
  """
  def get_expense_details(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "report.getExpenseDetails"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns information about all, or a filtered set of
  invoices. Default sorting in the response is by currency code,
  unless overruled with the filter.

  ## Parameters
  
  * `client_id` (optional)
  """
  def get_invoice_details(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "report.getInvoiceDetails"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns profit & loss details. With this report we assume that the
  currency_code is the same as the system’s base
  currency_code. Invoice amounts in other currencies will be
  converted. The normal call (not filtered by date) will return the
  same information as the ‘Totals’ column on the Profit & Loss Report.

  ## Parameters
  
  * `date_from` YYYY-MM-DD format
  * `date_to` YYYY-MM-DD format
  * `group_by` (optional)
  """
  def get_profit_details(credentials, date_from, date_to, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "report.getProfitDetails"
    |> Request.build([{:date_from, %{}, date_from}, {:date_to, %{}, date_to}, opts])
    |> HTTP.request!(credentials)
  end
end
