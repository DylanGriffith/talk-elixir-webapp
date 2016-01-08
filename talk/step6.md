1. Add the estimate template `lib/templates/estimate.html.eex`:
```html
<!DOCTYPE html>
<html lang="en">
  <head>
  </head>
  <body>
  <h1>Estimate</h1>
  For <%= number_of_people %> people you need <%= number_of_ducks %> ducks.
  </body>
</html>
```

2. Add the eex function to `lib/duckex/template.ex`:

```elixir
  EEx.function_from_file :def, :estimate, "./lib/templates/estimate.html.eex", [:number_of_people, :number_of_ducks]
```

3. Update the router:

```elixir
  get "/estimate" do
    params = conn.query_string |> Plug.Conn.Query.decode
    {number_of_people, ""} = Integer.parse(params["people"])
    number_of_ducks = round(Float.ceil(number_of_people / 3))

    send_resp(conn, 200, Duckex.Template.estimate(number_of_people, number_of_ducks))
  end
```
