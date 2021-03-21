defmodule Brainn.Repositories.Repos do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  schema "starred_repos" do
    field :description, :string
    field :http_url, :string
    field :language, :string
    field :name, :string
    many_to_many :tags, Brainn.Tags.Tags, join_through: "repo_tags"

    timestamps()
  end

  @doc false
  def changeset(repos, attrs) do
    repos
    |> cast(attrs, [:id, :name, :description, :http_url, :language, :tags])
    |> validate_required([:id, :name, :description, :http_url, :language, :tags])
  end
end
