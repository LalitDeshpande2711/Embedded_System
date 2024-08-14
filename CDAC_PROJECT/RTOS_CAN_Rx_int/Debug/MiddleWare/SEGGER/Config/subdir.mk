################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.c 

OBJS += \
./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o 

C_DEPS += \
./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/SEGGER/Config/%.o MiddleWare/SEGGER/Config/%.su MiddleWare/SEGGER/Config/%.cyclo: ../MiddleWare/SEGGER/Config/%.c MiddleWare/SEGGER/Config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-SEGGER-2f-Config

clean-MiddleWare-2f-SEGGER-2f-Config:
	-$(RM) ./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.cyclo ./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d ./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o ./MiddleWare/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.su

.PHONY: clean-MiddleWare-2f-SEGGER-2f-Config

