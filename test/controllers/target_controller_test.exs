defmodule Htmlscrape.TargetControllerTest do
  use Htmlscrape.ConnCase

  alias Htmlscrape.Target
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, target_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing targets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, target_path(conn, :new)
    assert html_response(conn, 200) =~ "New target"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, target_path(conn, :create), target: @valid_attrs
    assert redirected_to(conn) == target_path(conn, :index)
    assert Repo.get_by(Target, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, target_path(conn, :create), target: @invalid_attrs
    assert html_response(conn, 200) =~ "New target"
  end

  test "shows chosen resource", %{conn: conn} do
    target = Repo.insert! %Target{}
    conn = get conn, target_path(conn, :show, target)
    assert html_response(conn, 200) =~ "Show target"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, target_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    target = Repo.insert! %Target{}
    conn = get conn, target_path(conn, :edit, target)
    assert html_response(conn, 200) =~ "Edit target"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    target = Repo.insert! %Target{}
    conn = put conn, target_path(conn, :update, target), target: @valid_attrs
    assert redirected_to(conn) == target_path(conn, :show, target)
    assert Repo.get_by(Target, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    target = Repo.insert! %Target{}
    conn = put conn, target_path(conn, :update, target), target: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit target"
  end

  test "deletes chosen resource", %{conn: conn} do
    target = Repo.insert! %Target{}
    conn = delete conn, target_path(conn, :delete, target)
    assert redirected_to(conn) == target_path(conn, :index)
    refute Repo.get(Target, target.id)
  end
end
