defmodule BrainnWeb.FallbackController do
  use BrainnWeb, :controller

  def call(conn, {:error, "Resource not found"}) do
    conn
    |> put_status(:not_found)
    |> put_view(BrainnWeb.ErrorView)
    |> render("404.json", result: "Resource not found")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BrainnWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
