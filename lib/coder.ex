defmodule Coder do
  def encode_from_pid(pid) do
    pid
    |> :erlang.pid_to_list
    |> to_string
    |> encrypt
    |> Enum.map(fn x -> Base.url_encode64(x, [padding: false]) end)
  end
  def decode_to_pid(list) do
    list
    |> Enum.map(fn x -> Base.url_decode64!(x, [padding: false]) end)
    |> decrypt
    |> to_charlist
    |> :erlang.list_to_pid
  end

  def encrypt(data) do
    key = :crypto.hash(:sha256, Application.get_env(:cafe, CafeWeb.Endpoint)[:secret_key_base])
    {:ok, {init_vec, cipher_text}} = ExCrypto.encrypt(key, data)
    [init_vec, cipher_text]
  end

  def decrypt([init_vec, cipher_text]) do
    key = :crypto.hash(:sha256, Application.get_env(:cafe, CafeWeb.Endpoint)[:secret_key_base])
    {:ok, val} = ExCrypto.decrypt(key, init_vec, cipher_text)
    val
  end
end

