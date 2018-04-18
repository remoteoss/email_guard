defmodule EmailGuard.FreeList do
  @moduledoc """
  List of free email providers (such as gmail).

  Large based on:
    https://gist.github.com/ammarshah/f5c2624d767f91a7cbdc4e54db8dd0bf

  Note that domains of providers of disposable emails (which are often free)
  are part of `EmailGuard.DisposableList` and are not included here.
  """

  @behaviour EmailGuard.List

  @impl EmailGuard.List

  use EmailGuard.List, filename: "free_list.txt"
end
