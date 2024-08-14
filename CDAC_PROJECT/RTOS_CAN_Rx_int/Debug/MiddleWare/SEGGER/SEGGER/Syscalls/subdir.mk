################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c 

OBJS += \
./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o 

C_DEPS += \
./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/SEGGER/SEGGER/Syscalls/%.o MiddleWare/SEGGER/SEGGER/Syscalls/%.su MiddleWare/SEGGER/SEGGER/Syscalls/%.cyclo: ../MiddleWare/SEGGER/SEGGER/Syscalls/%.c MiddleWare/SEGGER/SEGGER/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-SEGGER-2f-SEGGER-2f-Syscalls

clean-MiddleWare-2f-SEGGER-2f-SEGGER-2f-Syscalls:
	-$(RM) ./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.cyclo ./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o ./MiddleWare/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.su

.PHONY: clean-MiddleWare-2f-SEGGER-2f-SEGGER-2f-Syscalls

