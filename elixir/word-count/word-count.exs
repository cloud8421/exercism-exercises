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

  defp increment_count(nil), do: 1
  defp increment_count(integer), do: integer + 1

  defp add_or_edit_entry(word, acc) do
    Regex.replace(%r/\W/, word, "") |> do_add_or_edit_entry(acc)
  end

  defp do_add_or_edit_entry("", acc), do: acc
  defp do_add_or_edit_entry(word, acc) do
    current_count = HashDict.get(acc, word) |> increment_count
    HashDict.put(acc, word, current_count)
  end


end
