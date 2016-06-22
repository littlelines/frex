defmodule Frex.Client.TasksTest do
  use ExUnit.Case, async: true
  alias Frex.Client.Tasks
  import Credentials

  test "Tasks.get calls are successful" do
    {status, _} = Tasks.get(credentials, 106513)
    assert status == :ok
  end

  test "Tasks.list calls are successful" do
    {status, _, _} = Tasks.list(credentials)
    assert status == :ok
  end
end
