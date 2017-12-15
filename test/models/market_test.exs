defmodule Liveview.MarketTest do
  use Liveview.ModelCase

  alias Liveview.Market

  @valid_attrs %{lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Market.changeset(%Market{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Market.changeset(%Market{}, @invalid_attrs)
    refute changeset.valid?
  end
end
