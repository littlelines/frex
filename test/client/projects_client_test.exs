defmodule Frex.Client.ProjectsTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Projects
  import Credentials

  test "Projects.get calls are successful" do
    {status, _} = Projects.get(credentials, 8564)
    assert status == :ok
  end

  test "Projects.list calls are successful" do
    {status, _, _} = Projects.list(credentials)
    assert status == :ok
  end
end
