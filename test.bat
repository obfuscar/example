@echo off

for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
  set InstallDir=%%i
)

if exist "%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe" (
  set msBuildExe="%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe"
)
@echo on

set EnableNuGetPackageRestore=true
call %msBuildExe% BasicExample.sln /t:restore /p:Configuration=Release
call %MSBuildExe% BasicExample.sln /p:Configuration=Release /p:OutDir=..\Obfuscator_Input

echo Step 3, execute obfuscation.
call %userprofile%\.nuget\packages\obfuscar\2.2.8\tools\Obfuscar.Console.exe obfuscar.xml
