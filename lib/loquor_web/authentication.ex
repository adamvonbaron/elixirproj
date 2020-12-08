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
        user |> Argon2.check_pass(password)
    end
  end
end
