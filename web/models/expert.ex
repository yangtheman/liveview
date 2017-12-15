defmodule Liveview.Expert do
  use Liveview.Web, :model
  use Ecto.Schema

  schema "experts" do
    field :fullname, :string

    belongs_to :market, Liveview.Market

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:market_id, :fullname])
    |> validate_required([:market_id, :fullname])
  end
end
