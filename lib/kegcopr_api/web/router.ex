defmodule KegCopRAPI.Web.Router do
  use KegCopRAPI.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KegCopRAPI.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", KegCopRAPI.Web do
    pipe_through :api

    resources "/users", UserController, except: [:show, :index, :new, :edit]
  end
end
