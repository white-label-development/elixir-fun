# CH3

## Immutability.

Immutable data is known data.
Variables stay the same until rebound.

# CH4

## Elixir Basics

### Built-in Types

#### Value Types:

integers, floating-point numbers,

atoms (constants that represent something's name. An atoms name is it's value.) eg: :neil@treven? :<> :== :"func/3" : "foo bar"

ranges (start...end for integers) 

regular expressions  ~r{regexp} or ~r{regexp}opts.

where opts is a set of single character options. eg: f (force match on firstline)
Elixir regex support is the same as perl (PCRE)

```
iex(32)> Regex.replace ~r{[aeiou]}, "caterpillar", "*"
"c*t*rp*ll*r"
```


#### System Types: (reflect resources in underlying Erlang VM)

PIDs (reference to a local or remote process. get PID of current process via ```self```)


ports (a reference to a resource)

References (the function make_ref creates a globally unique reference. Rarely used. Ignore for now.)

#### Colletion Types:

tuples (an ordered collection of values)
{ :ok, 42, "life"}


lists (more a linked data structure than an array)
```
iex()> [1,2] ++ [3,4] #concatenation = [1,2,3,4]
iex()> [1,2,3,4] -- [2,4] #difference = [1,3]
iex()> 1 in [1,2,3,4] #membership = true
```

Keyword Lists, Shortcuts

```[fn: "neil", sn: "t"]``` gets converted to list of tuples ``` [{:fn, "neil}, {:sn, "t}]```

We can skip the square brackets if a keyword list is the last argument (or only) to a function

```DB.save record, [{:foo, true},{:logging, "HIGH"}]``` 

can be rewritten as

```DB.save record, foo: true, logging: "HIGH"```

We can also drop the bracket if a keyword list is the last/only item where a list of values is expected

```
iex(37)> [1, fred: 1, bob: 2]
[1, {:fred, 1}, {:bob, 2}]
iex(38)> {1, fred: 1, bob: 2}
{1, [fred: 1, bob: 2]}
```

@29

maps



binaries




