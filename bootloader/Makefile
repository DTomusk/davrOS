# everything related to the bootloaer in the top level make is put here 
BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))# the object files need to be put in the build directory and not the current directory 

all: $(BOOTLOADER_OBJS)

$(BUILD_DIR)/%.o: %.asm
	nasm -f bin $< -o $@
	
clean: 
	rm $(BUILD)/*
