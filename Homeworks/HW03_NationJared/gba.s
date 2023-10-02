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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	" \000"
	.text
	.align	2
	.global	drawRectangle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r3, #0
	ble	.L1
	mov	r10, #0
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	r5, r0, r3, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	fp, .L8
	ldr	r9, .L8+4
	ldr	r8, .L8+8
	lsl	r5, r5, #1
	lsl	r4, r1, #1
	orr	r6, r2, #-2130706432
	add	r7, sp, #40
.L3:
	ldm	fp, {r2, r3}
	add	r2, r2, r4
	str	r10, [r3, #44]
	mov	r0, r8
	str	r2, [r3, #40]
	str	r7, [r3, #36]
	str	r6, [r3, #44]
	add	r4, r4, #480
	mov	lr, pc
	bx	r9
	cmp	r4, r5
	bne	.L3
.L1:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC0
	.size	drawRectangle, .-drawRectangle
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
	mov	ip, #0
	str	lr, [sp, #-4]!
	ldr	r2, .L12
	sub	sp, sp, #12
	ldr	r3, [r2, #4]
	ldr	lr, [r2]
	ldr	r1, .L12+4
	orr	r0, r0, r0, lsl #16
	add	r2, sp, #4
	str	r0, [sp, #4]
	str	lr, [r3, #40]
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	-2063578368
	.size	fillScreen, .-fillScreen
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
.L15:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L15
	mov	r2, #67108864
.L16:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L16
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
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
	ble	.L24
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L26
.L24:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L26:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L24
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L37
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	r4, [ip]
	ldr	lr, .L37+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	r4, r4, r1, lsl #1
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L28:
	mov	r1, r4
	sub	r2, lr, #48
.L30:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L30
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L28
	pop	{r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L39
	mov	r6, r1
	mov	r4, r0
.L41:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L41
.L39:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
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
	ldr	ip, .L49
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0, lsl #2]
	str	r2, [ip, #4]
	str	r3, [ip, #8]
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.global	videoBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
