defmodule Store.Storage do
  def create(data) do
    [iv, ct] = data
    |> Poison.encode!()
    |> Coder.encrypt
    {:ok, pid} = Agent.start_link(fn -> [iv, ct] end)
    Coder.encode_from_pid(pid)
  end

  def get(code_pair) do
    code_pair
    |> Coder.decode_to_pid
    |> Agent.get(fn data -> data end)
    |> Coder.decrypt
    |> Poison.decode!

  end

end

