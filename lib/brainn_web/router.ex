defmodule BrainnWeb.Router do
  use BrainnWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BrainnWeb do
    pipe_through :api

    get "/starred-repos/:user", RepositoriesController, :index
    get "/starred-repos", RepositoriesController, :index

    get "/tags", TagsController, :index
    post "/tags", TagsController, :create
    put "/tags/:id", TagsController, :update
    delete "/tags/:id", TagsController, :delete

    post "/repo-tags/:starred_repos_id", RepoTagsController, :create
    delete "/repo-tags/:starred_repos_id/:tags_id", RepoTagsController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BrainnWeb.Telemetry
    end
  end
end
