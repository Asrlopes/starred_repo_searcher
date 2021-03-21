defmodule Brainn.Tags.Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :starred_repos, Brainn.Repositories.Repos, join_through: "repo_tags"

    timestamps()
  end

  @doc false
  def changeset(repos, attrs) do
    repos
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
