defmodule Anagram do

  @doc """
  Tests a word agains a list to find all anagrams inside that list

  iex> Anagram.match "listen", %w(enlists google inlets banana)
  ["inlets"]
  """

  def match(word, list) do
    Enum.filter list, fn(potential_anagram) ->
      match_word(word, potential_anagram)
    end
  end

  def match_word(word, potential_anagram) do
    do_match_word(String.downcase(word), String.downcase(potential_anagram))
  end

  defp do_match_word(word, word), do: false
  defp do_match_word(word, potential_anagram) do
    sort_word(word) == sort_word(potential_anagram)
  end

  defp sort_word(word) do
    String.codepoints(word) |> Enum.sort
  end

end
