# Helpful links used in Chapter 06
- Active Directory: LDAP Syntax Filters: https://social.technet.microsoft.com/wiki/contents/articles/5392.active-directory-ldap-syntax-filters.aspx
- ActiveDirectory: https://docs.microsoft.com/en-us/powershell/module/activedirectory
- Import or export text (.txt or .csv) files: https://support.microsoft.com/en-au/office/import-or-export-text-txt-or-csv-files-5250ac4c-663c-47ce-937b-339e391393ba (Original: https://support.microsoft.com/en-us/office/import-or-export-text-txt-or-csv-files-5250ac4c-663c-47ce-937b-339e391393ba)
- Tutorial: Import Data into Excel and Create a Data Model: https://support.microsoft.com/en-us/office/tutorial-import-data-into-excel-and-create-a-data-model-4b4e5ab4-60ee-465e-8195-09ebba060bf0 (Original: https://support.microsoft.com/en-us/office/tutorial-import-data-into-excel-and-create-a-data-model-4b4e5ab4-60ee-465e-8195-09ebba060bf0)
- Create a PivotTable to analyze worksheet data: https://support.microsoft.com/en-us/office/create-a-pivottable-to-analyze-worksheet-data-a9a84538-bfe9-40a9-a8e9-f99134456576 (Original: https://support.microsoft.com/en-us/office/create-a-pivottable-to-analyze-worksheet-data-a9a84538-bfe9-40a9-a8e9-f99134456576)
- Active Directory accounts: https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/active-directory-accounts
- Security identifiers: https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-identifiers
- DomainPasswordSpray: https://github.com/dafthack/domainPasswordSpray
- PowerSploit/Recon: https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon
- Password Strength: https://xkcd.com/936/
- Well-known SIDs: https://docs.microsoft.com/en-us/windows/win32/secauthz/well-known-sids
- DACLs and ACEs: https://docs.microsoft.com/en-us/windows/win32/secauthz/dacls-and-aces
- Get-Acl: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-acl
- Set-Acl: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-acl
- GroupPolicy: https://docs.microsoft.com/en-us/powershell/module/grouppolicy/
- mimikatz: https://github.com/gentilkiwi/mimikatz/wiki
- How trust relationships work for forests in Active Directory: https://docs.microsoft.com/en-us/azure/active-directory-domain-services/concepts-forest-trust
- Gathering AD Data with the Active Directory PowerShell Module: https://adsecurity.org/?p=3719
- Stop using Lan Manager and NTLMv1!: https://miriamxyra.com/2017/11/08/stop-using-lan-manager-and-ntlmv1/
- Making the second hop in PowerShell Remoting: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ps-remoting-second-hop
- mimikatz Wiki: https://github.com/gentilkiwi/mimikatz/wiki
- PowerSploit: https://github.com/PowerShellMafia/PowerSploit
- Invoke-Kerberoast.ps1: https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1
- Shadow Credentials: Abusing Key Trust Account Mapping for Account Takeover: https://posts.specterops.io/shadow-credentials-abusing-key-trust-account-mapping-for-takeover-8ee1a53566ab
- Mitigating Pass-the-Hash (PtH) Attacks and Other Credential Theft, Version 1 and 2: https://www.microsoft.com/en-us/download/details.aspx?id=36036
- Enterprise access model: https://learn.microsoft.com/en-us/security/privileged-access-workstations/privileged-access-access-model
- Security Compliance Toolkit and Baselines: https://www.microsoft.com/en-us/download/details.aspx?id=55319

# Further Reading
## Access rights
    - Get-Acl: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-acl
    - Set-Acl: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-acl
    - DS-Replication-Get-Changes-All extended right: https://learn.microsoft.com/en-us/windows/win32/adschema/r-ds-replication-get-changes-all
## Active Directory related PowerShell modules (Part of the RSAT tool)
    - ActiveDirectory module: https://docs.microsoft.com/en-us/powershell/module/activedirectory
    - GroupPolicy module: https://docs.microsoft.com/en-us/powershell/module/grouppolicy/
## Active Directory related open-source attacker tools
    - Domain Password Spray: https://github.com/dafthack/DomainPasswordSpray
    - PowerSploit: https://github.com/PowerShellMafia/PowerSploit
    - PowerView: https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon
    - Mimikatz: https://github.com/gentilkiwi/mimikatz/wiki
    - Kerberoast tools: https://github.com/nidem/kerberoast
## Authentication
    - Stop using Lan Manager and NTLMv1!: https://miriamxyra.com/2017/11/08/stop-using-lan-manager-and-ntlmv1/
    - Making the second hop in PowerShell Remoting: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ps-remoting-second-hop
## Desired State Configuration
    - Windows PowerShell Desired State Configuration Overview: https://docs.microsoft.com/en-us/powershell/scripting/dsc/overview/overview
    - Get started with Azure Automation State Configuration: https://docs.microsoft.com/en-us/azure/automation/automation-dsc-getting-started
    - Quickstart: Convert Group Policy into DSC: https://docs.microsoft.com/en-us/powershell/scripting/dsc/quickstarts/gpo-quickstart
## Enumeration
    - Gathering AD Data with the Active Directory PowerShell Module: https://adsecurity.org/?p=3719
## Forest trust
    - How trust relationships work for resource forests in Azure Active Directory Domain Services: https://docs.microsoft.com/en-us/azure/active-directory-domain-services/concepts-forest-trust
## Import data to Excel and PowerPivot
    - Import or export text (.txt or .csv) files: https://support.microsoft.com/en-us/office/import-or-export-text-txt-or-csv-files-5250ac4c-663c-47ce-937b-339e391393ba
    - Tutorial: Import Data into Excel, and Create a Data Model: https://support.microsoft.com/en-us/office/tutorial-import-data-into-excel-and-create-a-data-model-4b4e5ab4-60ee-465e-8195-09ebba060bf0
    - Create a PivotTable to analyze worksheet data: https://support.microsoft.com/en-us/office/create-a-pivottable-to-analyze-worksheet-data-a9a84538-bfe9-40a9-a8e9-f99134456576
## Mitigation
    - Microsoft Security Compliance Toolkit 1.0: https://www.microsoft.com/en-us/download/details.aspx?id=55319
## Privileged accounts & groups
    - Appendix B: Privileged Accounts and Groups in Active Directory: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn487460(v=ws.11)
## Security Identifiers (SID)
    - Well-known security identifiers in Windows operating systems: https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/security-identifiers-in-windows
    - Well-known SIDs: https://docs.microsoft.com/en-us/windows/win32/secauthz/well-known-sids
## User rights assignment
    - User Rights Assignment: https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/user-rights-assignment
    - Secedit: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490997(v=technet.10)
## xkcd password strength
    - Password strength: https://xkcd.com/936/