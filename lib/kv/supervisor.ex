defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      KV
    ]

    opts = [
      strategy: :one_for_one,
      name: KV.Supervisor
    ]

    Supervisor.init(children, opts)
  end
end
