# defmodule Frex.Client.WebhooksTest do
#   use ExUnit.Case, async: true
#   alias Frex.Client.Webhooks
#   import Credentials

#   test "Webhooks.get calls are successful" do
#     {status, _} = Webhooks.create(credentials, "time_entry.create")
#     assert status == :ok
#   end

#   test "Webhooks.list calls are successful" do
#     {status, _, _} = Webhooks.list(credentials)
#     assert status == :ok
#   end
# end
