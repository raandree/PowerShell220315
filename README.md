# PowerShell 220315

## Useful VSCode Extensions
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [ColorTab](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext)
- [Favorites](https://marketplace.visualstudio.com/items?itemName=howardzuo.vscode-favorites)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Shiesh.todo-tree)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
  

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
