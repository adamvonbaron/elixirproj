defmodule LoquorWeb.GraphQLContext do
  @behaviour Plug

  import Plug.Conn

  require Logger

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, _context} -> conn
      {:error, reason} -> conn |> send_resp(:unauthorized, reason) |> halt
    end
  end

  defp build_context(conn) do
    Logger.info("in the shit my man")
    %Plug.Conn{cookies: bobies} = fetch_cookies(conn, signed: true)
    Logger.info(inspect(Map.get(bobies, "jwt")))

    with %Plug.Conn{cookies: cookies} <- fetch_cookies(conn, signed: true),
         {:ok, current_user} <- LoquorWeb.Authentication.authorize_user(Map.get(cookies, "jwt")) do
      {:ok, current_user: current_user}
    else
      _ -> {:error, "unauthorized"}
    end
  end
end
