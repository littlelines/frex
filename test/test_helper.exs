# Testing module for getting OAuth credentials for testing.
defmodule Credentials do
  # Grabs OAuth credentials from your environment and puts them in `credentials` as a struct.
  def credentials do
    %Frex.Credentials{
      oauth_token: System.get_env("FRESHBOOKS_OAUTH_TOKEN"),
      oauth_secret: System.get_env("FRESHBOOKS_OAUTH_SECRET")
    }
  end
end

ExUnit.start()
