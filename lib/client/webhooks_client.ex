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
    |> Request.build({:callback, %{}, [{:event, %{}, event}, {:uri, %{}, uri}]})
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
    |> Request.build({:callback, %{}, [{:callback_id, %{}, callback_id}, {:verifier, %{}, verifier}]})
    |> HTTP.request!(credentials)
  end

  @doc """
  Lists all webhooks.
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "callback.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end

  @doc """
  Deletes a webhook.
  
  ## Parameters
  
  * callback_id -- ID of the callback you wish to destroy
  """
  def delete(credentials, callback_id) do
    "callback.delete"
    |> Request.build({:callback_id, %{}, callback_id})
    |> HTTP.request!(credentials)
  end
end
