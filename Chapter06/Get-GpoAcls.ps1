function Get-OuACLSecurity {
<#
.SYNOPSIS
    Retrieves the ACL security information for Group Policy Objects (GPOs).

.DESCRIPTION
    The Get-OuACLSecurity function retrieves the ACL security information for all Group Policy Objects (GPOs) in the domain using the GroupPolicy module.
    Requires the GroupPolicy module. This function needs to be run with administrative privileges.

.PARAMETER None
    This function does not accept any parameters.

.NOTES
    AUTHOR: Miriam Wiesner, @miriamxyra

.EXAMPLE
    Get-OuACLSecurity

    Retrieves the ACL security information for all GPOs in the domain.
#>

    Get-Gpo -All | foreach {
        $DisplayName = $_.DisplayName
        $DomainName = $_.DomainName
        $Owner = $_.Owner
        $Id = $_.Id
        $GpoStatus = $_.GpoStatus
        $Description = $_.Description
        $CreationTime = $_.CreationTime
        $ModificationTime = $_.ModificationTime
        $UserVersion = $_.UserVersion
        $ComputerVersion = $_.ComputerVersion
        $WmiFilter = $_.WmiFilter

        Get-GPPermission -Guid $_.Id -All | foreach {
             [PSCustomObject]@{
                DisplayName = $DisplayName
                DomainName = $DomainName
                Owner = $Owner
                Id = $Id
                GpoStatus = $GpoStatus
                Description = $Description
                CreationTime = $CreationTime
                ModificationTime = $ModificationTime
                UserVersion = $UserVersion
                ComputerVersion = $ComputerVersion
                WmiFilter = $WmiFilter
                Trustee = $_.Trustee
                TrusteeType = $_.TrusteeType
                Permission = $_.Permission
                Inherited = $_.Inherited
             }
        }
    }
}

Get-OuACLSecurity