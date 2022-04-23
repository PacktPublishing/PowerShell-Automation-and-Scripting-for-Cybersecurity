#########################################################
# This is a script to demonstrate how JEAnalyzer parses commands from audit events
#
# Author: Miriam Wiesner
#
####################### VARIABLES #######################

$path = "$env:ProgramFiles\WindowsPowerShell\Modules\JEAnalyzer-Log"
$rolePath = "$path\RoleCapabilities"

$outPath = "C:\JEA\"

$DomainName = (Get-WmiObject -Class Win32_ComputerSystem).Domain
$DomainNetbiosName = (Get-WmiObject -Class Win32_NTDomain -Filter "DnsForestName = '$DomainName'").DomainName

#################### PREREQUISITES ######################

# Install required module ScriptBlockLoggingAnalyzer
Install-Module ScriptBlockLoggingAnalyzer

# Enable ScriptBlockLogging
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1 -Force

#########################################################

# Create Paths if needed
if(!(Test-Path -Path $path )){
    New-Item -Path $path -ItemType Directory
}

if(!(Test-Path -Path $rolePath )){
    New-Item -Path $rolePath -ItemType Directory
}

#########################################################

# Module Manifest
New-ModuleManifest -Path "$path\JEAnalyzer-Logs.psd1"
#########################################################

# Run some commands as mwiesner: right click on PowerShell console -> run as different user (sometimes shift right click to have this option appear)
restart-service spooler
(Get-WMIObject win32_operatingsystem).name
Get-NetAdapter
Get-Date
Get-Help
Get-Command
Get-Process
Get-Member
Get-Hotfix
# Now you can close the session run under mwiesner again

##################### AUDIT EVENTS ######################

# Use ScriptBlockLoggingAnalyzer to analyze audit events
Get-SBLEvent | Out-GridView

Get-SBLEvent | Where-Object Username -like "$DomainNetbiosName\mwiesner" | Out-GridView

Get-SBLEvent | Where-Object Username -like "$DomainNetbiosName\mwiesner" | Select-Object Code | Out-GridView

# Analyze the created audit events with Read-JeaScriptblock
$scriptBlock = Get-SBLEvent | Where-Object Username -like "$DomainNetbiosName\mwiesner" | Select-Object Code

Read-JeaScriptblock -ScriptCode $scriptBlock

Read-JeaScriptblock -ScriptCode $scriptBlock | Export-Csv -Path "$outPath\JEAnalyzer-Logs.csv"

# Create a new JEA Role Capability File using the Audit log
Read-JeaScriptblock -ScriptCode $scriptBlock | Export-JeaRoleCapFile -Path "$rolePath\JEAnalyzer-Logs-RoleCapability.psrc" -Author "Miriam" -Company "JEAnalyzer"

notepad.exe "$rolePath\JEAnalyzer-Logs-RoleCapability.psrc"

#########################################################

# Create the Session Configuration
$SessionConfigParams = @{
    Author = 'Miriam'
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    RoleDefinitions = @{"$DomainNetbiosName\mwiesner" = @{ RoleCapabilities = 'JEAnalyzer-Logs-RoleCapability' }}
}

New-PSSessionConfigurationFile -Path "$path\Logs-SessionConfigurationFile.pssc" @SessionConfigParams
notepad.exe "$path\Logs-SessionConfigurationFile.pssc"

#########################################################

# Register the session configuration
Register-PSSessionConfiguration -Name Logs -Path "$path\Logs-SessionConfigurationFile.pssc"
Restart-Service -name Winrm

#########################################################

# Display the endpoint
Get-PSSessionConfiguration -Name Logs

# Connect to JEA Operator PS-Session
Enter-PSSession –ComputerName localhost –ConfigurationName Logs -Credential "$DomainNetbiosName\mwiesner"

#########################################################

Get-Command

#########################################################

Exit-PSSession