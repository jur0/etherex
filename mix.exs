defmodule Etherex.Mixfile do
  use Mix.Project

  def project do
    [app: :etherex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:keccakf1600, git: "https://github.com/jur0/erlang-keccakf1600.git", branch: "original-keccak"}]
  end
end
