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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame.part.0, %function
updateGame.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	add	r0, r3, #32
	ldm	r0, {r0, r1}
	ldr	ip, [r3]
	str	lr, [sp, #-4]!
	ldrh	r2, [r3, #4]
	stm	r3, {r0, r1}
	add	r0, r3, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #8]
	str	ip, [r3, #32]
	ldrh	ip, [r3, #12]
	strh	r2, [r3, #36]	@ movhi
	add	r2, r3, #8
	stm	r2, {r0, r1}
	str	lr, [r3, #24]
	strh	ip, [r3, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	axolotls
	.size	updateGame.part.0, .-updateGame.part.0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Resting Axolotls\000"
	.text
	.align	2
	.global	goToRest
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToRest, %function
goToRest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r3, #10
	push	{r4, lr}
	ldr	lr, .L8
	sub	sp, sp, #8
	str	ip, [sp]
	mov	r1, r3
	mov	r0, r3
	strb	ip, [lr]
	mov	r2, #150
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	mov	r1, #10
	ldr	r3, .L8+8
	mov	r0, r1
	ldr	r2, .L8+12
	ldr	r4, .L8+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	state
	.word	drawRect
	.word	30495
	.word	.LC0
	.word	drawString
	.size	goToRest, .-goToRest
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
	mov	r1, #0
	push	{r4, lr}
	ldr	r0, .L12
	ldr	r2, .L12+4
	strh	r0, [r3]	@ movhi
	ldr	r3, .L12+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToRest
.L13:
	.align	2
.L12:
	.word	1027
	.word	frameCounter
	.word	initializeAxolotls
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Animated Axolotls!\000"
	.text
	.align	2
	.global	goToAnimate
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToAnimate, %function
goToAnimate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #10
	mov	r2, #0
	push	{r4, lr}
	mov	lr, #1
	sub	sp, sp, #8
	ldr	ip, .L16
	mov	r1, r3
	mov	r0, r3
	str	r2, [sp]
	ldr	r4, .L16+4
	mov	r2, #150
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r1, #10
	mov	r3, #31744
	mov	r0, r1
	ldr	r2, .L16+8
	ldr	r4, .L16+12
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	drawRect
	.word	.LC1
	.word	drawString
	.size	goToAnimate, .-goToAnimate
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r7, fp, lr}
	ldr	r1, .L33
	strh	r1, [r3]	@ movhi
	ldr	r1, .L33+4
	ldr	r3, .L33+8
	sub	sp, sp, #12
	ldr	r5, .L33+12
	ldr	r7, .L33+16
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+20
	mov	lr, pc
	bx	r3
	ldr	r6, .L33+24
	ldrh	r3, [r5]
	ldr	r4, .L33+28
	add	fp, r7, #8
	add	r10, r7, #16
	add	r9, r7, #24
	add	r8, r7, #32
.L19:
	ldr	r2, .L33+32
	ldrb	r1, [r2]	@ zero_extendqisi2
.L22:
	strh	r3, [r6]	@ movhi
	ldr	r3, .L33+36
	ldrh	r3, [r3, #48]
	cmp	r1, #0
	strh	r3, [r5]	@ movhi
	beq	.L20
	cmp	r1, #1
	bne	.L22
	ldr	r2, .L33+4
	ldr	r3, [r2]
	cmp	r3, #19
	add	r3, r3, #1
	strne	r3, [r2]
	bne	.L25
	mov	r3, #0
	ldr	r2, .L33+4
	str	r3, [r2]
	ldr	r3, .L33+40
	mov	lr, pc
	bx	r3
.L25:
	ldr	r3, .L33+44
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r0, r7
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, fp
	mov	lr, pc
	bx	r4
	mov	r1, #2
	mov	r0, r10
	mov	lr, pc
	bx	r4
	mov	r1, #3
	mov	r0, r9
	mov	lr, pc
	bx	r4
	mov	r1, #4
	mov	r0, r8
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L19
	ldrh	r2, [r6]
	tst	r2, #8
	beq	.L19
	ldr	r3, .L33+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L19
.L20:
	ldr	r3, .L33+44
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r0, r7
	ldr	r1, [sp, #4]
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, fp
	mov	lr, pc
	bx	r4
	mov	r1, #2
	mov	r0, r10
	mov	lr, pc
	bx	r4
	mov	r1, #3
	mov	r0, r9
	mov	lr, pc
	bx	r4
	mov	r1, #4
	mov	r0, r8
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L19
	ldrh	r2, [r6]
	tst	r2, #8
	beq	.L19
	ldr	r3, .L33+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L19
.L34:
	.align	2
.L33:
	.word	1027
	.word	frameCounter
	.word	initializeAxolotls
	.word	buttons
	.word	axolotls
	.word	goToRest
	.word	oldButtons
	.word	drawAxolotl
	.word	state
	.word	67109120
	.word	updateGame.part.0
	.word	waitForVBlank
	.word	goToAnimate
	.size	main, .-main
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L39
	ldr	r3, [r2]
	cmp	r3, #19
	add	r3, r3, #1
	beq	.L36
	str	r3, [r2]
	bx	lr
.L36:
	mov	r3, #0
	str	r3, [r2]
	b	updateGame.part.0
.L40:
	.align	2
.L39:
	.word	frameCounter
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L43
	ldr	r4, .L43+4
	mov	r0, r5
	mov	r1, #0
	mov	lr, pc
	bx	r4
	add	r0, r5, #8
	mov	r1, #1
	mov	lr, pc
	bx	r4
	add	r0, r5, #16
	mov	r1, #2
	mov	lr, pc
	bx	r4
	add	r0, r5, #24
	mov	r1, #3
	mov	lr, pc
	bx	r4
	add	r0, r5, #32
	mov	r1, #4
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	axolotls
	.word	drawAxolotl
	.size	drawGame, .-drawGame
	.align	2
	.global	reverseAxolotls
	.syntax unified
	.arm
	.fpu softvfp
	.type	reverseAxolotls, %function
reverseAxolotls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	add	r0, r3, #32
	ldm	r0, {r0, r1}
	ldr	ip, [r3]
	str	lr, [sp, #-4]!
	ldrh	r2, [r3, #4]
	stm	r3, {r0, r1}
	add	r0, r3, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #8]
	str	ip, [r3, #32]
	ldrh	ip, [r3, #12]
	strh	r2, [r3, #36]	@ movhi
	add	r2, r3, #8
	stm	r2, {r0, r1}
	str	lr, [r3, #24]
	strh	ip, [r3, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	axolotls
	.size	reverseAxolotls, .-reverseAxolotls
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	mov	r2, r0
	str	lr, [sp, #-4]!
	ldrh	ip, [r0, #4]
	ldr	lr, [r0]
	ldm	r1, {r0, r1}
	stm	r2, {r0, r1}
	str	lr, [r3]
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	swap, .-swap
	.comm	state,1,1
	.comm	frameCounter,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	axolotls,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
