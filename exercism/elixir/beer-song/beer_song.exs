defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    first_verse(number) <> second_verse(number-1)
  end

  defp first_verse(0), do: "No more bottles of beer on the wall, no more bottles of beer.\n"
  defp first_verse(number), do: "#{number} bottle#{plural(number)} of beer on the wall, #{number} bottle#{plural(number)} of beer.\n"

  defp second_verse(-1), do: "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  defp second_verse(0), do: "Take it down and pass it around, no more bottles of beer on the wall.\n"
  defp second_verse(number), do: "Take one down and pass it around, #{number} bottle#{plural(number)} of beer on the wall.\n"

  defp plural(1), do: ""
  defp plural(_), do: "s"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map(range, fn x -> verse(x) end)
    |> Enum.join("\n")
  end
end
