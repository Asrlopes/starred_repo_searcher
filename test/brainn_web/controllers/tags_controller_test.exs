defmodule BrainnWeb.TagsControllerTest do
  use BrainnWeb.ConnCase, async: true

  alias Brainn.Tags
  alias Brainn.Tags.Create

  def fixture(:tag) do
    {:ok, tag} = Create.call(%{"name" => "some_tag"})
    tag
  end

  describe "index/2" do
    test "list all tags", %{conn: conn} do
      conn = get(conn, Routes.tags_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create/2" do
    test "render tag when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tags_path(conn, :create), name: "some tag")

      assert %{"id" => _id} = json_response(conn, 201)

      assert %{
               "id" => _id,
               "name" => "some tag"
             } = json_response(conn, 201)
    end

    test "rende errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tags_path(conn, :create), name: "")
      assert json_response(conn, 400)["errors"] != %{}
    end
  end

  describe "update/2" do
    setup [:create_tag]

    test "when the given id is valid, update an tag", %{conn: conn, tag: %Tags{id: id} = tag} do
      conn = put(conn, Routes.tags_path(conn, :update, tag), name: "new tag")
      assert %{"id" => ^id} = json_response(conn, 200)

      assert %{
               "id" => _id,
               "name" => "new tag"
             } = json_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, tag: tag} do
      conn = put(conn, Routes.tags_path(conn, :update, tag), name: "")
      assert json_response(conn, 400)["errors"] != %{}
    end
  end

  describe "delete/2" do
    setup [:create_tag]

    test "deletes chosen tag", %{conn: conn, tag: tag} do
      conn = delete(conn, Routes.tags_path(conn, :delete, tag))
      assert response(conn, 204)
    end

    test "when the resource its not found, return an error", %{
      conn: conn,
      tag: _tag
    } do
      conn = delete(conn, Routes.tags_path(conn, :delete, %Tags{id: 999_999}))

      assert json_response(conn, 404) != %{}
    end
  end

  defp create_tag(_) do
    tag = fixture(:tag)
    %{tag: tag}
  end
end
