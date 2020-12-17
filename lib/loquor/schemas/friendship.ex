defmodule Loquor.Schemas.Friendship do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.User

  schema "friendships" do
    belongs_to :user, User
    belongs_to :friend, User

    timestamps()
  end

  def datasource(), do: Dataloader.Ecto.new(Loquor.Repo, query: &query/2)
  def query(queryable, _params), do: queryable

  def changeset(friendship, attrs) do
    friendship
    |> cast(attrs, [:user_id, :friend_id])
    |> assoc_constraint(:user)
    |> assoc_constraint(:friend)
  end
end
