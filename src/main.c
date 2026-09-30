#include <stdint.h>

// UART0 data register on the LM3S6965 (datasheet: UART0 base 0x4000C000, UARTDR offset 0x000).
#define UART0_DR (*(volatile uint32_t *)0x4000C000)

static void uart_putc(char c) {
    UART0_DR = (uint32_t)c;
}

static void uart_puts(const char *s) {
    while (*s) {
        uart_putc(*s++);
    }
}

int main(void) {
    uart_puts("Hello from Cortex-M3!\r\n");
    return 0;
}
