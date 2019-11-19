# flags.cmake: This file set flags for the linker and compiler

MESSAGE(STATUS "Project root located at: ${CMAKE_SOURCE_DIR}.")

# Define Flags for linker 1) Common flags
SET(LINKER_COMMON_XLINKER_FLAGS
    "-Xlinker --gc-sections -Xlinker -print-memory-usage  -Xlinker --sort-section=alignment"
)
SET(LINKER_COMMON_FLAGS "-nostdlib ${LINKER_COMMON_XLINKER_FLAGS}")
# 2) Special debug/release flags
SET(LINKER_DEBUG_LINKER_SCRIPT_FLAGS "-T${CMAKE_SOURCE_DIR}/linker/debug.ld --coverage")
SET(LINKER_RELEASE_LINKER_SCRIPT_FLAGS
    "-T${CMAKE_SOURCE_DIR}/linker/release.ld")
# 3) Complete debug/release flags
SET(LINKER_DEBUG_FLAGS
    "${LINKER_COMMON_FLAGS} ${LINKER_DEBUG_LINKER_SCRIPT_FLAGS}")
SET(LINKER_RELEASE_FLAGS
    "${LINKER_COMMON_FLAGS} ${LINKER_RELEASE_LINKER_SCRIPT_FLAGS}")

# Define Flags for C/CXX compiler 1) Common CPU flags
SET(CPU_COMMON_DEFINITION_FLAGS
    "-DLPC54606 -DCPU_LPC54606J512BD100 -DCPU_LPC54606J512BD100_cm4")
SET(CPU_COMMON_TYPE_FLAGS
    "-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb")
# 2) Common flags
SET(C_CXX_COMMON_DEFINITION_FLAGS
    "-DFSL_RTOS_BAREMETAL -D__USE_CMSIS -D__MCUXPRESSO -D__NEWLIB__ -DSDK_DEBUGCONSOLE=0"
)
SET(C_CXX_COMMON_FLAGS
    "${C_CXX_COMMON_DEFINITION_FLAGS} ${CPU_COMMON_DEFINITION_FLAGS} ${CPU_COMMON_TYPE_FLAGS} -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fstack-usage -fno-builtin -MMD -MP"
)
# 3) Special debug/release flags
SET(C_CXX_DEBUG_FLAGS "-DDEBUG -O3 -g3 -fprofile-arcs -ftest-coverage")
SET(C_CXX_RELEASE_FLAGS "-DNDEBUG -Os -g")
# 4) Complete common flags
SET(C_COMMON_FLAGS "${C_CXX_COMMON_FLAGS}")
SET(CXX_COMMON_FLAGS "${C_CXX_COMMON_FLAGS} -fno-rtti -fno-exceptions"
)# TODO Indeed exceptions can be use.
# 5) Complete debug/release flags C
SET(C_DEBUG_FLAGS "${C_COMMON_FLAGS} ${C_CXX_DEBUG_FLAGS}")
SET(C_RELEASE_FLAGS "${C_COMMON_FLAGS} ${C_CXX_RELEASE_FLAGS}")
# CXX
SET(CXX_DEBUG_FLAGS "${CXX_COMMON_FLAGS} ${C_CXX_DEBUG_FLAGS}")
SET(CXX_RELEASE_FLAGS "${CXX_COMMON_FLAGS} ${C_CXX_RELEASE_FLAGS}")

# Set flags for CMake 1) Set common flags
SET(CMAKE_C_FLAGS "${C_COMMON_FLAGS}")
SET(CMAKE_CXX_FLAGS "${CXX_COMMON_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS "${LINKER_COMMON_FLAGS}")
# 2) Set debug flags
SET(CMAKE_C_FLAGS_DEBUG "${C_DEBUG_FLAGS}")
SET(CMAKE_CXX_FLAGS_DEBUG "${CXX_DEBUG_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "${LINKER_DEBUG_FLAGS}")
# 3) Set release flags
SET(CMAKE_C_FLAGS_RELEASE "${C_RELEASE_FLAGS}")
SET(CMAKE_CXX_FLAGS_RELEASE "${CXX_RELEASE_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE "${LINKER_RELEASE_FLAGS}")

LINK_DIRECTORIES(${CMAKE_SOURCE_DIR}/linker)

# Note Debug Linker Flags: --nostdlib -L${CMAKE_SOURCE_DIR}/lib -Xlinker
# -Map=<TARGET_NAME>.map -Xlinker --gc-sections -Xlinker -print-memory-usage
# -Xlinker --sort-section=alignment -Xlinker --cref -mcpu=cortex-m4
# -mfpu=fpv4-sp-d16 -mfloat-abi-hard -mthumb
# -T${CMAKE_SOURCE_LIB}/linker/debug.ld
#
# Debug C Compiler Flags: -DLPC54606 -DCPU_LPC54606J512BD100
# -DCPU_LPC54606J512BD100_cmi4 -DFSL_RTOS_BAREMETAL -D__USE_CMSIS
# -DSDK_DEBUGCONSOLE=0 -D__MCUXPRESSO -DDEBUG -D__NEWLIB__ -O0 -g3 -Wall -fno-
# common -ffunction-sections -fdata_sections -ffreestanding -fno-builtin
# -fstack- usage -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -MMD
# -MP
#
# Debug CXX Compiler Flags: -DLPC54606 -DCPU_LPC54606J512BD100
# -DCPU_LPC54606J512BD100_cmi4 -DFSL_RTOS_BAREMETAL -D__USE_CMSIS
# -DSDK_DEBUGCONSOLE=0 -D__MCUXPRESSO -DDEBUG -D__NEWLIB__ -O0 -g3 -Wall -fno-
# common -ffunction-sections -fdata_sections -ffreestanding -fno-builtin
# -fstack- usage -fno-rtti -fno-exceptions -mcpu=cortex-m4 -mfpu=fpv4-sp-d16
# -mfloat-abi= hard -mthumb -MMD -MP
