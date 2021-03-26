defmodule BrainnWeb.FallbackController do
  use BrainnWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BrainnWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
