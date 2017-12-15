defmodule Liveview.LocationControllerTest do
  use Liveview.ConnCase

  alias Liveview.Location
  @valid_attrs %{expert_id: 42, lat: "120.5", lng: "120.5", timestamp: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, location_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing locations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, location_path(conn, :new)
    assert html_response(conn, 200) =~ "New location"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, location_path(conn, :create), location: @valid_attrs
    assert redirected_to(conn) == location_path(conn, :index)
    assert Repo.get_by(Location, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, location_path(conn, :create), location: @invalid_attrs
    assert html_response(conn, 200) =~ "New location"
  end

  test "shows chosen resource", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = get conn, location_path(conn, :show, location)
    assert html_response(conn, 200) =~ "Show location"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, location_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = get conn, location_path(conn, :edit, location)
    assert html_response(conn, 200) =~ "Edit location"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = put conn, location_path(conn, :update, location), location: @valid_attrs
    assert redirected_to(conn) == location_path(conn, :show, location)
    assert Repo.get_by(Location, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = put conn, location_path(conn, :update, location), location: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit location"
  end

  test "deletes chosen resource", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = delete conn, location_path(conn, :delete, location)
    assert redirected_to(conn) == location_path(conn, :index)
    refute Repo.get(Location, location.id)
  end
end
