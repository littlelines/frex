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

  def run([endpoint | _]) do
    Mix.Generator.create_file("lib/client/#{endpoint}_client.ex", template(endpoint))
  end

  def run(_), do: usage

  defp template(endpoint) do
    """
    defmodule Frex.Client.#{String.capitalize(endpoint)} do
      @moduledoc \"\"\"
      Client module for interacting with the Freshbooks #{endpoint} endpoint.
      \"\"\"
    end
    """
  end

  defp usage, do: IO.puts "Usage: mix gen.client <ENDPOINT>"
end
