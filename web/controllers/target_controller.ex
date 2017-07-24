defmodule Htmlscrape.TargetController do
  use Htmlscrape.Web, :controller

  alias Htmlscrape.Target

  def index(conn, _params) do
    targets = Repo.all(Target)
    render(conn, "index.html", targets: targets)
  end

  def new(conn, _params) do
    changeset = Target.changeset(%Target{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"target" => target_params}) do
    changeset = Target.changeset(%Target{}, target_params)

    case Repo.insert(changeset) do
      {:ok, _target} ->
        conn
        |> put_flash(:info, "Target created successfully.")
        |> redirect(to: target_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    target = Repo.get!(Target, id)
    render(conn, "show.html", target: target)
  end

  def edit(conn, %{"id" => id}) do
    target = Repo.get!(Target, id)
    changeset = Target.changeset(target)
    render(conn, "edit.html", target: target, changeset: changeset)
  end

  def update(conn, %{"id" => id, "target" => target_params}) do
    target = Repo.get!(Target, id)
    changeset = Target.changeset(target, target_params)

    case Repo.update(changeset) do
      {:ok, target} ->
        conn
        |> put_flash(:info, "Target updated successfully.")
        |> redirect(to: target_path(conn, :show, target))
      {:error, changeset} ->
        render(conn, "edit.html", target: target, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    target = Repo.get!(Target, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(target)

    conn
    |> put_flash(:info, "Target deleted successfully.")
    |> redirect(to: target_path(conn, :index))
  end
end
