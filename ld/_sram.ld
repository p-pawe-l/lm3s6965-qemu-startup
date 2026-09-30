SECTIONS {
    .data : {
        . = ALIGN(4);
        _sram_start_data_section = .;
        *(.data*)
        . = ALIGN(4);
        _sram_end_data_section = .;
    } > SRAM AT > FLASH;

    .bss : {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss*)
        *(COMMON)
        . =  ALIGN(4);
        _bss_end = .;
    } > SRAM;
    
    _stack_size = 2K;
    _stack_start = ORIGIN(SRAM) + LENGTH(SRAM)
    ASSERT( . + _stack_size <= _stack_start, "RAM overflow: No memory for the stack")
}