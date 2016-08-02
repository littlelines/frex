defmodule Frex.Client.InvoicesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Invoices
  import Credentials

  test "Invoices.list calls are successful" do
    {status, _, _} = Invoices.list(credentials)
    assert status == :ok
  end
end
