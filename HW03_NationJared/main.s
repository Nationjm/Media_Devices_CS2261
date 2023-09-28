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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r2, #67108864
	mov	r1, r3
	mov	fp, r3
	ldr	r0, .L14+4
	ldr	r6, .L14+8
	strh	r0, [r2]	@ movhi
	ldr	r8, .L14+12
	strb	r3, [r6]
	ldr	r5, .L14+16
	ldr	r7, .L14+20
	ldr	r10, .L14+24
	ldr	r9, .L14+28
	ldr	r4, .L14+32
.L2:
	ldrh	r3, [r8]
.L3:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L3
.L5:
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
.L4:
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r3
.L10:
	ldrb	r1, [r6]	@ zero_extendqisi2
	b	.L2
.L6:
	ldr	r3, .L14+40
	mov	lr, pc
	bx	r3
	b	.L10
.L7:
	mov	lr, pc
	bx	r9
	b	.L10
.L8:
	ldr	r3, .L14+44
	mov	lr, pc
	bx	r3
	b	.L10
.L9:
	ldr	r0, [r7]
	mov	lr, pc
	bx	r10
	str	fp, [r7]
	b	.L10
.L15:
	.align	2
.L14:
	.word	mgba_open
	.word	1027
	.word	state
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	start
	.word	game
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L18+4
	ldr	r3, .L18+8
	strh	r0, [r1]	@ movhi
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	mgba_open
	.word	1027
	.word	state
	.size	initialize, .-initialize
	.comm	state,1,1
	.global	drawStart
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	drawStart, %object
	.size	drawStart, 4
drawStart:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
