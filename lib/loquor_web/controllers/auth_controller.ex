defmodule LoquorWeb.AuthController do
  use LoquorWeb, :controller

  alias LoquorWeb.Authentication
  alias Loquor.Guardian

  @cookie_opts [
    encrypted: true,
    http_only: true,
    secure: true,
    same_site: "Strict"
  ]

  def login(conn, params) do
    IO.inspect(params)

    with {:ok, user} <- Authentication.verify_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> Guardian.Plug.sign_in(user)
      |> put_resp_cookie("jwt", token, @cookie_opts)
      |> render("login.json", user: user, token: token)
    end
  end

  def logout(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> delete_resp_cookie("jwt", @cookie_opts)
    |> send_resp(200, "ok")
  end
end
