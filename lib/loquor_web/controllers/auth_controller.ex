defmodule LoquorWeb.AuthController do
  use LoquorWeb, :controller

  alias LoquorWeb.Authentication

  @cookie_opts [
    encrypted: true,
    http_only: true,
    secure: true,
    same_site: "Strict"
  ]

  def login(conn, params) do
    IO.inspect(params)

    with {:ok, user, token} <- Authentication.login_user(params) do
      conn
      |> put_resp_cookie("jwt", token, @cookie_opts)
      |> render("login.json", user: user, token: token)
    end
  end

  def logout(conn, _params) do
    conn
    |> delete_resp_cookie("jwt", @cookie_opts)
    |> send_resp(200, "ok")
  end
end
