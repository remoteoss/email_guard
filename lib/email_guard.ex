defmodule EmailGuard do
  @moduledoc """
  Checks given email against lists of email providers.

  Email lists included in this module are `EmailGuard.DisposableList` and
  `EmailGuard.FreeList`. See each module docs for further details.

  You can also provide your own list by implemented the `EmailGuard.List`
  behaviour and returning a list of domains.
  """

  @default_list [EmailGuard.DisposableList]

  @doc """
  Checks if given email is present in email lists:

      iex> EmailGuard.check("svilen@gmail.com")
      :ok

  By default it will check against `EmailGuard.DisposableList`:

      iex> EmailGuard.check("svilen@mailinator.com")
      {:error, EmailGuard.DisposableList}

  You can specify the email list modules, e.g. including the provided one
  for free email service providers:

      iex> lists = [EmailGuard.DisposableList, EmailGuard.FreeList]
      [EmailGuard.DisposableList, EmailGuard.FreeList]

      iex> EmailGuard.check("svilen@gmail.com", lists)
      {:error, EmailGuard.FreeList}

  To provide your own custom lists, see the `EmailGuard.List` behaviour.

  You can also provide a domain, e.g. "mailinator.com" rather than an email.
  """
  @spec check(String.t(), [module]) :: :ok | {:error, module}
  def check(email, email_list \\ @default_list)
      when is_binary(email) and is_list(email_list) do
    domain = extract_domain(email)

    email_list
    |> Enum.find(fn list -> list.lookup(domain) end)
    |> case do
      nil ->
        :ok

      list_name ->
        {:error, list_name}
    end
  end

  defp extract_domain(input) do
    input
    |> :binary.split("@", [:global])
    |> List.last()
  end
end
