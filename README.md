# Elixir Blockchain

Toy project so I can reimplement some well-known blockchain algorithms
and create a simple blockchain from scratch

* bitcoin's [hashcash](https://en.bitcoin.it/wiki/Hashcash) algorithm

## Installation

**locally**
 * mix deps.get
 * mix
 * mix test

**docker**

 `docker build -t elixir_blockchain .`

 To run tests
 `docker run -t --rm elixir_blockchain`

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_blockchain` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_blockchain, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_blockchain](https://hexdocs.pm/elixir_blockchain).

