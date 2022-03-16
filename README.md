# PowerShell 220315

## Useful Resources

- [PSConfEU - PowerShell Conference Europe - largest conference around PowerShell and DevOps](https://psconf.eu/)
- [PowerShell Explained](https://powershellexplained.com/)
- [.net BinaryReader](https://docs.microsoft.com/en-us/dotnet/api/system.io.binaryreader?view=net-6.0)
- [PowerShell Advanced Functions - from one liner to full-featured function](https://github.com/raandree/PowerShellTraining)

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

