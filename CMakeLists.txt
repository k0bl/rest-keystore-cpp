cmake_minimum_required (VERSION 2.8.8)
project (pes7-keystore)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wextra")

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.8)
        message(FATAL_ERROR "GCC version >=4.8 required.")
    endif()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 3.3)
        message(FATAL_ERROR "Clang version >=3.3 required.")
    endif()
elseif (MSVC14) #TODO: What about other MSVC versions?
else()
    message(WARNING "Your compiler (${CMAKE_CXX_COMPILER_ID}) has not been tested on this project. Only Clang and GCC has been tested. Please report any problems at the project page on GitHub.")
endif()

SET (Wt_CONNECTOR "wthttp" CACHE STRING "Connector used (wthttp or wtfcgi)")

INCLUDE(cmake/FindWt.cmake)
INCLUDE_DIRECTORIES( ${Wt_INCLUDE_DIR} )
IF ("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    MESSAGE( STATUS "Using Debug " )
    SET(MY_WT
        ${Wt_DEBUG_LIBRARY}
        ${Wt_DBO_DEBUG_LIBRARY}
        ${Wt_DBOPOSTGRES_DEBUG_LIBRARY}
        ${Wt_DBOSQLITE3_DEBUG_LIBRARY}
    )
    IF( "${Wt_CONNECTOR}" STREQUAL "wthttp")
        MESSAGE( STATUS "Using Debug wthttp" )
        SET( MY_WT ${MY_WT} ${Wt_HTTP_DEBUG_LIBRARY})
    ELSE( "${Wt_CONNECTOR}" STREQUAL "wthttp")
        MESSAGE( STATUS "Using Debug wtfcgi")
        SET( MY_WT ${MY_WT} ${Wt_FCGI_DEBUG_LIBRARY})
    ENDIF( "${Wt_CONNECTOR}" STREQUAL "wthttp")
ELSE("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    MESSAGE( STATUS "NOT using Debug " )
    SET(MY_WT
        ${Wt_LIBRARY}
        ${Wt_DBO_LIBRARY}
        ${Wt_DBOPOSTGRES_LIBRARY}
        ${Wt_DBOSQLITE3_LIBRARY}
    )
    IF ( "${Wt_CONNECTOR}" STREQUAL "wthttp" )
        MESSAGE ( STATUS "Using wthttp" )
        SET( MY_WT ${MY_WT} ${Wt_HTTP_LIBRARY})
    ELSE ("${Wt_CONNECTOR}" STREQUAL "wthttp")
        MESSAGE ( STATUS "Using wtfcgi")
        SET( MY_WT ${MY_WT} ${Wt_FCGI_LIBRARY})
    ENDIF ("${Wt_CONNECTOR}" STREQUAL "wthttp")
ENDIF("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")

SET(LIBRARIES
${Wt_LIBRARY}
${Wt_DBO_LIBRARY}
${Wt_DBOPOSTGRES_LIBRARY}
${Wt_DBOSQLITE3_LIBRARY}
boost_random
boost_regex
boost_signals
boost_system
pthread
boost_thread
boost_filesystem
boost_program_options
boost_date_time
)


include_directories(.)

find_package(Threads REQUIRED)

find_package(Boost 1.53.0 COMPONENTS regex system thread filesystem date_time REQUIRED)
include_directories(SYSTEM ${Boost_INCLUDE_DIR})

if(APPLE)
    set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl")
endif()

#TODO: add requirement for version 1.0.1g (can it be done in one line?)
find_package(OpenSSL)

if(OPENSSL_FOUND)
    include_directories(SYSTEM ${OPENSSL_INCLUDE_DIR})

    add_executable(keystore-https-server keystore-https-server.cpp)
    target_link_libraries(keystore-https-server ${Boost_LIBRARIES})
    target_link_libraries(keystore-https-server ${OPENSSL_LIBRARIES})
    target_link_libraries(keystore-https-server ${CMAKE_THREAD_LIBS_INIT})
endif()

add_executable(keystore-http-server keystore-http-server.cpp)
target_link_libraries(keystore-http-server ${Boost_LIBRARIES})
target_link_libraries(keystore-http-server ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(keystore-http-server wt)
target_link_libraries(keystore-http-server wtdbo)
target_link_libraries(keystore-http-server wtdbopostgres)

if(MSYS) #TODO: Is MSYS true when MSVC is true?
    target_link_libraries(keystore-http-server ws2_32 wsock32)
    target_link_libraries(keystore-https-server ws2_32 wsock32)
endif()

#enable_testing()
#add_subdirectory(tests)

install(FILES server_http.hpp client_http.hpp server_https.hpp client_https.hpp DESTINATION include/simple-web-server)
