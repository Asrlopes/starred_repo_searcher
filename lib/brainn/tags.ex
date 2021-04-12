defmodule Brainn.Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :starred_repos, Brainn.StarredRepos, join_through: "repo_tags"

    timestamps()
  end

  def changeset(tag \\ %__MODULE__{}, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def update_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
