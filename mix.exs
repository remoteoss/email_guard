defmodule EmailGuard.MixProject do
  use Mix.Project

  @version "1.1.1"

  def project do
    [
      app: :email_guard,
      version: @version,
      elixir: "~> 1.3",
      name: "EmailGuard",
      description: "Detect disposable or personal email addresses.",
      package: [
        maintainers: ["Svilen Gospodinov <svilen@heresy.io>"],
        licenses: ["MIT"],
        links: %{Github: "https://github.com/heresydev/email_guard"}
      ],
      docs: [
        main: "readme",
        extras: ["README.md"],
        source_url: "https://github.com/heresydev/email_guard",
        source_ref: @version
      ],
      deps: deps()
    ]
  end

  def application() do
    []
  end

  defp deps() do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:benchee, "~> 0.13", only: :bench}
    ]
  end
end
