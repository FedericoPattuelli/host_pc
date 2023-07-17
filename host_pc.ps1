# This script takes the ip address of your client (WIndows) and
# for each name defined in $names inserts a line in the hosts file 
# 
# 
# Federico Pattuelli
# federico.pattuelli@gmail.com
# July 2023 

# Take the path of the host file
$hostFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Write the name to which you want to refer your IP
$names = @("my_client", "my_ip", "client_ip")

# Take the ip address
$ipAddress = (Get-NetIPAddress | Where-Object { $_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00" }).IPAddress

# Check if the host file exists
if (-not (Test-Path -Path $hostFilePath -PathType Leaf)) {
    Write-Host "FATAL: File $hostFilePath not found."
    Exit 222
}

# Take all the rows in the host file
$lines = Get-Content -Path $hostFilePath

# Create an array to store modified lines
$modifiedLines = @()

# Iterate through each line in the host file and check if it contains a name in $names
# if it doesn't, add it to the modified lines
foreach ($line in $lines) {
    $lineContainsName = $false
    foreach ($name in $names) {
        if ($line.Contains($name)) {
            $lineContainsName = $true
            break
        }
    }
    if (-not $lineContainsName) {
        $modifiedLines += $line
    }
}

# Clear the host file
Clear-Content -Path $hostFilePath

# Add the modified lines to the host file
$modifiedLines | Add-Content -Path $hostFilePath

# Add the IP address and name to the host file
foreach ($name in $names) {
    $hostEntry = "$ipAddress $name"
    Add-Content -Path $hostFilePath -Value $hostEntry
    Write-Host $hostEntry
}