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
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #2048
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	DMANow
	.word	blockPal
	.word	blockTiles
	.word	100679680
	.word	worldMap
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r9, .L13+4
	ldr	r6, .L13+8
	ldr	r5, .L13+12
	ldr	r4, .L13+16
	ldr	r8, .L13+20
	ldr	r7, .L13+24
.L8:
	ldrh	r2, [r9]
	strh	r2, [r6]	@ movhi
	ldrh	r3, [r4, #48]
	tst	r2, #8
	strh	r3, [r9]	@ movhi
	beq	.L7
	tst	r3, #8
	strheq	r7, [r8]	@ movhi
.L7:
	mov	lr, pc
	bx	r5
	b	.L8
.L14:
	.align	2
.L13:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	waitForVBlank
	.word	67109120
	.word	100680392
	.word	12293
	.size	main, .-main
	.text
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	ldreq	r3, .L20+8
	ldreq	r2, .L20+12
	strheq	r2, [r3]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	oldButtons
	.word	buttons
	.word	100680392
	.word	12293
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	draw, .-draw
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
