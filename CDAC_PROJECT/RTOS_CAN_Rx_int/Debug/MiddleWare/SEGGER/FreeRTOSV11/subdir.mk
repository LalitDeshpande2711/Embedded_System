################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/SEGGER/FreeRTOSV11/%.o MiddleWare/SEGGER/FreeRTOSV11/%.su MiddleWare/SEGGER/FreeRTOSV11/%.cyclo: ../MiddleWare/SEGGER/FreeRTOSV11/%.c MiddleWare/SEGGER/FreeRTOSV11/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-SEGGER-2f-FreeRTOSV11

clean-MiddleWare-2f-SEGGER-2f-FreeRTOSV11:
	-$(RM) ./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.cyclo ./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.d ./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.o ./MiddleWare/SEGGER/FreeRTOSV11/SEGGER_SYSVIEW_FreeRTOS.su

.PHONY: clean-MiddleWare-2f-SEGGER-2f-FreeRTOSV11

