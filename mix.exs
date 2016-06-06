defmodule Frex.Mixfile do
  use Mix.Project

  def project do
    [app: :frex,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # Production
      {:httpotion, "~> 2.2.0"},
      {:oauther, "~> 1.0.1"},
      {:quinn, github: "jesseherrick/quinn"},
      {:secure_random, "~> 0.2"},
      {:xml_builder, "~> 0.0.8"},
      # Development
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:mix_test_watch, "~> 0.2", only: [:dev, :test]}
    ]
  end
end
