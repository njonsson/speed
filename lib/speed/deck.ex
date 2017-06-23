defmodule Speed.Deck do
  @moduledoc """
  Provides functions for working with a deck of playing cards.
  """

  @typedoc "A list of binaries representing playing cards."
  @type t :: [binary]

  @suits ~w( ♠ ♣ ♥ ♦ )
  @numbers ~w( A 2 3 4 5 6 7 8 9 10 J Q K )

  @doc """
  Constructs a deck using the specified `options`.

  ## Example

      iex> Speed.Deck.new
      ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "J♠", "Q♠", "K♠", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "J♣", "Q♣", "K♣", "A♥", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "K♥", "A♦", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "J♦", "Q♦", "K♦"]

      iex> Speed.Deck.new jokers: true
      ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "J♠", "Q♠", "K♠", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "J♣", "Q♣", "K♣", "A♥", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "K♥", "A♦", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "J♦", "Q♦", "K♦", "🃏", "🃏"]

      iex> Speed.Deck.new jokers: false
      ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "J♠", "Q♠", "K♠", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "J♣", "Q♣", "K♣", "A♥", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "K♥", "A♦", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "J♦", "Q♦", "K♦"]
  """
  @spec new(keyword(jokers: boolean)) :: t
  def new(options \\ [])

  def new(jokers: true), do: new() ++ ~w( 🃏 🃏 )

  def new(_options) do
    for suit <- @suits, number <- @numbers, do: "#{number}#{suit}"
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
  @spec shuffle(t) :: t
  defdelegate shuffle(deck), to: Enum
end
