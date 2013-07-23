defmodule Anagram do

  def match(word, list) do
    do_match(word, list, [])
  end

  defp do_match(word, [], acc), do: Enum.reverse(acc)
  defp do_match(word, [head|tail], acc) do
    cond do
      compare_words(word, head) -> do_match(word, tail, [head|acc])
      true -> do_match(word, tail, acc)
    end
  end

  defp compare_words(word1, word2) do
    sort_word(word1) == sort_word(word2)
  end

  defp sort_word(word) do
    String.codepoints(word) |> Enum.sort
  end

end
