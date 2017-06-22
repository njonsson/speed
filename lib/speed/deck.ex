defmodule Speed.Deck do
  @moduledoc """
  A deck of cards used for playing Speed.
  """

  @suits ~w( ♠ ♣ ♥ ♦ )
  @values ~w( A 2 3 4 5 6 7 8 9 10 J Q K )

  @doc """
  Builds a new deck of cards with no jokers.

  ## Example

     iex> Speed.Deck.new
     ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "J♠", "Q♠", "K♠", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "J♣", "Q♣", "K♣", "A♥", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "K♥", "A♦", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "J♦", "Q♦", "K♦"]
  """
  def new do
    for suit <- @suits, value <- @values do
      "#{value}#{suit}"
    end
  end

  @doc """
  Shuffles the specified `deck`.

  ## Examples

      iex> deck = Speed.Deck.new
      ...> shuffled_deck = Speed.Deck.shuffle(deck)
      ...> length(shuffled_deck) == length(deck)
      true

      iex> deck = Speed.Deck.new
      ...> shuffled1 = Speed.Deck.shuffle(deck)
      ...> shuffled2 = Speed.Deck.shuffle(deck)
      ...> shuffled1 == shuffled2
      false
  """
  def shuffle(deck) do
    Enum.shuffle deck
  end
end
