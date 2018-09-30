defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    :world
  end

  def hi do
    "hi there"
  end

  def create_deck do
    ## convention is for double quotes
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    ## a list comprehension (a comprehension is a mapping function)
    ## eg: for every element in suits, do

    ## for value <- values do
    ##   for suit <- suits do
    ##     "#{value} of #{suit}"
    ##   end
    ## end
    ## outer comprehension into inner comprehension returns a list of lists.

    ## correct method. Does the order make a difference?
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck) ## Enum is in esl, so does not need an import.
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  ## split deck into new deck minus hand_size
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist."
    end
  end

end
