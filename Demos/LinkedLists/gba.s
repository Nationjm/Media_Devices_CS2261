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
	.global	collision
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L5
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L8
.L5:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L5
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
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
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L10
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L17
	ldr	lr, [ip]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	drawChar3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar3, %function
drawChar3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L29
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	r4, [ip, #4]
	ldr	lr, .L29+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	r4, r4, r1, lsl #1
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L20:
	mov	r1, r4
	sub	r2, lr, #48
.L22:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L22
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L20
	pop	{r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	fontdata_6x8+48
	.size	drawChar3, .-drawChar3
	.align	2
	.global	drawString3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString3, %function
drawString3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L31
	mov	r4, r0
	mov	r6, r1
.L33:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar3
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L33
.L31:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString3, .-drawString3
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
