defmodule Frex.Client.DefaultTermsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.DefaultTerms
  import Credentials


  test "DefaultTerms.get calls are successful" do
    for type <- ~w(invoice estimate credit) do
      {status, _} = DefaultTerms.get(credentials, type)
      assert status == :ok
    end
  end

  test "DefaultTerms.list calls are successful" do
    {status, _} = DefaultTerms.list(credentials)
    assert status == :ok
  end
end
