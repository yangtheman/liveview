defmodule Liveview.LocationController do
  use Liveview.Web, :controller

  alias Liveview.Location
  alias Liveview.Expert

  def index(conn, _params) do
    locations = Repo.all(Location)
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Location.changeset(%Location{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    changeset = Location.changeset(%Location{}, location_params)

    case Repo.insert(changeset) do
      {:ok, location} ->
        Liveview.LocationChannel.broadcast_new_location(location)

        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: location_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Repo.get!(Location, id)
    render(conn, "show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Repo.get!(Location, id)
    changeset = Location.changeset(location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Repo.get!(Location, id)
    changeset = Location.changeset(location, location_params)

    case Repo.update(changeset) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: location_path(conn, :show, location))
      {:error, changeset} ->
        render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Repo.get!(Location, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: location_path(conn, :index))
  end
end
