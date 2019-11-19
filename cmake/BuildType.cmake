IF(NOT DEFINED CMAKE_BUILD_TYPE
   OR NOT CMAKE_BUILD_TYPE
   OR NOT ${CMAKE_BUILD_TYPE} MATCHES
      "debug|Debug|DEBUG|release|Release|RELEASE")
    MESSAGE(
        STATUS "CMAKE_BUILD_TYPE is not set or invalid, use Debug as default.")
    SET(CMAKE_BUILD_TYPE "Debug")
ENDIF()

MESSAGE(STATUS "Using build type: ${CMAKE_BUILD_TYPE}.")
