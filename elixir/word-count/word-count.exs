defmodule Words do

  @doc """
    Takes a string and returns a HashDict with the number of occurences for each word.

    iex> Words.count("some string")
    HashDict.new [{ "some", 1 }, { "string", 1 }]
  """
  def count(text) do
    acc = HashDict.new
    String.downcase(text)
    |> String.split
    |> do_count(acc)
  end

  defp do_count([], acc), do: acc
  defp do_count([head | tail], acc) do
    entry = add_or_edit_entry(head, acc)
    do_count(tail, entry)
  end

  defp add_or_edit_entry(word, acc) do
    Regex.replace(%r/\W/, word, "") |> do_add_or_edit_entry(acc)
  end

  defp do_add_or_edit_entry("", acc), do: acc
  defp do_add_or_edit_entry(word, acc) do
    HashDict.update(acc, word, 1, &1 + 1)
  end

end
