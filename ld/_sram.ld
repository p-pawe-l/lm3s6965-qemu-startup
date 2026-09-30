SECTIONS {
    .data : {
        . = ALIGN(4);
        __sram_data_section_start = .;
        *(.data*)
        . = ALIGN(4);
        __sram_data_section_end = .;
    } > SRAM AT > FLASH

    .bss : {
        . = ALIGN(4);
        __bss_sram_section_start = .;
        *(.bss*)
        *(COMMON)
        . =  ALIGN(4);
        __bss_sram_section_end = .;
    } > SRAM
    
    _stack_size = 2K;
    _stack_start = ORIGIN(SRAM) + LENGTH(SRAM);
    ASSERT( . + _stack_size <= _stack_start, "RAM overflow: No memory for the stack")
}