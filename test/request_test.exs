defmodule Frex.RequestTest do
  use ExUnit.Case, async: true
  import Credentials

  test "`build` builds a proper XML request for GET" do
    expected = """
    <?xml version="1.0" encoding="UTF-8" ?>
    <request method="expense.get">
    \t<expense_id>433</expense_id>
    </request>
    """ |> String.strip

    actual = Frex.Request.build("expense.get", [{:expense_id, %{}, 433}]) |> String.strip

    assert actual == expected
  end

  test "`build` works when not given a ending list" do
    expected = """
    <?xml version="1.0" encoding="UTF-8" ?>
    <request method="expense.get">
    \t<expense_id>433</expense_id>
    </request>
    """ |> String.strip

    actual = Frex.Request.build("expense.get", {:expense_id, %{}, 433}) |> String.strip

    assert actual == expected
  end

  test "`build` works with multiple API params" do
    expected = """
    <?xml version="1.0" encoding="UTF-8" ?>
    <request method="expense.list">
    \t<client_id>3</client_id>
    \t<date_from>2009-10-31</date_from>
    \t<date_to>2010-2-28</date_to>
    \t<folder>active</folder>
    </request>
    """ |> String.strip

    builder_list = [
      {:client_id, %{}, 3},
      {:date_from, %{}, "2009-10-31"},
      {:date_to, %{}, "2010-2-28"},
      {:folder, %{}, "active"}
    ]

    actual = Frex.Request.build("expense.list", builder_list)

    assert expected == actual
  end

  test "`build` works when no other params are given" do
    expected = """
    <?xml version="1.0" encoding="UTF-8" ?>
    <request method="staff.current"></request>
    """ |> String.strip

    actual = Frex.Request.build("staff.current")

    assert expected == actual
  end

  test "`build` works when an empty list is given" do
    expected = """
    <?xml version="1.0" encoding="UTF-8" ?>
    <request method="staff.current"></request>
    """ |> String.strip

    actual = Frex.Request.build("staff.current", [])

    assert expected == actual
  end

  describe ".list_all" do
    test "it paginates through a list and returns a bigger one" do
      actual = Frex.Request.list_all(credentials, fn(creds, args) ->
        Frex.Client.TimeEntries.list(creds, args)
      end) |> length

      {:ok, _, %{total: total}} = Frex.Client.TimeEntries.list(credentials)

      assert actual == total
    end

    test "it returns an empty list if an empty list is received" do
      assert Frex.Request.list_all(credentials, fn(_creds, _args) ->
        {:ok, []}
      end) == []
    end
  end
end
