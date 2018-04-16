defmodule EmailGuardTest do
  use ExUnit.Case

  @free "a@gmail.com"
  @burner "a@mailinator.com"

  test "checks DisposableList by default" do
    assert EmailGuard.check(@free) == :ok
    assert EmailGuard.check(@burner) == {:error, "EmailGuard.DisposableList"}
  end

  test "accepts custom email lists" do
    assert EmailGuard.check(@free, [EmailGuard.FreeList]) == {:error, "EmailGuard.FreeList"}
    assert EmailGuard.check(@burner, [EmailGuard.FreeList]) == :ok
  end
end
