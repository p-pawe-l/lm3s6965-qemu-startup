void __stop() { while (1); }

__attribute__((weak, alias("__stop"))) void Reset_Handler(void);
__attribute__((weak, alias("__stop"))) void NMI_Handler(void);
__attribute__((weak, alias("__stop"))) void HardFault_Handler(void);
__attribute__((weak, alias("__stop"))) void MemoryManagementFault_Handler(void);
__attribute__((weak, alias("__stop"))) void BusFault_Handler(void);
__attribute__((weak, alias("__stop"))) void UsageFault_Handler(void);
__attribute__((weak, alias("__stop"))) void SVCall_Handler(void);
__attribute__((weak, alias("__stop"))) void DebugMonitor_Handler(void);
__attribute__((weak, alias("__stop"))) void PendSV_Handler(void);
__attribute__((weak, alias("__stop"))) void SysTick_Handler(void);

__attribute__((weak, alias("__stop"))) void Dummy_Handler(void);

typedef void (*func_ptr_t)(void);
__attribute((section(".handlers_vector"), used)) 
func_ptr_t __handlers_vector[] = {
    Reset_Handler(),
    NMI_Handler(),
    HardFault_Handler(),
    MemoryManagementFault_Handler(),
    BusFault_Handler(),
    UsageFault_Handler(),
    Dummy_Handler(),
    Dummy_Handler(),
    Dummy_Handler(),
    Dummy_Handler(),
    SVCall_Handler(),
    DebugMonitor_Handler(),
    Dummy_Handler(),
    PendSV_Handler(),
    SysTick_Handler(),
};