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
