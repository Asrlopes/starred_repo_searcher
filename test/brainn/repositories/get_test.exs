defmodule Brainn.Repositories.GetTest do
  use Brainn.DataCase, async: true
  import Tesla.Mock

  alias Brainn.Repositories.Get
  # alias Brainn.StarredRepos

  describe "call/0" do
    test "list all starred repos from database" do
      starred_repos = Get.call()

      assert starred_repos == {:ok, []}
    end
  end

  describe "call/1" do
    test "fetch starred repos from github by username" do
      username = "asrlopes"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 2, "name" => "my repo 2"}
      ]

      mock(fn %{method: :get, url: "https://api.github.com/users/asrlopes/starred"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      expected_response = {:ok, response}

      assert Get.call(%{"user" => username}) === expected_response
    end

    test "list starred repos from database by tag name" do
      tag_name = "docker"

      starred_repos = Get.call(%{"tags" => tag_name})
      assert starred_repos == {:ok, []}
    end
  end
end
