defmodule Frex.Client.Tasks do
  @moduledoc """
  Client module for interacting with the Freshbooks tasks endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API tasks endpoint.

  ## Parameters

  * `task_id` (**required**) -- task ID
  """
  def get(credentials, task_id) do
    "task.get"
    |> Request.build({:task_id, %{}, task_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of tasks in alphabetical order.
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "task.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
