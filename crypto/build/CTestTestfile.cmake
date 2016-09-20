# CMake generated Testfile for 
# Source directory: /home/codyscherer/Downloads/cryptopp564
# Build directory: /home/codyscherer/Downloads/cryptopp564/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(build_cryptest "/usr/bin/cmake" "--build" "/home/codyscherer/Downloads/cryptopp564/build" "--target" "cryptest")
ADD_TEST(cryptest "/home/codyscherer/Downloads/cryptopp564/build/cryptest.exe" "v")
SET_TESTS_PROPERTIES(cryptest PROPERTIES  DEPENDS "build_cryptest")
