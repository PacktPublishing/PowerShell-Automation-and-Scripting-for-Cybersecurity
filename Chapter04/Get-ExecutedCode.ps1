function Get-ExecutedCode {
    <#
    .SYNOPSIS
        Queries the EventLog and outputs all code that was executed on the system.
        
    .DESCRIPTION
        This function queries the EventLog and outputs all code that was executed on this system. It can be used to find executed code with a specific keyword, user ID, log level, or path. 
    
    .PARAMETER SearchWord
        Filters events containing the specified keyword in the executed code.
    
    .PARAMETER UserId
        Filters events caused by the user with the specified user ID.
    
    .PARAMETER Level
        Filters events containing the specified log level.
    
    .PARAMETER Path
        Filters events where the executed code was in the specified path or subfolder.
        
    .EXAMPLE
        Get-ExecutedCode -SearchWord "Set-"
        Outputs all code that was executed on the system which contains the keyword "Set-" in the code part.
    
    .EXAMPLE
        Get-ExecutedCode -UserId "S-1-5-18"
        Finds all code that was executed by the user with the user ID "S-1-5-18".
    
    .EXAMPLE
        Get-ExecutedCode -Level "Warning"
        Finds all events with the log level "Warning".
    
    .EXAMPLE
        Get-ExecutedCode -Path "C:\Users\Administrator\Documents\GitHub\PowerShell-Automation-and-Scripting-for-CyberSecurity\Chapter04*"
        Finds all code that was executed in a certain path.
    
    #>
        
    [cmdletbinding()]
    param (
        [string]$SearchWord,
        [string]$UserId,
        [string]$Level,
        [string]$Path
    )
    
    $PSWinEventLog = @{ ProviderName = "Microsoft-Windows-PowerShell"; Id = 4104 }
    $PSCoreEventLog = @{ ProviderName = "PowerShellCore"; Id = 4104 }
    
    $AllEvents = Get-WinEvent -FilterHashtable $PSWinEventLog, $PSCoreEventLog |
    Sort-Object @{Expression = { $_.Properties[3].Value } }, @{Expression = { $_.Properties[0].Value } } |
    ForEach-Object {
        [PSCustomObject]@{
            TimeCreated   = $_.TimeCreated
            ExecutedCode  = $_.Properties[2].Value
            UserId        = $_.UserId
            Level         = $_.LevelDisplayName
            Path          = $_.Properties[4].Value
            ProviderName  = $_.ProviderName
            ScriptblockId = $_.Properties[3].Value
            IsMultiPart   = $_.Properties[1].Value -ne 1
            CurrentPart   = $_.Properties[0].Value
            TotalParts    = $_.Properties[1].Value
        }
    }
    
    $oldScriptBlockId = ""
    
    # All Multipart Events
    $CodeEvents = $AllEvents | Where-Object { $_.IsMultiPart } | foreach {
        # Only merge the code if it's a new ScriptBlock
        if ($oldScriptBlockId -ne $_.ScriptblockId) {
            $ScriptBlockCode = $_.ExecutedCode
            $oldScriptBlockId = $_.ScriptblockId
        }
        else {
            $ScriptBlockCode += $_.ExecutedCode
        }
        # If it's the last part of the ScriptBlock, merge the code
        if ($_.CurrentPart -eq $_.TotalParts) {
            [PSCustomObject]@{
                TimeCreated   = $_.TimeCreated
                ExecutedCode  = $ScriptBlockCode
                UserId        = $_.UserId
                Level         = $_.Level
                Path          = $_.Path
                ProviderName  = $_.ProviderName
                ScriptblockId = $_.ScriptblockId
            }
        }
    }
    
    # All Regular Events
    $CodeEvents += $AllEvents | Where-Object { !( $_.IsMultiPart) } | foreach {
        # just add every event
        [PSCustomObject]@{
            TimeCreated   = $_.TimeCreated
            ExecutedCode  = $ScriptBlockCode
            UserId        = $_.UserId
            Level         = $_.Level
            Path          = $_.Path
            ProviderName  = $_.ProviderName
            ScriptblockId = $_.ScriptblockId
        }
    }
    
    $CodeEvents = $CodeEvents | Sort-Object TimeCreated 
    
    #Filter for Search Word
    if ($SearchWord) {
        $CodeEvents = $CodeEvents | Where-Object { $_.ExecutedCode -match $SearchWord }
    }
    
    #Filter for User Id
    if ($UserId) {
        $CodeEvents = $CodeEvents | Where-Object { $_.UserId -eq $UserId }
    }
    
    #Filter for Level
    if ($Level) {
        $CodeEvents = $CodeEvents | Where-Object { $_.Level -eq $Level }
    }
    
    #Filter for Path
    if ($Path) {
        $CodeEvents = $CodeEvents | Where-Object { $_.Path -like "$Path*" }
    }
    
    return $CodeEvents
    
}
    
Get-ExecutedCode