defmodule Himmel.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string
      add :coordinates, :map

      timestamps()
    end

    create unique_index(:places, [:coordinates])
  end
end
