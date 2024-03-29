function Get-UsersAndGroups {
    <#
        .SYNOPSIS
        This function enumerates all AD groups that can be accessed and displays group membership.

        .DESCRIPTION
        This function enumerates all AD groups that can be accessed and displays group membership. Requires the ActiveDirectory module.

        .NOTES
        AUTHOR: Miriam Wiesner, @miriamxyra

        .EXAMPLE
        Get-UsersAndGroups

        Displays all AD groups that can be accessed and group membership.
    #>
    $ADGroups = Get-ADGroup -Filter * | ForEach-Object {
        $groupName = $_.SamAccountName
        Get-ADGroupMember $_.SamAccountName | ForEach-Object {
            [PSCustomObject]@{
                GroupName         = $groupName
                distinguishedName = $_.distinguishedName
                name              = $_.name
                objectClass       = $_.objectClass
                objectGUID        = $_.objectGUID
                SamAccountName    = $_.SamAccountName
                SID               = $_.SID
            }
        }
    }
    $ADGroups
}
Get-UsersAndGroups