# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dennis/src/vxi-ws-server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dennis/src/vxi-ws-server

# Include any dependencies generated for this target.
include CMakeFiles/vxi-ws-server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vxi-ws-server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vxi-ws-server.dir/flags.make

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o: CMakeFiles/vxi-ws-server.dir/flags.make
CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o: vxi-ws-server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dennis/src/vxi-ws-server/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o   -c /home/dennis/src/vxi-ws-server/vxi-ws-server.c

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/dennis/src/vxi-ws-server/vxi-ws-server.c > CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.i

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/dennis/src/vxi-ws-server/vxi-ws-server.c -o CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.s

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.requires:

.PHONY : CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.requires

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.provides: CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.requires
	$(MAKE) -f CMakeFiles/vxi-ws-server.dir/build.make CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.provides.build
.PHONY : CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.provides

CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.provides.build: CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o


# Object files for target vxi-ws-server
vxi__ws__server_OBJECTS = \
"CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o"

# External object files for target vxi-ws-server
vxi__ws__server_EXTERNAL_OBJECTS =

vxi-ws-server: CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o
vxi-ws-server: CMakeFiles/vxi-ws-server.dir/build.make
vxi-ws-server: CMakeFiles/vxi-ws-server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dennis/src/vxi-ws-server/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable vxi-ws-server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vxi-ws-server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vxi-ws-server.dir/build: vxi-ws-server

.PHONY : CMakeFiles/vxi-ws-server.dir/build

CMakeFiles/vxi-ws-server.dir/requires: CMakeFiles/vxi-ws-server.dir/vxi-ws-server.c.o.requires

.PHONY : CMakeFiles/vxi-ws-server.dir/requires

CMakeFiles/vxi-ws-server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vxi-ws-server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vxi-ws-server.dir/clean

CMakeFiles/vxi-ws-server.dir/depend:
	cd /home/dennis/src/vxi-ws-server && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dennis/src/vxi-ws-server /home/dennis/src/vxi-ws-server /home/dennis/src/vxi-ws-server /home/dennis/src/vxi-ws-server /home/dennis/src/vxi-ws-server/CMakeFiles/vxi-ws-server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vxi-ws-server.dir/depend
