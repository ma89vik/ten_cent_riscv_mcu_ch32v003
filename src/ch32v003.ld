MEMORY
{
  FLASH        : ORIGIN = 0x0000000, LENGTH = 0x4000  /* 16MB off-chip */
  RAM          : ORIGIN = 0x2000000, LENGTH = 0x800 /* 2KB on-chip */
}

ENTRY(__start)

SECTIONS
{
  .text :
  {
    PROVIDE(_text_start = .);
    *(.text.vectors)
    *(.text*)
    PROVIDE(_text_end = .);
  }
  > FLASH

  . = ALIGN(4);

  .rodata :
  {
    PROVIDE(_rodata_start = .);
    *(.rodata*)
    PROVIDE(_rodata_end = .);
  }
  > FLASH


  _load_addr_data = LOADADDR(.data);
  .data ALIGN(4):
  {
    PROVIDE(_data_start = .);
    *(.data)
    *(.data*)
    *(.sdata)
    *(.sdata*)
    PROVIDE(_data_end = .);
  } > RAM AT > FLASH

  .bss :
  {
    PROVIDE(_bss_start = .);
    *(.bss*)
    PROVIDE(_bss_end = .);
  }
  > RAM

    /* Set stack top to end of RAM */
  __StackTop = ORIGIN(RAM) + LENGTH(RAM);
  PROVIDE(__stack_top = __StackTop);
}