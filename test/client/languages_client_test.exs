defmodule Frex.Client.LanguagesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Languages
  import Credentials

  test "Languages.list calls are successful" do
    {status, _} = Languages.list(credentials)
    assert status == :ok
  end
end
