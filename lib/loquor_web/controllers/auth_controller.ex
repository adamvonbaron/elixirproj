defmodule LoquorWeb.AuthController do
  use LoquorWeb, :controller

  @cookie_opts [
    encrypted: true,
    http_only: true,
    secure: true
  ]

  def login(conn, params) do
    with {:ok, user} <- Authentication.verify_user(params) do
      conn
      |> put_status(:ok)
      |> put_resp_cookie("jwt", Authentication.generate_token(user), @cookie_opts)
      |> render("login.json", user: user)
    end
  end

  def logout(conn, _params) do
    conn
    |> delete_resp_cookie("jwt", @cookie_opts)
    |> resp(:ok, "")
    |> send_resp
  end
end
