workspace "capybara"
configurations {"Debug", "Release"}
architecture("x86_64", "x86", "ARM", "AARCH64", "RISCV64")
system("linux", "macosx", "windows")

project "capybara-cli"
kind "ConsoleApp"
language "C++"
cppdialect "C++23"

targetdir "bin/%{cfg.system}_%{cfg.architecture}_%{cfg.buildcfg}"
objdir "bin/%{cfg.system}_%{cfg.architecture}_%{cfg.buildcfg}/obj"

files {"**.cpp"}

filter "configurations:Debug"
    runtime "Debug"
    defines {"DEBUG"}
    linktimeoptimization "off"
    optimize "off"
    symbols "full"
    targetname "capybara"

filter "configurations:Release"
    runtime "Release"
    defines {"NDEBUG"}
    linktimeoptimization "on"
    optimize "on"
    symbols "off"
    targetname "capybara"
