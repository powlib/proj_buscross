/*
 * main.c
 *
 *  Created on: Jan 15, 2019
 *      Author: Administrator
 */

#include <stdint.h>

#define RAM0_BASE ((volatile uint32_t*)0x44A10000)
#define RAM1_BASE ((volatile uint32_t*)0x44A00000)

int main()
{
	uint32_t word;
	RAM0_BASE[0] = 0x55FF55FF;
	RAM0_BASE[1] = 0x12345678;
	word = RAM0_BASE[0];
	return 0;
}
