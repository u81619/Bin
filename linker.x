OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)

ENTRY(_main)

PHDRS
{
  text PT_LOAD FLAGS(5);
  data PT_LOAD FLAGS(6);
}

SECTIONS
{
  . = 0x926200000;

  .text : {
    *(.text.start)
    *(.text)
    *(.text.*)
    *(.rodata)
    *(.rodata.*)
  } : text

  .data : {
    *(.data)
    *(.data.*)
  } : data

  .bss : {
    *(.bss)
    *(.bss.*)
    *(COMMON)
  } : data

  /DISCARD/ : {
    *(.comment)
    *(.note.GNU-stack)
    *(.eh_frame)
  }
}
