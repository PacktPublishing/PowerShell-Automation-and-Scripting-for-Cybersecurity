function Assert-OuACLSecurity {
    <#
        .SYNOPSIS
        This function enumerates all OU ACLs and displays access rights.

        .DESCRIPTION
        This function enumerates all OU ACLs and displays access rights.

        .NOTES
        AUTHOR: Miriam Wiesner, @miriamxyra

        .EXAMPLE
        Assert-OuACLSecurity

        Displays all OU ACLs and their access rights.
    #>
    $OuAcls = Get-ADOrganizationalUnit -Filter * | ForEach-Object {
        $distinguishedName = $_.DistinguishedName
        (Get-Acl -Path "AD:\$($_.DistinguishedName)").Access | ForEach-Object {
            [PSCustomObject]@{
                DistinguishedName     = $distinguishedName
                ActiveDirectoryRights = $_.ActiveDirectoryRights
                InheritanceType       = $_.InheritanceType
                ObjectType            = $_.ObjectType
                InheritedObjectType   = $_.InheritedObjectType
                ObjectFlags           = $_.ObjectFlags
                AccessControlType     = $_.AccessControlType
                IdentityReference     = $_.IdentityReference
                IsInherited           = $_.IsInherited
                InheritanceFlags      = $_.InheritanceFlags
                PropagationFlags      = $_.PropagationFlags
            }
        }
    }
    return $OuAcls
}
Assert-OuACLSecurity