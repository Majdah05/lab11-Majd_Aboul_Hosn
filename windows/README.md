# Hello World (Windows) - Majd Aboul Hosn

A minimal C# console application that prints `Hello, World from Majd_AboulHosn!`.

## Build the executable
```powershell
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /out:helloworld.exe HelloWorld.cs
```

## Build the MSI (WiX Toolset v5)
```powershell
dotnet tool install --global wix --version 5.0.2
wix build Product.wxs -arch x64 -o helloworld_majd_aboulhosn.msi
```
(or simply run `.\build.ps1`)

## Install / run / uninstall
The package is a per-user MSI, so no administrator rights are needed.
```powershell
msiexec /i helloworld_majd_aboulhosn.msi /qb
& "$env:LOCALAPPDATA\Programs\HelloWorld_Majd_AboulHosn\helloworld.exe"
msiexec /x helloworld_majd_aboulhosn.msi /qb
```
