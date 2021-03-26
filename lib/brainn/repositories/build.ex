defmodule Brainn.Repositories.Build do
  def build(list) do
    case list do
      {:ok, repos} ->
        repos
        |> parse_repos()

      {:error, _reason} ->
        list
    end
  end

  defp parse_repos(repos) do
    parsed_repos =
      Enum.map(repos, fn repo ->
        %{
          id: Map.get(repo, "id"),
          name: Map.get(repo, "name"),
          description: Map.get(repo, "description"),
          language: Map.get(repo, "language"),
          http_url: Map.get(repo, "html_url")
        }
      end)

    {:ok, parsed_repos}
  end
end
