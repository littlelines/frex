defmodule Frex.Client.Projects do
  @moduledoc """
  Client module for interacting with the Freshbooks projects endpoint.
  
  Staff have access to the API calls listed below if the Time Tracking
  tab is enabled for staff. Each staff member can view all projects to
  which he or she is assigned. Each staff member can edit only those
  projects on which he or she is the Project Manaer. Limited
  information is returned about projects that the staff member is
  assigned to, but not the manager of.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Retrieve an existing project.

  ## Parameters

  * `project_id` (**required**) -- projects ID
  """
  def get(credentials, project_id) do
    "project.get"
    |> Request.build({:project_id, %{}, project_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API projects endpoint.

  Returns a list of projects in alphabetical order.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "project.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
