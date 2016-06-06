defmodule Frex.Client.TimeEntriesTest do
  use ExUnit.Case, async: true
  alias Frex.Client.TimeEntries
  import Credentials

  test "TimeEntries.get calls are successful" do
    {status, _} = TimeEntries.get(credentials, 10901)
    assert status == :ok
  end

  test "TimeEntries.list calls are successful" do
    {status, _} = TimeEntries.list(credentials)
    assert status == :ok
  end

  test "TimeEntries.list by project ID" do
    {status, entries} = TimeEntries.list(credentials, %{project_id: 9310})

    assert status == :ok

    for entry <- entries do
      %{project_id: project_id} = entry
      assert project_id == "9310"
    end
  end
end
