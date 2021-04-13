# defmodule Brainn.RepositoriesTest do
#   use Brainn.DataCase

#   alias Brainn.Repositories

#   describe "starred_repos" do
#     alias Brainn.Repositories.Repos

#     @valid_attrs %{description: "some description", http_url: "some http_url", language: "some language", name: "some name", tags: []}
#     @update_attrs %{description: "some updated description", http_url: "some updated http_url", language: "some updated language", name: "some updated name", tags: []}
#     @invalid_attrs %{description: nil, http_url: nil, language: nil, name: nil, tags: nil}

#     def repos_fixture(attrs \\ %{}) do
#       {:ok, repos} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Repositories.create_repos()

#       repos
#     end

#     test "list_starred_repos/0 returns all starred_repos" do
#       repos = repos_fixture()
#       assert Repositories.list_starred_repos() == [repos]
#     end

#     test "get_repos!/1 returns the repos with given id" do
#       repos = repos_fixture()
#       assert Repositories.get_repos!(repos.id) == repos
#     end

#     test "create_repos/1 with valid data creates a repos" do
#       assert {:ok, %Repos{} = repos} = Repositories.create_repos(@valid_attrs)
#       assert repos.description == "some description"
#       assert repos.http_url == "some http_url"
#       assert repos.language == "some language"
#       assert repos.name == "some name"
#       assert repos.tags == []
#     end

#     test "create_repos/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Repositories.create_repos(@invalid_attrs)
#     end

#     test "update_repos/2 with valid data updates the repos" do
#       repos = repos_fixture()
#       assert {:ok, %Repos{} = repos} = Repositories.update_repos(repos, @update_attrs)
#       assert repos.description == "some updated description"
#       assert repos.http_url == "some updated http_url"
#       assert repos.language == "some updated language"
#       assert repos.name == "some updated name"
#       assert repos.tags == []
#     end

#     test "update_repos/2 with invalid data returns error changeset" do
#       repos = repos_fixture()
#       assert {:error, %Ecto.Changeset{}} = Repositories.update_repos(repos, @invalid_attrs)
#       assert repos == Repositories.get_repos!(repos.id)
#     end

#     test "delete_repos/1 deletes the repos" do
#       repos = repos_fixture()
#       assert {:ok, %Repos{}} = Repositories.delete_repos(repos)
#       assert_raise Ecto.NoResultsError, fn -> Repositories.get_repos!(repos.id) end
#     end

#     test "change_repos/1 returns a repos changeset" do
#       repos = repos_fixture()
#       assert %Ecto.Changeset{} = Repositories.change_repos(repos)
#     end
#   end
# end
