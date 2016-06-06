defmodule Frex.Client.ReportsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Reports
  import Credentials

  test "Reports.get_client_details calls are successful" do
    {status, _} = Reports.get_client_details(credentials, 39985)
    assert status == :ok
  end

  test "Reports.get_estimate_details calls are successful" do
    {status, _} = Reports.get_estimate_details(credentials, 39985)
    assert status == :ok
  end

  test "Reports.get_expense_details calls are successful" do
    {status, _} = Reports.get_expense_details(credentials)
    assert status == :ok
  end

  test "Reports.get_invoice_details calls are successful" do
    {status, _} = Reports.get_invoice_details(credentials)
    assert status == :ok
  end

  test "Reports.get_profit_details calls are successful" do
    {status, _} = Reports.get_profit_details(credentials, "2016-06-03", "2016-06-05")
    assert status == :ok
  end
end
