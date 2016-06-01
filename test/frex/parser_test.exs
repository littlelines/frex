defmodule Frex.Parsers.ExpensesTest do
  use ExUnit.Case, async: true

  test "parses an XML staff GET response into a map" do
    staff_xml_response = """
    <?xml version="1.0" encoding="utf-8"?>
    <response xmlns="https://www.freshbooks.com/api/" status="ok">
      <staff>
        <staff_id>1</staff_id>
        <username>John</username>
        <first_name>John</first_name>
        <last_name>Smith</last_name>
        <email>John@example.org</email>
        <business_phone></business_phone>
        <mobile_phone></mobile_phone>
        <rate>0</rate>
        <last_login>2010-07-12 13:55:58</last_login>
        <number_of_logins>700</number_of_logins>
        <signup_date>2010-07-07 10:38:57</signup_date>
        <street1></street1>
        <street2></street2>
        <city></city>
        <state></state>
        <country></country>
        <code></code>
      </staff>
    </response>
    """

    expected = {:ok,
                %{business_phone: nil, city: nil, code: nil, country: nil, email: "John@example.org",
                  first_name: "John", last_login: "2010-07-12 13:55:58", last_name: "Smith",
                  mobile_phone: nil, number_of_logins: "700", rate: "0", signup_date: "2010-07-07 10:38:57",
                  staff_id: "1", state: nil, status: "ok", street1: nil, street2: nil, username: "John"}}

    actual = Frex.Parser.parse(staff_xml_response)

    assert actual == expected
  end

  test "parses an XML expenses GET response into a map" do
    expense_xml_response = """
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

    expected = {:ok,
                %{amount: "29.95", category_id: "5", client_id: "10", date: "2008-11-01",
                  expense_id: "433", folder: "active", notes: "Software package.",
                  project_id: "10", staff_id: "0", status: "ok", tax1_amount: nil,
                  tax1_name: nil, tax1_percent: nil, tax2_amount: nil, tax2_name: nil,
                  tax2_percent: nil, vendor: "FreshBooks"}}

    actual = Frex.Parser.parse(expense_xml_response)

    assert actual == expected
  end

  test "parses an XML expenses LIST response into a map" do
    expense_xml_response = """
    <?xml version="1.0" encoding="utf-8"?>
    <response xmlns="https://www.freshbooks.com/api/" status="ok">
      <expenses page="1" per_page="10" pages="4" total="47">
        <expense>
          <expense_id>430</expense_id>
          <staff_id>1</staff_id>
          <category_id>5</category_id>
          <project_id>10</project_id>
          <client_id>10</client_id>
          <amount>29.95</amount>
          <date>2008-11-01</date>
          <notes>Hardware.</notes>
          <vendor>FreshBooks</vendor>
          <status>1</status>
          <folder>active</folder>
          <tax1_name></tax1_name>
          <tax1_percent></tax1_percent>
          <tax1_amount></tax1_amount>
          <tax2_name></tax2_name>
          <tax2_percent></tax2_percent>
          <tax2_amount></tax2_amount>
        </expense>
        <expense>
          <expense_id>433</expense_id>
          <staff_id>2</staff_id>
          <category_id>5</category_id>
          <project_id>10</project_id>
          <client_id>10</client_id>
          <amount>29.95</amount>
          <date>2008-11-01</date>
          <notes>Software package.</notes>
          <status>1</status>
          <folder>active</folder>
          <tax1_name></tax1_name>
          <tax1_percent></tax1_percent>
          <tax1_amount></tax1_amount>
          <tax2_name></tax2_name>
          <tax2_percent></tax2_percent>
          <tax2_amount></tax2_amount>
        </expense>
      </expenses>
    </response>
    """

    expected = {:ok,
                [%{amount: "29.95", category_id: "5", client_id: "10", date: "2008-11-01",
                   expense_id: "430", folder: "active", notes: "Hardware.", project_id: "10",
                   staff_id: "1", status: "1", tax1_amount: nil, tax1_name: nil, tax1_percent: nil,
                   tax2_amount: nil, tax2_name: nil, tax2_percent: nil, vendor: "FreshBooks"},
                 %{amount: "29.95", category_id: "5", client_id: "10", date: "2008-11-01",
                   expense_id: "433", folder: "active", notes: "Software package.",
                   project_id: "10", staff_id: "2", status: "1", tax1_amount: nil, tax1_name: nil,
                   tax1_percent: nil, tax2_amount: nil, tax2_name: nil, tax2_percent: nil}]}

    actual = Frex.Parser.parse(expense_xml_response)

    assert actual == expected
  end
end
