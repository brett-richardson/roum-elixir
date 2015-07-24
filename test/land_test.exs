defmodule Roum.LandTest do
  use ExUnit.Case, async: true

  alias Roum.Land

  test "has a terrain property" do
    land = %Land{}
    assert land.terrain == :grass
  end
end
