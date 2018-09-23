# start

github.com/stephengrider/elixircode

## section 1

install instructions

## 1.4+ Generating a project

Mix - creates and compiles projects, runs tasks, manages deps.

$ mix new cards

* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/cards.ex
* creating test
* creating test/test_helper.exs
* creating test/cards_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd cards
    mix test


looking at lib/cards.ex

```
defmodule Cards do
  def Hello do
    "Hello World"
  end
end
```
almost everything in elixir is organised into modules (a collection of methods or functions).

def defines a function.

```$ iex -S mix ``` //interactive elixir
 
```iex> Cards.hello``` // "hello world".

added Card.create_deck, but got [UNdefinedFunctionError] as need to call
```iex> recompile``` first.


## 1.7+ Functional v OO

```
  def create_deck do
    ["Ace","Two","Three", "Four", "Five"] ## convention is for double quotes
  end

  def shuffle(deck) do
    Enum.shuffle(deck) ## Enum is in esl (elixir standard library), so does not need an import.
  end

  ## contains? // convention puts a question mark on functions that returns t/f
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
```

note no assignment to anything, eg: var array = 

in oo, might have an instance of a Deck class whose deck.shuffle() function operated on instance values, such as this.Card

in any functional language this is not the case. Central is the Cards Module (stand alone object) with no instance variables. A module cannot be instantiated; it is a collection of methods and nothing more.

Cards Module contains: create_deck, shuffle, save, load

create_deck -> <[string]>

<[string]> -> shuffle -> <[string]>

<[string]> -> save -> <[string]> (path to saved file)

(path to saved file)<[string]> -> load -> <[string]>

cards.create_deck would return our array (with any internal storage).
cards.shuffle would have an array in and return a new array.
cards.save would take an array in and output the path to the saved file. etc.

### method args
term: arity is the number of args a method accepts.
elixir allows overloads, described by arity eg: Cards.shuffle/1 takes one arg.

Elixir Standard Library (esl) - https://hexdocs.pm/elixir/Kernel.html


```
iex> deck = Cards.create deck
iex> Cards.shuffle(deck)
iex> deck 
``` 

deck is immutable, so unaffected by shuffle.

## 1.12+ Comprehensions over lists

Trying to get "Ace of Spades" etc..
tempting to nest two comprehensions. This is the WRONG WAY.

```
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end    
    end
  end
```

returns (yields?) multiple arrays. Not what we want.
```
iex> Cards.create_deck
[
  ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds"],
  ["Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds"],
  ["Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds"],
  ["Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds"],
  ["Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]
]
```
we can use List.flatten(cardCollection) here to create a single list
```
cardCollection = for value <- values do
    for suit <- suits do
      "#{value} of #{suit}"
    end    
end

List.flatten(cardCollection)
```
but the correct way to do this is to double up the comprehension
```
for suit <- suits, value <- values do
  "#{value} of #{suit}"
end
```    

## 1.15 The importance of index with tuples

Cards.deal/2 returns a tuple, eg: {[1,2,3], [4,5]} - where first item in Tuple (index 0) is our hand and index 1 is the "remainder".

How do we get just the first bit? tempting to try ```Cards.deal(deck, 3)[0]``` but this will not work. Instead it's all about Pattern Matching.


## 1.16 Pattern Matching

..is elixirs replacement for variable assignment.

```
iex> { hand, rest_of_deck } = Cards.deal(deck, 5)
iex> hand ## shows hand
iex> rest_of_deck ## show rest

```

Because the tuple of the left hand side matches the result from the right hand side exactly, they get mapped.

Any time we see = we are pattern matching.

```iex> colour1 = ["red"] ## lhs matches entire list (of one) ```

```
iex> [colour1] = ["red"] ##lhs matches the string
iex> colour1
"red"
```


code we write (fed into)-> Elixir (transpiled)-> Erlang (compiled and executes)-> BEAM





