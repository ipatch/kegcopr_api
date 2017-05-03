defmodule KegCopRAPI.Repo.Migrations.CreateKegCopRAPI.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :encrypted_password, :string

      timestamps()
    end

    create unique_index(:accounts_users, [:email])
    create unique_index(:accounts_users, [:username])
  end
end
