# variation on https://github.com/drueck/exercism-assignments/blob/master/elixir/bob/bob.exs
defmodule Teenager do

  @doc """
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    iex> Teenager.hey("")
    "Fine. Be that way."

    iex> Teenager.hey("Do you like chocolate?")
    "Sure."

    iex> Teenager.hey("LEAVE ME ALONE!")
    "Woah, chill out!"

    iex> Teenager.hey("It's sunny outside")
    "Whatever."

  """
  def hey(""), do: "Fine. Be that way."
  def hey(message) do
    cond do
      shouting?(message) -> "Woah, chill out!"
      asking?(message) -> "Sure."
      true -> "Whatever."
    end
  end

  defp shouting?(message) do
    message == String.upcase(message)
  end

  defp asking?(message) do
    String.ends_with?(message, "?")
  end
end
