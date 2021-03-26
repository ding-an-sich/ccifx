# Ccifx

A Caesar's Cipher implementation and repository.

## Using the cipher

To encrypt messages, call Ccfix.crypt passing a phrase, a key and a cryptographic mode.

```elixir
iex> Ccfix.crypt("MY SHARONA", 3, :left)
=> :ok
```
To decrypt the last message using the repository, call Ccfix.decrypt passing a cyptographic mode.

```elixir
iex> Ccfix.decrypt(:left)
=> "MY SHARONA"
```

## The repository

The repository holds the last call to each cryptographic mode. It stores the encrypted text and the key.

```elixir
iex> Ccfix.crypt("MY SHARONA", 3, :right)
=> :ok
iex> Ccifx.Repository.retrieve(:right)
=> {3, "PB VKDURQD"}
```

## TO-DO
- Specs
- Documentation
- Tests
- Let users decrypt any message
- Implement :zigzag
