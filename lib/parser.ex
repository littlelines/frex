defmodule Frex.Parser do
  @moduledoc """
  Module for parsing the response of endpoint calls.
  """

  @doc """
  Parses a Freshbooks XML response (`xml_string`) and returns a map of its attributes.
  
  Returns a tuple with `:ok` and a `Map` if the response is to a single item.

  Returns a tuple with `:ok` and a `List` of `Map`s if the response is multiple item.
  """
  def parse(xml_string) do
    [initial_response] = Quinn.parse(xml_string)

    case initial_response do
      %{attr: [_, status: "fail"]} ->
        %{value: [%{name: :error, value: [error_message]}, %{name: :code, value: [error_code]}]} = initial_response

        {:error,
         %{status: "fail", message: error_message, code: error_code}}
      %{attr: [_, status: "ok"]} ->
        %{value: [%{value: response_data}]} = initial_response

        response_map =
          if response_data |> Enum.at(0) |> Map.get(:value) |> length > 1 do
            response_data |> clean_response_list |>
            Enum.map(fn(item) -> put_attrs(item) end)
          else
            put_attrs(response_data) |> Map.put(:status, "ok")
          end
        {:ok, response_map}
    end
  end

  # Puts attributes from the Freshbooks API (`response`) response into a Map.
  #
  # Returns a `Map`.
  defp put_attrs(response) do
    Enum.reduce(response, %{}, fn(attr, acc) ->
      Map.put(acc, attr.name, Enum.at(attr.value, 0))
    end)
  end

  defp clean_response_list(response_list) do
    Enum.map response_list, fn(item) ->
      %{value: value} = item
      value
    end
  end
end
