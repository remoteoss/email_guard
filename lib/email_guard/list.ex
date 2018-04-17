defmodule EmailGuard.List do
  @moduledoc """
  Simple behaviour for lists of blacklisted domains.

  See `EmailGuard.DisposableList` for an example.
  """

  @doc "Returns the domain to guard against."
  @callback lookup(domain :: String.t()) :: list_module :: module | nil

  defmacro __using__(opts) do
    filename = opts[:filename] || raise(ArgumentError, message: "expected :filename")

    quote bind_quoted: [filepath: path_to_list(filename)] do
      filepath
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.reject(&match?("", &1))
      |> Enum.uniq()
      |> Enum.map(fn domain ->
        def lookup(unquote(domain)), do: __MODULE__
      end)

      def lookup(_unmatched_domain), do: nil
    end
  end

  @spec path_to_list(String.t()) :: String.t()
  defp path_to_list(filename) do
    Path.join([to_string(:code.priv_dir(:email_guard)), filename])
  end
end
