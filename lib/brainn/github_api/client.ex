defmodule Brainn.GithubApi.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.Headers, [{"User-Agent", "brainn"}]

  plug Tesla.Middleware.JSON

  def get_starred_repos_by_username(user) do
    "/users/#{user}/starred"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "User not found"}
  defp handle_get({:error, _reason}), do: {:error, "Generic error"}
end
