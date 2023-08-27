extern void main(void);

extern int _bss_end, _bss_start, _load_addr_data, _data_start, _data_end;

void reset_handler()
{
    /* Reset bss */
    int bss_size = (int)&_bss_end - (int)&_bss_start;
    char *bss = (char *)&_bss_start;
    for (int i = 0; i < bss_size; i++)
    {
        *bss++ = 0;
    }

    /* Copy .data */
    char *data_flash_addr = (char *)&_load_addr_data;
    int data_size = (int)&_data_end - (int)&_data_start;
    char *data = (char *)&_data_start;
    for (int i = 0; i < data_size; i++)
    {
        *data++ = *data_flash_addr++;
    }

    // init. the .bss section to zero in SRAM

    main();
}