defmodule Himmel.Repo.Migrations.CreatePlacesUsers do
  use Ecto.Migration

  def change do
    create table(:places_users, primary_key: false) do
      add :place_id, references(:places, on_delete: :delete_all)
      add :user_id, references(:user, on_delete: :delete_all)
    end

    create unique_index(:places_users, [:place_id, :user_id])
  end
end
