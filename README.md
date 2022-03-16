# PowerShell 220315

## Useful Resources

- [PSConfEU - PowerShell Conference Europe - largest conference around PowerShell and DevOps](https://psconf.eu/)
- [PowerShell Explained](https://powershellexplained.com/)
- [.net BinaryReader](https://docs.microsoft.com/en-us/dotnet/api/system.io.binaryreader?view=net-6.0)
- [PowerShell Advanced Functions - from one liner to full-featured function](https://github.com/raandree/PowerShellTraining)
- [15 Ways to Bypass the PowerShell Execution Policy](https://www.netspi.com/blog/technical/network-penetration-testing/15-ways-to-bypass-the-powershell-execution-policy)
- [Sampler - A module templating solution](https://github.com/gaelcolas/Sampler)

## Download Visual Studio Code and Git

- [Download Visual Studio Code](https://code.visualstudio.com/download)
- [Download Git](https://git-scm.com/downloads)

## Useful VSCode Extensions
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [ColorTab](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext)
- [Favorites](https://marketplace.visualstudio.com/items?itemName=howardzuo.vscode-favorites)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Shiesh.todo-tree)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)






## Code Samples

- ### Defining and instantiating a class in PowerShell

    ```powershell
    class Car
    {
        [string]$Manufacturer
        [string]$Model
        [string]$Color
        [int]$Speed
        [bool]$IsConvertible
    
        [void] Accelerate([int]$km) {
            $this.Speed += $km
        }
        
        [void] Brake([int]$km) {
            $this.Speed -= $km
        } 
    }

    $car = New-Object Car
    $car.Manufacturer = 'VW'
    $car.Model = 'Golf'
    $car.Engine = '123'
    $car.Accelerate(50)
    $car
    ```

- ### Defining a class in C# and adding the .net class to PowerShell

    This is the class definition in C#. It can be moved to PowerShell exactly like it is.

    ```csharp
    using System;

    namespace My
    {
        public class Car
        {
            public string Manufacturer { get; set; }
            public string Model { get; set; }
            public int Speed { get; set; }
            public bool IsConvertible { get; set; }

            public double SpeedMph {  get { return Speed / 1.6; } }        

            public void Accelerate(int km)
            {
                Speed += km;
            }
            public void Brake(int km)
            {
                Speed -= km;
            }
        }
    }
    ```

    PowerShell can compile and add the type using the cmdlet `Add-Type`.

    ```powershell
    $dotnetType = @'
    using System;

    namespace My
    {
        public class Car
        {
            public string Manufacturer { get; set; }
            public string Model { get; set; }
            public int Speed { get; set; }
            public bool IsConvertible { get; set; }

            public double SpeedMph {  get { return Speed / 1.6; } }        

            public void Accelerate(int km)
            {
                Speed += km;
            }
            public void Brake(int km)
            {
                Speed -= km;
            }
        }
    }
    '@

    Add-Type -TypeDefinition $dotnetType

    $car = New-Object My.Car
    $car.Manufacturer = 'VW'
    $car.Model = 'Golf'
    $car.Accelerate(50)
    $car
    ```

- ### Create a hashtable and store it in a file

    > Note: The process needed in order to  store structured data in files is called [Serialization](https://en.wikipedia.org/wiki/Serialization)

    ```powershell
    $h = @{}

    $h.Add('emp1', 'Sue')
    $h.Add('emp2', @{
        Firstname = 'Peter'
        Lastname = 'Doe'
    })
    $h.Add('emp3', 'Julia')

    $h | ConvertTo-Json | Out-File -FilePath d:\h.json

    $h = Get-Content -Path d:\h.json | ConvertFrom-Json
    ```

- ### Similarities between scriptblock and functions

    ```powershell
    Get-Process | Where-Object { $_.WorkingSet -gt 500MB }

    1..10 | ForEach-Object {
        Write-Host "Test $_" -ForegroundColor $_
    }

    $sb = { Get-Date }
    $sb.GetType() #-> ScriptBlock

    & $sb
    Invoke-Command -ScriptBlock $sb
    Invoke-Command -ScriptBlock $sb -ComputerName server1

    #scriptblock can also have parameters

    $sb = {
        param(
            [int]$Year
        )
        Get-Date -Year $Year
    }

    & $sb 2000
    Invoke-Command -ScriptBlock $sb -ArgumentList 2000


    #functions are the same like scriptblock but with a name

    function Get-MyDate {
        param(
            [int]$Year
        )
        Get-Date -Year $Year
    }
    Get-MyDate -Year 2000

    #--------------------------------------------

    #getting the script block of the function's metadata
    $f = Get-Command -Name Get-MyDate
    $f.ScriptBlock

    & $f.ScriptBlock 2000 #just for showing that this is possible, but it is not adviced

    Get-MyDate -Year 2000
    ```

- ### Group Object is very powerful to discover patterns in data

    Top 5 extensions by file count

    ```powershell
    dir -Recurse | Group-Object -Property Extension | Sort-Object -Property Count -Descending | 
    Select-Object -First 5
    ```

    Files grouped together by the day they were created and then by year

    ```powershell
    dir -Recurse | Group-Object -Property { '{0:yy MM dd}' -f $_.CreationTime } | Sort-Object -Property Name -Descending

    dir -Recurse | Group-Object -Property { '{0:yy}' -f $_.CreationTime } | Sort-Object -Property Name -Descending
    ```

    Get the events of the last 7 days and group them by the entry type. This gives you an idea about the error, warning, information ratio.

    ```powershell
    Get-EventLog -LogName System -After (Get-Date).AddDays(-7) | Group-Object -Property EntryType
    ```
