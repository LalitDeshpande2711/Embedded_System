################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/SEGGER/SEGGER/SEGGER_RTT.c \
../MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.c \
../MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../MiddleWare/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.o \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.d \
./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/SEGGER/SEGGER/%.o MiddleWare/SEGGER/SEGGER/%.su MiddleWare/SEGGER/SEGGER/%.cyclo: ../MiddleWare/SEGGER/SEGGER/%.c MiddleWare/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
MiddleWare/SEGGER/SEGGER/%.o: ../MiddleWare/SEGGER/SEGGER/%.S MiddleWare/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-MiddleWare-2f-SEGGER-2f-SEGGER

clean-MiddleWare-2f-SEGGER-2f-SEGGER:
	-$(RM) ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.cyclo ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.d ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.o ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT.su ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.cyclo ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.d ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.o ./MiddleWare/SEGGER/SEGGER/SEGGER_RTT_printf.su ./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.cyclo ./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.o ./MiddleWare/SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-MiddleWare-2f-SEGGER-2f-SEGGER

