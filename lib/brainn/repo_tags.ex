defmodule Brainn.RepoTags do
  use Ecto.Schema
  import Ecto.Changeset

  alias Brainn.StarredRepos
  alias Brainn.Tags

  @primary_key {:id, :integer, []}
  schema "repo_tags" do
    belongs_to(:starred_repos, StarredRepos, primary_key: true)
    belongs_to(:tags, Tags, primary_key: true)

    timestamps()
  end

  @required_fields [:tags_id, :starred_repos_id]
  def changeset(params \\ %{}) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:tags_id)
    |> foreign_key_constraint(:starred_repos_id)
    |> unique_constraint([:tags_id, :starred_repos_id])
  end
end
