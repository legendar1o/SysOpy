# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cygdrive/c/Users/kryst/.CLion2017.3/system/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/kryst/.CLion2017.3/system/cygwin_cmake/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /cygdrive/c/Users/kryst/CLionProjects/lab1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/sysopy.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sysopy.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sysopy.dir/flags.make

CMakeFiles/sysopy.dir/library.c.o: CMakeFiles/sysopy.dir/flags.make
CMakeFiles/sysopy.dir/library.c.o: ../library.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sysopy.dir/library.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sysopy.dir/library.c.o   -c /cygdrive/c/Users/kryst/CLionProjects/lab1/library.c

CMakeFiles/sysopy.dir/library.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sysopy.dir/library.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /cygdrive/c/Users/kryst/CLionProjects/lab1/library.c > CMakeFiles/sysopy.dir/library.c.i

CMakeFiles/sysopy.dir/library.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sysopy.dir/library.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /cygdrive/c/Users/kryst/CLionProjects/lab1/library.c -o CMakeFiles/sysopy.dir/library.c.s

CMakeFiles/sysopy.dir/library.c.o.requires:

.PHONY : CMakeFiles/sysopy.dir/library.c.o.requires

CMakeFiles/sysopy.dir/library.c.o.provides: CMakeFiles/sysopy.dir/library.c.o.requires
	$(MAKE) -f CMakeFiles/sysopy.dir/build.make CMakeFiles/sysopy.dir/library.c.o.provides.build
.PHONY : CMakeFiles/sysopy.dir/library.c.o.provides

CMakeFiles/sysopy.dir/library.c.o.provides.build: CMakeFiles/sysopy.dir/library.c.o


CMakeFiles/sysopy.dir/main.c.o: CMakeFiles/sysopy.dir/flags.make
CMakeFiles/sysopy.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/sysopy.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sysopy.dir/main.c.o   -c /cygdrive/c/Users/kryst/CLionProjects/lab1/main.c

CMakeFiles/sysopy.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sysopy.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /cygdrive/c/Users/kryst/CLionProjects/lab1/main.c > CMakeFiles/sysopy.dir/main.c.i

CMakeFiles/sysopy.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sysopy.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /cygdrive/c/Users/kryst/CLionProjects/lab1/main.c -o CMakeFiles/sysopy.dir/main.c.s

CMakeFiles/sysopy.dir/main.c.o.requires:

.PHONY : CMakeFiles/sysopy.dir/main.c.o.requires

CMakeFiles/sysopy.dir/main.c.o.provides: CMakeFiles/sysopy.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/sysopy.dir/build.make CMakeFiles/sysopy.dir/main.c.o.provides.build
.PHONY : CMakeFiles/sysopy.dir/main.c.o.provides

CMakeFiles/sysopy.dir/main.c.o.provides.build: CMakeFiles/sysopy.dir/main.c.o


# Object files for target sysopy
sysopy_OBJECTS = \
"CMakeFiles/sysopy.dir/library.c.o" \
"CMakeFiles/sysopy.dir/main.c.o"

# External object files for target sysopy
sysopy_EXTERNAL_OBJECTS =

libsysopy.a: CMakeFiles/sysopy.dir/library.c.o
libsysopy.a: CMakeFiles/sysopy.dir/main.c.o
libsysopy.a: CMakeFiles/sysopy.dir/build.make
libsysopy.a: CMakeFiles/sysopy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library libsysopy.a"
	$(CMAKE_COMMAND) -P CMakeFiles/sysopy.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sysopy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sysopy.dir/build: libsysopy.a

.PHONY : CMakeFiles/sysopy.dir/build

CMakeFiles/sysopy.dir/requires: CMakeFiles/sysopy.dir/library.c.o.requires
CMakeFiles/sysopy.dir/requires: CMakeFiles/sysopy.dir/main.c.o.requires

.PHONY : CMakeFiles/sysopy.dir/requires

CMakeFiles/sysopy.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sysopy.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sysopy.dir/clean

CMakeFiles/sysopy.dir/depend:
	cd /cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /cygdrive/c/Users/kryst/CLionProjects/lab1 /cygdrive/c/Users/kryst/CLionProjects/lab1 /cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug /cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug /cygdrive/c/Users/kryst/CLionProjects/lab1/cmake-build-debug/CMakeFiles/sysopy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sysopy.dir/depend

