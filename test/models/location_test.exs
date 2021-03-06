defmodule Liveview.LocationTest do
  use Liveview.ModelCase

  alias Liveview.Location

  @valid_attrs %{expert_id: 42, lat: "120.5", lng: "120.5", timestamp: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
