# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/caoheng/.cache/JetBrains/RemoteDev/dist/9e0128be961c6_CLion-2025.1/bin/cmake/linux/x64/bin/cmake

# The command to remove a file.
RM = /home/caoheng/.cache/JetBrains/RemoteDev/dist/9e0128be961c6_CLion-2025.1/bin/cmake/linux/x64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/caoheng/repo/leveldb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/caoheng/repo/leveldb/cmake-build-debug

# Include any dependencies generated for this target.
include third_party/googletest/googletest/CMakeFiles/gtest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include third_party/googletest/googletest/CMakeFiles/gtest.dir/compiler_depend.make

# Include the progress variables for this target.
include third_party/googletest/googletest/CMakeFiles/gtest.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/googletest/googletest/CMakeFiles/gtest.dir/flags.make

third_party/googletest/googletest/CMakeFiles/gtest.dir/codegen:
.PHONY : third_party/googletest/googletest/CMakeFiles/gtest.dir/codegen

third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: third_party/googletest/googletest/CMakeFiles/gtest.dir/flags.make
third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: /home/caoheng/repo/leveldb/third_party/googletest/googletest/src/gtest-all.cc
third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: third_party/googletest/googletest/CMakeFiles/gtest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/caoheng/repo/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o"
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o -MF CMakeFiles/gtest.dir/src/gtest-all.cc.o.d -o CMakeFiles/gtest.dir/src/gtest-all.cc.o -c /home/caoheng/repo/leveldb/third_party/googletest/googletest/src/gtest-all.cc

third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/gtest.dir/src/gtest-all.cc.i"
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/caoheng/repo/leveldb/third_party/googletest/googletest/src/gtest-all.cc > CMakeFiles/gtest.dir/src/gtest-all.cc.i

third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/gtest.dir/src/gtest-all.cc.s"
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/caoheng/repo/leveldb/third_party/googletest/googletest/src/gtest-all.cc -o CMakeFiles/gtest.dir/src/gtest-all.cc.s

# Object files for target gtest
gtest_OBJECTS = \
"CMakeFiles/gtest.dir/src/gtest-all.cc.o"

# External object files for target gtest
gtest_EXTERNAL_OBJECTS =

lib/libgtestd.a: third_party/googletest/googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
lib/libgtestd.a: third_party/googletest/googletest/CMakeFiles/gtest.dir/build.make
lib/libgtestd.a: third_party/googletest/googletest/CMakeFiles/gtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/caoheng/repo/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../lib/libgtestd.a"
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean_target.cmake
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
third_party/googletest/googletest/CMakeFiles/gtest.dir/build: lib/libgtestd.a
.PHONY : third_party/googletest/googletest/CMakeFiles/gtest.dir/build

third_party/googletest/googletest/CMakeFiles/gtest.dir/clean:
	cd /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean.cmake
.PHONY : third_party/googletest/googletest/CMakeFiles/gtest.dir/clean

third_party/googletest/googletest/CMakeFiles/gtest.dir/depend:
	cd /home/caoheng/repo/leveldb/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/caoheng/repo/leveldb /home/caoheng/repo/leveldb/third_party/googletest/googletest /home/caoheng/repo/leveldb/cmake-build-debug /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest /home/caoheng/repo/leveldb/cmake-build-debug/third_party/googletest/googletest/CMakeFiles/gtest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : third_party/googletest/googletest/CMakeFiles/gtest.dir/depend

