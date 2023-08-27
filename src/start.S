	.global vector_table
    .global __start

/* The reset vector, jumps to startup code */
reset_vector:
	.section .text.vectors
    .option   norvc
	j __start
	.word   NMI_Handler               /* NMI Handler */
	.word   HardFault_Handler         /* Hard Fault Handler */
	.word   0
	.word   0
	.word   0
	.word   0
	.word   0
	.word   0
	.word   0
	.word   0
	.word   SysTick_Handler           /* SysTick Handler */
	.word   0
	.word   SW_Handler                /* SW Handler */
	.word   0
	/* External Interrupts */
	.word   WWDG_IRQHandler           /* Window Watchdog */
	.word   PVD_IRQHandler            /* PVD through EXTI Line detect */
	.word   FLASH_IRQHandler          /* Flash */
	.word   RCC_IRQHandler            /* RCC */
	.word   EXTI7_0_IRQHandler        /* EXTI Line 7..0 */
	.word   AWU_IRQHandler            /* AWU */
	.word   DMA1_Channel1_IRQHandler  /* DMA1 Channel 1 */
	.word   DMA1_Channel2_IRQHandler  /* DMA1 Channel 2 */
	.word   DMA1_Channel3_IRQHandler  /* DMA1 Channel 3 */
	.word   DMA1_Channel4_IRQHandler  /* DMA1 Channel 4 */
	.word   DMA1_Channel5_IRQHandler  /* DMA1 Channel 5 */
	.word   DMA1_Channel6_IRQHandler  /* DMA1 Channel 6 */
	.word   DMA1_Channel7_IRQHandler  /* DMA1 Channel 7 */
	.word   ADC1_IRQHandler           /* ADC1 */
	.word   I2C1_EV_IRQHandler        /* I2C1 Event */
	.word   I2C1_ER_IRQHandler        /* I2C1 Error */
	.word   USART1_IRQHandler         /* USART1 */
	.word   SPI1_IRQHandler           /* SPI1 */
	.word   TIM1_BRK_IRQHandler       /* TIM1 Break */
	.word   TIM1_UP_IRQHandler        /* TIM1 Update */
	.word   TIM1_TRG_COM_IRQHandler   /* TIM1 Trigger and Commutation */
	.word   TIM1_CC_IRQHandler        /* TIM1 Capture Compare */
	.word   TIM2_IRQHandler           /* TIM2 */

__start:
	/* setup the stack pointer */
	la sp, __stack_top

	call reset_handler

