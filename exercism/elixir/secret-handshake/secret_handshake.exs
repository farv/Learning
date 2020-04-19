defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.digits(code, 2)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce([], &commands_translator/2)
    |> Enum.reverse
  end

  defp commands_translator({value,index}, acc) do
    cond do 
      value == 1 -> 
        case index do
          0 -> ["wink" | acc]
          1 -> ["double blink" | acc]
          2 -> ["close your eyes" | acc]
          3 -> ["jump" | acc]
          4 -> Enum.reverse(acc)
          _ -> acc
        end
      true -> acc
    end
  end 
end
