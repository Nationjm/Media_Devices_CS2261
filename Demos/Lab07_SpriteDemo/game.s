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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, #32
	mov	r1, #0
	mov	r9, #16
	mov	r8, #95
	mov	ip, #1
	mov	r0, #104
	mov	r7, #36
	mov	r6, #2
	mov	lr, #3
	mov	r5, #200
	mov	r4, #140
	ldr	r3, .L4
	str	r0, [r3]
	stmib	r3, {r8, ip}
	str	r9, [r3, #20]
	str	r2, [r3, #16]
	str	ip, [r3, #12]
	str	r1, [r3, #28]
	ldr	r3, .L4+4
	str	r1, [r3]
	ldr	r3, .L4+8
	str	r1, [r3]
	ldr	r3, .L4+12
	str	r7, [r3, #4]
	strb	r6, [r3, #48]
	str	r0, [r3]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r3, .L4+16
	strb	lr, [r3, #48]
	str	r5, [r3]
	str	r4, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	kitty
	.word	collided
	.word	kittyPalette
	.word	statue
	.word	paw
	.size	initGame, .-initGame
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
	ldr	r3, .L12
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L7
	ldr	r3, .L12+4
	ldr	r3, [r3, #24]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L12+8
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bcc	.L7
	ldr	r1, .L12+12
	ldr	r2, [r1]
	ldr	r3, .L12+16
	add	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r1]
.L7:
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	collided
	.word	kitty
	.word	143165576
	.word	kittyPalette
	.word	1431655766
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initKitty
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKitty, %function
initKitty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #16
	mov	r0, #104
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #32
	mov	lr, #95
	mov	r1, #1
	ldr	r3, .L16
	str	ip, [r3, #20]
	str	r0, [r3]
	ldr	ip, .L16+4
	ldr	r0, .L16+8
	str	r4, [r3, #16]
	str	lr, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [ip]
	str	r2, [r0]
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	kitty
	.word	collided
	.word	kittyPalette
	.size	initKitty, .-initKitty
	.align	2
	.global	initStatue
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStatue, %function
initStatue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #32
	mov	ip, #104
	mov	r0, #36
	mov	r1, #2
	ldr	r3, .L19
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3]
	str	r0, [r3, #4]
	strb	r1, [r3, #48]
	bx	lr
.L20:
	.align	2
.L19:
	.word	statue
	.size	initStatue, .-initStatue
	.align	2
	.global	initPaw
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPaw, %function
initPaw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #32
	mov	ip, #200
	mov	r0, #140
	mov	r1, #3
	ldr	r3, .L22
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3]
	str	r0, [r3, #4]
	strb	r1, [r3, #48]
	bx	lr
.L23:
	.align	2
.L22:
	.word	paw
	.size	initPaw, .-initPaw
	.align	2
	.global	updateKitty
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateKitty, %function
updateKitty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L39
	ldrh	r3, [r3, #48]
	ldr	r4, .L39+4
	tst	r3, #64
	ldr	r1, [r4, #4]
	sub	sp, sp, #16
	bne	.L25
	cmp	r1, #0
	ldrgt	r3, [r4, #12]
	subgt	r1, r1, r3
	strgt	r1, [r4, #4]
.L25:
	ldr	r3, .L39
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldr	r3, [r4, #20]
	bne	.L26
	add	r2, r1, r3
	cmp	r2, #159
	ldrle	r2, [r4, #12]
	addle	r1, r1, r2
	strle	r1, [r4, #4]
.L26:
	ldr	r2, .L39
	ldrh	r2, [r2, #48]
	tst	r2, #32
	ldr	r0, [r4]
	bne	.L27
	cmp	r0, #0
	ldrgt	r2, [r4, #8]
	subgt	r0, r0, r2
	strgt	r0, [r4]
.L27:
	ldr	r2, .L39
	ldrh	r2, [r2, #48]
	tst	r2, #16
	ldr	r2, [r4, #16]
	bne	.L28
	add	ip, r0, r2
	cmp	ip, #239
	ldrle	ip, [r4, #8]
	addle	r0, r0, ip
	strle	r0, [r4]
.L28:
	ldr	ip, .L39+8
	add	r5, ip, #16
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L39+12
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	ldrne	r6, .L39+16
	strne	r3, [r6]
	ldr	r3, .L39+20
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldreq	r6, .L39+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r6]
	bne	.L24
	ldr	r3, [r6]
	cmp	r3, #0
	ldrne	r3, [r4, #24]
	addne	r3, r3, #1
	strne	r3, [r4, #24]
.L24:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	67109120
	.word	kitty
	.word	paw
	.word	collision
	.word	collided
	.word	statue
	.size	updateKitty, .-updateKitty
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
	b	updateKitty
	.size	updateGame, .-updateGame
	.align	2
	.global	drawKitty
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKitty, %function
drawKitty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L47
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L47+4
	ldr	r3, [r3, #24]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L47+8
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bxcc	lr
	ldr	r1, .L47+12
	ldr	r2, [r1]
	ldr	r3, .L47+16
	add	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r1]
	bx	lr
.L48:
	.align	2
.L47:
	.word	collided
	.word	kitty
	.word	143165576
	.word	kittyPalette
	.word	1431655766
	.size	drawKitty, .-drawKitty
	.align	2
	.global	drawStatue
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStatue, %function
drawStatue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawStatue, .-drawStatue
	.align	2
	.global	drawPaw
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaw, %function
drawPaw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawPaw, .-drawPaw
	.comm	paw,52,4
	.comm	statue,52,4
	.comm	kittyPalette,4,4
	.comm	collided,4,4
	.comm	kitty,52,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
