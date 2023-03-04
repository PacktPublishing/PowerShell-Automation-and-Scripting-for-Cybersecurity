
    function Invoke-Greeting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$true)]
            [string]$Name
        )
        "Hello, $Name!"
    }

