defmodule Liveview.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :expert_id, :integer
      add :lat, :float
      add :lng, :float
      add :timestamp, :datetime

      timestamps()
    end

  end
end
