defmodule EmailGuardTest do
  use ExUnit.Case

  @free "a@gmail.com"
  @burner "a@mailinator.com"
  @custom "a@custom.com"

  test "checks DisposableList by default" do
    assert EmailGuard.check(@free) == :ok
    assert EmailGuard.check(@burner) == {:error, EmailGuard.DisposableList}
    assert EmailGuard.check(@custom) == :ok
  end

  test "disposable emails are not included in FreeList" do
    assert EmailGuard.check(@burner, [EmailGuard.FreeList]) == :ok
  end

  test "accepts custom email lists" do
    assert EmailGuard.check(@free, [EmailGuard.FreeList]) == {:error, EmailGuard.FreeList}
    assert EmailGuard.check(@custom, [EmailGuard.FreeList]) == :ok
  end
end
