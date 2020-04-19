defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([], _), do: []
  def keep([x|rest], f) do 
    if f.(x) do
      [x | keep(rest, f)]
    else
      keep(rest, f)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([], _), do: []
  def discard([x|rest], f) do 
    unless f.(x) do
      [x | discard(rest, f)]
    else
      discard(rest, f)
    end
  end
end
