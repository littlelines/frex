# Frex

> A comprehensive and straightforward Phoenix-app friendly Freshbooks API.

## Installation

  1. Add Frex to your list of dependencies in `mix.exs`:

        def deps do
          [
            {:frex, github: "littlelines/frex"}
          ]
        end

  2. Ensure Frex is started before your application:

        def application do
          [applications: [:frex]]
        end

## Configuration

Frex interfaces with the Freshbooks API. In order to integrate it with
your application, you must set a few variables.

If you are running Frex inside of a Phoenix app, add the following to
your `config/prod.secrets.exs`:

```elixir
config :frex, freshbooks_oauth_consumer_key: "mycompanyname"
config :frex, freshbooks_oauth_consumer_secret: "<CONSUMER SECRET>"
```

You can find these values in your Freshbooks settings under "API"
(Freshbooks requires you to apply a few days in advance, however).

### OAuth Configuration

Freshbooks _still_ uses OAuth 1.0A, so you're going to have to create
a flow for getting your users' keys. If you want one for your own
development purposes, [I did the gruntwork for you](https://gist.github.com/JesseHerrick/4aa28721980876fa5730b26161b8c11d).

## Getting Started

```elixir
# Set OAuth credentials.
credentials = %Frex.Credentials{oauth_token: "<OAUTH_TOKEN>", oauth_secret: "<OAUTH_SECRET>"}

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

# One with filters!

Frex.Client.TimeEntries.list(creds, %{project_id: 9311})
# => ...
{:ok,
 [%{billed: "1", date: "2016-05-24", hours: "5.01",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106512", time_entry_id: "10897"},
  %{billed: "1", date: "2016-05-18", hours: "2.11",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106512", time_entry_id: "10909"},
  %{billed: "1", date: "2016-05-18", hours: "2", notes: "Meetings",
    project_id: "9311", staff_id: "39978", task_id: "87593",
    time_entry_id: "10951"},
  %{billed: "1", date: "2016-05-16", hours: "1", notes: "Meeting",
    project_id: "9311", staff_id: "39971", task_id: "87593",
    time_entry_id: "10912"},
  %{billed: "1", date: "2016-05-11", hours: "1.01",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106512", time_entry_id: "10919"},
  %{billed: "1", date: "2016-05-09", hours: "5.11",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106512", time_entry_id: "10916"},
  %{billed: "1", date: "2016-05-06", hours: "1.47",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106513", time_entry_id: "10926"},
  %{billed: "1", date: "2016-05-05", hours: "4.22",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106513", time_entry_id: "10927"},
  %{billed: "1", date: "2016-05-03", hours: "4.03",
    notes: "Worked on Web Development", project_id: "9311", staff_id: "39971",
    task_id: "106512", time_entry_id: "10932"}]},
    %{page: 1, pages: 2, total: 20, per_page: 10}}
```

## Documentation

* Not sure if we're going to upload this to Hex yet, so for now the
  docs are in the `doc/` directory if you'd like to read them.
* [Freshbooks API Docs](https://www.freshbooks.com/developers)
  everything you need to know when trying to figure out which
  arguments to put in a request.

### Things not Covered

* __Receipts__ -- XML can't parse the response for some reason
* __Email Templates__ -- Needs fake data for tests
