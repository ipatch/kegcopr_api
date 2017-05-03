defmodule KegCopRAPI.Repo.Migrations.CreateKegCopRAPI.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :email, :string
      add :encrypted_password, :string
      add :username, :string

      timestamps()
    end

  end
end
