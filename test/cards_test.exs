defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "createDeck makes 20 cards" do
    deckLength = length(Cards.createDeck)
    assert deckLength == 20
  end

  test "shuffling a deck reandomizes it" do
    deck = Cards.createDeck
    refute deck == Cards.shuffle(deck)
  end
end
