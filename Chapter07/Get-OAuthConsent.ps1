function Get-OAuthConsent {
<#
.SYNOPSIS
Retrieves information about OAuth 2.0 Consent in Azure Active Directory.
    

.DESCRIPTION
The Get-OAuthConsent function retrieves information about OAuth 2.0 Consent in Azure Active Directory (AAD). It checks the OAuth 2.0 permissions of all service principals in the AAD tenant and returns a list of those that have an admin consent description. This information is useful for blue teamers to determine which applications have access to which permissions, and whether they may pose a security risk.

.NOTES
AUTHOR: Miriam Wiesner, @miriamxyra

.EXAMPLE
PS C:> Get-OAuthConsent
This example retrieves information about OAuth 2.0 Consent in Azure Active Directory and displays a list of service principals that have an admin consent description, including their display name, description, enabled status, ID, and application owner tenant ID.
#>
    
    
    try {
        Get-AzureADCurrentSessionInfo | Out-Null
    }
    catch {
        Connect-AzureAD
    }
    
        
    $permissions = Get-AzureADServicePrincipal -All:$true | Where-Object { $null -ne $_.oauth2permissions }
    
    $OAuthConsent = foreach ($permission in $permissions) {
        foreach ($scope in $permission.oauth2permissions) {
            if ($null -ne $scope.adminconsentdescription) {
                [PSCustomObject]@{
                    DisplayName      = $permission.DisplayName
                    Description      = $($scope.adminconsentdescription)
                    Enabled          = $($scope.IsEnabled)
                    Id               = $($scope.Id)
                    AppOwnerTenantId = $permission.AppOwnerTenantId
                }
            }
        }
    }
    $OAuthConsent
}
    
Get-OAuthConsent