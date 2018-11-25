defmodule Store do
  alias Store.Storage

  defdelegate create(data), to: Storage
  defdelegate get(code), to: Storage
end

