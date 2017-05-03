defmodule KegCopRAPI.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :email, :string
    field :encrypted_password, :string
    field :username, :string

    timestamps()
  end
end
