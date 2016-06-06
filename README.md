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
    task_id: "106512", time_entry_id: "10932"}]}
```
