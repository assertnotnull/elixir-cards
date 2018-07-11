defmodule Cards do
  @moduledoc """
    Provides methos for creating and handling a deck of cards
  """

  @doc """
    Returns a list of string representing a deck of playing cards.
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `handSize` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.createDeck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Error reading file"
    end
  end

  def createHand(handSize) do
    Cards.createDeck
    |> Cards.shuffle
    |> Cards.deal(handSize)
  end
end
