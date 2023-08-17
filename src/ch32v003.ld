MEMORY
{
  FLASH        : ORIGIN = 0x0000000, LENGTH = 0x4000  /* 16MB off-chip */
  RAM          : ORIGIN = 0x2000000, LENGTH = 0x800 /* 2KB on-chip */
}

SECTIONS
{
  .text :
  {
    PROVIDE(_text_start = .);
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

  . = ALIGN(4);

  .bss :
  {
    PROVIDE(_bss_start = .);
    *(.bss*)
    PROVIDE(_bss_end = .);
  }
  > RAM AT> FLASH
}