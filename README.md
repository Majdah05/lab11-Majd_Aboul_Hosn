# EECE 435L – Lab 11: Configuration and Deployment Tools
**Majd Aboul Hosn** – solo submission

A "Hello, World from Majd_AboulHosn!" application packaged three ways:

| Package | File | Tool |
|---|---|---|
| Windows MSI (graded) | [`packages/helloworld_majd_aboulhosn.msi`](packages/helloworld_majd_aboulhosn.msi) | WiX Toolset v5.0.2 |
| Debian DEB (graded) | [`packages/helloworld_majd_aboulhosn.deb`](packages/helloworld_majd_aboulhosn.deb) | `dpkg -b` / `dpkg-deb` (WSL Ubuntu) |
| RedHat RPM (optional) | [`packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm`](packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm) | `rpmbuild` (WSL Ubuntu) |

## Repository layout
```
windows/      C# source (HelloWorld.cs), WiX installer (Product.wxs), README.md, HelpGuide.txt, build.ps1
linux/        C source (helloworld.c), README.md, user_guide.txt, build_deb.sh, build_rpm.sh, myapp.spec
packages/     the built .msi, .deb and .rpm
metadata/     Debian control file, RPM spec, WiX source, MSI table dump, dpkg/rpm info output
screenshots/  proof of package creation, installation and execution
source.zip    zip of the source code (windows/ + linux/)
Lab11_Report_Majd_AboulHosn.docx   lab report with screenshots and discussion
```

## How to compile and run
### Windows
```powershell
cd windows
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /out:helloworld.exe HelloWorld.cs
.\helloworld.exe
dotnet tool install --global wix --version 5.0.2
wix build Product.wxs -arch x64 -o ..\packages\helloworld_majd_aboulhosn.msi
msiexec /i ..\packages\helloworld_majd_aboulhosn.msi /qb
& "$env:LOCALAPPDATA\Programs\HelloWorld_Majd_AboulHosn\helloworld.exe"
```
### Linux (Ubuntu / WSL)
```bash
cd linux
sudo apt install gcc dpkg-dev fakeroot rpm
gcc -o helloworld helloworld.c && ./helloworld
./build_deb.sh                      # -> packages/helloworld_majd_aboulhosn.deb
sudo dpkg -i ../packages/helloworld_majd_aboulhosn.deb
dpkg -l | grep helloworld
helloworld
./build_rpm.sh                      # optional -> packages/*.rpm
```

## Screenshots
| # | Shows |
|---|---|
| 01 | WiX build of the MSI (csc compile + `wix build`) |
| 02 | MSI metadata: Property, Feature, Component, File, Directory tables |
| 03 | `msiexec /i ... /qb` install, installed files, running the installed app |
| 04 | App listed in Settings › Apps › Installed apps |
| 05 | App listed in Control Panel › Programs and Features |
| 06 | DEB creation with `dpkg -b` and the control file |
| 07 | `dpkg-deb -I` / `dpkg-deb -c` package metadata and contents |
| 08 | `dpkg -i`, `dpkg -l \| grep helloworld`, `apt list --installed`, running `helloworld` |
| 09 | Optional RPM build with `rpmbuild -ba`, `rpm -qip`, `rpm -qlp` |
