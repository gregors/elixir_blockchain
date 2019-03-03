defmodule ElixirBlockchainBlockTest do
  use ExUnit.Case
  alias ElixirBlockchain.Bitcoin, as: Bitcoin
  doctest ElixirBlockchain.Bitcoin

  test "default values" do
    assert %Bitcoin{}.bits == ''
    assert %Bitcoin{}.version == 0
    assert %Bitcoin{}.merkel_root == ''
    assert %Bitcoin{}.timestamp == ''
    assert %Bitcoin{}.nonce == ''
    assert %Bitcoin{}.previous_block == ''
  end

  test "genesis block" do
    block = Bitcoin.genesis_block
    assert block.version == 1
    assert block.previous_block == "0000000000000000000000000000000000000000000000000000000000000000"
    assert block.merkel_root == "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b"
    assert block.timestamp == 1231006505
    assert block.nonce == 2083236893
    assert block.bits == 486604799
  end

  test "get_hash" do
    block = Bitcoin.genesis_block
    assert Bitcoin.get_hash(block) == "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f"
  end
end
