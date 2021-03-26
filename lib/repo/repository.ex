defmodule Ccifx.Repository do
  @moduledoc """
  A repository for saving and retrieving ciphered messages.
  """

  use Agent

  def start_link(initial_state) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def save(message, mode, key) do
    Agent.update(__MODULE__, fn map ->
      Map.put(map, mode, {key, message})
    end)
  end

  def retrieve(mode) do
    Agent.get(__MODULE__, fn map ->
      map[mode]
    end)
  end
end
