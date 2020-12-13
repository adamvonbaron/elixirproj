defmodule Loquor.Repo.Migrations.AddFriendshipsTable do
  use Ecto.Migration

  def change do
    create table(:friendships) do
      add :user_id, references(:users)
      add :friend_id, references(:users)

      timestamps()
    end
  end
end
