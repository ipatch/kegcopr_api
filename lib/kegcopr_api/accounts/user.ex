defmodule KegCopRAPI.Accounts.User do
  use Ecto.Schema
  # import Ecto
  import Ecto.Changeset
  # import Ecto.Query

  schema "accounts_users" do
    field :email, :string
    field :encrypted_password, :string
    field :username, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields ~w(email encrypted_password username)
  @optional_fields ~w()

  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields, @optional_fields)
    # |> cast(params, [:email, :encrypted_password, :username])
    # |> validate_required([:email, :encrypted_password, :username])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 1, max: 20)
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
    |> update_change(:username, &String.downcase/1)
    |> unique_constraint(:username)
  end
end
