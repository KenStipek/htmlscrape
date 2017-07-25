defmodule Htmlscrape.Scrape do
  use Htmlscrape.Web, :model

  alias Htmlscrape.Target

  schema "scrapes" do
    belongs_to :target, Target
    field      :result, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:result, :target_id])
    |> validate_required([])
  end
end
