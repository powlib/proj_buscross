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
#include <xaxicdma.h>

#define RAM0_BASE    ((volatile uint32_t*)0x44A10000)
#define RAM1_BASE    ((volatile uint32_t*)0x44A00000)
#define TOTAL        (16)
#define RUNNING_MASK (0xFF00)
#define SUCCESS_MASK (0x00FF)

XGpio    ledObj;
XAxiCdma cdmaObj;

int main()
{
	/* Set up driver for Xilinx GPIO core. */
	Xil_AssertNonvoid(XGpio_Initialize(&ledObj, XPAR_AXI_GPIO_0_DEVICE_ID)==XST_SUCCESS);
	XGpio_SetDataDirection(&ledObj, XGPIO_IR_CH1_MASK, 0);

	/* Set a specific pattern on the LEDs to indicate the design is running. */
	XGpio_DiscreteWrite(&ledObj, XGPIO_IR_CH1_MASK, RUNNING_MASK);

	/* Configure your CDMA. */
	{
		XAxiCdma_Config* config = XAxiCdma_LookupConfig(XPAR_AXI_CDMA_0_DEVICE_ID);
		Xil_AssertNonvoid(config!=NULL);
		Xil_AssertNonvoid(XST_SUCCESS==XAxiCdma_CfgInitialize(&cdmaObj, config, config->BaseAddress));
	}

	/* Write some data to RAM0. */
	{
		volatile uint32_t* endptr = RAM0_BASE+TOTAL;
		volatile uint32_t* curptr = RAM0_BASE;
		         uint32_t  value  = 0;

		while (curptr!=endptr) *(curptr++) = value++;
	}

	/* Perform the CDMA transfer. */
	Xil_AssertNonvoid(XST_SUCCESS==XAxiCdma_SimpleTransfer(&cdmaObj,
			(UINTPTR)RAM0_BASE, (UINTPTR)RAM1_BASE,
			TOTAL*sizeof(uint32_t), NULL, NULL));

	/* Wait until the transfer is finished. */
	while (XAxiCdma_IsBusy(&cdmaObj)) continue;

	/* Score the data through comparison. */
	{
		volatile uint32_t* endptr = RAM0_BASE+TOTAL;
		volatile uint32_t* rm0ptr = RAM0_BASE;
		volatile uint32_t* rm1ptr = RAM1_BASE;

		while (rm0ptr!=endptr) Xil_AssertNonvoid(*(rm0ptr++)==*(rm1ptr++));
	}

	/* Set a specific pattern on the LEDs to indicate the design is successfully ended. */
	XGpio_DiscreteWrite(&ledObj, XGPIO_IR_CH1_MASK, SUCCESS_MASK);

	return 0;
}

