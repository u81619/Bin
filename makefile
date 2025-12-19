Target		= Payload
OutDir		= $(shell pwd)
CC		= gcc
AS		= gcc
OBJCOPY		= objcopy
ODIR		= build
SDIR		= source
IDIR		= include
LDIR		= lib

LIBS		= -lSceLibcInternal -lSceSysUtil
CFLAGS		= -I$(IDIR) -Os -std=c11 -ffreestanding -fno-common -fno-builtin -m64 -fPIC
LDFLAGS		= -T linker.x -nodefaultlibs -nostdlib -static $(LIBS)

CFILES		= $(wildcard $(SDIR)/*.c)
OBJS		= $(CFILES:$(SDIR)/%.c=$(ODIR)/%.o)

all: $(Target).bin

$(ODIR)/%.o: $(SDIR)/%.c
	@mkdir -p $(ODIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(Target).bin: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(Target).elf
	$(OBJCOPY) -O binary $(Target).elf $(Target).bin

clean:
	rm -rf $(Target).bin $(Target).elf $(ODIR)
  
