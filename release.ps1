$msBuild = "msbuild"
try
{
    & $msBuild /version
    Write-Host "Likely on Linux/macOS."
}
catch
{
    Write-Host "MSBuild doesn't exist. Use vswhere to locate MSBuild."

    # Use environment-aware path for Program Files (x86) with fallback to Program Files
    $programFilesX86 = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ProgramFilesX86)
    if ([string]::IsNullOrEmpty($programFilesX86)) {
        $programFilesX86 = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ProgramFiles)
    }

    $vswhere = Join-Path $programFilesX86 "Microsoft Visual Studio\Installer\vswhere.exe"
    if (Test-Path $vswhere)
    {
        # Query vswhere for the latest instance that has MSBuild
        $installDir = & $vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath 2>$null
        if ($installDir)
        {
            # Prefer the Current MSBuild path, fall back to 15.0 if needed
            $candidate1 = Join-Path $installDir "MSBuild\Current\Bin\MSBuild.exe"
            $candidate2 = Join-Path $installDir "MSBuild\15.0\Bin\MSBuild.exe"

            if (Test-Path $candidate1) { $msBuild = $candidate1 }
            elseif (Test-Path $candidate2) { $msBuild = $candidate2 }
            else { Write-Host "MSBuild not found under installation path returned by vswhere: $installDir" }
        }
        else
        {
            Write-Host "vswhere found but no suitable Visual Studio instance with MSBuild component."
        }
    }
    else
    {
        Write-Host "vswhere not found at '$vswhere'. Falling back to VSSetup module."

        Install-Module VSSetup -Scope CurrentUser -Force
        $instance = Get-VSSetupInstance -All | Select-VSSetupInstance -Require 'Microsoft.Component.MSBuild' -Latest
        $installDir = $instance.installationPath
        $msBuild = Join-Path $installDir 'MSBuild\15.0\Bin\MSBuild.exe'
    }

    if (-not [string]::IsNullOrEmpty($msBuild) -and -not ([System.IO.File]::Exists($msBuild)))
    {
        Write-Host "MSBuild doesn't exist. Exit."
        exit 1
    }

    Write-Host "Likely on Windows."
}

Write-Host "MSBuild found. Compile the projects."

$logFile = "build.log"
& $msBuild BasicExample.sln /t:restore /p:Configuration=Release /v:diag /flp:logfile=$logFile`;verbosity=diagnostic
& $msBuild BasicExample.sln /p:Configuration=Release /v:diag /flp:logfile=$logFile`;verbosity=diagnostic`;append=true /p:RunPostBuildEvent=OnBuildSuccess

Write-Host "Compilation finished. Full log written to $logFile"
Write-Host ""
Write-Host "Last 50 lines of build log:"
Get-Content $logFile -Tail 50
