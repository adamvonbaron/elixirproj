defmodule Loquor.Schemas.User do
  use Loquor.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :username, :string

    # has_many :friends,

    timestamps()
  end

  # def validate_password(user, password) do
  #   case Argon2.check_pass password do
  #     {:ok, u} -> {:ok, u}
  #     {:error, reason} ->
  #   end
  # end

  @doc """
  returns user from database using email password combo

  ## Examples

    iex> verify_user %{email: "test@test.com", password: "example_pass"}
    %{:ok, %User{}}
  """
  def verify_user(%{"email" => email, "password" => password}) do
    case Loquor.Repo.get_by(%__MODULE__{}, email: email) do
      %__MODULE__{} = user -> user |> Argon2.check_pass(password)
      nil -> {:error, "No user with that email"}
    end
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
