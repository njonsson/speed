defmodule Speed.Mixfile do
  use Mix.Project

  def project do
    [app: :speed,
     version: version(),
     description: description(),
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript(),
     deps: deps(),
     preferred_cli_env: %{:coveralls          => :test,
                          :"coveralls.detail" => :test,
                          :"coveralls.html"   => :test,
                          :"coveralls.json"   => :test,
                          :"coveralls.post"   => :test},
     package: package(),
     source_url: "https://github.com/njonsson/speed",
     # homepage_url: "https://njonsson.github.io/speed",
     docs: [extras: ["README.md":  [filename: "about",
                                    title: "About Speed"],
                     "License.md": [filename: "license",
                                    title: "Project license"]],
                     # TODO: Figure out why ExDoc chokes on this
                     # "History.md": [filename: "history",
                     #                title: "Project history"]],
            # logo: "assets/logo.png",
            main: "about"],
     test_coverage: [tool: ExCoveralls]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  def version, do: "0.1.0"

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:dialyxir,    "~> 0.5",  only: :dev,  runtime: false},
     {:excoveralls, "~> 0.7",  only: :test, runtime: false},
     {:ex_doc,      "~> 0.16", only: :dev,  runtime: false}]
  end

  defp description do
    "The card game Speed — a first programming project with my 11-year-old son"
  end

  defp escript, do: [main_module: Speed.CLI]

  defp package do
    [files:       [# "History.md",
                   "License.md",
                   "README.md",
                   # "assets/logo.png",
                   "lib",
                   "mix.exs"],
     maintainers: ["Nils Jonsson <speed@nilsjonsson.com>"],
     licenses:    ["MIT"],
     links:       %{# "Home"   => "https://njonsson.github.io/speed",
                    "Source" => "https://github.com/njonsson/speed",
                    "Issues" => "https://github.com/njonsson/speed/issues"}]
  end
end
