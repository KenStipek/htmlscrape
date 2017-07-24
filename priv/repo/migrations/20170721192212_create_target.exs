defmodule Htmlscrape.Repo.Migrations.CreateTarget do
  use Ecto.Migration

  def change do
    create table(:targets) do
      add :name,      :string
      add :url,       :string
      add :selector,  :string

      timestamps()
    end

  end
end
