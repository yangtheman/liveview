defmodule Liveview.PageController do
  use Liveview.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
