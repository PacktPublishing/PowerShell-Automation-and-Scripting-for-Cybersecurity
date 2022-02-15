function Assert-LocalUsersAndGroups {
    <#
        .SYNOPSIS
        This function enumerates all local users and groups that can be accessed and displays group membership.

        .DESCRIPTION
        This function enumerates all local users and groups that can be accessed and displays group membership.

        .NOTES
        AUTHOR: Miriam Wiesner, @miriamxyra

        .EXAMPLE
        Assert-UsersAndGroups

        Displays all local users and groups that can be accessed and group membership.
    #>
    
    $LocalGroups = Get-LocalGroup | ForEach-Object {
        $groupName = $_.Name
        Get-LocalGroupMember $_.Name | ForEach-Object {
            [PSCustomObject]@{
                GroupName = $groupName
                distinguishedName = $_.Name
                objectClass = $_.ObjectClass
                principalSource = $_.PrincipalSource
            }
        }
    }
    $LocalGroups
}
Assert-LocalUsersAndGroups