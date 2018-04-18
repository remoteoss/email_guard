# Changelog

# 1.1.0 (2018-04-18)
- __BREAKING__: `EmailGuard.check/2` function returns `{:error, module}` instead of `{:error, String.t()}`, so if you're using `DisposableList`, you will now get `{:error, EmailGuard.DisposableList}` instead of `{:error, "EmailGuard.DisposableList"}`.
- Significant performance improvements when searching the list of domains (@idi-ot)

# 1.0.1 (2018-04-17)
- Documentation fixes, re-published to update Hexdocs.

# 1.0.0 (2018-04-16)
- First version.
