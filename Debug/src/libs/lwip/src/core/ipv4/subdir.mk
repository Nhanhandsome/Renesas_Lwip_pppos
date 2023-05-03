################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/libs/lwip/src/core/ipv4/autoip.c \
../src/libs/lwip/src/core/ipv4/dhcp.c \
../src/libs/lwip/src/core/ipv4/etharp.c \
../src/libs/lwip/src/core/ipv4/icmp.c \
../src/libs/lwip/src/core/ipv4/igmp.c \
../src/libs/lwip/src/core/ipv4/ip4.c \
../src/libs/lwip/src/core/ipv4/ip4_addr.c \
../src/libs/lwip/src/core/ipv4/ip4_frag.c 

C_DEPS += \
./src/libs/lwip/src/core/ipv4/autoip.d \
./src/libs/lwip/src/core/ipv4/dhcp.d \
./src/libs/lwip/src/core/ipv4/etharp.d \
./src/libs/lwip/src/core/ipv4/icmp.d \
./src/libs/lwip/src/core/ipv4/igmp.d \
./src/libs/lwip/src/core/ipv4/ip4.d \
./src/libs/lwip/src/core/ipv4/ip4_addr.d \
./src/libs/lwip/src/core/ipv4/ip4_frag.d 

OBJS += \
./src/libs/lwip/src/core/ipv4/autoip.o \
./src/libs/lwip/src/core/ipv4/dhcp.o \
./src/libs/lwip/src/core/ipv4/etharp.o \
./src/libs/lwip/src/core/ipv4/icmp.o \
./src/libs/lwip/src/core/ipv4/igmp.o \
./src/libs/lwip/src/core/ipv4/ip4.o \
./src/libs/lwip/src/core/ipv4/ip4_addr.o \
./src/libs/lwip/src/core/ipv4/ip4_frag.o 

SREC += \
porting_lwip.srec 

MAP += \
porting_lwip.map 


# Each subdirectory must supply rules for building sources it contributes
src/libs/lwip/src/core/ipv4/%.o: ../src/libs/lwip/src/core/ipv4/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/api" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/instances" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/src/rm_freertos_port" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/aws/amazon-freertos/freertos_kernel/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_gen" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg/bsp" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/aws" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/lwip/src/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/freertos/include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

