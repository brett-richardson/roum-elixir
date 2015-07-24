defmodule Roum.Planet do
  alias Roum.Land
  defstruct id: nil

  def size(_) do
    2
  end

  def rows(planet) do
    for x <- 1..size(planet) do
      for y <- 1..size(planet) do
        %Land{}
      end
    end
  end

  def terrain(planet) do
    amount = size planet

    planet
      |> random_stream
      |> Enum.take(amount * amount)
      |> Enum.map &float_to_terrain/1
  end

  def float_to_terrain(rand) do
    case Float.floor(rand * 100) do
      r when r in  0..10 -> :grass
      r when r in 11..20 -> :ice
      r when r in 21..30 -> :forrest
      r when r in 31..40 -> :desert
      r when r in 41..50 -> :volcanic
      r when r in 51..60 -> :mountain
      _ -> :water
    end
  end

  defp key(planet) do
    ~s(planet/#{planet.id})
      |> String.to_char_list
      |> Enum.reduce(0, fn (i, mem) -> i + mem end)
  end

  defp seed(planet) do
    { key(planet), 0, 0 }
  end

  defp random_stream(planet) do
    start  = fn     -> :random.seed seed(planet) end
    close  = fn (_) -> end

    take = fn (resource) ->
      case resource do
        _ -> { [:random.uniform], resource }
      end
    end

    Stream.resource(start, take, close)
  end
end
