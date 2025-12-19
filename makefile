Target      = Payload
CC          = gcc
OBJCOPY     = objcopy
ODIR        = build
SDIR        = source
IDIR        = include

CFLAGS      = -I$(IDIR) -Os -std=c11 -ffreestanding -fno-common -fno-builtin -m64 -fPIC
# حذفنا المكتبات التي تسبب الخطأ وأبقينا فقط خيارات الربط الأساسية
LDFLAGS     = -T linker.x -nodefaultlibs -nostdlib -static

CFILES      = $(wildcard $(SDIR)/*.c)
OBJS        = $(CFILES:$(SDIR)/%.c=$(ODIR)/%.o)

all: $(Target).bin

$(ODIR)/%.o: $(SDIR)/%.c
	@mkdir -p $(ODIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(Target).bin: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(Target).elf
	$(OBJCOPY) -O binary $(Target).elf $(Target).bin

clean:
	rm -rf $(Target).bin $(Target).elf $(ODIR)


