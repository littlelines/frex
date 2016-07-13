defmodule Frex.Client.Webhooks do
  @moduledoc """
  Client module for interacting with the Freshbooks webhooks endpoint.
  """
  
  use Frex.Endpoint, :client

  @doc """
  Creates a new webhook.
  
  ## Parameters
  
  * `event` (**required**) -- event that the webhook sends on
  * `uri` (**required**) -- URI that the webhook sends to
  """
  def create(credentials, event, uri) do
    "callback.create"
    |> Request.build([{:event, %{}, event}, {:uri, %{}, uri}])
    |> HTTP.request!(credentials)
  end

  @doc """
  Verifies a webhook.
  
  ## Parameters

  * `callback_id` (**required**)
  * `verifier` (**required**) -- verifier hash (provided by the initial create request)
  """
  def verify(credentials, callback_id, verifier) do
    "callback.verify"
    |> Request.build([{:callback_id, %{}, callback_id}, {:verifier, %{}, verifier}])
    |> HTTP.request!(credentials)
  end
end
