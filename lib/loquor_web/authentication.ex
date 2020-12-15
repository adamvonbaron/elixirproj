defmodule LoquorWeb.Authentication do
  alias Loquor.Schemas.User
  alias Loquor.Repo
  alias Argon2
  import Ecto.Query, only: [from: 2]
  require Logger

  def verify_user(%{"email" => email, "password" => password}) do
    query = from u in User, where: u.email == ^email

    case Repo.one(query) do
      nil ->
        Logger.warn("no user found")
        Argon2.no_user_verify()
        {:error, :invalid_credentials}

      user ->
        Logger.info("got a user: #{inspect(user)}")
        {:ok, user} = user |> Argon2.check_pass(password)
        {:ok, user |> sanitize_user}
    end
  end

  def verify_user(%{"sub" => id}) do
    case User.by_id(id) |> sanitize_user do
      nil ->
        {:error, "no user found"}

      user ->
        {:ok, user}
    end
  end

  def login_user(params) do
    {:ok, user} = verify_user(params)
    {:ok, token, _} = Loquor.Token.generate_and_sign(%{"sub" => user.id})
    {:ok, user, token}
  end

  def authorize_user(token) when token == nil, do: {:error, "no token"}

  def authorize_user(token) do
    case Loquor.Token.verify_and_validate(token) do
      {:ok, claims} -> verify_user(claims)
      {:error, reason} -> {:error, reason}
    end
  end

  defp sanitize_user(user), do: user |> Map.from_struct() |> Map.drop([:password, :password_hash])
  defp sanitize_user(nil), do: nil
end
