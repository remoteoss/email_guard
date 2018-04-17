free = "a@gmail.com"
burner = "a@mailinator.com"

Benchee.run(
  %{
    "free found" => fn -> EmailGuard.check(free, [EmailGuard.FreeList]) end,
    "free passed" => fn -> EmailGuard.check(free) end,
    "disposable found" => fn -> EmailGuard.check(burner) end,
    "disposable passed" => fn -> EmailGuard.check("some@example.email") end
  },
  time: 10,
  memory_time: 2
)
