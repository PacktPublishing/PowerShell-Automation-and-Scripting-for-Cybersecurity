#########################################################
# This is a script to demonstrate how JEAnalyzer parses scripts
#
# Author: Miriam Wiesner
#
####################### VARIABLES #######################

$path = "$env:ProgramFiles\WindowsPowerShell\Modules\JEAnalyzer-RunScript"
$rolePath = "$path\RoleCapabilities"

$outPath = "C:\JEA\"

$scriptPath = "C:\DEMO\ext\Export_AD_Users_to_CSV.v1.0\Export_AD_Users_to_CSV.v1.0.ps1"

# Domain
$DomainName = (Get-WmiObject -Class Win32_ComputerSystem).Domain
$DomainNetbiosName = (Get-WmiObject -Class Win32_NTDomain -Filter "DnsForestName = '$DomainName'").DomainName

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
New-ModuleManifest -Path "$path\JEAnalyzer-RunScript.psd1"


##################### AUDIT SCRIPT ######################

# Get all commands used in the script
Read-JeaScriptFile -Path $scriptPath

# Export the output from the earlier command 'Read-JeaScriptFile -Path $scriptPath' to a CSV in your output folder
Read-JeaScriptFile -Path $scriptPath | Export-Csv -Path "$outPath\JEAnalyzer-RunScript.csv"

# Use the script as input to create a new Role Capability File, based on the script file
Read-JeaScriptFile -Path $scriptPath | Export-JeaRoleCapFile -Path "$rolePath\JEAnalyzer-RunScript-RoleCapability.psrc" -Author "Miriam" -Company "JEAnalyzer"

notepad.exe "$rolePath\JEAnalyzer-RunScript-RoleCapability.psrc"


#########################################################

# Create the Session Configuration
$SessionConfigParams = @{
    Author = 'Miriam'
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    RoleDefinitions = @{"$DomainNetbiosName\mwiesner" = @{ RoleCapabilities = 'JEAnalyzer-RunScript-RoleCapability' }}
}

New-PSSessionConfigurationFile -Path "$path\RunScript-SessionConfigurationFile.pssc" @SessionConfigParams
notepad.exe "$path\RunScript-SessionConfigurationFile.pssc"

#########################################################

# Register the session configuration
Register-PSSessionConfiguration -Name RunScript -Path "$path\RunScript-SessionConfigurationFile.pssc"
Restart-Service -name Winrm

#########################################################

# Display the endpoint
Get-PSSessionConfiguration -Name RunScript

# Connect to JEA Operator PS-Session
Enter-PSSession –ComputerName localhost –ConfigurationName RunScript -Credential "$DomainNetbiosName\mwiesner"

#########################################################

# See which commands are available in the session
Get-Command

# Exit the Session
Exit-PSSession