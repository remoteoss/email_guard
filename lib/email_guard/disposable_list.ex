defmodule EmailGuard.DisposableList do
  @moduledoc """
  Contains list of providers of disposable
  email address (aka temp or burner emails).

  Largely based on:
    https://raw.githubusercontent.com/FGRibreau/mailchecker/master/list.txt
  """

  @behaviour EmailGuard.List

  @impl EmailGuard.List

  use EmailGuard.List, filename: "disposable_list.txt"
end
