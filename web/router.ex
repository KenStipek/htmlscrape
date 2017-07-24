defmodule Htmlscrape.Router do
  use Htmlscrape.Web, :router

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

  scope "/", Htmlscrape do
    pipe_through :browser # Use the default browser stack

    get "/", ScrapeController, :index
    
    resources "/targets", TargetController 
  end

  # Other scopes may use custom stacks.
  # scope "/api", Htmlscrape do
  #   pipe_through :api
  # end
end
