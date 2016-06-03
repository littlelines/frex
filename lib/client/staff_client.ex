defmodule Frex.Client.Staff do
  @moduledoc """
  Module for interfacing with the staff endpoint of the Freshbooks API.
  """

  use Frex.Endpoint, :client

  @doc """
  Gets information about the current staff member (accessing the API).
  """
  def current do
    Request.build("staff.current")
    |> HTTP.request!
  end

  @doc """
  Return the complete staff details associated with the given staff_id. Staff have access to this call, but only for their own staff_id.
  """
  def get(staff_id) do
    Request.build("staff.get", {:staff_id, %{}, staff_id})
    |> HTTP.request!
  end

  @doc """
  Returns a list of staff.
  """
  def list(filters \\ %{}) do
    opts = opts_to_builder(filters)

    Request.build("staff.list", opts)
    |> HTTP.request!
  end
end
