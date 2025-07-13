# CS2SteamfarmManagement

This repository contains utilities for managing multiple Steam bot accounts on Windows 10.

## extract-mafiles.ps1
`extract-mafiles.ps1` scans a folder for `.mafile` files, extracts each bot's credentials, and generates easy to use output.

When you run the script it will by default read files from
`C:\Users\Felix\Desktop\AFEEEEEEKS\maFiles` and output the results to
`C:\Users\Felix\Desktop\AFEEEEEEKS\Exported accs`.
1. Create a folder called `Exported accs` (if it does not already exist).
2. Parse every `.mafile` in the specified input folder to get the account `username`, `password`, `shared_secret` and `identity_secret` values.
3. Write a CSV file named `steam_credentials.csv` in `Exported accs` containing one line per bot formatted as:
   `username,password,shared_secret,identity_secret`.
4. Create one JSON file per bot inside `Exported accs` named `<username>-credentials.json` with the following structure:

```json
{
    "<username>": {
        "password": "<password>",
        "shared_secret": "<shared_secret>",
        "identity_secret": "<identity_secret>"
    }
}
```

You can run the script in PowerShell with the default paths:

```powershell
powershell -File .\extract-mafiles.ps1
```

Or specify custom locations:

```powershell
powershell -File .\extract-mafiles.ps1 -InputFolder <path> -OutputFolder <path>
```

## Requirements
- Windows 10 with PowerShell 5 or newer.
- The folder containing your `.mafile` files exported from ASF or similar tools.

## License
This project is licensed under the MIT License (see `LICENSE`).
