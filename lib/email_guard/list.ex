defmodule EmailGuard.List do
  @moduledoc """
  Simple behaviour for lists of blacklisted domains.

  See `EmailGuard.DisposableList` for an example.
  """

  @doc "Returns list of domains to guard against."
  @callback domains() :: list(String.t)
end
