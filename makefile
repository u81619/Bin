CC := gcc
OBJCOPY := objcopy
ODIR := build
SDIR := source
IDIR := include

OO_PS4_TOOLCHAIN ?= $(HOME)/sdk
LIBDIR := $(OO_PS4_TOOLCHAIN)/lib
INCDIR := $(OO_PS4_TOOLCHAIN)/include

CFLAGS := -I$(IDIR) -I$(INCDIR) -Os -std=c11 -ffreestanding -fno-common -fno-builtin -m64 -fPIC -c
LDFLAGS := -T linker.x -nodefaultlibs -nostdlib -static -L$(LIBDIR) -lSceSysUtil -lSceKernel

$(ODIR)/%.o: $(SDIR)/%.c
	mkdir -p $(ODIR)
	$(CC) $(CFLAGS) $< -o $@

Payload.elf: $(ODIR)/main.o
	$(CC) $(ODIR)/main.o $(LDFLAGS) -o Payload.elf

Payload.bin: Payload.elf
	$(OBJCOPY) -O binary Payload.elf Payload.bin

all: Payload.bin
