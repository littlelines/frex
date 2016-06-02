defmodule Frex.Client.Staff do
  use Frex.Endpoint, :client

  @moduledoc """
  Module for interfacing with the staff endpoint of the Freshbooks API.
  """

  @doc """
  Gets information about the current staff member (accessing the API).
  """
  def current do
    Request.build("staff.current")
    |> HTTP.request!
  end
end
