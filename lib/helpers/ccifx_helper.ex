defmodule Ccifx.Helper do
  @moduledoc """
  Helpers for building alphabet maps.
  """
  def provide_alpha_map do
    alphabet = for l <- ?A..?Z, do: <<l::utf8>>
    n_range = 0..25 |> Enum.to_list()
    Enum.zip(n_range, alphabet) |> Enum.into(%{})
  end

  def provide_n_map do
    alphabet = for l <- ?A..?Z, do: <<l::utf8>>
    n_range = 0..25 |> Enum.to_list()
    Enum.zip(alphabet, n_range) |> Enum.into(%{})
  end
end
