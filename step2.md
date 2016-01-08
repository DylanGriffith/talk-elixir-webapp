1. Setup mix.exs for exrm:
```elixir
defmodule Duckex.Mixfile do
  # ...
  def application do
    [applications: [:logger, :cowboy, :plug],
    included_applications: [:eex],
     mod: {Duckex, []}]
  end
  # ...
end
```

2. Test the release locally:
```
$ mix release
```

```
$ rel/duckex/bin/duckex console
```
