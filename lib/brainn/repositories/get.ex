defmodule Brainn.Repositories.Get do
  alias Brainn.GithubApi.Client
  alias Brainn.Repo
  alias Brainn.Repositories.Build
  alias Brainn.StarredRepos

  def call(username) do
    username
    |> Client.get_starred_repos_by_username()
    |> Build.build()
    |> store_to_database()

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
