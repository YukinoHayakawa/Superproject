@echo off

rem https://stackoverflow.com/questions/7550388/how-do-i-set-the-taglib-character-set-on-windows-to-use-unicode
rem https://stackoverflow.com/questions/16910787/use-existing-visual-studio-project-in-cmake

SETLOCAL
SET _GEN="Visual Studio 16 2019"
SET _ARCH="x64"
SET _FLAGS="/DWIN32 /D_WINDOWS /W3 /GR /EHsc /D_UNICODE"
SET _CMAKE_ARGS=-G %_GEN% -A %_ARCH% -DCMAKE_CXX_FLAGS=%_FLAGS%

rem ### Dependencies of Usagi ###

rem fmt
del /s /q fmt\build
md fmt\build & cd fmt\build
start cmake .. %_CMAKE_ARGS% ^
-Dfmt_GUID_CMAKE:INTERNAL="65806822-06b5-3679-ac9f-629ea69adaf1"
cd ..\..

rem Note: Requires Python to be installed
rem glslang
del /s /q glslang\build
md glslang\build & cd glslang\build
start cmake .. %_CMAKE_ARGS% ^
-Dglslang_GUID_CMAKE:INTERNAL="cfebe9ae-9cf8-30fa-8fc0-31067e861f34" ^
-DHLSL_GUID_CMAKE:INTERNAL="83d45e57-0b6e-3904-b1ac-b366ad1e8a72" ^
-DOGLCompiler_GUID_CMAKE:INTERNAL="0747be93-f3c1-397f-bfc7-2a4ababe7ba7" ^
-DSPIRV_GUID_CMAKE:INTERNAL="ab744df2-2244-3bd4-984e-6c3f82756fb5" ^
-Dglslang-default-resource-limits_GUID_CMAKE:INTERNAL="777ca18f-9fd4-3f3b-be41-0e7f78629123"
cd ..\..

rem SPIRV-Cross
del /s /q SPIRV-Cross\build
md SPIRV-Cross\build & cd SPIRV-Cross\build
start cmake .. %_CMAKE_ARGS% ^
-Dspirv-cross-core_GUID_CMAKE:INTERNAL="5a2df431-3a80-3c06-b9b1-27430b56a29e" ^
-Dspirv-cross-cpp_GUID_CMAKE:INTERNAL="38420c6a-42c5-3ab9-a6e5-59e445ac0e5e" ^
-Dspirv-cross-glsl_GUID_CMAKE:INTERNAL="065dc5c3-4006-3e20-a116-6b66bf3d954b" ^
-Dspirv-cross-hlsl_GUID_CMAKE:INTERNAL="e727a94c-0b46-3335-b1ea-d79477de7681" ^
-Dspirv-cross-msl_GUID_CMAKE:INTERNAL="17861b06-326c-313f-b531-6698f69a7e0a" ^
-Dspirv-cross-reflect_GUID_CMAKE:INTERNAL="383414a1-4e4e-3867-b4d1-a695d8987077" ^
-Dspirv-cross-util_GUID_CMAKE:INTERNAL="88cc132d-bf6f-39b4-af07-17c68a1c42c0"
cd ..\..

rem libnyquist
del /s /q libnyquist\build
md libnyquist\build & cd libnyquist\build
start cmake .. %_CMAKE_ARGS% ^
-Dlibnyquist_GUID_CMAKE:INTERNAL="2567D83A-3050-37AA-ACAE-F9841523146D"
cd ..\..

rem ### Dependencies of Negi ###

rem lua
md lua\build
copy lua.vcxproj lua\build\

ENDLOCAL
