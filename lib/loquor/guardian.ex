defmodule Loquor.Guardian do
  use Guardian, otp_app: :loquor

  alias Loquor.Repo
  alias Loquor.Schemas.User

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def resource_from_claims(%{"sub" => uuid}) do
    user = Repo.get_by(User, id: uuid)
    {:ok, user}
  end

  def resource_from_claims(_), do: {:error, :no_sub_found}
end

defmodule Loquor.Guardian.ErrorHandler do
  import Plug.Conn

  require Logger

  @behaviour Guardian.Plug.ErrorHandler

  @impl true
  def auth_error(conn, {type, _reason}, _) do
    body = to_string(type)
    conn |> put_resp_content_type("text/plain") |> send_resp(401, body) |> halt
  end
end

defmodule Loquor.Guardian.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :loquor,
    error_handler: Loquor.Guardian.ErrorHandler,
    module: Loquor.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: "Bearer"
  plug Guardian.Plug.LoadResource, allow_blank: true
end
