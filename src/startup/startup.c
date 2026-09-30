extern unsigned __flash_data_section_start;
extern unsigned __sram_data_section_start;
extern unsigned __sram_data_section_end;

extern unsigned __bss_sram_section_start;
extern unsigned __bss_sram_section_end;

// App main function 
extern int main(void);

void System_Init(void) {
	// Your system initialization here
}

void CopyDataFromFlashToSRAM(void) {
	unsigned *flash_start = &__flash_data_section_start;
	unsigned *sram_start = &__sram_data_section_start;
	while (sram_start < &__sram_data_section_end) {
		*sram_start = *flash_start;
		sram_start++; 
		flash_start++;
	}
}

void ResetBSS_Section(void) {
	unsigned *bss_start = &__bss_sram_section_start;
	while (bss_start < &__bss_sram_section_end) {
		*bss_start = 0x00000000;
		bss_start++;
	}
}

void Reset_Handler(void) {
	System_Init();
	CopyDataFromFlashToSRAM();
	ResetBSS_Section();

	main();
	while(1);
} 


