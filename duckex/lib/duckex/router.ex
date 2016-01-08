defmodule Duckex.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, [], [port: 5151]
  end

  get "/" do
    send_resp(conn, 200, Duckex.Template.index)
  end

  get "/estimate" do
    params = conn.query_string |> Plug.Conn.Query.decode
    {number_of_people, ""} = Integer.parse(params["people"])
    number_of_ducks = round(Float.ceil(number_of_people / 3))

    send_resp(conn, 200, Duckex.Template.estimate(number_of_people, number_of_ducks))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
