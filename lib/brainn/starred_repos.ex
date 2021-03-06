defmodule Brainn.StarredRepos do
  use Ecto.Schema
  alias Brainn.Repo

  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  schema "starred_repos" do
    field :description, :string
    field :http_url, :string
    field :language, :string
    field :name, :string
    many_to_many :tags, Brainn.Tags, join_through: "repo_tags"

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:id, :name, :description, :http_url, :language])
    |> validate_required([:id, :name])
    |> Repo.insert()
  end
end
