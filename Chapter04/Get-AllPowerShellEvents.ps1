function Get-AllPowerShellEvents {
    <#
        .SYNOPSIS
        This function queries most relevant event ids from all PowerShell related event logs.
    
        .DESCRIPTION
        This function queries most relevant event ids from "Microsoft-Windows-PowerShell/Operational", "PowerShellCore/Operational" and "Windows PowerShell" event logs. Do not only use this function for security monitoring, as there are many other events that should also be analyzed.
    
        .EXAMPLE
        Get-AllPowerShellEvents
    
        Queries event id 200, 400, 500, 501, 600, 800, 4103, 4104, 4105 and 4106 from "Microsoft-Windows-PowerShell/Operational", "PowerShellCore/Operational" and "Windows PowerShell" event logs and displays the results. Look at the xml syntax in this function for further information.
    #>
    
    [cmdletbinding()]
    param ()

    $xml = @'
<QueryList>
    <Query Id="0" Path="Microsoft-Windows-PowerShell/Operational">
        <Select Path="Microsoft-Windows-PowerShell/Operational">*[System[(EventID=4103 or EventID=4104 or EventID=4105 or EventID=4106)]]</Select>
        <Select Path="PowerShellCore/Operational">*[System[(EventID=4103 or EventID=4104 or EventID=4105 or EventID=4106)]]</Select>
        <Select Path="Windows PowerShell">*[System[(EventID=200 or EventID=400 or EventID=500 or EventID=501 or EventID=600 or EventID=800)]]</Select>
    </Query>
</QueryList>
'@

    Get-WinEvent -FilterXml $xml | Format-List

}

Get-AllPowerShellEvents