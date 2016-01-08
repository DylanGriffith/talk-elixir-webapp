1. Create app
```bash
$ mix new --sup duckex && cd duckex
```

2. Add dependencies
```elixir
defmodule Duckex.Mixfile do
  # ...

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:exrm, "~> 0.19"},
    ]
  end
end
```

```bash
$ mix deps.get
```

3. Hello World WebApp

Supervision tree `lib/duckex.ex`:

```elixir
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
```

Plug router `lib/duckex/router.ex`:

```elixir
defmodule Duckex.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, [], [port: 5151]
  end

  get "/" do
    send_resp(conn, 200, "<h1>Hello, Duck!</h1>")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
```

4. Test It
```bash
$ mix run --no-halt
```

[Check it out](http://localhost:5151)

https://www.facebook.com/dialog/feed?to=513077892146229&app_id=145634995501895&redirect_uri=https://developers.facebook.com/tools/explorer
