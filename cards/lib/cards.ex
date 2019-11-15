defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for  suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

    # List.flatten(cards)

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist."

    # end

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      # _ In front of variable names lets elixir know to ignore the variable
      {:error, _reason} -> "That file does not exist."

    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    # Pipe operator (Uses | and >)
    |>Cards.shuffle
    #Elixer will automaticaly return the value as the first argument with Pipe operators
    #Pipe operators are expecting you to write methods with consistent first arguments
    |>Cards.deal(hand_size)
  end

end
