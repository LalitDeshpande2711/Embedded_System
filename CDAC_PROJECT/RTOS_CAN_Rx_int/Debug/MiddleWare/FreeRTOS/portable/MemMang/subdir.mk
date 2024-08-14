################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/FreeRTOS/portable/MemMang/heap_4.c 

OBJS += \
./MiddleWare/FreeRTOS/portable/MemMang/heap_4.o 

C_DEPS += \
./MiddleWare/FreeRTOS/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/FreeRTOS/portable/MemMang/%.o MiddleWare/FreeRTOS/portable/MemMang/%.su MiddleWare/FreeRTOS/portable/MemMang/%.cyclo: ../MiddleWare/FreeRTOS/portable/MemMang/%.c MiddleWare/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-MemMang

clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./MiddleWare/FreeRTOS/portable/MemMang/heap_4.cyclo ./MiddleWare/FreeRTOS/portable/MemMang/heap_4.d ./MiddleWare/FreeRTOS/portable/MemMang/heap_4.o ./MiddleWare/FreeRTOS/portable/MemMang/heap_4.su

.PHONY: clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-MemMang

