defmodule Ccifx.Ciphers do
  @moduledoc """
  Various Caesar's Ciphers implementations.
  """
  Module.put_attribute(__MODULE__, :alphamap, Ccifx.Helper.provide_alpha_map)
  Module.put_attribute(__MODULE__, :nmap, Ccifx.Helper.provide_n_map)

  def left(graphs, key) do
    graphs
    |> Enum.map(fn graph ->
      code = @nmap[graph]
      if code do
        cypher = Integer.mod((code - key), 26)
        @alphamap[cypher]
      else
        graph
      end
    end)
    |> List.to_string()
  end

  def right(graphs, key) do
    graphs
    |> Enum.map(fn graph ->
      code = @nmap[graph]
      if code do
        cypher = Integer.mod((code + key), 26)
        @alphamap[cypher]
      else
        graph
      end
    end)
    |> List.to_string()
  end
end
