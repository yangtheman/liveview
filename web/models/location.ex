defmodule Liveview.Location do
  use Liveview.Web, :model

  schema "locations" do
    field :expert_id, :integer
    field :lat, :float
    field :lng, :float
    field :timestamp, :naive_datetime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:expert_id, :lat, :lng, :timestamp])
    |> validate_required([:expert_id, :lat, :lng, :timestamp])
  end
end
