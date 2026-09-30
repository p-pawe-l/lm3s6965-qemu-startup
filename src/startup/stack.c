
// top of the stack in SRAM memory 
extern unsigned _stack_start;

__attribute__((section(".init_stack_pointer", used)))
const unsigned *init_stack_pointer = &_stack_start;