# AGENT TASK

This repository stores PowerShell scripts for managing Steam bot credentials.

## Tasks
- Parse `.mafile` files for username, password, shared_secret and identity_secret.
- Save a combined CSV of all bots to `Exported accs/steam_credentials.csv`.
- Write individual JSON files for each bot to `Exported accs/<username>-credentials.json`.

Run `extract-mafiles.ps1` with PowerShell 5 or later to produce the output files.
