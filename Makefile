CROSS   = arm-none-eabi-
CC      = $(CROSS)gcc
OBJCOPY = $(CROSS)objcopy
SIZE    = $(CROSS)size

TARGET  = firmware
BUILD   = build
LDSCRIPT = ld/lm3s6965evb.ld

SRCS    = src/main.c \
          src/startup/startup.c \
          src/startup/handlers.c \
          src/startup/stack.c

OBJS    = $(SRCS:%.c=$(BUILD)/%.o)

CFLAGS  = -mcpu=cortex-m3 -mthumb -ffreestanding -g -O0 -Wall -Wextra

LDFLAGS = -T $(LDSCRIPT) -nostdlib -Wl,-Map=$(TARGET).map

all: $(TARGET).elf

$(TARGET).elf: $(OBJS) $(wildcard ld/*.ld)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
	$(SIZE) $@

$(BUILD)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@

run: $(TARGET).elf
	qemu-system-arm -M lm3s6965evb -nographic -kernel $<

debug: $(TARGET).elf
	qemu-system-arm -M lm3s6965evb -nographic -kernel $< -S -s

clean:
	rm -rf $(BUILD) $(TARGET).elf $(TARGET).bin $(TARGET).map

.PHONY: all run debug clean
