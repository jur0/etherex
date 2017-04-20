defmodule Etherex.CryptoTest do
  use ExUnit.Case, async: true

  import Etherex.Crypto
  import Base, only: [encode16: 1, decode16!: 1]

  @private_key "1111111111111111111111111111111111111111111111111111111111111111"

  @public_key "044F355BDCB7CC0AF728EF3CCEB9615D90684BB5B2CA5F859AB0F0B704075871AA385B6B1B8EAD809CA67454D9683FCF2BA03456D6FE2C4ABE2B07F0FBDBB2F1C1"

  @address "19E7E376E7C213B7E7E7E46CC70A5DD086DAFF2A"

  @data <<>>

  @keccak224_result "F71837502BA8E10837BDD8D365ADB85591895602FC552B48B7390ABD"

  @keccak256_result "C5D2460186F7233C927E7DB2DCC703C0E500B653CA82273B7BFAD8045D85A470"

  @keccak384_result "2C23146A63A29ACF99E73B88F8C24EAA7DC60AA771780CCC006AFBFA8FE2479B2DD2B21362337441AC12B515911957FF"

  @keccak512_result "0EAB42DE4C3CEB9235FC91ACFFE746B29C29A8C366B7C60E4E67C466F36A4304C00FA9CAF9D87976BA469BCBE06713B435F091EF2769FB160CDAB33D3670680E"

  test "converts private key to address" do
    private_key = @private_key |> decode16!
    assert private_key_to_address(private_key) |> encode16  == @address
  end

  test "converts private key to public key" do
    private_key = @private_key |> decode16!
    assert private_key_to_public_key(private_key) |> encode16 == @public_key
  end

  test "converts public key to address" do
    public_key = @public_key |> decode16!
    assert public_key_to_address(public_key) |> encode16 == @address
  end

  test "keccak224" do
    assert keccak224(@data) |> encode16 == @keccak224_result
  end

  test "keccak256" do
    assert keccak256(@data) |> encode16 == @keccak256_result
  end

  test "keccak384" do
    assert keccak384(@data) |> encode16 == @keccak384_result
  end

  test "keccak512" do
    assert keccak512(@data) |> encode16 == @keccak512_result
  end
end
