defmodule BrainnWeb.RepositoriesControllerTest do
  use BrainnWeb.ConnCase, async: true
  import Tesla.Mock

  describe "index/2" do
    test "list all starred repos from github", %{conn: conn} do
      mock(fn %{method: :get, url: "https://api.github.com/users/asrlopes/starred"} ->
        %Tesla.Env{status: 200}
      end)

      conn = get(conn, Routes.repositories_path(conn, :index))

      assert json_response(conn, 200) == %{"data" => []}
    end

    test "list all starred repos from database", %{conn: conn} do
      conn = get(conn, Routes.repositories_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end

    test "list all starred repos from database with query string", %{conn: conn} do
      conn = get(conn, Routes.repositories_path(conn, :index), tags: "docker")
      assert json_response(conn, 200)["data"] == []
    end

    test "rende errors when username is invalid", %{conn: conn} do
      mock(fn %{method: :get, url: "https://api.github.com/users/ /starred"} ->
        %Tesla.Env{status: 404}
      end)

      conn = get(conn, Routes.repositories_path(conn, :index), user: " ")

      assert json_response(conn, 404) == %{"message" => "User not found"}
    end
  end
end
