<#
.SYNOPSIS
    Gets all privileges from the local user rights assignment and displays them as a hash table.

.DESCRIPTION
    This script uses the "secedit" tool to export the security settings to a file, and then parses the file to get the user rights assignment for each privilege. For each privilege, the script retrieves the username or group name associated with the security identifier (SID) of each account that has the privilege. This script requires administrative privileges to run, as it uses the "secedit" tool to export the security settings.

.PARAMETER Path
    Specifies the path and filename of the export file to create. The default value is "$env:TEMP\secedit.txt".

.EXAMPLE
    .\Get-UserRightsAssignment.ps1

    This command exports the security settings to the default export file, parses the file to get the user rights assignment for each privilege, and displays the results as a hash table.

.EXAMPLE
    .\Get-UserRightsAssignment.ps1 -Path "C:\Temp\secedit.txt"

    This command exports the security settings to the specified export file, parses the file to get the user rights assignment for each privilege, and displays the results as a hash table.

.NOTES
    Author: Miriam Wiesner, @miriamxyra

#>

[cmdletbinding()]
param(
    [string]$Path = "$env:TEMP\secedit.txt"
)

# Export the security settings to the export file
Start-Process -FilePath secedit.exe -ArgumentList "/export /cfg `"$Path`"" -Wait

# Get the user rights assignment from the export file
$UserRights = Get-Content $Path | Where-Object {$_ -match "^Se"} | ForEach-Object {
    $SplitUserRights = $_ -split "="
    $UserRightName = $SplitUserRights[0]
    $SID = (($SplitUserRights[1]).Replace("*","")).Trim()
    $SplitSid = $SID -split ","
    #Let's create one entry for every SID
    foreach ($Item in $SplitSID) {
        $UserName = Get-CimInstance -Query "select * from win32_useraccount where SID = '$Item'" | Select-Object -ExpandProperty Caption
        $EntityName = ""
        if (!($UserName)) {
            #If it's not a SID shown as SID...
            if ($Item -eq "Guest") {
                $EntityName = "Guest"
            }
            elseif ($Item -eq "Administrator") {
                $EntityName = "Administrator"
            }
            #Is it a well-known SID?
            elseif ($Item) {
                $ObjSID = New-Object System.Security.Principal.SecurityIdentifier($Item)
                $EntityName = ($ObjSID.Translate([System.Security.Principal.NTAccount])).Value
            }
            #If it's not a user or well known SID, it's a group
            if (!($EntityName)) {
                $EntityName = Get-CimInstance -ClassName win32_group -filter "SID='$Item'" | Select-Object -ExpandProperty Caption
            }
        }
        else {
            $EntityName = $UserName
        }
        #Create the PSCustomObject
        [PSCustomObject]@{
            RightName = $UserRightName
            Accounts = $EntityName
            SID = $Item
        }
    }
}
#Clean up
Remove-Item $Path

$UserRights

