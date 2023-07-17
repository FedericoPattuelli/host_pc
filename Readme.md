# Host Client - Powershell Script

**Description:** This Powershell script allows you to update the Windows hosts file with the current IP address of your client (Windows PC). It inserts a line in the hosts file for each name defined, making it easier to manage host-to-IP mappings.

Federico Pattuelli 
/ federico.pattuelli@gmail.com 
/ July 2023

## Requirements
- Powershell (tested with version 7)

## Configuration
1. Download the "host_pc.ps1" script.
2. Open the script in a text editor and locate the `$names` variable. Add or remove the names as needed, each name should be on a new line.
3. Save the changes to the script.

## Creating a Desktop Shortcut
1. Navigate to "C:\Program Files\PowerShell\7" or the path where Powershell 7 is installed on your system.
2. Find "pwsh.exe" and create a desktop shortcut for it.
3. Right-click on the shortcut and select "Properties."
4. In the "Target" field, add the location path of "host_pc.ps1" at the end of the line, leaving a space after "C:\Program Files\PowerShell\7\pwsh.exe". The full target path should look like: `"C:\Program Files\PowerShell\7\pwsh.exe" C:\path\to\host_pc.ps1`
5. Apply the changes and close the properties window.

## Running the Script
- Double-click the newly created shortcut on your desktop.
- When prompted, run the script as an Administrator. Be cautious when running scripts from untrusted sources.