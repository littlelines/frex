defmodule Frex.Client.EmailTemplatesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.EmailTemplates
  import Credentials

  # TODO: Make email templates for testing.
  # test "EmailTemplates.get calls are successful" do
  #   {status, _} = Emailtemplates.get(credentials, 1)
  #   assert status == :ok
  # end

  test "EmailTemplates.list calls are successful" do
    {status, _} = EmailTemplates.list(credentials)
    assert status == :ok
  end
end
