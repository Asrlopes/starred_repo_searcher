defmodule Brainn.RepoTags.Create do
  alias Brainn.Repo
  alias Brainn.RepoTags

  def call(params) do
    RepoTags.changeset(params)
    |> Repo.insert()
  end
end
