function Get-UsersAndGroupsWithAdsi {
    <#
        .SYNOPSIS
        This function enumerates all AD groups using adsisearcher that can be accessed and displays group membership.
        .DESCRIPTION
        This function enumerates all AD groups using adsisearcher that can be accessed and displays group membership.
        .NOTES
        AUTHOR: Miriam Wiesner, @miriamxyra
        .EXAMPLE
        Get-UsersAndGroups
        Displays all AD groups using adsisearcher that can be accessed and group membership.
    #>
    $ADGroups = ([adsisearcher]"(objectClass=group)").FindAll() | ForEach-Object {
        $groupName = $_.Properties.samaccountname
        $distinguishedNames = $_.properties.member

        if (!([string]::IsNullOrEmpty($distinguishedNames))) {
            foreach($distinguishedName in $distinguishedNames) {
                ([adsisearcher]"(distinguishedName=$distinguishedName)").FindAll()| ForEach-Object {
                    [PSCustomObject]@{
                        GroupName          = $groupName
                        distinguishedName  = $distinguishedName
                        name               = $_.properties.name
                        objectClass        = $_.properties.objectclass
                        objectGUID         = $_.properties.objectguid
                        SamAccountName     = $_.properties.samaccountname
                        SID                = $_.properties.objectsid
                        useraccountcontrol = $_.properties.useraccountcontrol
                    }
                }
            }
        }
    }
    $ADGroups
}
Get-UsersAndGroupsWithAdsi
