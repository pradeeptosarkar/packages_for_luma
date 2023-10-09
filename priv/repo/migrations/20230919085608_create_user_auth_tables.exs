defmodule Himmel.Repo.Migrations.CreateUserAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:user) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:user, [:email])

    create table(:user_tokens) do
      add :user_id, references(:user, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:user_tokens, [:user_id])
    create unique_index(:user_tokens, [:context, :token])
  end
end
