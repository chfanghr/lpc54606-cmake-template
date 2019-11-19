//
// Created by 方泓睿 on 2019/11/19.
//

#include <iostream>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_gpio.h"
#include "LPC54606.h"

const auto led_port = 1u;
const auto led_pin = 12u;
volatile uint32_t sys_tick_counter;

extern "C" void SysTick_Handler(void) {
  if (sys_tick_counter != 0u)
	sys_tick_counter--;
}

void SysTick_DelayTicks(uint32_t n) {
  sys_tick_counter = n;
  while (sys_tick_counter != 0);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmissing-noreturn"
int main() {
  BOARD_InitBootPins();
  BOARD_InitBootClocks();
  BOARD_InitBootPeripherals();

//  std::cout<<"Hello World"<<std::endl;

  auto led_config = gpio_pin_config_t{
	  kGPIO_DigitalOutput,
	  0
  };

  GPIO_PortInit(GPIO, led_port);
  GPIO_PinInit(GPIO, led_port, led_pin, &led_config);

  if (SysTick_Config(SystemCoreClock / 1000U))while (true);

  while (true) {
	SysTick_DelayTicks(1000U);
	GPIO_PortToggle(GPIO, led_port, 1u << led_pin);
  }

  return 0;
}
#pragma clang diagnostic pop