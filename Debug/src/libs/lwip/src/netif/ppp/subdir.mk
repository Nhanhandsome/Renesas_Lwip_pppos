################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/libs/lwip/src/netif/ppp/auth.c \
../src/libs/lwip/src/netif/ppp/ccp.c \
../src/libs/lwip/src/netif/ppp/chap-md5.c \
../src/libs/lwip/src/netif/ppp/chap-new.c \
../src/libs/lwip/src/netif/ppp/chap_ms.c \
../src/libs/lwip/src/netif/ppp/demand.c \
../src/libs/lwip/src/netif/ppp/eap.c \
../src/libs/lwip/src/netif/ppp/ecp.c \
../src/libs/lwip/src/netif/ppp/eui64.c \
../src/libs/lwip/src/netif/ppp/fsm.c \
../src/libs/lwip/src/netif/ppp/ipcp.c \
../src/libs/lwip/src/netif/ppp/ipv6cp.c \
../src/libs/lwip/src/netif/ppp/lcp.c \
../src/libs/lwip/src/netif/ppp/magic.c \
../src/libs/lwip/src/netif/ppp/mppe.c \
../src/libs/lwip/src/netif/ppp/multilink.c \
../src/libs/lwip/src/netif/ppp/ppp.c \
../src/libs/lwip/src/netif/ppp/pppapi.c \
../src/libs/lwip/src/netif/ppp/pppcrypt.c \
../src/libs/lwip/src/netif/ppp/pppoe.c \
../src/libs/lwip/src/netif/ppp/pppol2tp.c \
../src/libs/lwip/src/netif/ppp/pppos.c \
../src/libs/lwip/src/netif/ppp/upap.c \
../src/libs/lwip/src/netif/ppp/utils.c \
../src/libs/lwip/src/netif/ppp/vj.c 

C_DEPS += \
./src/libs/lwip/src/netif/ppp/auth.d \
./src/libs/lwip/src/netif/ppp/ccp.d \
./src/libs/lwip/src/netif/ppp/chap-md5.d \
./src/libs/lwip/src/netif/ppp/chap-new.d \
./src/libs/lwip/src/netif/ppp/chap_ms.d \
./src/libs/lwip/src/netif/ppp/demand.d \
./src/libs/lwip/src/netif/ppp/eap.d \
./src/libs/lwip/src/netif/ppp/ecp.d \
./src/libs/lwip/src/netif/ppp/eui64.d \
./src/libs/lwip/src/netif/ppp/fsm.d \
./src/libs/lwip/src/netif/ppp/ipcp.d \
./src/libs/lwip/src/netif/ppp/ipv6cp.d \
./src/libs/lwip/src/netif/ppp/lcp.d \
./src/libs/lwip/src/netif/ppp/magic.d \
./src/libs/lwip/src/netif/ppp/mppe.d \
./src/libs/lwip/src/netif/ppp/multilink.d \
./src/libs/lwip/src/netif/ppp/ppp.d \
./src/libs/lwip/src/netif/ppp/pppapi.d \
./src/libs/lwip/src/netif/ppp/pppcrypt.d \
./src/libs/lwip/src/netif/ppp/pppoe.d \
./src/libs/lwip/src/netif/ppp/pppol2tp.d \
./src/libs/lwip/src/netif/ppp/pppos.d \
./src/libs/lwip/src/netif/ppp/upap.d \
./src/libs/lwip/src/netif/ppp/utils.d \
./src/libs/lwip/src/netif/ppp/vj.d 

OBJS += \
./src/libs/lwip/src/netif/ppp/auth.o \
./src/libs/lwip/src/netif/ppp/ccp.o \
./src/libs/lwip/src/netif/ppp/chap-md5.o \
./src/libs/lwip/src/netif/ppp/chap-new.o \
./src/libs/lwip/src/netif/ppp/chap_ms.o \
./src/libs/lwip/src/netif/ppp/demand.o \
./src/libs/lwip/src/netif/ppp/eap.o \
./src/libs/lwip/src/netif/ppp/ecp.o \
./src/libs/lwip/src/netif/ppp/eui64.o \
./src/libs/lwip/src/netif/ppp/fsm.o \
./src/libs/lwip/src/netif/ppp/ipcp.o \
./src/libs/lwip/src/netif/ppp/ipv6cp.o \
./src/libs/lwip/src/netif/ppp/lcp.o \
./src/libs/lwip/src/netif/ppp/magic.o \
./src/libs/lwip/src/netif/ppp/mppe.o \
./src/libs/lwip/src/netif/ppp/multilink.o \
./src/libs/lwip/src/netif/ppp/ppp.o \
./src/libs/lwip/src/netif/ppp/pppapi.o \
./src/libs/lwip/src/netif/ppp/pppcrypt.o \
./src/libs/lwip/src/netif/ppp/pppoe.o \
./src/libs/lwip/src/netif/ppp/pppol2tp.o \
./src/libs/lwip/src/netif/ppp/pppos.o \
./src/libs/lwip/src/netif/ppp/upap.o \
./src/libs/lwip/src/netif/ppp/utils.o \
./src/libs/lwip/src/netif/ppp/vj.o 

SREC += \
porting_lwip.srec 

MAP += \
porting_lwip.map 


# Each subdirectory must supply rules for building sources it contributes
src/libs/lwip/src/netif/ppp/%.o: ../src/libs/lwip/src/netif/ppp/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/api" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/inc/instances" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/fsp/src/rm_freertos_port" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/aws/amazon-freertos/freertos_kernel/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_gen" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg/bsp" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/fsp_cfg" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/ra_cfg/aws" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/lwip/src/include" -I"C:/Users/Admin/e2_studio/workspace4.1/porting_lwip/src/libs/freertos/include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

