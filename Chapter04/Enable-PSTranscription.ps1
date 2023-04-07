<#
.SYNOPSIS
This script enables PowerShell transcription.

.DESCRIPTION
This script enables PowerShell transcription on the local machine. It configures the registry keys for EnableTranscription, EnableInvocationHeader, and OutputDirectory. You can specify the output directory using the -OutputDirectory parameter. By default, the output directory is set to c:\ProgramData\WindowsPowerShell\Transcripts.

.PARAMETER OutputDirectory
Specifies the directory where the transcript files should be saved.

.EXAMPLE
Enable-PSTranscription.ps1 -OutputDirectory "C:\PSLogs"
#>

[cmdletbinding()]
param (
    [Parameter()]
    [string]$OutputDirectory = "c:\ProgramData\WindowsPowerShell\Transcripts"
)

$registryPath = "HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\Transcription"

if (!(Test-Path $registryPath)) {
    New-Item $registryPath -Force
}

New-ItemProperty $registryPath -Name "EnableTranscripting" -PropertyType Dword -Value 1 -Force
New-ItemProperty $registryPath -Name "EnableInvocationHeader" -PropertyType Dword -Value 1 -Force
New-ItemProperty $registryPath -Name "OutputDirectory" -PropertyType String -Value $OutputDirectory -Force