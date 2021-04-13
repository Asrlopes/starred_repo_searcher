defmodule Brainn.Repositories.Get do
  alias Brainn.GithubApi.Client
  alias Brainn.Repo
  alias Brainn.Repositories.Build
  alias Brainn.StarredRepos

  def call(username) do
    Repo.delete_all(StarredRepos)
    # Repo.delete_all()

    starred_repos = Client.get_starred_repos_by_username(username)

    Build.build(starred_repos)
    |> store_to_database()

    starred_repos
    # retrieve_data_from_db()
  end

  def call() do
    retrieve_data_from_db()
  end

  defp store_to_database({:ok, parsed_repos}) do
    parsed_repos
    |> Enum.map(fn parsed_repo -> StarredRepos.changeset(parsed_repo) end)
  end

  defp store_to_database({:error, _reason}), do: :error

  defp retrieve_data_from_db() do
    data =
      Repo.all(StarredRepos)
      |> Repo.preload([:tags])

    {:ok, data}
  end
end
