defmodule Loquor.Schemas.User do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.Post
  alias Loquor.Schemas.Comment

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :username, :string

    many_to_many :friends, __MODULE__, join_through: "friendships"
    has_many :posts, Post
    has_many :comments, Comment

    timestamps()
  end

  def list_users() do
    Loquor.Repo.all(__MODULE__)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :firstname, :lastname])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_pass_hash
  end

  defp put_pass_hash(
         %Ecto.Changeset{
           valid?: true,
           changes: %{password: password}
         } = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
