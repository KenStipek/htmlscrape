defmodule Htmlscrape.ScrapeController do
  use Htmlscrape.Web, :controller

  alias Htmlscrape.Scrape

  def index(conn, _params) do
    scrapes = Repo.all(Scrape)
    render(conn, "index.html", scrapes: scrapes)
  end
end
