defmodule Duckex do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Duckex.Router, []),
    ]

    opts = [strategy: :one_for_one, name: Duckex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
