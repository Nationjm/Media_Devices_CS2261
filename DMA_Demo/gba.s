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
	.file	"gba.c"
	.text
	.align	2
	.global	DMANow
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	sub	sp, sp, #8
	ldr	r2, [r3]
	strh	r0, [sp, #6]	@ movhi
	add	r1, r2, #76800
.L4:
	ldrh	r3, [sp, #6]
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L4
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ble	.L9
	mov	ip, #0
	ldr	r3, .L17
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r1, r2, r1, lsl #4
	add	r0, r1, r0
	rsb	r4, r2, r2, lsl #31
	add	r0, r3, r0, lsl #1
	lsl	r4, r4, #1
.L11:
	cmp	r2, #0
	addgt	r1, r0, r4
	ble	.L14
.L12:
	ldrh	r3, [sp, #8]
	strh	r3, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L12
.L14:
	add	ip, ip, #1
	cmp	lr, ip
	add	r0, r0, #480
	bne	.L11
.L9:
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L20:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L20
	mov	r2, #67108864
.L21:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L21
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
