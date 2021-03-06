defmodule Frex.Client.Staff do
  @moduledoc """
  Module for interfacing with the staff endpoint of the Freshbooks API.
  """

  use Frex.Endpoint, :client

  @doc """
  Gets information about the current staff member (accessing the API).
  """
  def current(credentials) do
    "staff.current"
    |> Request.build
    |> HTTP.request!(credentials)
  end

  @doc """
  Return the complete staff details associated with the given
  staff_id. Staff have access to this call, but only for their own
  staff_id.
  """
  def get(credentials, staff_id) do
    "staff.get"
    |> Request.build({:staff_id, %{}, staff_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Returns a list of staff.
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "staff.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
