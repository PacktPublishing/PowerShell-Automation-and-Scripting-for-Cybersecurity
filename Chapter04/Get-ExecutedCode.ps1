function Get-ExecutedCode {
    <#
        .SYNOPSIS
        This function queries the EventLog and outputs all code that was executed on this system.
            
        .DESCRIPTION
        This function queries the EventLog and outputs all code that was executed on this system.

        .PARAMETER SearchWord
        Outputs all occurrences where the SearchWord was found in the executed code.

        .PARAMETER UserId
        Outputs all events that were caused by the user with the specified user id.

        .PARAMETER Level
        Outputs all events containing the specified level.

        .PARAMETER Path
        Outputs all code that was executed in the specified path or a subfolder.

        .PARAMETER IsMultiPart
        Can be used to specify if all code that was split into multiple event ids (IsMultiPart = $true) should be displayed or if only non-multipart events should be displayed.

    
        .EXAMPLE
        Get-ExecutedCode -SearchWord "Set-"
    
        Outputs all code that was executed on this system which contains the keyword "Set-" in the code part.


        Get-ExecutedCode -UserId "S-1-5-18"

        Finds all code that was executed by the user with the user id "S-1-5-18"


        Get-ExecutedCode -Level "Warning"

        Finds all events with the event level "Warning".


        Get-ExecutedCode -Path "C:\Users\Administrator\Documents\GitHub\PowerShell-Automation-and-Scripting-for-CyberSecurity\Chapter04*"

        Finds all code that was executed in a certain path.


        Get-ExecutedCode -IsMultiPart $true

        Finds all events, for which the code was split into multiple events.
    #>
    
    [cmdletbinding()]
    param (
        [string]$SearchWord,
        [string]$UserId,
        [string]$Level,
        [string]$Path,
        [Boolean]$IsMultiPart
    )

    $PSWinEventLog = @{ ProviderName="Microsoft-Windows-PowerShell"; Id = 4104 }
    $PSCoreEventLog = @{ ProviderName="PowerShellCore"; Id = 4104 }

    $CodeEvents = Get-WinEvent -FilterHashtable $PSWinEventLog,$PSCoreEventLog | ForEach-Object {
        [PSCustomObject]@{
            TimeCreated = $_.TimeCreated
            ExecutedCode = $_.Properties[2].Value
            UserId = $_.UserId
            Level = $_.LevelDisplayName
            Path = $_.Properties[4].Value
            ProviderName = $_.ProviderName
            ScriptblockId = $_.Properties[3].Value
            
            #Is code split into multiple log entries?
            IsMultiPart = $_.Properties[1].Value -ne 1
            CurrentPart = $_.Properties[0].Value
            TotalParts = $_.Properties[1].Value
        }
    }

    #Filter for Search Word
    if ($SearchWord) {
        $CodeEvents = $CodeEvents | Where-Object { $_.ExecutedCode -match $SearchWord}
    }

    #Filter for User Id
    if ($UserId) {
        $CodeEvents = $CodeEvents | Where-Object { $_.UserId -eq $UserId}
    }

    #Filter for Level
    if ($Level) {
        $CodeEvents = $CodeEvents | Where-Object { $_.Level -eq $Level}
    }

    #Filter for Path
    if ($Path) {
        $CodeEvents = $CodeEvents | Where-Object { $_.Path -like "$Path*"}
    }

    #Filter if code was split into multiple event entries
    if ($IsMultiPart) {
        $CodeEvents = $CodeEvents | Where-Object { $_.IsMultiPart -eq $true}
    }
    else {
        $CodeEvents = $CodeEvents | Where-Object { $_.IsMultiPart -eq $false}
    }

    return $CodeEvents

}

Get-ExecutedCode

#Examples
Get-ExecutedCode -SearchWord "Set-"
Get-ExecutedCode -UserId "S-1-5-18"
Get-ExecutedCode -Level "Warning"
Get-ExecutedCode -Path "C:\Users\Administrator\Documents\GitHub\PowerShell-Automation-and-Scripting-for-CyberSecurity\Chapter04"
Get-ExecutedCode -IsMultiPart $false