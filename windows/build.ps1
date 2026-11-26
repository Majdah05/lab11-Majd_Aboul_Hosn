# Builds helloworld.exe and the MSI. Run from the windows/ folder.
& "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe" /nologo /out:helloworld.exe HelloWorld.cs
wix build Product.wxs -arch x64 -o ..\packages\helloworld_majd_aboulhosn.msi
