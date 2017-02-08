defmodule Exgit.Mixfile do
  use Mix.Project

  def project do
    [app: :exgit,
     description: description(),
     package: package(),
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     escript: [main_module: Exgit.Escript],
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:credo, "~> 0.6.1", only: :dev},
     {:earmark, "~> 1.1.1", only: :dev},
     {:excoveralls, "~> 0.6.2", only: :test},
     {:ex_doc, "~> 0.14.5", only: :dev}
    ]
  end

  defp description do
    "Elixir Git Object Explorer"
  end

  defp package do
    [maintainers: ["Kenny Ballou"],
     licenses: ["GPLv3"],
     links: %{"Github" => "https://github.com/kennyballou/exgit.git",
              "Git" => "https://git.devnulllabs.io/exgit.git"},
     files: ~w(mix.exs README.md LICENSE lib)]
  end
end
