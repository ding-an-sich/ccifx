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
## TO-DO
- Specs
- Documentation
- Tests
- Let users decrypt any message
- Implement :zigzag
