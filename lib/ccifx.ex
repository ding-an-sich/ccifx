defmodule Ccifx do
  @moduledoc """
  Provides functions for ciphering and deciphering phrases with Caesar's Cipher.
  """

  alias Ccifx.Repository
  alias Ccifx.Ciphers
  use Application

  @implemented_modes [:left, :right]

  def start(_, _) do
    Ccifx.Repository.Supervisor.start_link([])
  end

  def crypt(phrase, key, mode) when is_binary(phrase) and is_integer(key), do: do_crypt(phrase, key, mode)
  def crypt(_phrase, _key, _mode), do: raise ArgumentError

  defp do_crypt(phrase, key, :left) do
    phrase
    |> String.upcase()
    |> String.graphemes()
    |> Ciphers.left(key)
    |> Repository.save(:left, key)
  end

  defp do_crypt(phrase, key, :right) do
    phrase
    |> String.upcase()
    |> String.graphemes()
    |> Ciphers.right(key)
    |> Repository.save(:right, key)
  end

  defp do_crypt(_phrase, _key, _mode) do
    raise ArgumentError
  end

  def decrypt(mode) when mode in @implemented_modes do
    {key, message} = Repository.retrieve(mode)
    graphs = String.graphemes(message)
    case mode do
      :left -> Ciphers.right(graphs, key)
      :right -> Ciphers.left(graphs, key)
    end
  end
end
