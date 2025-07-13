# Requires -Version 5
param(
    [string]$InputFolder = 'C:\Users\Felix\Desktop\AFEEEEEEKS\maFiles',
    [string]$OutputFolder = 'C:\Users\Felix\Desktop\AFEEEEEEKS\Exported accs'
)

if (-not (Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

$csvRecords = @()

Get-ChildItem -Path $InputFolder -Filter '*.mafile' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw | ConvertFrom-Json
    $username = $content.account_name
    $password = $content.password
    $sharedSecret = $content.shared_secret
    $identitySecret = $content.identity_secret

    $csvRecords += [pscustomobject]@{
        username = $username
        password = $password
        shared_secret = $sharedSecret
        identity_secret = $identitySecret
    }

    $creds = @{ 
        $username = @{ 
            password = $password
            shared_secret = $sharedSecret
            identity_secret = $identitySecret
        }
    } | ConvertTo-Json -Depth 3

    $outFile = Join-Path $OutputFolder "$username-credentials.json"
    $creds | Set-Content $outFile
}

$csvPath = Join-Path $OutputFolder 'steam_credentials.csv'
$csvRecords | Export-Csv -Path $csvPath -NoTypeInformation

Write-Output "Credentials exported to $csvPath and individual json files in $OutputFolder"
