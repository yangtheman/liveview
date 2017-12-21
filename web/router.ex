defmodule Liveview.Router do
  use Liveview.Web, :router

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

  scope "/", Liveview do
    pipe_through :browser # Use the default browser stack

    resources "/markets", MarketController, only: [:show]

    get "/", PageController, :index
  end

  scope "/api", Liveview do
    pipe_through :api

    resources "/locations", API.LocationController, except: [:new, :edit]
  end
end
