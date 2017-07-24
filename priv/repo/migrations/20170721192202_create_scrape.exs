defmodule Htmlscrape.Repo.Migrations.CreateScrape do
  use Ecto.Migration

  def change do
    create table(:scrapes) do
      add :target_id, :integer
      add :result, :string
      
      timestamps()
    end

  end
end
