defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | rest]), do: 1 + count(rest)

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse([x]), do: [x]
  def reverse([x|rest]), do: reverse(rest,[x])
  defp reverse([],y), do: y
  defp reverse([x|rest],y), do: reverse(rest,[x|y])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([x|rest], f), do: [f.(x) | map(rest, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([x|rest], f) do 
    if f.(x) do
      [x | filter(rest, f)]
    else
      filter(rest, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([x|rest], acc, f), do: reduce(rest, f.(x,acc), f)

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], b), do: b
  def append(a, []), do: a
  def append(x, y), do: concat([x,y])

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([x|rest]) do
    case x do
      [] -> concat(rest)
      [x] -> [x|concat(rest)]
      [x|rest2] -> [x|concat([rest2|rest])]
    end
  end
end
