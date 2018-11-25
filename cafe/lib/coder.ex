defmodule Coder do
  def encode_from_pid(pid) do
    pid
    |> :erlang.pid_to_list
    |> to_string
    |> Base.url_encode64
  end
  def decode_to_pid(string) do
    string
    |> Base.url_decode64!
    |> to_charlist
    |> :erlang.list_to_pid

  end
end

