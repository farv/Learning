defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> clean_input
    |> split_into_words
    |> count_words
  end

  defp clean_input(input) do
    String.downcase(input)
  end

  defp split_into_words(input) do
    String.split(input, ~r{[^[:alnum:]\-]}u, trim: true)
  end

  defp count_words(input) do
    input
    |> Enum.reduce(%{}, &count_words_reducer/2)
  end

  defp count_words_reducer(word, result) do
    result
    |> Map.update(word, 1, &(&1 + 1))
  end
end
