defmodule Htmlscrape.ScrapeControllerTest do
  use Htmlscrape.ConnCase

  alias Htmlscrape.Scrape
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, scrape_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing scrapes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, scrape_path(conn, :new)
    assert html_response(conn, 200) =~ "New scrape"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, scrape_path(conn, :create), scrape: @valid_attrs
    assert redirected_to(conn) == scrape_path(conn, :index)
    assert Repo.get_by(Scrape, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, scrape_path(conn, :create), scrape: @invalid_attrs
    assert html_response(conn, 200) =~ "New scrape"
  end

  test "shows chosen resource", %{conn: conn} do
    scrape = Repo.insert! %Scrape{}
    conn = get conn, scrape_path(conn, :show, scrape)
    assert html_response(conn, 200) =~ "Show scrape"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, scrape_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    scrape = Repo.insert! %Scrape{}
    conn = get conn, scrape_path(conn, :edit, scrape)
    assert html_response(conn, 200) =~ "Edit scrape"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    scrape = Repo.insert! %Scrape{}
    conn = put conn, scrape_path(conn, :update, scrape), scrape: @valid_attrs
    assert redirected_to(conn) == scrape_path(conn, :show, scrape)
    assert Repo.get_by(Scrape, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    scrape = Repo.insert! %Scrape{}
    conn = put conn, scrape_path(conn, :update, scrape), scrape: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit scrape"
  end

  test "deletes chosen resource", %{conn: conn} do
    scrape = Repo.insert! %Scrape{}
    conn = delete conn, scrape_path(conn, :delete, scrape)
    assert redirected_to(conn) == scrape_path(conn, :index)
    refute Repo.get(Scrape, scrape.id)
  end
end
