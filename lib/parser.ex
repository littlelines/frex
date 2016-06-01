defmodule Frex.Parser do
  @moduledoc """
  Module for parsing the response of endpoint calls.
  """

  @doc """
  Parses a Freshbooks XML response (`xml_string`) and returns a map of its attributes.
  
  Returns a tuple with `:ok` and a `Map`.
  """
  def parse(xml_string) do
    [initial_response] = Quinn.parse(xml_string)
    %{attr: [_, status: status], name: :response, value: [%{value: response}]} = initial_response

    response_map = put_attrs(response) |> Map.put(:status, status)

    {:ok, response_map}
  end

  # Puts attributes from the Freshbooks API (`response`) response into a Map.
  #
  # Returns a `Map`.
  defp put_attrs(response) do
    Enum.reduce(response, %{}, fn(attr, acc) ->
      Map.put(acc, attr.name, Enum.at(attr.value, 0))
    end)
  end
end
