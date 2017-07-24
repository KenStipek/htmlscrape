defmodule Htmlscrape.Target do
  use Htmlscrape.Web, :model
  
  alias Htmlscrape.Repo

  schema "targets" do
    has_many :scrapes,  Htmlscrape.Scrape
    field    :name,     :string
    field    :url,      :string
    field    :selector, :string
    timestamps()
  end
    
  def scrape_data() do
    HTTPotion.start
    for target <- Repo.all(Htmlscrape.Target) do
      response = HTTPotion.get(
        target.url, [
          headers: ["User-Agent": "Htmlscrape"], 
          follow_redirects: true
        ]
      )
      Floki.find(response.body, target.selector)
      |> Floki.text
      |> String.split("%")
      |> hd
    end
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :selector])
    |> validate_required([:name, :url, :selector])
  end
end
