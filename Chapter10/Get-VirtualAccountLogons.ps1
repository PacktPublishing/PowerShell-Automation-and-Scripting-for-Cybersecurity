<#
.SYNOPSIS
    Retrieves information about virtual account logons using CIM.

.DESCRIPTION
    This script retrieves information about virtual account logons on the local system using CIM. It queries the Win32_LoggedOnUser and Win32_LogonSession classes to retrieve the logon information and maps the logon type numbers to their corresponding names using a hashtable.

.EXAMPLE
    PS C:\> Get-VirtualAccountLogons.ps1
    Retrieves information about virtual account logons on the local system.

.NOTES
    Author: Miriam Wiesner, @miriamxyra
#>

# Define a hashtable that maps logon type numbers to their corresponding names
$LogonType = @{ 
    "0"="Local System" 
    "2"="Interactive"
    "3"="Network"
    "4"="Batch"
    "5"="Service"
    "7"="Unlock"
    "8"="NetworkCleartext"
    "9"="NewCredentials"
    "10"="RemoteInteractive"
    "11"="CachedInteractive"
}

$LoggedOnUsers = Get-CimInstance -ClassName Win32_LoggedOnUser | Where-Object { $_.Antecedent -like "*WinRM VA*"}
$VirtualAccountLogons = $LoggedOnUsers.ForEach({

    $LogonSession = Get-CimInstance -ClassName Win32_LogonSession -Filter "LogonId = $($_.Dependent.LogonId)"

    #After a Session was terminated, the Domain changes to "WinRM Virtual Users"
    $ActiveSession = $_.Antecedent.Domain -ne "WinRM Virtual Users"

    [PSCustomObject]@{
        Name = $_.Antecedent.Name
        Domain = $_.Antecedent.Domain
        LogonTypeNumber = $LogonSession.LogonType
        LogonTypeString = $LogonType[($LogonSession.LogonType).tostring()]
        SessionStartTime = $LogonSession.StartTime
        SessionAuthPackage = $LogonSession.AuthenticationPackage
        LogonId = $_.Dependent.LogonId
        ActiveSession = $ActiveSession
    }
})

$VirtualAccountLogons