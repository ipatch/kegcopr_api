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

  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 1, max: 20)
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
    |> update_change(:username, &String.downcase/1)
    |> unique_constraint(:username)
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 100) |> put_encrypted_pw
  end

  defp put_encrypted_pw(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} -> put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(pass))
    _ ->
      changeset
    end
  end
end
