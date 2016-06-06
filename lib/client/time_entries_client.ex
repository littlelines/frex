defmodule Frex.Client.TimeEntries do
  @moduledoc """
  Client module for interacting with the Freshbooks timeentries endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a get request to the Freshbooks API timeentries endpoint.

  ## Parameters

  * `time_entry_id` (**required**) -- time_entry ID
  """
  def get(credentials, time_entry_id) do
    "time_entry.get"
    |> Request.build({:time_entry_id, %{}, time_entry_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of timesheet entries ordered according to date.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `project_id`
    * `task_id`
    * `date_from`
    * `date_to`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "time_entry.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
