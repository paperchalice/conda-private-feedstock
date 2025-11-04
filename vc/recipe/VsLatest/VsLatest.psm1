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
    [string[]]$cflag_list = @(
        ,'-nologo'
        ,'-MP'
        ,'-Zc:inline'
        ,'-Zc:preprocessor'
        ,'-utf-8'
        ,'-DWIN32'
        ,'-D_WINDOWS'
        ,'-DNDEBUG'
        ,'-I', $($Env:LIBRARY_INC.Replace('\', '/'))
    )
    [string[]]$cxxflag_list = $cflag_list + @(
        ,'-permissive-'
        ,'-Zc:__cplusplus'
        ,'-Zc:checkGwOdr'
        ,'-Zc:externConstexpr'
        , '-Zc:referenceBinding'
        , '-Zc:rvalueCast',
        , '-Zc:templateScope'
    )
    [string[]]$ldflags_list = @(
        ,'-NOLOGO'
        ,'-INCREMENTAL:NO'
        ,  "-LIBPATH:$($Env:LIBRARY_LIB.Replace('\', '/'))"
    )
    $Env:CMAKE_BUILD_TYPE = 'MinSizeRel'
    $Env:CMAKE_GENERATOR = "Visual Studio $vs_ver_major $($vswhere.catalog.productLineVersion)"
    $Env:CMAKE_GENERATOR_PLATFORM = 'x64'
    $Env:CMAKE_INSTALL_PREFIX = $LIBRARY_PREFIX.Replace('\', '/')
    $Env:CFLAGS = $cflag_list -join ' '
    $Env:CXXFLAGS = $cxxflag_list -join ' '
    $Env:LDFLAGS = $ldflags_list -join ' '
    $Env:INCLUDE = "$Env:LIBRARY_INC;$Env:INCLUDE"
    $Env:LIB = "$Env:LIBRARY_LIB;$Env:LIB"

    $CMAKE_BUILD_TYPE = $Env:CMAKE_BUILD_TYPE
    Export-ModuleMember -Variable "CMAKE_BUILD_TYPE"
}

function Enter-M2 {
    $Env:CFLAGS += ' -O1 -MD'
    $Env:CXXFLAGS += ' -O1 -MD'
    $Env:CC = 'compile cl'
    $Env:CXX = 'compile cl'
    $Env:AR = 'ar-lib lib'
    $Env:WINDRES = 'windres-rc rc'
}
Export-ModuleMember -Function "Enter-M2"
