OUTPUT_ARCH( "riscv" )
ENTRY(rvtest_entry_point)

MEMORY
{
	ICCM  : ORIGIN = 0x00000000, LENGTH = 16K
	DCCM  : ORIGIN = 0x00002000, LENGTH = 16K
}

SECTIONS
{
  .text : { *(.text) } > ICCM
  .text.init : { *(.text.init) } > ICCM
  .data :
    { *(.data) } > DCCM
  .data.string : { *(.data.string)} > DCCM
  .bss : { *(.bss) } > DCCM
}