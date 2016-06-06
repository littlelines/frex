defmodule Frex.Client.Languages do
  @moduledoc """
  Client module for interacting with the Freshbooks languages endpoint.
  
  The Language API provides access to the list of languages available
  in the application.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Sends a list request to the Freshbooks API languages endpoint.
  
  Returns a list of language names and the corresponding codes that
  you can use for clients, invoices and estimates. The codes are from
  IETF RFC 5646, which is usually the two-letter ISO-639-1 code.
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "language.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
