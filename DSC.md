# Desired State Configuration)

## Basic References

- [Microsoft Windows PowerShell DSC (Desired State Configuration)](https://www.techtarget.com/searchwindowsserver/definition/Microsoft-Windows-PowerShell-DSC-Desired-State-Configuration#:~:text=Desired%20State%20Configuration%20(DSC)%20is,a%20process%20called%20declarative%20scripting.)
- [Desired State Configuration overview for decision makers](https://docs.microsoft.com/de-de/powershell/dsc/overview/decisionMaker?view=dsc-1.1&viewFallbackFrom=powershell-7.2)

- [DSC Community](http://dsccommunity.org/)
- [DscWorkshop project blueprint](https://github.com/dsccommunity/DscWorkshop)
  - This project comes with [exercises](https://github.com/dsccommunity/DscWorkshop/tree/main/Exercises) that make the introduction much easier.

## Simple Configuration

```powershell
configuration Test1 {
    
    Import-DscResource -ModuleName ComputerManagementDsc
    
    Node localhost {
  
        WindowsFeature RemoveXpsViewer {
            Name = 'XPS-Viewer'
            Ensure = 'Absent'
        }
    
        WindowsFeature DnsRsatTools {
            Name = 'RSAT-DNS-Server'
            Ensure = 'Present'
        }
        
        WindowsCapability sshServer {
            Name = 'OpenSSH.Server~~~~0.0.1.0'
            Ensure = 'Present'
        }
        
        Service sshd {
            Name = 'sshd'
            State = 'Running'
            StartupType = 'Automatic'
        }
    }
}

#Install-Module -Name ComputerManagementDsc -Force

Test1 -OutputPath C:\DSC

Start-DscConfiguration -Wait -Verbose -Path C:\DSC -Force
```