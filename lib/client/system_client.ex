defmodule Frex.Client.System do
  @moduledoc """
  Client module for interacting with the Freshbooks system endpoint.
  """
  
  use Frex.Endpoint, :client

  def current(credentials) do
    "system.current"
    |> Request.build
    |> HTTP.request!(credentials)
  end
end
