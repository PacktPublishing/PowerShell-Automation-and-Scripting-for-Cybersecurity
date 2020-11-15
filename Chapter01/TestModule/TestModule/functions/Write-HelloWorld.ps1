function Write-HelloWorld () {
    <#
        .SYNOPSIS
        This function writes "Hello World!'" to the commandline.
    
        .DESCRIPTION
        This function writes "Hello World!" to the commandline. If the parameter Identity is specified, it also shows an individual greeting.
    
        .PARAMETER Identity
        If the parameter Identity is specified, an individual greeting is added to the output.
    
        .EXAMPLE
        Write-HelloWord -Identity "Miriam"
    
        Writes the output "Hello World! Hello Miriam!"
    #>
    
    [cmdletbinding()]
    param (
        [string]$Identity
    )

    if (![string]::IsNullOrEmpty($Identity)) {
        $appendStr = " Hello $Identity!"
    }
    else {
        $appendStr = ""
    }

    Write-Host "Hello World!$appendStr"
}
