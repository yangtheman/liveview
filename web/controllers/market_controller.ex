defmodule Liveview.MarketController do
  use Liveview.Web, :controller
  import PhoenixGon.Controller
  require Logger

  alias Liveview.Market

  def show(conn, %{"id" => id}) do
    market = Repo.get_by!(Market, name: String.upcase(id))
    username = signed_in_username()
    conn = put_gon(conn, %{username: username, market_lat: market.lat, market_lng: market.lng, channel_name: String.downcase(id)})
    render(conn, "show.html", market: market, username: username)
  end

  defp signed_in_username do
    query = from(e in "experts", select: {e.fullname}, order_by: fragment("random()"), limit: 1)
    [row|_] = Repo.all(query)
    {expert_fullname} = row
    expert_fullname
  end
end
