################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/%.o MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/%.su MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/%.cyclo: ../MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/%.c MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.cyclo ./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.d ./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.o ./MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-MiddleWare-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

