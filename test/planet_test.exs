defmodule Roum.PlanetTest do
  use ExUnit.Case, async: true

  alias Roum.Planet
  alias Roum.Land

  test "returns default size" do
    planet = %Planet{id: 1}
    assert Planet.size(planet) == 2
  end

  test "returns rows" do
    planet = %Planet{id: 1}
    rows   = Planet.rows(planet)

    assert rows == [
      [%Land{}, %Land{}],
      [%Land{}, %Land{}]
    ]
  end

  test "terrain stream" do
    planet  = %Planet{id: 1}
    terrain = Planet.terrain planet

    assert terrain == [:ice, :water, :mountain, :water]
  end

  test "terrain stream is different for different planets" do
    planet = %Planet{id: 2}
    terrain = Planet.terrain planet

    assert terrain == [:ice, :water, :water, :mountain]
  end
end
