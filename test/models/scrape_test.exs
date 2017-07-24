defmodule Htmlscrape.ScrapeTest do
  use Htmlscrape.ModelCase

  alias Htmlscrape.Scrape

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Scrape.changeset(%Scrape{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Scrape.changeset(%Scrape{}, @invalid_attrs)
    refute changeset.valid?
  end
end
