defmodule Frex.Endpoint do
  @moduledoc """
  Aliases and imports to make writing endpoint clients less painful.
  
  ## Example

  ```
  defmodule Frex.Client.Foo do
    use Frex.Endpoint, :client
    
    # ...
  end
  ```
  """

  def client do
    quote do
      alias Frex.HTTP
      alias Frex.Request
      import Frex.Client
    end
  end

  @doc """
  When used, dispatch to the appropriate function.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
