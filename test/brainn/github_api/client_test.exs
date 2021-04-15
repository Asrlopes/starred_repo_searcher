defmodule Brainn.GithubApi.CientTest do
  use ExUnit.Case, async: true

  import Tesla.Mock

  alias Brainn.GithubApi.Client

  describe "get_starred_repos_by_username/1" do
    test "when the user has starred repos, return the repos" do
      username = "asrlopes"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 2, "name" => "my repo 2"}
      ]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/asrlopes/starred"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert Client.get_starred_repos_by_username(username) === expected_response
    end

    test "when the user does not exist return an error" do
      username = ""

      expected_response = {:error, "User not found"}

      mock(fn %{method: :get, url: "https://api.github.com/users//starred"} ->
        %Tesla.Env{status: 404}
      end)

      assert Client.get_starred_repos_by_username(username) === expected_response
    end

    test "when the error is generic" do
      username = "asrlopes"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 2, "name" => "my repo 2"}
      ]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/asrlopes/starred"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert Client.get_starred_repos_by_username(username) === expected_response
    end
  end
end
