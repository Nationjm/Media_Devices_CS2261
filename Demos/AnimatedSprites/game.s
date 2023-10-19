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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, lr}
	mov	r1, #1
	mov	r5, #120
	mov	r4, #80
	mov	lr, #3
	mov	r0, #16
	mov	ip, #20
	ldr	r3, .L4
	strb	r2, [r3, #48]
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #40]
	str	ip, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	car
	.size	initGame, .-initGame
	.align	2
	.global	initCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCar, %function
initCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	initGame
	.size	initCar, .-initCar
	.global	__aeabi_idivmod
	.align	2
	.global	updateCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCar, %function
updateCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r2, .L32
	ldrh	r2, [r2, #48]
	push	{r4, lr}
	ldr	r4, .L32+4
	tst	r2, #64
	str	r3, [r4, #32]
	bne	.L8
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, [r4, #12]
	subgt	r3, r3, r2
	strgt	r3, [r4, #4]
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #32]
	str	r3, [r4, #28]
.L8:
	ldr	r3, .L32
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L10
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #4]
	rsb	r3, r3, #160
	cmp	r2, r3
	ldrlt	r3, [r4, #12]
	addlt	r2, r3, r2
	strlt	r2, [r4, #4]
	mov	r3, #2
	mov	r2, #1
	str	r3, [r4, #28]
	str	r2, [r4, #32]
.L10:
	ldr	r3, .L32
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L12
	ldr	r3, [r4]
	cmp	r3, #0
	ldrgt	r2, [r4, #8]
	subgt	r3, r3, r2
	strgt	r3, [r4]
	mov	r2, #1
	mov	r3, #3
	ldr	r1, .L32
	ldrh	r1, [r1, #48]
	tst	r1, #16
	str	r2, [r4, #32]
	str	r3, [r4, #28]
	bne	.L15
.L14:
	ldr	r3, [r4, #16]
	ldr	r2, [r4]
	rsb	r3, r3, #240
	cmp	r2, r3
	blt	.L16
.L17:
	mov	r3, #1
	str	r3, [r4, #28]
	str	r3, [r4, #32]
.L15:
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L7
	ldr	r0, [r4, #36]
	ldr	r3, .L32+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #20
	str	r1, [r4, #36]
	str	r3, [r4, #24]
.L7:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, [r4, #8]
	add	r2, r3, r2
	str	r2, [r4]
	b	.L17
.L12:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L14
	ldr	r3, [r4, #32]
	cmp	r3, #0
	streq	r3, [r4, #36]
	bne	.L15
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	67109120
	.word	car
	.word	__aeabi_idivmod
	.size	updateCar, .-updateCar
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
	b	updateCar
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCar, %function
drawCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L41
	ldr	r0, [r2, #36]
	ldr	r3, [r2]
	ldr	ip, [r2, #28]
	ldr	lr, .L41+4
	ldrb	r1, [r2, #48]	@ zero_extendqisi2
	ldr	r6, [r2, #44]
	ldrb	r4, [r2, #4]	@ zero_extendqisi2
	add	ip, ip, r0, lsl #5
	lsl	r3, r3, #23
	ldr	r0, .L41+8
	add	r5, lr, r1, lsl #3
	cmp	r6, #0
	lsl	r1, r1, #3
	lsr	r3, r3, #23
	strh	r4, [lr, r1]	@ movhi
	orr	r3, r3, #16384
	orrne	r4, r4, #512
	and	r2, r0, ip, lsl #1
	strh	r3, [r5, #2]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	strhne	r4, [lr, r1]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	car
	.word	shadowOAM
	.word	1022
	.size	drawCar, .-drawCar
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
	push	{r4, lr}
	bl	drawCar
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L45+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	car,52,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
