defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    cond do
      input == "" -> "Fine. Be that way!"
      end_with_?(input) -> interrogation_scenario(input)
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp interrogation_scenario(input) do
    cond do
      shouting?(input) -> "Calm down, I know what I'm doing!"
      true -> "Sure."
    end
  end

  defp end_with_?(input) do
    input
    |> String.ends_with?("?")
  end

  defp shouting?(input) do
    contains_letters(input) &&
    String.upcase(String.slice(input, 1..-1)) == String.slice(input, 1..-1)
  end

  defp contains_letters(input) do
    String.upcase(input) != String.downcase(input)
  end
end
