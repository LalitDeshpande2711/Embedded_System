################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MiddleWare/FreeRTOS/croutine.c \
../MiddleWare/FreeRTOS/event_groups.c \
../MiddleWare/FreeRTOS/list.c \
../MiddleWare/FreeRTOS/queue.c \
../MiddleWare/FreeRTOS/stream_buffer.c \
../MiddleWare/FreeRTOS/tasks.c \
../MiddleWare/FreeRTOS/timers.c 

OBJS += \
./MiddleWare/FreeRTOS/croutine.o \
./MiddleWare/FreeRTOS/event_groups.o \
./MiddleWare/FreeRTOS/list.o \
./MiddleWare/FreeRTOS/queue.o \
./MiddleWare/FreeRTOS/stream_buffer.o \
./MiddleWare/FreeRTOS/tasks.o \
./MiddleWare/FreeRTOS/timers.o 

C_DEPS += \
./MiddleWare/FreeRTOS/croutine.d \
./MiddleWare/FreeRTOS/event_groups.d \
./MiddleWare/FreeRTOS/list.d \
./MiddleWare/FreeRTOS/queue.d \
./MiddleWare/FreeRTOS/stream_buffer.d \
./MiddleWare/FreeRTOS/tasks.d \
./MiddleWare/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
MiddleWare/FreeRTOS/%.o MiddleWare/FreeRTOS/%.su MiddleWare/FreeRTOS/%.cyclo: ../MiddleWare/FreeRTOS/%.c MiddleWare/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/include" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/Config" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/FreeRTOSV11" -I"D:/stm/RTOS_CAN_Rx_int/MiddleWare/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MiddleWare-2f-FreeRTOS

clean-MiddleWare-2f-FreeRTOS:
	-$(RM) ./MiddleWare/FreeRTOS/croutine.cyclo ./MiddleWare/FreeRTOS/croutine.d ./MiddleWare/FreeRTOS/croutine.o ./MiddleWare/FreeRTOS/croutine.su ./MiddleWare/FreeRTOS/event_groups.cyclo ./MiddleWare/FreeRTOS/event_groups.d ./MiddleWare/FreeRTOS/event_groups.o ./MiddleWare/FreeRTOS/event_groups.su ./MiddleWare/FreeRTOS/list.cyclo ./MiddleWare/FreeRTOS/list.d ./MiddleWare/FreeRTOS/list.o ./MiddleWare/FreeRTOS/list.su ./MiddleWare/FreeRTOS/queue.cyclo ./MiddleWare/FreeRTOS/queue.d ./MiddleWare/FreeRTOS/queue.o ./MiddleWare/FreeRTOS/queue.su ./MiddleWare/FreeRTOS/stream_buffer.cyclo ./MiddleWare/FreeRTOS/stream_buffer.d ./MiddleWare/FreeRTOS/stream_buffer.o ./MiddleWare/FreeRTOS/stream_buffer.su ./MiddleWare/FreeRTOS/tasks.cyclo ./MiddleWare/FreeRTOS/tasks.d ./MiddleWare/FreeRTOS/tasks.o ./MiddleWare/FreeRTOS/tasks.su ./MiddleWare/FreeRTOS/timers.cyclo ./MiddleWare/FreeRTOS/timers.d ./MiddleWare/FreeRTOS/timers.o ./MiddleWare/FreeRTOS/timers.su

.PHONY: clean-MiddleWare-2f-FreeRTOS

