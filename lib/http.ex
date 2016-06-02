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
    username = System.get_env("FRESHBOOKS_USERNAME")
    token = System.get_env("FRESHBOOKS_API_TOKEN")

    send_request(request_body, username, token)
  end

  def request!(request_body, %{username: username, token: token}) do
    send_request(request_body, username, token)
  end

  defp send_request(request_body, username, token) do
    request_headers = [
      "Content-Type": "application/xml"
    ]

    HTTPotion.start

    response = HTTPotion.post "https://#{token}:X@#{username}#{@api_base}", [body: request_body, headers: request_headers]
    Frex.Parser.parse(response.body)
  end
end
