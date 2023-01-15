<#PSScriptInfo
 
.VERSION 1.0
 
.AUTHOR Miriam Wiesner (@miriamxyra)
 
.COPYRIGHT
 This script is based on Scan-UpdatesOffline.ps1 by Andrei Stoica astoica@microsoft.com, which is licensed under the MIT License. Additional code written by Miriam Wiesner.
 
.LICENSEURI https://opensource.org/licenses/MIT

.SYNOPSIS
This script scans one or more host(s) to see if Windows updates are missing.
    
.DESCRIPTION
This script scans one or more (local or remote) host(s) to see if Windows updates are missing. It is also possible to specify whether the cab file will be deleted or not after and/or before the scan.

.PARAMETER RemoteHosts
Specify one or more remote hosts. If this parameter is not specified, the localhost will be scanned.

.PARAMETER CabPath
You can use this parameter to specify where the wsusscn2.cab file should be downloaded to. If nothing is specified, it will be downloaded to $env:temp\wsusscn2.cab.

.PARAMETER Force
If the Force parameter is specified, the wsusscn2.cab file will be deleted if present and a new version will be downloaded.

.PARAMETER DoNotDeleteCabFile
If specified, the wsusscn2.cab file will not be deleted after the scan.

.EXAMPLE
.\Scan-RemoteUpdates.ps1 -remoteHosts "PSSec-PC01", "PSSec-PC02", "PSSec-Srv01" -Force

Downloads a new version of the wsusscn2.cab file, regardless if it is present or not. Then scans the remote hosts "PSSec-PC01", "PSSec-PC02", "PSSec-Srv01" and returns which updates are missing.
  
#>

Param(
    [string[]]$RemoteHosts,
    [string]$CabPath = "$env:temp\wsusscn2.cab",
    [switch]$Force,
    [switch]$DoNotDeleteCabFile
)

if (!$RemoteHosts) {
    $RemoteHosts = "localhost"
}

$RemoteHosts | ForEach-Object {
    $session = New-PSSession -ComputerName $_
    Invoke-Command -Session $session -ScriptBlock {
        param($DoNotDeleteCabFile, $CabPath, $Force)
        if ($Force) {
            Remove-Item -Path $CabPath -Force
        }
        if (!(Test-Path $CabPath)) {
            $cabUrl = "http://go.microsoft.com/fwlink/?linkid=74689"
            Write-Output "Downloading wsusscn2.cab from $cabUrl..."
            Invoke-WebRequest -Uri $cabUrl -OutFile $CabPath
        }
        $UpdateSession = New-Object -ComObject Microsoft.Update.Session 
        $UpdateServiceManager = New-Object -ComObject Microsoft.Update.ServiceManager 
        $UpdateService = $UpdateServiceManager.AddScanPackageService("Offline Sync Service", $CabPath) 
        $UpdateSearcher = $UpdateSession.CreateUpdateSearcher() 
        Write-Output "Searching for updates on $(hostname)... `r`n" 
        $UpdateSearcher.ServerSelection = 3 #ssOthers
        $UpdateSearcher.IncludePotentiallySupersededUpdates = $true # good for older OSes, to include Security-Only or superseded updates in the result list, otherwise these are pruned out and not returned as part of the final result list
        $UpdateSearcher.ServiceID = $UpdateService.ServiceID.ToString() 
        $SearchResult = $UpdateSearcher.Search("IsInstalled=0") # or "IsInstalled=0 or IsInstalled=1" to also list the installed updates as MBSA did
        $Updates = $SearchResult.Updates 
        if (!($DoNotDeleteCabFile)) {
            Remove-Item -Path $CabPath -Force
        }
        if ($Updates.Count -eq 0) { 
            Write-Output "There are no applicable updates on $(hostname)." 
            return $null 
        } 
        Write-Output "List of applicable items on the machine when using wsusscn2.cab: `r`n" 
        $i = 0 
        foreach ($Update in $Updates) {  
            Write-Output "$($i)> $($Update.Title)" 
            $i++ 
        }
    } -ArgumentList $DoNotDeleteCabFile, $CabPath, $Force
    Remove-PSSession $session
}