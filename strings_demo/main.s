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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
	ldr	r1, .L4
	ldr	r3, .L4+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	mgba_open
	.size	initialize, .-initialize
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
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L16
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [ip]
	ldr	ip, .L16+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	lr, lr, r1, lsl #1
	add	ip, ip, r2, lsl #4
.L7:
	mov	r1, lr
	sub	r2, ip, #48
.L9:
	ldrb	r0, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	r0, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, ip
	add	r1, r1, #480
	bne	.L9
	add	r4, r4, #1
	cmp	r4, #6
	add	ip, r2, #1
	add	lr, lr, #2
	bne	.L7
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	videoBuffer
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"j is 106\000"
	.align	2
.LC1:
	.ascii	"String 'Orange' is size: %d\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L24
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L24+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+8
	ldr	r0, .L24+12
	mov	lr, pc
	bx	r4
	mov	r1, #7
	ldr	r0, .L24+16
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r5, r2
	mov	r1, r2
	mov	r0, r2
	mov	r3, #31
	ldr	r7, .L24+20
	mov	lr, pc
	bx	r7
	mov	r6, r5
	mov	r4, #6
	b	.L19
.L21:
	mov	r1, r6
	mov	r0, r4
	mov	r3, #31
	add	r4, r4, #6
	mov	lr, pc
	bx	r7
	cmp	r4, #230
	movgt	r4, #0
	addgt	r6, r6, #8
.L19:
	add	r5, r5, #1
	cmp	r5, #256
	and	r2, r5, #255
	bne	.L21
.L22:
	b	.L22
.L25:
	.align	2
.L24:
	.word	1027
	.word	mgba_open
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.word	drawChar
	.size	main, .-main
	.text
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
	movne	r4, r0
	movne	r6, r1
	bne	.L28
	b	.L26
.L37:
	sub	r4, r4, #230
	add	r6, r6, #8
	mov	r1, r6
	mov	r0, r4
	bl	drawChar
	ldrb	r5, [r5]	@ zero_extendqisi2
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L26
.L28:
	cmp	r4, #230
	bgt	.L37
	mov	r0, r4
	mov	r1, r6
	add	r5, r5, #1
	bl	drawChar
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L28
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.ident	"GCC: (devkitARM release 53) 9.1.0"
