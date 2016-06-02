defmodule Frex.Client do
  @moduledoc """
  The client module's job is to facilitate the request to the Freshbooks API
  (through `Frex.Request`) and ensure that all required properties are passed
  properly.
  """

  @doc """
  Puts options from a map into a usable builder list.
  """
  def opts_to_builder(opts) when is_map(opts) do
    Enum.reduce opts, [], fn(opt, acc) ->
      {key, val} = opt
      Enum.into(acc, [{key, %{}, val}])
    end
  end
end
