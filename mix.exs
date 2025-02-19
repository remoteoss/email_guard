defmodule EmailGuard.MixProject do
  use Mix.Project

  @version "1.2.3"

  def project do
    [
      app: :email_guard,
      version: @version,
      elixir: "~> 1.3",
      name: "EmailGuard",
      description: "Detect disposable (burner) or personal email addresses.",
      package: [
        maintainers: ["Svilen Gospodinov <webmaster@s2g.io>"],
        licenses: ["MIT"],
        links: %{Github: "https://github.com/svileng/email_guard"}
      ],
      docs: [
        main: "readme",
        extras: ["README.md"],
        source_url: "https://github.com/svileng/email_guard",
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
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:benchee, "~> 1.0", only: :bench}
    ]
  end
end
