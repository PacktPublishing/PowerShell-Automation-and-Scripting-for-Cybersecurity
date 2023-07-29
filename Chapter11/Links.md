# Helpful links used in Chapter 11
- RFC3161 - the Time-Stamp Protocol (TSP): https://www.ietf.org/rfc/rfc3161.txt
- Timestamp server list: https://gist.github.com/Manouchehri/fd754e402d98430243455713efada710
- Design a CI/CD pipeline using Azure DevOps: https://learn.microsoft.com/en-us/azure/devops/pipelines/architectures/devops-pipelines-baseline-architecture
- How to build a CI/CD pipeline with GitHub Actions in four simple steps: https://github.blog/2022-02-02-build-ci-cd-pipeline-github-actions-four-steps/
- Code Signing Best Practices: http://download.microsoft.com/download/a/f/7/af7777e5-7dcd-4800-8a0a-b18336565f5b/best_practices.doc
- What features are different between Software Restriction Policies and AppLocker?: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/what-is-applocker#what-features-are-different-between-software-restriction-policies-and-applocker
- Windows Defender Application Control and AppLocker feature availability: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/feature-availability
- Use AppLocker and Software Restriction Policies in the same domain: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/use-applocker-and-software-restriction-policies-in-the-same-domain
- Use Software Restriction Policies and AppLocker policies: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/using-software-restriction-policies-and-applocker-policies
- AaronLocker: https://github.com/microsoft/AaronLocker
- AppLocker CSP: https://docs.microsoft.com/en-us/windows/client-management/mdm/applocker-csp
- Configuration Service Provider: https://docs.microsoft.com/en-us/windows/client-management/mdm/configuration-service-provider-reference#csp-support
- Deploy OMA-URIs to target a CSP through Intune, and a comparison to on-premises: https://docs.microsoft.com/en-us/troubleshoot/mem/intune/deploy-oma-uris-to-target-csp-via-intune
- Monitor app usage with AppLocker: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/monitor-application-usage-with-applocker
- Core isolation: https://support.microsoft.com/en-us/windows/core-isolation-e30ed737-17d8-42f3-a2a9-87521df09b78
- Microsoft recommended block rules: https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/Microsoft-recommended-block-rules
- Understand Windows Defender Application Control (WDAC) policy rules and file rules: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/select-types-of-rules-to-create
- WDAC Policy Wizard: https://webapp-wdac-wizard.azurewebsites.net/
- ConfigCI: https://learn.microsoft.com/en-us/powershell/module/configci
- Secure Boot: https://learn.microsoft.com/en-us/powershell/module/secureboot
- Secure Boot Landing: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/secure-boot-landing
- Deploying Windows Defender Application Control (WDAC) policies: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/windows-defender-application-control-deployment-guide
- Deploy Windows Defender Application Control policies by using Group Policy: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/deploy-windows-defender-application-control-policies-using-group-policy
- Deploy WDAC policies using Mobile Device Management (MDM): https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/deploy-windows-defender-application-control-policies-using-intune
- Deploy WDAC policies by using Microsoft Configuration Manager: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/deployment/deploy-wdac-policies-with-memcm
- WDAC policy refresh tool: https://www.microsoft.com/en-us/download/details.aspx?id=102925
- WDACTools: https://github.com/mattifestation/WDACTools
- Deploy WDAC policies using script: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/deployment/deploy-wdac-policies-with-script

# Further Reading
## Certificate operations:
- New-SelfSignedCertificate: https://docs.microsoft.com/en-us/powershell/module/pki/new-selfsignedcertificate
- Set-AuthenticodeSignature: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-authenticodesignature
- Get-AuthenticodeSignature: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-authenticodesignature
## CI/CD:
- CI/CD: The what, why, and how: https://resources.github.com/ci-cd/
- About continuous integration: https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration
## Application control:
- Application Control for Windows: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/windows-defender-application-control
- Authorize reputable apps with the Intelligent Security Graph (ISG): https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/use-windows-defender-application-control-with-intelligent-security-graph
- Enable virtualization-based protection of code integrity: https://learn.microsoft.com/en-us/windows/security/threat-protection/device-guard/enable-virtualization-based-protection-of-code-integrity
- ConfigCI module reference (ConfigCI): https://docs.microsoft.com/en-us/powershell/module/configci
- Understand Windows Defender Application Control (WDAC) policy rules and file rules: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/select-types-of-rules-to-create
- Understanding WDAC Policy Settings: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/understanding-wdac-policy-settings
- Use multiple Windows Defender Application Control Policies: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/deploy-multiple-windows-defender-application-control-policies
- Use signed policies to protect Windows Defender Application Control against tampering: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/use-signed-policies-to-protect-windows-defender-application-control-against-tampering
- Windows Defender Application Control management with Configuration Manager: https://docs.microsoft.com/en-us/mem/configmgr/protect/deploy-use/use-device-guard-with-configuration-manager
- Windows Defender Application Control Wizard: https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/wdac-wizard
## AppLocker:
- AppLocker Operations Guide: https://docs.microsoft.com/en-us/previousversions/windows/it-pro/windows-server-2008-R2-and-2008/ee791916(v=ws.10)
- Enable the DLL rule collection: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/enable-the-dll-rule-collection