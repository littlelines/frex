defmodule Frex.Client.EmailTemplates do
  @moduledoc """
  Client module for interacting with the Freshbooks email templates endpoint.
  
  ## Type Options

  The following email templates can be referenced in the node when
  calling either email_template.get or email_template.update:

  * new_invoice
  * new_estimate
  * new_client
  * new_credit
  * new_staff
  * payment_notification
  * credit_card_expiry
  * credit_card_failure
  * new_support_ticket
  * update_support_ticket
  * late_payment_reminder_first
  * late_payment_reminder_second
  * late_payment_reminder_third
  """
  
  use Frex.Endpoint, :client

  @doc """
  Gets a specific email template and related email variables.

  ## Parameters

  * `email_template_id` (**required**) -- email_template ID
  """
  def get(credentials, email_template_id) do
    "email_template.get"
    |> Request.build({:email_template_id, %{}, email_template_id})
    |> HTTP.request!(credentials)
  end

  @doc """
  Sends a list request to the Freshbooks API emailtemplates endpoint.

  ## Parameters

  * `filters` (**optional**) -- a map of filters for the list request
    * `first_one`
  """
  def list(credentials, filters \\ %{}) do
    opts = opts_to_builder(filters)

    "email_template.list"
    |> Request.build(opts)
    |> HTTP.request!(credentials)
  end
end
