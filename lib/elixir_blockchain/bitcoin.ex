defmodule ElixirBlockchain.Bitcoin do
  # https://en.bitcoin.it/wiki/Block_hashing_algorithm

  defstruct version: 0, previous_block: '', merkel_root: '', timestamp: '', bits: '', nonce: ''

  def get_block(num) do
    blockchain_api(num)
    |> format_block
  end

  def genesis_block do
    %ElixirBlockchain.Bitcoin{ }
    |> Map.put(:version, 1)
    |> Map.put(:previous_block, "0000000000000000000000000000000000000000000000000000000000000000")
    |> Map.put(:merkel_root, "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b")
    |> Map.put(:nonce, 2083236893)
    |> Map.put(:timestamp, 1231006505)
    |> Map.put(:bits, 486604799)
  end

  def blockchain_api(num) do
    url = "https://blockchain.info/block-height/#{num}?format=json"
    response = HTTPoison.get!(url)
    req = Poison.decode!(response.body)
    req["blocks"]
    |> List.first
  end

  def format_block(data) do
    %ElixirBlockchain.Bitcoin{ }
    |> Map.put(:version, data["ver"])
    |> Map.put(:previous_block, data["prev_block"])
    |> Map.put(:merkel_root, data["mrkl_root"])
    |> Map.put(:nonce, data["nonce"])
    |> Map.put(:timestamp, data["time"])
    |> Map.put(:bits, data["bits"])
  end

  def swap(s) do
    s
    |> String.to_charlist
    |> Enum.chunk_every(2)
    |> Enum.reverse
    |> Enum.join
  end

  def to_hex(n) do
    Integer.to_string(n, 16) |> String.pad_leading(8, "0")
  end

  def pad_zero(s) do
    String.pad_leading(s, 32, "0")
  end

  def to_binary(s) do
    s |> String.to_integer(16) |> :binary.encode_unsigned
  end

  def sha256_digest(s) do
    s = to_binary(s)
    :crypto.hash(:sha256, s) |> Base.encode16(case: :lower)
  end

  def get_hash(h) do
    version = h.version |> to_hex |> swap
    previous_block = h.previous_block |> swap
    mrkl_root = h.merkel_root |> swap
    timestamp = h.timestamp |> to_hex |> swap
    bits = h.bits |> to_hex |> swap
    nonce = h.nonce |> to_hex |> swap

    header = version <> previous_block <> mrkl_root <> timestamp <> bits <> nonce
    IO.puts header
    IO.puts "0100000081cd02ab7e569e8bcd9317e2fe99f2de44d49ab2b8851ba4a308000000000000e320b6c2fffc8d750423db8b1eb942ae710e951ed797f7affc8892b0f1fc122bc7f5d74df2b9441a42a14695"
    header |> sha256_digest |> sha256_digest |> swap
  end
end
