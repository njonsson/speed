defmodule Speed.Deck do
  @moduledoc """
  Provides functions for working with a deck of playing cards.
  """

  @typedoc "A list of binaries representing playing cards."
  @type t :: [card]

  @typedoc "A binary representing a playing card."
  @type card :: binary

  @typedoc "The successful result of dealing to a player"
  @type dealt :: {list(card), list(card), card}

  @suits ~w( ♠ ♣ ♥ ♦ )
  @numbers ~w( A 2 3 4 5 6 7 8 9 10 J Q K )

  @doc """
  Deals the specified `deck` to two players, returning those players’ hands, draw
  piles and face-down cards, plus the remaining deck.

  ## Examples

      iex> ["A♠", "2♠", "3♠"] |> Speed.Deck.deal
      {:error, "Not enough cards in the deck"}

      iex> shuffled_deck = Speed.Deck.new |> Speed.Deck.shuffle
      ...> {{[_, _, _, _, _], [_, _, _, _, _, _, _, _, _, _, _, _, _, _, _], _}, {[_, _, _, _, _], [_, _, _, _, _, _, _, _, _, _, _, _, _, _, _], _}, remaining_deck} = shuffled_deck |> Speed.Deck.deal
      ...> remaining_deck |> length
      10
  """
  @spec deal(t) :: {{dealt, dealt}, t} | Speed.error
  def deal(deck) do
    if length(deck) < 40 do
      {:error, "Not enough cards in the deck"}
    else
      hands_cards = deck |> Enum.take(10)
      hand1 = hands_cards |> Enum.take_every(2)
      hand2 = hands_cards |> Enum.drop(1) |> Enum.take_every(2)

      draw_piles_cards = deck |> Enum.drop(10) |> Enum.take(30)
      draw_pile1 = draw_piles_cards |> Enum.take_every(2)
      draw_pile2 = draw_piles_cards |> Enum.drop(1) |> Enum.take_every(2)

      face_down_cards = deck |> Enum.drop(40) |> Enum.take(2)
      face_down_card1 = face_down_cards |> Enum.at(0)
      face_down_card2 = face_down_cards |> Enum.at(1)

      remaining_deck = deck |> Enum.drop(42)

      {{hand1, draw_pile1, face_down_card1},
       {hand2, draw_pile2, face_down_card2},
       remaining_deck}
    end
  end

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
