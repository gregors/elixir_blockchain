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
    block = ElixirBlockchain.Bitcoin.genesis_block
    assert block.version == 1
    assert block.previous_block == "0000000000000000000000000000000000000000000000000000000000000000"
    assert block.merkel_root == "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b"
  end
end
