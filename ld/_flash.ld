SECTIONS {
    /* Initial stack pointer value at 0x00000000*/
    .init_stack_pointer : {
        KEEP(*(.init_stack_pointer))
    } > FLASH

    /* Vector table flashed into memory from 0x00000004*/
    .handlers_vector : {
        KEEP(*(.handlers_vector))
    } > FLASH

    .text : {
        *(.text*)
        . = ALIGN(4);
    } > FLASH

    .rodata : {
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    __flash_data_section_start = LOADADDR(.data);
}
