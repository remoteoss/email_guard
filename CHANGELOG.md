# Changelog

# 1.2.0 (2020-12-06)
- Significantly faster compile times.

# 1.1.3 (2020-03-24)
- Use [Mailchecker](https://github.com/FGRibreau/mailchecker)'s disposable email list

# 1.1.2 (2018-04-18)
- Remove `google.com` from `FreeList` (internal domain for Google employees only).

# 1.1.1 (2018-04-18)
- Fix regression where domains in `DisposableList` were included in `FreeList` (which is reserved for regular free email service providers like GMail, Yahoo, etc).

# 1.1.0 (2018-04-18)
- __BREAKING__: `EmailGuard.check/2` function returns `{:error, module}` instead of `{:error, String.t()}`, so if you're using `DisposableList`, you will now get `{:error, EmailGuard.DisposableList}` instead of `{:error, "EmailGuard.DisposableList"}`.
- Significant performance improvements when searching the list of domains ([@idi-ot](https://github.com/idi-ot)).

# 1.0.1 (2018-04-17)
- Documentation fixes, re-published to update Hexdocs.

# 1.0.0 (2018-04-16)
- First version.
