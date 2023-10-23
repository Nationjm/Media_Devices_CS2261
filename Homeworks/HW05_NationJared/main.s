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
	mov	r3, #67108864
	mov	r2, #256
	mov	r1, #2048
	push	{r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r2, .L21
	strh	r1, [r3, #8]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r5, .L21+4
	ldr	r4, .L21+8
	ldr	fp, .L21+12
	ldr	r10, .L21+16
	ldr	r9, .L21+20
	ldr	r8, .L21+24
	ldr	r7, .L21+28
	ldr	r6, .L21+32
.L3:
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L3
.L5:
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
.L4:
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	b	.L3
.L6:
	mov	lr, pc
	bx	r6
	b	.L3
.L7:
	mov	lr, pc
	bx	r8
	b	.L3
.L8:
	mov	lr, pc
	bx	r9
	b	.L3
.L9:
	mov	lr, pc
	bx	r7
	b	.L3
.L10:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r10]
	tst	r3, #8
	beq	.L11
	ldr	r2, .L21+40
	ldrh	r2, [r2, #48]
	tst	r2, #8
	and	r3, r3, #1
	bne	.L13
	cmp	r3, #0
	ldrne	r3, .L21+40
	ldrhne	r3, [r3, #48]
.L14:
	ldr	r3, .L21+44
	mov	lr, pc
	bx	r3
	b	.L3
.L11:
	and	r3, r3, #1
.L13:
	cmp	r3, #0
	beq	.L3
	ldr	r3, .L21+40
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bne	.L3
	b	.L14
.L22:
	.align	2
.L21:
	.word	goToStart
	.word	waitForVBlank
	.word	state
	.word	start
	.word	oldButtons
	.word	game1
	.word	game2
	.word	pause
	.word	win
	.word	lose
	.word	67109120
	.word	goToGame1
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
	mov	r3, #67108864
	mov	r2, #256
	mov	r1, #2048
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	ldr	r2, .L25
	strh	r1, [r3, #8]	@ movhi
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	goToStart
	.size	initialize, .-initialize
	.comm	state,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	STATE,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
