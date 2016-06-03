# Frex

> A comprehensive and straightforward Phoenix-app-friendly Freshbooks API.

## Installation


  1. Add frex to your list of dependencies in `mix.exs`:

        def deps do
          [{:frex, "~> 0.0.1"}]
        end

  2. Ensure frex is started before your application:

        def application do
          [applications: [:frex]]
        end

## Getting Started

```elixir
# Set OAuth credentials.
credentials = %Frex.Credentials{oauth_token: "<OAUTH_TOKEN>",
oauth_secret: "<OAUTH_SECRET>"}

# Make a request!

Frex.Client.Staff.current(credentials)

# => {:ok, %{business_phone: nil, city: nil, code: nil, country: nil,
#      email: "rubyrags@littlelines.com", fax: nil, first_name: "Ruby",
#      home_phone: nil, last_login: "2016-06-03 06:28:40", last_name:
#      "Rags", mobile_phone: nil, notes: nil, number_of_logins: "4",
#      projects: nil, rate: nil, signup_date: "2016-06-02 06:01:18",
#      staff_id: "1", state: nil, status: "ok", street1: nil, street2: nil,
#      username: "rubyrags@littlelines.com"}
#    }
```
