# Description

Insert a useful description for the TestModule project here.

Remember, it's the first thing a visitor will see.

# Project Setup Instructions
## Working with the layout

- Don't touch the psm1 file
- Place functions you export in `functions/` (can have subfolders)
- Place private/internal functions invisible to the user in `internal/functions` (can have subfolders)
- Don't add code directly to the `postimport.ps1` or `preimport.ps1`.
  Those files are designed to import other files only.
- When adding files & folders, make sure they are covered by either `postimport.ps1` or `preimport.ps1`.
  This adds them to both the import and the build sequence.

## Setting up CI/CD

> To create a PR validation pipeline, set up tasks like this:

- Install Prerequisites (PowerShell Task; VSTS-Prerequisites.ps1)
- Validate (PowerShell Task; VSTS-Validate.ps1)
- Publish Test Results (Publish Test Results; NUnit format; Run no matter what)

> To create a build/publish pipeline, set up tasks like this:

- Install Prerequisites (PowerShell Task; VSTS-Prerequisites.ps1)
- Validate (PowerShell Task; VSTS-Validate.ps1)
- Build (PowerShell Task; VSTS-Build.ps1)
- Publish Test Results (Publish Test Results; NUnit format; Run no matter what)
