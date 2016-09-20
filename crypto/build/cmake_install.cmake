# Install script for directory: /home/codyscherer/Downloads/cryptopp564

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/libcryptopp.so.5.6"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/libcryptopp.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    ENDIF()
  ENDFOREACH()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu" TYPE SHARED_LIBRARY FILES
    "/home/codyscherer/Downloads/cryptopp564/build/libcryptopp.so.5.6"
    "/home/codyscherer/Downloads/cryptopp564/build/libcryptopp.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/libcryptopp.so.5.6"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/libcryptopp.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu" TYPE STATIC_LIBRARY FILES "/home/codyscherer/Downloads/cryptopp564/build/libcryptopp.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cryptopp" TYPE FILE FILES
    "/home/codyscherer/Downloads/cryptopp564/rijndael.h"
    "/home/codyscherer/Downloads/cryptopp564/modexppc.h"
    "/home/codyscherer/Downloads/cryptopp564/validate.h"
    "/home/codyscherer/Downloads/cryptopp564/config.h"
    "/home/codyscherer/Downloads/cryptopp564/socketft.h"
    "/home/codyscherer/Downloads/cryptopp564/oaep.h"
    "/home/codyscherer/Downloads/cryptopp564/hmac.h"
    "/home/codyscherer/Downloads/cryptopp564/stdcpp.h"
    "/home/codyscherer/Downloads/cryptopp564/wake.h"
    "/home/codyscherer/Downloads/cryptopp564/vmac.h"
    "/home/codyscherer/Downloads/cryptopp564/mars.h"
    "/home/codyscherer/Downloads/cryptopp564/modarith.h"
    "/home/codyscherer/Downloads/cryptopp564/rc6.h"
    "/home/codyscherer/Downloads/cryptopp564/eax.h"
    "/home/codyscherer/Downloads/cryptopp564/iterhash.h"
    "/home/codyscherer/Downloads/cryptopp564/algebra.h"
    "/home/codyscherer/Downloads/cryptopp564/aes.h"
    "/home/codyscherer/Downloads/cryptopp564/esign.h"
    "/home/codyscherer/Downloads/cryptopp564/winpipes.h"
    "/home/codyscherer/Downloads/cryptopp564/dh.h"
    "/home/codyscherer/Downloads/cryptopp564/blake2.h"
    "/home/codyscherer/Downloads/cryptopp564/bench.h"
    "/home/codyscherer/Downloads/cryptopp564/lubyrack.h"
    "/home/codyscherer/Downloads/cryptopp564/nr.h"
    "/home/codyscherer/Downloads/cryptopp564/queue.h"
    "/home/codyscherer/Downloads/cryptopp564/dmac.h"
    "/home/codyscherer/Downloads/cryptopp564/gfpcrypt.h"
    "/home/codyscherer/Downloads/cryptopp564/factory.h"
    "/home/codyscherer/Downloads/cryptopp564/wait.h"
    "/home/codyscherer/Downloads/cryptopp564/sosemanuk.h"
    "/home/codyscherer/Downloads/cryptopp564/cmac.h"
    "/home/codyscherer/Downloads/cryptopp564/gost.h"
    "/home/codyscherer/Downloads/cryptopp564/resource.h"
    "/home/codyscherer/Downloads/cryptopp564/ripemd.h"
    "/home/codyscherer/Downloads/cryptopp564/polynomi.h"
    "/home/codyscherer/Downloads/cryptopp564/seal.h"
    "/home/codyscherer/Downloads/cryptopp564/words.h"
    "/home/codyscherer/Downloads/cryptopp564/sha3.h"
    "/home/codyscherer/Downloads/cryptopp564/files.h"
    "/home/codyscherer/Downloads/cryptopp564/oids.h"
    "/home/codyscherer/Downloads/cryptopp564/md2.h"
    "/home/codyscherer/Downloads/cryptopp564/whrlpool.h"
    "/home/codyscherer/Downloads/cryptopp564/gf256.h"
    "/home/codyscherer/Downloads/cryptopp564/misc.h"
    "/home/codyscherer/Downloads/cryptopp564/integer.h"
    "/home/codyscherer/Downloads/cryptopp564/default.h"
    "/home/codyscherer/Downloads/cryptopp564/md4.h"
    "/home/codyscherer/Downloads/cryptopp564/square.h"
    "/home/codyscherer/Downloads/cryptopp564/hkdf.h"
    "/home/codyscherer/Downloads/cryptopp564/dll.h"
    "/home/codyscherer/Downloads/cryptopp564/pssr.h"
    "/home/codyscherer/Downloads/cryptopp564/crc.h"
    "/home/codyscherer/Downloads/cryptopp564/pubkey.h"
    "/home/codyscherer/Downloads/cryptopp564/secblock.h"
    "/home/codyscherer/Downloads/cryptopp564/rw.h"
    "/home/codyscherer/Downloads/cryptopp564/algparam.h"
    "/home/codyscherer/Downloads/cryptopp564/arc4.h"
    "/home/codyscherer/Downloads/cryptopp564/mqueue.h"
    "/home/codyscherer/Downloads/cryptopp564/authenc.h"
    "/home/codyscherer/Downloads/cryptopp564/sha.h"
    "/home/codyscherer/Downloads/cryptopp564/ccm.h"
    "/home/codyscherer/Downloads/cryptopp564/fhmqv.h"
    "/home/codyscherer/Downloads/cryptopp564/3way.h"
    "/home/codyscherer/Downloads/cryptopp564/blowfish.h"
    "/home/codyscherer/Downloads/cryptopp564/rabin.h"
    "/home/codyscherer/Downloads/cryptopp564/gf2n.h"
    "/home/codyscherer/Downloads/cryptopp564/adler32.h"
    "/home/codyscherer/Downloads/cryptopp564/filters.h"
    "/home/codyscherer/Downloads/cryptopp564/serpent.h"
    "/home/codyscherer/Downloads/cryptopp564/shacal2.h"
    "/home/codyscherer/Downloads/cryptopp564/gcm.h"
    "/home/codyscherer/Downloads/cryptopp564/zdeflate.h"
    "/home/codyscherer/Downloads/cryptopp564/ec2n.h"
    "/home/codyscherer/Downloads/cryptopp564/network.h"
    "/home/codyscherer/Downloads/cryptopp564/skipjack.h"
    "/home/codyscherer/Downloads/cryptopp564/hmqv.h"
    "/home/codyscherer/Downloads/cryptopp564/md5.h"
    "/home/codyscherer/Downloads/cryptopp564/emsa2.h"
    "/home/codyscherer/Downloads/cryptopp564/simple.h"
    "/home/codyscherer/Downloads/cryptopp564/ecp.h"
    "/home/codyscherer/Downloads/cryptopp564/basecode.h"
    "/home/codyscherer/Downloads/cryptopp564/cbcmac.h"
    "/home/codyscherer/Downloads/cryptopp564/hex.h"
    "/home/codyscherer/Downloads/cryptopp564/shark.h"
    "/home/codyscherer/Downloads/cryptopp564/xtr.h"
    "/home/codyscherer/Downloads/cryptopp564/keccak.h"
    "/home/codyscherer/Downloads/cryptopp564/elgamal.h"
    "/home/codyscherer/Downloads/cryptopp564/trdlocal.h"
    "/home/codyscherer/Downloads/cryptopp564/chacha.h"
    "/home/codyscherer/Downloads/cryptopp564/seed.h"
    "/home/codyscherer/Downloads/cryptopp564/osrng.h"
    "/home/codyscherer/Downloads/cryptopp564/pwdbased.h"
    "/home/codyscherer/Downloads/cryptopp564/nbtheory.h"
    "/home/codyscherer/Downloads/cryptopp564/pch.h"
    "/home/codyscherer/Downloads/cryptopp564/modes.h"
    "/home/codyscherer/Downloads/cryptopp564/channels.h"
    "/home/codyscherer/Downloads/cryptopp564/tiger.h"
    "/home/codyscherer/Downloads/cryptopp564/twofish.h"
    "/home/codyscherer/Downloads/cryptopp564/blumshub.h"
    "/home/codyscherer/Downloads/cryptopp564/rng.h"
    "/home/codyscherer/Downloads/cryptopp564/cast.h"
    "/home/codyscherer/Downloads/cryptopp564/argnames.h"
    "/home/codyscherer/Downloads/cryptopp564/des.h"
    "/home/codyscherer/Downloads/cryptopp564/seckey.h"
    "/home/codyscherer/Downloads/cryptopp564/salsa.h"
    "/home/codyscherer/Downloads/cryptopp564/fltrimpl.h"
    "/home/codyscherer/Downloads/cryptopp564/hrtimer.h"
    "/home/codyscherer/Downloads/cryptopp564/dsa.h"
    "/home/codyscherer/Downloads/cryptopp564/tea.h"
    "/home/codyscherer/Downloads/cryptopp564/mdc.h"
    "/home/codyscherer/Downloads/cryptopp564/zinflate.h"
    "/home/codyscherer/Downloads/cryptopp564/rc2.h"
    "/home/codyscherer/Downloads/cryptopp564/ttmac.h"
    "/home/codyscherer/Downloads/cryptopp564/eprecomp.h"
    "/home/codyscherer/Downloads/cryptopp564/zlib.h"
    "/home/codyscherer/Downloads/cryptopp564/xtrcrypt.h"
    "/home/codyscherer/Downloads/cryptopp564/camellia.h"
    "/home/codyscherer/Downloads/cryptopp564/asn.h"
    "/home/codyscherer/Downloads/cryptopp564/gf2_32.h"
    "/home/codyscherer/Downloads/cryptopp564/fips140.h"
    "/home/codyscherer/Downloads/cryptopp564/rsa.h"
    "/home/codyscherer/Downloads/cryptopp564/base32.h"
    "/home/codyscherer/Downloads/cryptopp564/serpentp.h"
    "/home/codyscherer/Downloads/cryptopp564/pkcspad.h"
    "/home/codyscherer/Downloads/cryptopp564/smartptr.h"
    "/home/codyscherer/Downloads/cryptopp564/trunhash.h"
    "/home/codyscherer/Downloads/cryptopp564/idea.h"
    "/home/codyscherer/Downloads/cryptopp564/base64.h"
    "/home/codyscherer/Downloads/cryptopp564/mqv.h"
    "/home/codyscherer/Downloads/cryptopp564/mersenne.h"
    "/home/codyscherer/Downloads/cryptopp564/strciphr.h"
    "/home/codyscherer/Downloads/cryptopp564/eccrypto.h"
    "/home/codyscherer/Downloads/cryptopp564/randpool.h"
    "/home/codyscherer/Downloads/cryptopp564/ida.h"
    "/home/codyscherer/Downloads/cryptopp564/rc5.h"
    "/home/codyscherer/Downloads/cryptopp564/dh2.h"
    "/home/codyscherer/Downloads/cryptopp564/panama.h"
    "/home/codyscherer/Downloads/cryptopp564/cpu.h"
    "/home/codyscherer/Downloads/cryptopp564/gzip.h"
    "/home/codyscherer/Downloads/cryptopp564/cryptlib.h"
    "/home/codyscherer/Downloads/cryptopp564/luc.h"
    "/home/codyscherer/Downloads/cryptopp564/rdrand.h"
    "/home/codyscherer/Downloads/cryptopp564/safer.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp" TYPE FILE FILES
    "/home/codyscherer/Downloads/cryptopp564/cryptopp-config.cmake"
    "/home/codyscherer/Downloads/cryptopp564/build/cryptopp-config-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp/cryptopp-targets.cmake")
    FILE(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp/cryptopp-targets.cmake"
         "/home/codyscherer/Downloads/cryptopp564/build/CMakeFiles/Export/lib/cmake/cryptopp/cryptopp-targets.cmake")
    IF(EXPORT_FILE_CHANGED)
      FILE(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp/cryptopp-targets-*.cmake")
      IF(OLD_CONFIG_FILES)
        MESSAGE(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp/cryptopp-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        FILE(REMOVE ${OLD_CONFIG_FILES})
      ENDIF(OLD_CONFIG_FILES)
    ENDIF(EXPORT_FILE_CHANGED)
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp" TYPE FILE FILES "/home/codyscherer/Downloads/cryptopp564/build/CMakeFiles/Export/lib/cmake/cryptopp/cryptopp-targets.cmake")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cryptopp" TYPE FILE FILES "/home/codyscherer/Downloads/cryptopp564/build/CMakeFiles/Export/lib/cmake/cryptopp/cryptopp-targets-noconfig.cmake")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/codyscherer/Downloads/cryptopp564/build/cryptest.exe")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cryptest.exe")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cryptopp" TYPE DIRECTORY FILES "/home/codyscherer/Downloads/cryptopp564/TestData")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cryptopp" TYPE DIRECTORY FILES "/home/codyscherer/Downloads/cryptopp564/TestVectors")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/codyscherer/Downloads/cryptopp564/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/codyscherer/Downloads/cryptopp564/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
