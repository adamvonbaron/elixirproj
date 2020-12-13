defmodule Loquor.Schemas.Friendship do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.User

  schema "friendships" do
    belongs_to :user, User
    belongs_to :friend, User

    timestamps()
  end

  def changeset(friendship, _) do
    friendship
    |> cast_assoc(:user, with: &User.changeset/2)
    |> cast_assoc(:friend, with: &User.changeset/2)
    # |> validate_required([:user, :friend])
    |> assoc_constraint(:user)
    |> assoc_constraint(:friend)
  end
end
