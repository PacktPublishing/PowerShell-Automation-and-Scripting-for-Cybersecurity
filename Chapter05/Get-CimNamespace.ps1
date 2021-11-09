function Get-CimNamespace {
    <#
        .SYNOPSIS
        Enumerates one or more namespaces.
    
        .DESCRIPTION
        Enumerates one or more namespaces. Without the -Recurse parameter it only enumerates the specified namespace, otherwise it recurses the enumeration. 'root' is the default namespace, if no other namespace is specified.
    
        .PARAMETER Namespace
        Specifies the namespace to enumerate. If no other namespace is specified, 'root' will be enumerated

        .PARAMETER Recurse
        If specified, the specified namespace is enumerated recursively.

        .EXAMPLE
        Get-CimNamespace -Namespace 'Root/directory/ldap' -Recurse
    
        Recursively enumerates the 'Root/directory/ldap' (Active Directory) namespace.
    #>

    [cmdletbinding()]
    param (
        [string]$Namespace = 'root',
        [switch]$Recurse
    )

    if ($Recurse.IsPresent) {
        $RecurseSearch = $true
    }

    Get-CimInstance -Namespace $Namespace -ClassName '__NAMESPACE' |
    ForEach-Object {
        Write-Host $("$Namespace\" + $_.Name)
        If ($RecurseSearch) {
            Get-CimNamespace $("$Namespace\" + $_.Name)
        }
    }

}