defmodule Liveview.ExpertTest do
  use Liveview.ModelCase

  alias Liveview.Expert

  @valid_attrs %{fullname: "some content", market_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Expert.changeset(%Expert{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Expert.changeset(%Expert{}, @invalid_attrs)
    refute changeset.valid?
  end
end
