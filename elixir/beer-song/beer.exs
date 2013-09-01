defmodule Beer do

  @doc """
  Sing the beer song!

  iex> Beer.sing(3)
  "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n\n2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n\n"
  """

  def sing(start, finish // 0) do
    Enum.map_join(start..finish, "\n", verse(&1)) <> "\n"
  end

  def verse(how_many) do
    """
    #{ bottle(how_many) |> String.capitalize } of beer on the wall, #{ bottle(how_many) } of beer.
    #{ last_verse(how_many) }
    """
  end

  defp last_verse(0) do
    "Go to the store and buy some more, 99 bottles of beer on the wall."
  end
  defp last_verse(1) do
    "Take it down and pass it around, no more bottles of beer on the wall."
  end
  defp last_verse(how_many) do
    "Take one down and pass it around, #{bottle(how_many - 1)} of beer on the wall."
  end

  defp bottle(0), do: "no more bottles"
  defp bottle(1), do: "1 bottle"
  defp bottle(number), do: "#{number} bottles"

end
