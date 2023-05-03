################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/libs/lwip/src/core/altcp.c \
../src/libs/lwip/src/core/altcp_alloc.c \
../src/libs/lwip/src/core/altcp_tcp.c \
../src/libs/lwip/src/core/def.c \
../src/libs/lwip/src/core/dns.c \
../src/libs/lwip/src/core/inet_chksum.c \
../src/libs/lwip/src/core/init.c \
../src/libs/lwip/src/core/ip.c \
../src/libs/lwip/src/core/mem.c \
../src/libs/lwip/src/core/memp.c \
../src/libs/lwip/src/core/netif.c \
../src/libs/lwip/src/core/pbuf.c \
../src/libs/lwip/src/core/raw.c \
../src/libs/lwip/src/core/stats.c \
../src/libs/lwip/src/core/sys.c \
../src/libs/lwip/src/core/tcp.c \
../src/libs/lwip/src/core/tcp_in.c \
../src/libs/lwip/src/core/tcp_out.c \
../src/libs/lwip/src/core/timeouts.c \
../src/libs/lwip/src/core/udp.c 

C_DEPS += \
./src/libs/lwip/src/core/altcp.d \
./src/libs/lwip/src/core/altcp_alloc.d \
./src/libs/lwip/src/core/altcp_tcp.d \
./src/libs/lwip/src/core/def.d \
./src/libs/lwip/src/core/dns.d \
./src/libs/lwip/src/core/inet_chksum.d \
./src/libs/lwip/src/core/init.d \
./src/libs/lwip/src/core/ip.d \
./src/libs/lwip/src/core/mem.d \
./src/libs/lwip/src/core/memp.d \
./src/libs/lwip/src/core/netif.d \
./src/libs/lwip/src/core/pbuf.d \
./src/libs/lwip/src/core/raw.d \
./src/libs/lwip/src/core/stats.d \
./src/libs/lwip/src/core/sys.d \
./src/libs/lwip/src/core/tcp.d \
./src/libs/lwip/src/core/tcp_in.d \
./src/libs/lwip/src/core/tcp_out.d \
./src/libs/lwip/src/core/timeouts.d \
./src/libs/lwip/src/core/udp.d 

OBJS += \
./src/libs/lwip/src/core/altcp.o \
./src/libs/lwip/src/core/altcp_alloc.o \
./src/libs/lwip/src/core/altcp_tcp.o \
./src/libs/lwip/src/core/def.o \
./src/libs/lwip/src/core/dns.o \
./src/libs/lwip/src/core/inet_chksum.o \
./src/libs/lwip/src/core/init.o \
./src/libs/lwip/src/core/ip.o \
./src/libs/lwip/src/core/mem.o \
./src/libs/lwip/src/core/memp.o \
./src/libs/lwip/src/core/netif.o \
./src/libs/lwip/src/core/pbuf.o \
./src/libs/lwip/src/core/raw.o \
./src/libs/lwip/src/core/stats.o \
./src/libs/lwip/src/core/sys.o \
./src/libs/lwip/src/core/tcp.o \
./src/libs/lwip/src/core/tcp_in.o \
./src/libs/lwip/src/core/tcp_out.o \
./src/libs/lwip/src/core/timeouts.o \
./src/libs/lwip/src/core/udp.o 

SREC += \
porting_lwip.srec 

MAP += \
porting_lwip.map 


# Each subdirectory must supply rules for building sources it contributes
src/libs/lwip/src/core/%.o: ../src/libs/lwip/src/core/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/api" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/instances" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/src/rm_freertos_port" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/aws/amazon-freertos/freertos_kernel/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_gen" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg/bsp" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/aws" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/lwip/src/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/freertos/include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

