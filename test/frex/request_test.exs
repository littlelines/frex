defmodule Frex.RequestTest do
  use ExUnit.Case, async: true

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
  end
end
