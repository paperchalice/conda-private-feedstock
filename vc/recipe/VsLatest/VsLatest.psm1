$Env:DISTUTILS_USE_SDK = $true
$Env:CC = 'cl.exe'
$Env:CXX = 'cl.exe'
$Env:LD = 'link.exe'

$vswhere = vswhere -format json -latest -utf8 | ConvertFrom-Json
$vs_ver_major = $vswhere.catalog.productLine -replace 'Dev'

Import-Module "$($vswhere.installationPath)\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell $vswhere.instanceId -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"

# CMake environments
if ($Env:CONDA_BUILD) {
    $Env:CMAKE_BUILD_TYPE = 'MinSizeRel'
    $Env:CMAKE_GENERATOR = "Visual Studio $vs_ver_major $($vswhere.catalog.productLineVersion)"
    $Env:CMAKE_GENERATOR_PLATFORM = 'x64'
    $Env:CMAKE_INSTALL_PREFIX = $LIBRARY_PREFIX
    $Env:CFLAGS = "/nologo /Zc:inline /Zc:preprocessor /utf-8 " +
    "/DWIN32 /D_WINDOWS /DNDEBUG"
    $Env:CXXFLAGS = "/nologo /permissive- /Zc:__cplusplus /Zc:checkGwOdr /Zc:externConstexpr /Zc:inline /Zc:preprocessor " +
    "/Zc:referenceBinding /Zc:rvalueCast /Zc:templateScope /utf-8 " +
    "/DWIN32 /D_WINDOWS /DNDEBUG"

    $CMAKE_BUILD_TYPE = $Env:CMAKE_BUILD_TYPE
    Export-ModuleMember -Variable "CMAKE_BUILD_TYPE"
}

function Enter-M2 {
    $Env:CFLAGS = ($Env:CFLAGS -replace '/', '-') + ' -O1 -MD'
    $Env:CXXFLAGS = ($Env:CXXFLAGS -replace '/', '-') + ' -O1 -MD'
    $Env:CC = 'compile cl'
    $Env:CXX = 'compile cl'
    $Env:AR = 'ar-lib lib'
    $Env:WINDRES = 'windres-rc rc'
    $Env:INCLUDE = "$Env:BUILD_PREFIX\Library\include;$Env:INCLUDE"
    $Env:LIB = "$Env:BUILD_PREFIX\Library\lib;$Env:LIB"
}
Export-ModuleMember -Function "Enter-M2"
