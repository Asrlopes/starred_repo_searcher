defmodule Brainn.Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :starred_repos, Brainn.StarredRepos, join_through: "repo_tags"

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
