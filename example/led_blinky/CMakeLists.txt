INCLUDE(${CMAKE_SOURCE_DIR}/cmake/Utils.cmake)

ADD_EXECUTABLE_CONV(led_blinky main.cc)

TARGET_LINK_LIBRARIES(led_blinky drivers_fsl_gpio drivers_fsl_clock drivers_fsl_common drivers_fsl_reset)

