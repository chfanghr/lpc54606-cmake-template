INCLUDE_DIRECTORIES(
    ${CMAKE_SOURCE_DIR}/CMSIS
    ${CMAKE_SOURCE_DIR}/CMSIS_driver
    ${CMAKE_SOURCE_DIR}/board
    ${CMAKE_SOURCE_DIR}/device
    ${CMAKE_SOURCE_DIR}/component
    ${CMAKE_SOURCE_DIR}/component/lists
    ${CMAKE_SOURCE_DIR}/drivers
    ${CMAKE_SOURCE_DIR}/source
    ${CMAKE_SOURCE_DIR}/startup)

LINK_DIRECTORIES(${CMAKE_SOURCE_DIR}/libs)

ADD_LIBRARY(
    board OBJECT
    ${CMAKE_SOURCE_DIR}/board/peripherals.c
    ${CMAKE_SOURCE_DIR}/board/board.c
    ${CMAKE_SOURCE_DIR}/board/pin_mux.c
    ${CMAKE_SOURCE_DIR}/board/clock_config.c
    ${CMAKE_SOURCE_DIR}/board/RTE_Device.h
    ${CMAKE_SOURCE_DIR}/board/peripherals.h
    ${CMAKE_SOURCE_DIR}/board/board.h
    ${CMAKE_SOURCE_DIR}/board/pin_mux.h
    ${CMAKE_SOURCE_DIR}/board/clock_config.h)

ADD_LIBRARY(
    component_lists OBJECT ${CMAKE_SOURCE_DIR}/component/lists/generic_list.c
                           ${CMAKE_SOURCE_DIR}/component/lists/generic_list.h)

ADD_LIBRARY(
    device OBJECT
    ${CMAKE_SOURCE_DIR}/device/system_LPC54606.h
    ${CMAKE_SOURCE_DIR}/device/LPC54606.h
    ${CMAKE_SOURCE_DIR}/device/system_LPC54606.c
    ${CMAKE_SOURCE_DIR}/device/LPC54606_features.h
    ${CMAKE_SOURCE_DIR}/device/fsl_device_registers.h)

ADD_LIBRARY(startup OBJECT ${CMAKE_SOURCE_DIR}/startup/startup_lpc54606.cc)

ADD_LIBRARY(
    drivers OBJECT
    ${CMAKE_SOURCE_DIR}/drivers/fsl_power.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_adc.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_dma.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_common.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_dma.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_cmsis.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_dma.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_dma.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_gpio.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_cmsis.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_gint.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_utick.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_cmsis.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_flexcomm.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_clock.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_wwdt.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_reset.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_cmsis.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_dma.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_common.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_dma.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_adc.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_power.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_dma.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_gpio.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_dma.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_spi.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_cmsis.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_utick.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_cmsis.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_gint.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_reset.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_clock.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_rng.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_flexcomm.h
    ${CMAKE_SOURCE_DIR}/drivers/fsl_wwdt.h) 

ADD_LIBRARY(drivers_fsl_adc OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_adc.c
                                   ${CMAKE_SOURCE_DIR}/drivers/fsl_adc.h)

ADD_LIBRARY(drivers_fsl_clock OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_clock.c
                                     ${CMAKE_SOURCE_DIR}/drivers/fsl_clock.h)

ADD_LIBRARY(drivers_fsl_common OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_common.c
                                      ${CMAKE_SOURCE_DIR}/drivers/fsl_common.h)

ADD_LIBRARY(drivers_fsl_dma OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_dma.c
                                   ${CMAKE_SOURCE_DIR}/drivers/fsl_dma.h)

ADD_LIBRARY(
    drivers_fsl_flexcomm OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_flexcomm.c
                                ${CMAKE_SOURCE_DIR}/drivers/fsl_flexcomm.h)

ADD_LIBRARY(drivers_fsl_gint OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_gint.c
                                    ${CMAKE_SOURCE_DIR}/drivers/fsl_gint.h)

ADD_LIBRARY(drivers_fsl_gpio OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_gpio.c
                                    ${CMAKE_SOURCE_DIR}/drivers/fsl_gpio.h)

ADD_LIBRARY(drivers_fsl_i2c OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c.c
                                   ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c.h)

ADD_LIBRARY(
    drivers_fsl_i2c_cmsis OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_cmsis.c
                                 ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_cmsis.h)

ADD_LIBRARY(
    drivers_fsl_i2c_dma OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_dma.c
                               ${CMAKE_SOURCE_DIR}/drivers/fsl_i2c_dma.h)

ADD_LIBRARY(drivers_fsl_power OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_power.c
                                     ${CMAKE_SOURCE_DIR}/drivers/fsl_power.h)
ADD_LIBRARY(drivers_fsl_reset OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_reset.c
                                     ${CMAKE_SOURCE_DIR}/drivers/fsl_reset.h)
ADD_LIBRARY(drivers_fsl_spi OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_spi.c
                                   ${CMAKE_SOURCE_DIR}/drivers/fsl_spi.h)
ADD_LIBRARY(
    drivers_fsl_spi_cmsis OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_cmsis.c
                                 ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_cmsis.h)
ADD_LIBRARY(
    drivers_fsl_spi_dma OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_dma.c
                               ${CMAKE_SOURCE_DIR}/drivers/fsl_spi_dma.h)

ADD_LIBRARY(drivers_fsl_usart OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_usart.c
                                     ${CMAKE_SOURCE_DIR}/drivers/fsl_usart.h)

ADD_LIBRARY(
    drivers_fsl_usart_cmsis OBJECT
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_cmsis.c
    ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_cmsis.h)

ADD_LIBRARY(
    drivers_fsl_usart_dma OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_dma.c
                                 ${CMAKE_SOURCE_DIR}/drivers/fsl_usart_dma.h)

ADD_LIBRARY(drivers_fsl_utick OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_utick.c
                                     ${CMAKE_SOURCE_DIR}/drivers/fsl_utick.h)

ADD_LIBRARY(drivers_fsl_wwdt OBJECT ${CMAKE_SOURCE_DIR}/drivers/fsl_wwdt.c
                                    ${CMAKE_SOURCE_DIR}/drivers/fsl_wwdt.h)

ADD_LIBRARY(cpp_config OBJECT ${CMAKE_SOURCE_DIR}/source/cpp_config.cc)

ADD_LIBRARY(semihost_hardfault OBJECT ${CMAKE_SOURCE_DIR}/source/semihost_hardfault.c)

SET(CMAKE_EXECUTABLE_SUFFIX .elf)
