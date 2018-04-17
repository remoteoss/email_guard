defmodule EmailGuard.DisposableList do
  @moduledoc """
  Contains list of providers of disposable
  email address (aka temp or burner emails).

  Credits to: https://github.com/wesbos/burner-email-providers
  """

  @behaviour EmailGuard.List

  @impl EmailGuard.List

  use EmailGuard.List, filename: "disposable_list.txt"
end
