workspace "capybara"
    configurations { "debug", "release" }
    platforms { "x86_64", "x86", "ARM", "ARM64", "RISCV64", "ppc", "ppc64" }

    project "capybara-cli"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++23"
        toolset "clang"

        targetdir "bin/%{cfg.system}_%{cfg.architecture}_%{cfg.buildcfg}"
        objdir "bin/%{cfg.system}_%{cfg.architecture}_%{cfg.buildcfg}/obj"

        files { "**.cpp" }

-- Build Configurations
filter "configurations:debug"
    runtime "Debug"
    defines { "DEBUG" }
    linktimeoptimization "off"
    optimize "off"
    symbols "full"
    targetname "capybara"

filter "configurations:release"
    runtime "Release"
    defines { "NDEBUG" }
    linktimeoptimization "on"
    optimize "on"
    symbols "off"
    targetname "capybara"

-- Architecture Mappings (Idk if this is right, but it should be)
filter "platforms:x86" architecture "x86"
filter "platforms:x86_64" architecture "x86_64"
filter "platforms:ARM" architecture "ARM"
filter "platforms:ARM64" architecture "ARM64"
filter "platforms:RISCV64" architecture "RISCV64"
filter "platforms:ppc" architecture "ppc"
filter "platforms:ppc64" architecture "ppc64"

-- OS Filters
filter "system:windows"
    system "windows"
    targetextension ".exe"
    linkoptions { "-static" }

filter "system:linux"
    system "linux"

filter "system:macosx"
    system "macosx"

filter "system:bsd"
    system "bsd"