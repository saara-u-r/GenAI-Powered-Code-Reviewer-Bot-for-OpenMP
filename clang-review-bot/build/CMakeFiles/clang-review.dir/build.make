﻿# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build

# Include any dependencies generated for this target.
include CMakeFiles\clang-review.dir\depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles\clang-review.dir\compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles\clang-review.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\clang-review.dir\flags.make

CMakeFiles\clang-review.dir\main.cpp.obj: CMakeFiles\clang-review.dir\flags.make
CMakeFiles\clang-review.dir\main.cpp.obj: C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\main.cpp
CMakeFiles\clang-review.dir\main.cpp.obj: CMakeFiles\clang-review.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/clang-review.dir/main.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\clang-review.dir\main.cpp.obj.d --working-dir=C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build --filter-prefix="Note: including file: " -- C:\PROGRA~1\MIB055~1\2022\Preview\VC\Tools\MSVC\1444~1.352\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\clang-review.dir\main.cpp.obj /FdCMakeFiles\clang-review.dir\ /FS -c C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\main.cpp
<<

CMakeFiles\clang-review.dir\main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clang-review.dir/main.cpp.i"
	C:\PROGRA~1\MIB055~1\2022\Preview\VC\Tools\MSVC\1444~1.352\bin\Hostx64\x64\cl.exe > CMakeFiles\clang-review.dir\main.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\main.cpp
<<

CMakeFiles\clang-review.dir\main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clang-review.dir/main.cpp.s"
	C:\PROGRA~1\MIB055~1\2022\Preview\VC\Tools\MSVC\1444~1.352\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\clang-review.dir\main.cpp.s /c C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\main.cpp
<<

# Object files for target clang-review
clang__review_OBJECTS = \
"CMakeFiles\clang-review.dir\main.cpp.obj"

# External object files for target clang-review
clang__review_EXTERNAL_OBJECTS =

clang-review.exe: CMakeFiles\clang-review.dir\main.cpp.obj
clang-review.exe: CMakeFiles\clang-review.dir\build.make
clang-review.exe: CMakeFiles\clang-review.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable clang-review.exe"
	"C:\Program Files\CMake\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\clang-review.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100261~1.0\x64\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100261~1.0\x64\mt.exe --manifests -- C:\PROGRA~1\MIB055~1\2022\Preview\VC\Tools\MSVC\1444~1.352\bin\Hostx64\x64\link.exe /nologo @CMakeFiles\clang-review.dir\objects1.rsp @<<
 /out:clang-review.exe /implib:clang-review.lib /pdb:C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build\clang-review.pdb /version:0.0 /machine:x64 /debug /INCREMENTAL /subsystem:console  kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\clang-review.dir\build: clang-review.exe
.PHONY : CMakeFiles\clang-review.dir\build

CMakeFiles\clang-review.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\clang-review.dir\cmake_clean.cmake
.PHONY : CMakeFiles\clang-review.dir\clean

CMakeFiles\clang-review.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build C:\Users\raksh\OneDrive\Desktop\cdd\GenAI-Powered-Code-Reviewer-Bot-for-OpenMP\clang-review-bot\build\CMakeFiles\clang-review.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles\clang-review.dir\depend

