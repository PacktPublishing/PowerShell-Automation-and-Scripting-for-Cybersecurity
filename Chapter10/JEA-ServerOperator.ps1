#########################################################
# This is a JEA configuration script to create and register a ServerOperator user, 
# allowed to restart services and read user attributes from AD
#
# Author: Miriam Wiesner
#
####################### VARIABLES #######################

# Environment
$path = "$env:ProgramFiles\WindowsPowerShell\Modules\Server-Operator"
$rolePath = "$path\RoleCapabilities"

# Domain
$DomainName = (Get-WmiObject -Class Win32_ComputerSystem).Domain
$DomainNetbiosName = (Get-WmiObject -Class Win32_NTDomain -Filter "DnsForestName = '$DomainName'").DomainName

# AccountNames
$ServerOperator = "$DomainNetbiosName\mwiesner"

#########################################################

# Create Paths if needed
if(!(Test-Path -Path $path )){
    New-Item -Path $path -ItemType Directory
}

if(!(Test-Path -Path $rolePath )){
    New-Item -Path $rolePath -ItemType Directory
}

# Module Manifest
New-ModuleManifest -Path "$path\ServerOperator.psd1"

# Create the Role Capability File
$RoleCapParams = @{
    Path = "$rolePath\ServerOperator-RoleCapability.psrc"
    Author = 'Miriam Wiesner'
    CompanyName = 'PSSEC'
    VisibleCmdlets = 'Restart-Service', 'Get-ADUser'
    VisibleFunctions = 'TabExpansion2'
}
New-PSRoleCapabilityFile @RoleCapParams

# Create the Session Configuration
$SessionConfigParams = @{
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    RoleDefinitions = @{$ServerOperator = @{ RoleCapabilities = 'ServerOperator-RoleCapability' }}
}

New-PSSessionConfigurationFile -Path "$path\ServerOperator-SessionConfigurationFile.pssc" @SessionConfigParams

# Register the session configuration
Register-PSSessionConfiguration -Name ServerOperator -Path "$path\ServerOperator-SessionConfigurationFile.pssc"
Restart-Service -name Winrm

# Unregister the Session Configuration
#Unregister-PSSessionConfiguration -Name ServerOperator
#Restart-Service -name Winrm
