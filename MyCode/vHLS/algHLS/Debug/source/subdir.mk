################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/myAccel.c 

OBJS += \
./source/myAccel.o 

C_DEPS += \
./source/myAccel.d 


# Each subdirectory must supply rules for building sources it contributes
source/myAccel.o: /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/myAccel.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -DAESL_TB -D__llvm__ -D__llvm__ -I/tools/Xilinx/Vivado/2018.3/lnx64/tools/systemc/include -I/tools/Xilinx/Vivado/2018.3/lnx64/tools/auto_cc/include -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/vHLS -I/tools/Xilinx/Vivado/2018.3/include -I/tools/Xilinx/Vivado/2018.3/include/ap_sysc -I/tools/Xilinx/Vivado/2018.3/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


