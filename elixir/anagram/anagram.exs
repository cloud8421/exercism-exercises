defmodule Anagram do

  @doc """
  Tests a word agains a list to find all anagrams inside that list

  iex> Anagram.match "listen", %w(enlists google inlets banana)
  ["inlets"]
  """

  def match(word, list) do
    Enum.filter list, fn(potential_anagram) ->
      sort_word(word) == sort_word(potential_anagram)
    end
  end

  defp sort_word(word) do
    String.codepoints(word) |> Enum.sort
  end

end
