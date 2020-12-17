defmodule Loquor.Schemas.Post do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.User
  alias Loquor.Schemas.Comment

  schema "posts" do
    field :title, :string
    field :content, :string

    belongs_to(:user, User)
    has_many(:comments, Comment)

    timestamps()
  end

  def list_posts() do
    Loquor.Repo.all(__MODULE__) |> Loquor.Repo.preload(:user)
  end

  def get_author(%__MODULE__{user: user}) do
    {:ok, Loquor.Schemas.User.by_id(user.id)}
  end

  def datasource(), do: Dataloader.Ecto.new(Loquor.Repo, query: &query/2)
  def query(queryable, _params), do: queryable

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :user_id])
    |> validate_required([:content, :user_id])
    |> cast_assoc(:user)
    |> cast_assoc(:comments)
    |> assoc_constraint(:user)
  end
end
