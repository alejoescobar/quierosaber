defmodule QuieroSaber.PageController do
  use QuieroSaber.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
