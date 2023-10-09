defmodule Himmel.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset
  alias Himmel.Accounts.User
  alias Himmel.Places.Coordinates
  # alias Himmel.Repo

  schema "places" do
    field :name, :string
    embeds_one :coordinates, Coordinates

    many_to_many :user, User, join_through: "places_users"

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:name])
    |> cast_embed(:coordinates, required: true)
    |> cast_assoc(:user, with: &User.places_changeset/2, required: true)
    |> validate_required([:name, :coordinates, :user])
  end

  # defp validate_user_exists(changeset, user) do
  #   case user do
  #     %{"id" => id} ->
  #       case Repo.get(User, id) do
  #         nil -> add_error(changeset, :user, "does not exist")
  #         _ -> changeset
  #       end

  #     _ ->
  #       changeset
  #   end
  # end
end
