defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &change_base/1)
  end

  @spec to_rna([char]) :: [char]
  defp change_base(?C), do: ?G

  @spec to_rna([char]) :: [char]
  defp change_base(?G), do: ?C

  @spec to_rna([char]) :: [char]
  defp change_base(?A), do: ?U

  @spec to_rna([char]) :: [char]
  defp change_base(?T), do: ?A
  
end
