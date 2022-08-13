defmodule KV do
  @moduledoc """
  Documentation for `KV`.
  """

  def start_link(opts \\ %{}) do
    {:ok, server} = GenServer.start_link(KV.Server, opts)
    server
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end
end
