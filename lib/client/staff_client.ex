defmodule Frex.Client.Staff do
  @moduledoc """
  Module for interfacing with the staff endpoint of the Freshbooks API.
  """

  @doc """
  Gets information about the current staff member (accessing the API).
  """
  def current do
    Frex.Request.build("staff.current")
    |> Frex.HTTP.request!
  end
end
