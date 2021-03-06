defmodule Liveview.Location do
  use Liveview.Web, :model
  use Ecto.Schema

  schema "locations" do
    field :lat, :float
    field :lng, :float
    field :timestamp, :naive_datetime

    belongs_to :expert, Liveview.Expert

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
