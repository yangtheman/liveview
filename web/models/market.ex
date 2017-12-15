defmodule Liveview.Market do
  use Liveview.Web, :model
  use Ecto.Schema

  schema "markets" do
    field :name, :string
    field :lat, :float
    field :lng, :float

    has_many :experts, Liveview.Expert

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lat, :lng])
    |> validate_required([:name, :lat, :lng])
  end
end
