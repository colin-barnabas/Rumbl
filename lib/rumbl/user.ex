defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    field :password_hash, :string, virtual: true
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_required([:name, :username])
    |> validate_length(:name, min: 1)
    |> validate_length(:username, min: 1, max: 20)
  end
end
