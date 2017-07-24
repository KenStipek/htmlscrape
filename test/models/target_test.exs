defmodule Htmlscrape.TargetTest do
  use Htmlscrape.ModelCase

  alias Htmlscrape.Target

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Target.changeset(%Target{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Target.changeset(%Target{}, @invalid_attrs)
    refute changeset.valid?
  end
end
