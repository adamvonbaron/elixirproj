defmodule LoquorWeb.AuthView do
  use LoquorWeb, :view

  def render("login.json", %{user: user}) do
    %{
      username: user.username,
      email: user.email,
      inserted_at: user.inserted_at,
      firstname: user.firstname,
      lastname: user.lastname,
      id: user.id
    }
  end
end
