defmodule Frex.Parsers.ExpensesTest do
  use ExUnit.Case, async: true

  setup do
    response_xml = """
    <?xml version="1.0"?>
    <response xmlns="https://www.freshbooks.com/api/" status="ok">
      <expense>
        <expense_id>433</expense_id>
        <staff_id>0</staff_id>
        <category_id>5</category_id>
        <project_id>10</project_id>
        <client_id>10</client_id>
        <amount>29.95</amount>
        <date>2008-11-01</date>
        <notes>Software package.</notes>
        <folder>active</folder>
        <vendor>FreshBooks</vendor>
        <status>1</status>
        <tax1_name></tax1_name>
        <tax1_percent></tax1_percent>
        <tax1_amount></tax1_amount>
        <tax2_name></tax2_name>
        <tax2_percent></tax2_percent>
        <tax2_amount></tax2_amount>
      </expense>
    </response>
    """

    {:ok, %{response_xml: response_xml}}
  end

  test "parses an XML response into a map", %{response_xml: response_xml} do
    expected = {:ok,
                %{amount: "29.95", category_id: "5", client_id: "10", date: "2008-11-01",
                  expense_id: "433", folder: "active", notes: "Software package.",
                  project_id: "10", staff_id: "0", status: "ok", tax1_amount: nil,
                  tax1_name: nil, tax1_percent: nil, tax2_amount: nil, tax2_name: nil,
                  tax2_percent: nil, vendor: "FreshBooks"}}

    actual = Frex.Parsers.Expenses.parse(response_xml)

    assert actual == expected
  end
end
