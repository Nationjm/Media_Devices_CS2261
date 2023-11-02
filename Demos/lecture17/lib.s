	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lib.c"
	.text
	.align	2
	.global	waitForVBlank
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3]
	.syntax divided
@ 9 "lib.c" 1
	swi 0x02 << 16
@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #2
	sub	sp, sp, #8
	add	r0, r0, #67108864
	str	r3, [sp, #4]
	str	r1, [r0, #176]
	str	r2, [r0, #180]
	ldr	r3, [sp, #4]
	orr	r3, r3, #-2147483648
	str	r3, [r0, #184]
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	DMANow, .-DMANow
	.global	enableInput
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	enableInput, %object
	.size	enableInput, 4
enableInput:
	.word	1
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
