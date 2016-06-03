defmodule Frex.HTTP do
  @moduledoc """
  A module for sending requests to the Freshbooks API.
  """

  @api_base ".freshbooks.com/api/2.1/xml-in"

  @doc """
  Makes an HTTP POST request to the Freshbooks API with the given request body (`req_body`)
  and API credentials (`username`, `token`).
  
  Returns a parsed form of the response.
  """
  def request!(request_body) do
    oauth_token = System.get_env("FRESHBOOKS_OAUTH_TOKEN")
    oauth_secret = System.get_env("FRESHBOOKS_OAUTH_SECRET")

    send_request(request_body, oauth_token, oauth_secret)
  end

  def request!(request_body, %{oauth_token: oauth_token, oauth_secret: oauth_secret}) do
    send_request(request_body, oauth_token, oauth_secret)
  end

  defp send_request(request_body, oauth_token, oauth_secret) do
    oauth_consumer_key = System.get_env("FRESHBOOKS_OAUTH_CONSUMER_KEY")
    oauth_consumer_secret = System.get_env("FRESHBOOKS_OAUTH_CONSUMER_SECRET")
    signature = oauth_signature(consumer_key: oauth_consumer_key, consumer_secret: oauth_consumer_secret, token: oauth_token, token_secret: oauth_secret)

    request_headers = [
      "Content-Type": "application/xml",
      "Authorization":
        "OAuth realm=\"\"," <>
        "oauth_version=\"1.0\"," <>
        "oauth_consumer_key=\"#{oauth_consumer_key}\"," <>
        "oauth_token=\"#{oauth_token}\"," <>
        "oauth_timestamp=\"#{:os.system_time(:seconds)}\"," <>
        "oauth_nonce=\"#{SecureRandom.hex(20)}\"," <>
        "oauth_signature_method=\"PLAINTEXT\"," <>
        "oauth_signature=\"#{signature}\""
    ]

    HTTPotion.start

    response = HTTPotion.post "https://#{oauth_consumer_key}#{@api_base}", [body: request_body, headers: request_headers]
    Frex.Parser.parse(response.body)
  end

  defp oauth_signature([consumer_key: consumer_key, consumer_secret: consumer_secret, token: token, token_secret: token_secret]) do
    creds = OAuther.credentials(method: :plaintext, consumer_key: consumer_key, consumer_secret: consumer_secret, token: token, token_secret: token_secret)

    OAuther.signature("post", "https://#{consumer_key}#{@api_base}", [], creds)
  end
end
