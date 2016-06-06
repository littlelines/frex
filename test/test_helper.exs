# Testing module for getting OAuth credentials for testing.
defmodule Credentials do
  # Grabs OAuth credentials from your environment and puts them in `credentials` as a struct.
  def credentials do
    %Frex.Credentials{
      oauth_token: Application.get_env(:frex, :freshbooks_oauth_token),
      oauth_secret: Application.get_env(:frex, :freshbooks_oauth_secret)
    }
  end
end

ExUnit.start()
