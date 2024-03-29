# Helpful links used in Chapter 03
- Monad Manifesto: https://www.jsnover.com/blog/2011/10/01/monad-manifesto/
- Windows Remote Management Architecture: https://docs.microsoft.com/en-us/windows/win32/winrm/windows-remote-management-architecture
- Secrets of PowerShell Remoting: https://github.com/devops-collective-inc/secrets-of-powershell-remoting
- CimCmdlets: https://docs.microsoft.com/de-de/powershell/module/cimcmdlets/
- Open Management Infrastructure: https://github.com/Microsoft/omi
- Install PowerShell on Linux: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux
- How to Use ssh-keygen to Generate a New SSH Key?: https://www.ssh.com/ssh/keygen/
- What is SSH Public Key Authentication?: https://www.ssh.com/ssh/public-key-authentication
- sshd_config man page: https://manpages.debian.org/jessie/openssh-server/sshd_config.5.en.html
- Installing PowerShell on macOS: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos
- OpenSSH for Windows overview: https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview
- PowerShell remoting over SSH: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7.1#set-up-on-a-windows-computer
- Enable-RemotePSRemoting.ps1: http://www.powershellcookbook.com/recipe/SQOK/program-remotely-enable-powershell-remoting
- Clean source principle: https://docs.microsoft.com/en-us/security/compass/privileged-access-success-criteria#clean-source-principle
- Enterprise access model: https://docs.microsoft.com/en-us/security/compass/privileged-access-access-model
- Windows PowerShell Workflow Concepts: https://docs.microsoft.com/en-us/system-center/sma/overview-powershell-workflows?view=sc-sma-2019
- Server Manager: https://docs.microsoft.com/en-us/windows-server/administration/server-manager/server-manager
- New-PSSessionConfigurationFile: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/new-pssessionconfigurationfile
- Microsoft Negotiate: https://learn.microsoft.com/en-us/windows/win32/secauthn/microsoft-negotiate
- AuthenticationMechanism Enum: https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.runspaces.authenticationmechanism
- Mitigating Pass-the-Hash (PtH) Attacks and Other Credential Theft, Version 1 and 2: https://www.microsoft.com/en-us/download/details.aspx?id=36036
- Invoke-Command: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/invoke-command
- Clean source principle: https://learn.microsoft.com/en-us/security/privileged-access-workstations/privileged-access-success-criteria#clean-source-principle (Originally: https://docs.microsoft.com/en-us/security/compass/privilegedaccess-success-criteria#clean-source-principle)
- Enterprise access model: https://learn.microsoft.com/en-us/security/privileged-access-workstations/privileged-access-access-model (Originally: https://docs.microsoft.com/en-us/security/compass/privilegedaccess-access-model)

# Further Reading
## Authentication:
  - RFC 2617 – HTTP authentication (Basic & Digest authentication): https://tools.ietf.org/html/rfc2617
  - Credential Security Support Provider (CredSSP) Protocol:
    -    https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-cssp/85f57821-40bb-46aa-bfcb-ba9590b8fc30
    - https://ldapwiki.com/wiki/CredSSP
  - Public Key Authentication 
    - https://en.wikipedia.org/wiki/Public-key_cryptography
    - https://www.ssh.com/ssh/public-key-authentication
## CIM:
  - CIM Cmdlets: https://devblogs.microsoft.com/powershell/introduction-to-CIM cmdlets/
  - CIM standard by DMTF: https://www.dmtf.org/standards/cim
## DCOM:
  - Distributed Component Object Model (DCOM) Remote Protocol: https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-dcom/4a893f3d-bd29-48cd-9f43-d9777a4415b0
## OMI:
  - Open Management Infrastructure: https://cloudblogs.microsoft.com/windowsserver/2012/06/28/open-management-infrastructure/
## Other useful resources:
  - New-NetFirewallRule: https://learn.microsoft.com/en-us/powershell/module/netsecurity/new-netfirewallrule
## PowerShell Remoting:
  - [MS-PSRP]: PowerShell Remoting Protocol: https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-psrp/602ee78e-9a19-45ad-90fa-bb132b7cecec
  - Running Remote Commands: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/running-remote-commands
  - WS-Man Remoting in PowerShell Core: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/wsman-remoting-in-powershell-core
  - WS-MAN specifications by DMTF: https://www.dmtf.org/standards/ws-man
  - WinRM Security: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/winrmsecurity
  - PowerShell endpoints: https://devblogs.microsoft.com/scripting/introduction-to-powershell-endpoints/
  - PowerShell remoting over SSH: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core
  - The second hop: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ps-remoting-second-hop
## WMI:
  - Get-WmiObject: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-wmiobject
  - Invoke-WmiMethod: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/invoke-wmimethod
  - Register-WmiEvent: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/register-wmievent
  - Remove-WmiObject: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-wmiobject
  - Set-WmiInstance: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-wmiinstance
## WS-MAN:
  - WS-MAN standard by DMTF: https://www.dmtf.org/standards/ws-man
  - WS-Management (WSMan) Remoting in PowerShell Core: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/wsman-remoting-in-powershell-core