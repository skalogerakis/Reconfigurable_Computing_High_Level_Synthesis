################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/main.c 

OBJS += \
./testbench/main.o 

C_DEPS += \
./testbench/main.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/main.o: /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -I/tools/Xilinx/Vivado/2018.3/lnx64/tools/systemc/include -I/tools/Xilinx/Vivado/2018.3/lnx64/tools/auto_cc/include -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/vHLS -I/tools/Xilinx/Vivado/2018.3/include -I/tools/Xilinx/Vivado/2018.3/include/ap_sysc -I/tools/Xilinx/Vivado/2018.3/include/etc -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


