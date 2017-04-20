defmodule Etherex.Crypto do

  def private_key_to_address(<< private_key :: binary-size(32) >>) do
    private_key
    |> private_key_to_public_key()
    |> public_key_to_address()
  end

  def private_key_to_public_key(<< private_key :: binary-size(32) >>) do
    {public_key, ^private_key} = :crypto.generate_key(:ecdh, :secp256k1, private_key)
    public_key
  end

  def public_key_to_address(<< 4 :: size(8), key :: binary-size(64) >>) do
    << _ :: binary-size(12), address :: binary-size(20) >> = keccak256(key)
    address
  end

  def keccak224(data), do: :keccakf1600.hash(:sha3_224, data)

  def keccak256(data), do: :keccakf1600.hash(:sha3_256, data)
  
  def keccak384(data), do: :keccakf1600.hash(:sha3_384, data)
 
  def keccak512(data), do: :keccakf1600.hash(:sha3_512, data)
end
