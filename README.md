# EmailGuard [![hex.pm](https://img.shields.io/hexpm/v/email_guard.svg?style=flat-square)](https://hex.pm/packages/email_guard) [![hexdocs.pm](https://img.shields.io/badge/docs-latest-green.svg?style=flat-square)](https://hexdocs.pm/email_guard)

Elixir library for detecting disposable (burner) or personal email addresses.

Comes with two lists:

* `DisposableList` based on [mailchecker's list](https://raw.githubusercontent.com/FGRibreau/mailchecker/master/list.txt) containing **33,606 domains**;
* `FreeList` mostly [based on this](https://gist.github.com/ammarshah/f5c2624d767f91a7cbdc4e54db8dd0bf) minus the domains already listed in `DisposableList`, total **5009 domains**.

## Installation

Add to your `mix.exs`:

```elixir
def deps do
  [
    {:email_guard, "~> 1.0"}
  ]
end
```

If you're not using [application inference](https://elixir-lang.org/blog/2017/01/05/elixir-v1-4-0-released/#application-inference), then add `:email_guard` to your `applications` list.

## Usage

Checks if given email or domain is present in email lists:

```elixir
iex> EmailGuard.check("svilen@gmail.com")
:ok

iex> EmailGuard.check("gmail.com")
:ok
```

By default it will check against `EmailGuard.DisposableList`:

```elixir
iex> EmailGuard.check("svilen@mailinator.com")
{:error, EmailGuard.DisposableList}
```

You can specify the email list modules, e.g. including the provided one
for free email service providers:

```elixir
iex> lists = [EmailGuard.DisposableList, EmailGuard.FreeList]
[EmailGuard.DisposableList, EmailGuard.FreeList]

iex> EmailGuard.check("svilen@gmail.com", lists)
{:error, EmailGuard.FreeList}
```

To provide your own custom list see the `EmailGuard.List` behaviour.

Note that `EmailGuard` expects a valid email address or domain as input.

## Benchmark

```sh
MIX_ENV=bench mix run bench/check_bench.exs
```


## License

See LICENSE file.
