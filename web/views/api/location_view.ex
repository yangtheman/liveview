defmodule Liveview.API.LocationView do
  use Liveview.Web, :view

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, Liveview.API.LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, Liveview.API.LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id}
  end
end
