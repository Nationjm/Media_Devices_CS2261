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
	mov	r1, #67108864
	mov	r3, #0
	ldr	r0, .L4+4
	ldr	r2, .L4+8
	strh	r0, [r1]	@ movhi
	ldr	ip, .L4+12
	ldrh	lr, [r2, #48]
	ldr	r0, .L4+16
	ldr	r1, .L4+20
	ldr	r2, .L4+24
	strh	lr, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	state
	.word	goToStart
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
	push	{r4, r7, fp, lr}
	ldr	r4, .L29
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L29+8
	ldrh	r3, [r4]
	ldr	r8, .L29+12
	ldr	r7, .L29+16
	ldr	fp, .L29+20
	ldr	r10, .L29+24
	ldr	r9, .L29+28
	ldr	r6, .L29+32
.L16:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L17
.L10:
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L9:
	ldr	r3, .L29+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L17
.L23:
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L16
	ldr	r3, .L29+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L16
.L11:
	ldr	r3, .L29+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L23
.L17:
	ldrh	r3, [r4]
	b	.L16
.L12:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L17
.L20:
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L16
	ldr	r3, .L29+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L16
.L13:
	ldr	r3, .L29+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L17
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L16
	ldr	r3, .L29+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L16
.L15:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L17
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L16
	ldr	r3, .L29+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L16
.L14:
	mov	lr, pc
	bx	r10
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L20
	b	.L17
.L30:
	.align	2
.L29:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	state
	.word	start
	.word	instructions
	.word	pause
	.word	67109120
	.word	lose
	.word	goToStart
	.word	win
	.word	goToGame
	.word	game
	.word	goToPause
	.word	goToInstructions
	.size	main, .-main
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
