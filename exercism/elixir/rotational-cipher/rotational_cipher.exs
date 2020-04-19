defmodule RotationalCipher do
  
  @upper ?A..?Z
  @lower ?a..?z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(&(rotate_letter(&1, shift)))
    |> to_string
  end

  defp rotate_letter(char, shift) do
    cond do
      char in @lower -> rotate_lower(char, shift)
      char in @upper -> rotate_upper(char, shift)
      true -> char
    end
  end

  defp rotate_upper(char, shift) do
    rotate_defining_delimiters(char, shift, ?A, ?Z)
  end

  defp rotate_lower(char, shift) do
    rotate_defining_delimiters(char, shift, ?a, ?z)
  end

  defp rotate_defining_delimiters(char, shift, start, finish) do
    alphabet_length = finish + 1 - start
    start + rem(char - start + shift, alphabet_length)
  end
end
