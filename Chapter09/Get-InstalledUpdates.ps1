<#
.SYNOPSIS
    This PowerShell function retrieves the list of installed updates for a range of IP addresses using the Get-Hotfix cmdlet.

.DESCRIPTION
    The Get-InstalledUpdates function takes in a range of IP addresses defined by a base IP address and minimum and maximum IP address ranges. It then retrieves the list of installed updates on each IP address by running a background job using the Get-Hotfix cmdlet. The function limits the number of background jobs that can run simultaneously using the optional MaxJobs parameter.

.PARAMETER BaseIP <string>
    The base IP address of the range.

.PARAMETER MinIP <int>
    The minimum value of the IP address range.

.PARAMETER MaxIP <int>
    The maximum value of the IP address range.

.PARAMETER MaxJobs <int>
    Optional. The maximum number of background jobs that can run simultaneously. Defaults to 5.

.EXAMPLE
    Example 1:
    PS C:\> Get-InstalledUpdates -BaseIP "192.168.1" -MinIP 1 -MaxIP 5

    This example retrieves the list of installed updates for the IP addresses 192.168.1.1 through 192.168.1.5.

    Example 2:
    PS C:\> Get-InstalledUpdates -BaseIP "10.0.0" -MinIP 10 -MaxIP 20 -MaxJobs 10

    This example retrieves the list of installed updates for the IP addresses 10.0.0.10 through 10.0.0.20, limiting the number of background jobs to 10.

.OUTPUTS
    The function outputs a table of installed updates for each IP address in the specified range.

.NOTES
    Author: Miriam Wiesner, @miriamxyra
#>

[cmdletbinding()]
param(
    [Parameter(Mandatory)]
    [string]$BaseIP,
    [Parameter(Mandatory)]
    [int]$MinIP,
    [Parameter(Mandatory)]
    [int]$MaxIP,
    [int]$MaxJobs = 5
)

$i = $MinIP

#Run maximal 5 jobs in parallel
$MaxJobs = 5

$IpAddresses = @()

#Delete any old jobs
Get-Job | Remove-Job

#Populate IP addresses
while ($i -le $MaxIP) {
    $IpAddresses += ForEach-Object{$BaseIP + "." +$i}
    $i += 1
}

#ScriptBlock that will later be run as a job
$ScriptBlock = {
    param([string]$IpAddress)
    Get-Hotfix -ComputerName $IpAddress -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
}

#Start Jobs one after another - to a maximum of $MaxJobs at the same time
foreach ($ip in $IpAddresses) {
    While (@(Get-Job | Where-Object { $_.State -eq "Running" }).Count -ge $MaxJobs) {
        Start-Sleep -Seconds 3
    }
    Write-Verbose "Starting background job for $ip..."
    Start-Job -ScriptBlock $ScriptBlock -ArgumentList $ip | Out-Null
}

#Wait until all jobs are finished
While (@(Get-Job | Where-Object { $_.State -eq "Running" }).Count -ne 0) {
    Write-Verbose "Waiting for background jobs..."
    Start-Sleep -Seconds 5
}

#Receive all jobs
$InstalledUpdates = ForEach ($Job in (Get-Job))
{   Receive-Job $Job -ErrorAction SilentlyContinue
    Remove-Job $Job
}

$InstalledUpdates | Format-Table