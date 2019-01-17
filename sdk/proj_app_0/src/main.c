/*
 * main.c
 *
 *  Created on: Jan 15, 2019
 *      Author: Administrator
 */

#include <stdint.h>
#include <xgpio.h>
#include <xparameters.h>
#include <xil_assert.h>

#define RAM0_BASE    ((volatile uint32_t*)0x44A10000)
#define RAM1_BASE    ((volatile uint32_t*)0x44A00000)
#define TOTAL_CHECKS (128)
#define RUNNING_MASK (0xFF00)
#define SUCCESS_MASK (0x00FF)

uint32_t ramExp0[TOTAL_CHECKS];
uint32_t ramExp1[TOTAL_CHECKS];
XGpio    ledObj;

uint16_t lfsr();

int main()
{
	/* Write some data to the RAMs and read it back, just so it can be seen in the simulation. */
	RAM0_BASE[0] = 0x12345678;
	RAM1_BASE[0] = RAM0_BASE[0];

	/* Set up driver for Xilinx GPIO core. */
	Xil_AssertNonvoid(XGpio_Initialize(&ledObj, XPAR_AXI_GPIO_0_DEVICE_ID)==XST_SUCCESS);
	XGpio_SetDataDirection(&ledObj, XGPIO_IR_CH1_MASK, 0);

	/* Set a specific pattern on the LEDs to indicate the design is running. */
	XGpio_DiscreteWrite(&ledObj, XGPIO_IR_CH1_MASK, RUNNING_MASK);

	/* Generate the random data with simple linear-feedback register operation. */
	{
		uint32_t *expPtr0=ramExp0, *expPtr1=ramExp1, *expPtrEnd=(ramExp0+TOTAL_CHECKS);

		while (expPtr0!=expPtrEnd)
		{
			*(expPtr0++) = (lfsr()<<16)|lfsr();
			*(expPtr1++) = (lfsr()<<16)|lfsr();
		}
	}

	/* Write the data into the RAMs across the powlib crossbar. */
	{
		         uint32_t *expPtr0=ramExp0, *expPtr1=ramExp1, *expPtrEnd=(ramExp0+TOTAL_CHECKS);
		volatile uint32_t *ramPtr0=RAM0_BASE, *ramPtr1=RAM1_BASE;

		while (expPtr0!=expPtrEnd)
		{
			*(ramPtr0++) = *(expPtr0++);
			*(ramPtr1++) = *(expPtr1++);
		}
	}

	/* Read data back and check the data. */
	{
                 uint32_t *expPtr0=ramExp0, *expPtr1=ramExp1, *expPtrEnd=(ramExp0+TOTAL_CHECKS);
        volatile uint32_t *ramPtr0=RAM0_BASE, *ramPtr1=RAM1_BASE;

		while (expPtr0!=expPtrEnd)
		{
			Xil_AssertNonvoid((*(ramPtr0++)==*(expPtr0++))&&
					          (*(ramPtr1++)==*(expPtr1++)));
		}
	}

	/* Set a specific pattern on the LEDs to indicate the design is successfully ended. */
	XGpio_DiscreteWrite(&ledObj, XGPIO_IR_CH1_MASK, SUCCESS_MASK);

	return 0;
}

uint16_t lfsr()
{
	static uint16_t cur = 0xACE1u;
	uint16_t bit;
	uint16_t ret = cur;

	/* taps: 16 14 13 11; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 */
	bit  = ((cur >> 0) ^ (cur >> 2) ^ (cur >> 3) ^ (cur >> 5) ) & 1;
	cur =  (cur >> 1) | (bit << 15);

	return ret;
}
