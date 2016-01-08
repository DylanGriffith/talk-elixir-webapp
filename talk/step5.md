1. Add eex template to `lib/templates/index.html.eex`:
```html
<!DOCTYPE html>
<html lang="en">
  <head>
  </head>
  <body>
  <h1>Welcome To Duckex!</h1>
  <form action="/estimate" method="GET">
    <label for="people"># People</label>
    <input type="number" name="people"/>
    <input type="submit" value="Submit"/>
  </form>
  </body>
</html>
```

2. Add function to `lib/duckex/template.ex`:
```elixir
defmodule Duckex.Template do
  require EEx
  EEx.function_from_file :def, :index, "./lib/templates/index.html.eex", [:paragraph]
end
```

3. Update router:
```elixir
get "/" do
  send_resp(conn, 200, Duckex.Template.index)
end
```
