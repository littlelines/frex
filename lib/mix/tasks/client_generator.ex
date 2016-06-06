defmodule Mix.Tasks.Gen.Client do
  @moduledoc """
  Generates a new client for an endpoint based on a given endpoint name.
  
  ## Example
  
  ```
  $ mix client_generator expenses
  ```
  """

  use Mix.Task

  def run, do: usage

  def run([endpoint | [singular_endpoint | _]]) do
    endpoint = String.downcase(endpoint)
    Mix.Generator.create_file("lib/client/#{endpoint}_client.ex", template(endpoint, singular_endpoint))

    noun = String.capitalize(endpoint)
    Mix.Generator.create_file("test/client/#{endpoint}_client_test.exs", """
    defmodule Frex.Client.#{noun}Test do
      use ExUnit.Case, async: true
      alias Frex.Client.#{noun}
      import Credentials

      test \"#{noun}.get calls are successful\" do
        {status, _} = #{noun}.get(credentials, 1)
        assert status == :ok
      end

      test \"#{noun}.list calls are successful\" do
        {status, _} = #{noun}.list(credentials)
        assert status == :ok
      end
    end
    """)
  end

  def run(_), do: usage

  defp template(endpoint, singular_endpoint) do
    """
    defmodule Frex.Client.#{String.capitalize(endpoint)} do
      @moduledoc \"\"\"
      Client module for interacting with the Freshbooks #{endpoint} endpoint.
      \"\"\"
      
      use Frex.Endpoint, :client

      @doc \"\"\"
      Sends a get request to the Freshbooks API #{endpoint} endpoint.

      ## Parameters

      * `#{singular_endpoint}_id` (**required**) -- #{singular_endpoint} ID
      \"\"\"
      def get(credentials, #{singular_endpoint}_id) do
        "#{singular_endpoint}.get"
        |> Request.build({:#{singular_endpoint}_id, %{}, #{singular_endpoint}_id})
        |> HTTP.request!(credentials)
      end

      @doc \"\"\"
      Sends a list request to the Freshbooks API #{endpoint} endpoint.

      ## Parameters

      * `filters` (**optional**) -- a map of filters for the list request
        * `first_one`
      \"\"\"
      def list(credentials, filters \\\\ %{}) do
        opts = opts_to_builder(filters)

        "#{singular_endpoint}.list"
        |> Request.build(opts)
        |> HTTP.request!(credentials)
      end
    end
    """
  end

  defp usage, do: IO.puts "Usage: mix gen.client Expenses expense"
end
