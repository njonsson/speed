# Speed

[Speed][Speed-Wikipedia] is a card game for one player to play against the
computer.

## TODO

- [x] Start a new game
- [x] Define the deck: standard 52-card deck (no jokers)
- [x] Shuffle the deck
- [ ] Deal four piles of cards, face-down: 5, then 1, then 1, then 5
- [ ] Deal two hands, face-down, of 20 cards each (alternating between players)
- [ ] Each player takes the top 5 cards from his hand and looks at them (in secret)
- [ ] “Someone” flips the two middle cards face-up

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `speed` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:speed, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/speed](https://hexdocs.pm/speed).

[Speed-Wikipedia]: https://en.wikipedia.org/wiki/Speed_%28card_game%29 "“Speed (card game) at Wikipedia”"
