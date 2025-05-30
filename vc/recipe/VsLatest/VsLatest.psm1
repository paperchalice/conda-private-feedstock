$Env:DISTUTILS_USE_SDK = $true
$Env:CC = "cl.exe"
$Env:CXX = "cl.exe"

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

    $CMAKE_BUILD_TYPE = $Env:CMAKE_BUILD_TYPE
    Export-ModuleMember -Variable "CMAKE_BUILD_TYPE"
}
