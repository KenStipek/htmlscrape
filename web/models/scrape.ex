defmodule Htmlscrape.Scrape do
  use Htmlscrape.Web, :model

  schema "scrapes" do
    # belongs_to :target, Htmlscrape.Target
    has_many :scrapes, Htmlscrape.Target
    field    :result,  :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
