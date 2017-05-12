defmodule KegCopRAPI.Mixfile do
  use Mix.Project

  def project do
    [app: :kegcopr_api,
     version: "0.0.14",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  #test test

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {KegCopRAPI.Application, []},
     extra_applications:
     [
       :logger,
       :runtime_tools,
       :logger_file_backend]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    # see the below mentioned github issue why override: true is set.
    # https://github.com/ueberauth/guardian/issues/273
    # Note: see `mix.lock` for which RC version of phx project is using.
    [{:phoenix, "~> 1.3.0-rc", override: true},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.2"},
     {:postgrex, ">= 0.0.0"},
    #  {:phoenix_html, "~> 2.6"}, # DON'T USE BECAUSE APP IS AN API.
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     # User added dependencies.
     {:distillery, "~> 1.4"},
     {:gatling, "~> 1.0"},
     {:comeonin, "~> 3.0"}, # 3.0 is appears to be the latest version as of May 3rd 2017
     {:corsica, "~> 0.5.0"}, # latest as of May 3rd 2017
     {:guardian, "~> 0.14.2"}, # latest as of May 3rd 2017
     {:cors_plug, "~> 1.2"}, # latest as of May 5th 2017
     {:logger_file_backend, "~> 0.0.9"}
   ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
