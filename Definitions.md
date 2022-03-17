## Terms
- Class / Type
  
  Definition of what kind of object you can create. Remember, you cannot create objects of types / classes that are not defined. Classes are defined in the .net framework or additional libraries.
  
- Object / Instance
  
  Something you can actually touch, something created using the existing building plans (classes / types).
  > Note: Everything in .net and PowerShell is an object, even an int and bool
- Function
  
  Reusable unit of code that has a name and can be called.

  ```powershell
  function f1 {
    Get-Date
  }

  $a = f1
  ```

- Methods
  
  Similar like functions methods are units of code but available only on an existing object or class (static methods).

  > Calling a method always requires brackets at the end.

  ```powershell
  $a = Get-Date
  $a.ToString()
  ```

- Properties

  Data that is defined on an object. Properties like methods can only be access on an object like this:

  ```powershell
  $a = Get-Date
  $a.Year
  ```
  - Member

  Is a collective term for everything a class or object provides. In PowerShell it usually referrers to methods and properties.

- Scriptblock

    Scriptblock are units of codes like functions but without a name.

    ```powershell
    $sb = { Get-Date }
    $a = & $sb
    ```

- Parameter
  
  A parameter is a special kind of variable used in a function or script to refer to one of the pieces of data provided as input.

  ```powershell
  param (
    [Parameter(Mandatory)
    [string[]]$ComputerName
  )
  ```

- Argument

  An argument is the actual input expression passed/supplied to a function that is taken by one of the function's parameters, in this case ```w32time```

  ```powershell
  Get-Service -Name w32time
  ```

- Attribute

  An attribute is a specification that defines a property of an object or element. For example, you can use the Parameter attribute to specify a parameter and set it as mandatory or as pipeline input.

  ```powershell
  [Parameter()]
  ```

- Library

A file or module containing functions, like a DLL. DLLs cannot be invoked as they don't have a main entry point.

&nbsp;

## When to use which kind of bracket?

- Normal brackets ()
  
    - To prioritize sections of a line like in math to prioritize additions before multiplications.

      ```powershell
      #This results in an error
      Get-Process.Count

      (Get-Process).Count
      ```

    - To call a method

      ```powershell
      $d = Get-Date
      $d.AddDays(1)
      ```

    - If you want to create an empty array or   convert a single object into an array ob objects

      ```powershell
      $array = @()
      $array = @(1)
      ```

- Curly brackets

    - To indicate scripts blocks. Used in If, ForEach, functions, etc.

      ```powershell
      if ($a -gt 5){
        'yes'
      }
      else {
        'no'
      }
      ```

    - To define hashtables

      ```powershell
      $ht1 = @{}

      $ht2 = @{
        key1  = 'value1'
        Model = 'Golf'
      }
      ```

- Square brackets

  - Square brackets are used to access elements in an array:

    ```powershell
    $a = 1,2,3
    $a[0]
    $a[-1]
    ```

  - Square brackets are used to declare types or cast data

    ```powershell
    [int]$i = 0
    $a = [int]'123'

    $al = [System.Collections.ArrayList]::new()
    [System.Math]::Round(1.323434, 2)
    ```
