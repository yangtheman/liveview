defmodule Liveview.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:markets) do
      add :name, :string
      add :lat, :float
      add :lng, :float

      timestamps()
    end

    create table(:experts) do
      add :market_id, references(:markets)
      add :fullname, :string

      timestamps()
    end

    create table(:locations) do
      add :expert_id, references(:experts)
      add :lat, :float
      add :lng, :float
      add :timestamp, :naive_datetime

      timestamps()
    end
  end
end
