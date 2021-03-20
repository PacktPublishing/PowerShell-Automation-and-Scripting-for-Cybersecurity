function Enable-PSTranscription {
    <#
        .SYNOPSIS
        This function enables PowerShell transcription.
    
        .DESCRIPTION
        This function enables PowerShell transcription on the local machine. This function configures EnableTranscription, EnableInvocationHeader and OutputDirectory and overwrites existing registry keys.
    
        .PARAMETER OutputDirectory
        Using the mandatory parameter -OutputDirectory, you can specify where the transcript files should be saved.
    
        .EXAMPLE
        Enable-PSTranscription -OutputDirectory "C:\tmp"
    
        Enables PowerShellTranscription and writes all output to C:\tmp.
    #>
    
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$OutputDirectory
    )

    $registryPath = "HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\Transcription"

    if (!(Test-Path $registryPath)) {
        New-Item $registryPath -Force
    }

    New-ItemProperty $registryPath -Name "EnableTranscripting" -PropertyType Dword -Value 1 -Force
    New-ItemProperty $registryPath -Name "EnableInvocationHeader" -PropertyType Dword -Value 1 -Force
    New-ItemProperty $registryPath -Name "OutputDirectory" -PropertyType String -Value $OutputDirectory -Force
}