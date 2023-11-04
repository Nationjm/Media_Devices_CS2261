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
	mov	r1, #0
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	strh	r0, [r2]	@ movhi
	ldr	r0, .L4+12
	ldrh	ip, [r3, #48]
	ldr	r2, .L4+16
	ldr	r3, .L4+20
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
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
	.word	goToStart
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
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
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r6, .L35+4
	ldr	r4, .L35+8
	ldr	r10, .L35+12
	ldr	r5, .L35+16
	ldr	fp, .L35+20
	ldr	r9, .L35+24
	ldr	r7, .L35+28
	ldr	r8, .L35+32
.L27:
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	r1, [r5]
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L7
.L9:
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L8
.L8:
	ldr	r3, .L35+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #4
	beq	.L34
.L30:
	ldr	r1, [r5]
.L7:
	mov	r0, r8
	mov	lr, pc
	bx	r9
	b	.L27
.L10:
	ldr	r3, .L35+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #4
	bne	.L30
.L34:
	ldr	r3, .L35+44
	mov	lr, pc
	bx	r3
	b	.L30
.L11:
	ldr	r3, .L35+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #4
	bne	.L30
.L29:
	ldr	r3, .L35+52
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	b	.L7
.L12:
	ldr	r3, .L35+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #4
	bne	.L30
	ldr	r3, .L35+60
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	b	.L7
.L14:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #8
	bne	.L30
	ldr	r3, .L35+64
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	b	.L7
.L13:
	ldr	r3, .L35+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L30
	ldrh	r3, [r7, #48]
	tst	r3, #8
	bne	.L30
	b	.L29
.L36:
	.align	2
.L35:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	state
	.word	start
	.word	mgba_printf
	.word	67109120
	.word	.LC0
	.word	lose
	.word	win
	.word	goToStart
	.word	pause
	.word	goToGame
	.word	game
	.word	goToPause
	.word	goToInstructions
	.word	instructions
	.size	main, .-main
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
