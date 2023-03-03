function Set-Variables {
    $local_variable = "Hello, I'm a local variable."
    $script:script_variable = "Hello, I'm a script variable."
    $global:global_variable = "Hello, I'm a global variable."

    Write-Host "##########################################################"
    Write-Host "This is how our variables look in the function, where we defined the variables - in a LOCAL SCOPE:"
    Write-Host "  Local: " $local_variable
    Write-Host "  Script: " $script_variable
    Write-Host "  Global: " $global_variable    
}

Set-Variables

Write-Host "##########################################################"
Write-Host "This is how our variables look in the same script - in a SCRIPT SCOPE:"
Write-Host "  Local: " $local_variable
Write-Host "  Script: " $script_variable
Write-Host "  Global: " $global_variable

# Note: to ensure clean code and to avoid confusion - if a scope is set, you should always use the scope modifier as well when calling the variable:
# Write-Host "Local: " $local_variable
# Write-Host "Script: " $script:script_variable
# Write-Host "Global: " $global:global_variable