defmodule LoquorWeb.GraphQLContext do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, _context} -> conn
      {:error, reason} -> conn |> send_resp(:unauthorized, reason) |> halt
    end
  end

  defp build_context(conn) do
    with %Plug.Conn{cookies: cookies} <- fetch_cookies(conn, signed: true) do
      with {:ok, current_user} <- authorize_user(Map.get(cookies, "jwt")) do
        {:ok, current_user: current_user}
      else
        _ -> {:error, "unable to authenticate user with provided credentials"}
      end
    else
      _ -> {:error, "no cookie found"}
    end
  end

  defp authorize_user(_), do: {:ok, %{}}
end
