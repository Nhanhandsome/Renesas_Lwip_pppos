################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/libs/lwip/src/api/api_lib.c \
../src/libs/lwip/src/api/api_msg.c \
../src/libs/lwip/src/api/err.c \
../src/libs/lwip/src/api/if_api.c \
../src/libs/lwip/src/api/netbuf.c \
../src/libs/lwip/src/api/netdb.c \
../src/libs/lwip/src/api/netifapi.c \
../src/libs/lwip/src/api/sockets.c \
../src/libs/lwip/src/api/tcpip.c 

C_DEPS += \
./src/libs/lwip/src/api/api_lib.d \
./src/libs/lwip/src/api/api_msg.d \
./src/libs/lwip/src/api/err.d \
./src/libs/lwip/src/api/if_api.d \
./src/libs/lwip/src/api/netbuf.d \
./src/libs/lwip/src/api/netdb.d \
./src/libs/lwip/src/api/netifapi.d \
./src/libs/lwip/src/api/sockets.d \
./src/libs/lwip/src/api/tcpip.d 

OBJS += \
./src/libs/lwip/src/api/api_lib.o \
./src/libs/lwip/src/api/api_msg.o \
./src/libs/lwip/src/api/err.o \
./src/libs/lwip/src/api/if_api.o \
./src/libs/lwip/src/api/netbuf.o \
./src/libs/lwip/src/api/netdb.o \
./src/libs/lwip/src/api/netifapi.o \
./src/libs/lwip/src/api/sockets.o \
./src/libs/lwip/src/api/tcpip.o 

SREC += \
porting_lwip.srec 

MAP += \
porting_lwip.map 


# Each subdirectory must supply rules for building sources it contributes
src/libs/lwip/src/api/%.o: ../src/libs/lwip/src/api/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/api" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/instances" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/src/rm_freertos_port" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/aws/amazon-freertos/freertos_kernel/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_gen" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg/bsp" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/aws" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/lwip/src/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/freertos/include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

