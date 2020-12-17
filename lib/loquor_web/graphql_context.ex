defmodule LoquorWeb.GraphQLContext do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, context} -> conn |> Absinthe.Plug.put_options(context: context)
      {:error, reason} -> conn |> send_resp(:unauthorized, reason) |> halt
    end
  end

  defp build_context(conn) do
    with %Plug.Conn{cookies: cookies} <- fetch_cookies(conn, signed: true),
         {:ok, current_user} <- LoquorWeb.Authentication.authorize_user(Map.get(cookies, "jwt")) do
      {:ok, %{current_user: current_user}}
    else
      _ -> {:error, "unauthorized"}
    end
  end
end
