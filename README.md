# Homebrew Tap for dbtx

Install:

```bash
brew tap RAKUDEJI/dbtx
brew install dbtx
```

Optional drivers:

```bash
brew install dbtx-driver-snowflake
brew install dbtx-driver-adbc
```

Notes:
- Snowflake driver requires SnowSQL (`snowsql`) available on PATH.
- ADBC driver requires configuring `bindings.yaml` with `engine: adbc` and an `adbc.driver_path` pointing to your driver library.
