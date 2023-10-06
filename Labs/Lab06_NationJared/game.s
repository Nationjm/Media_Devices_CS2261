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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #128
	mov	r1, #100
	mov	r2, #32
	mov	ip, #0
	ldr	r3, .L3
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	ip, [r3, #16]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #134
	mov	r3, #128
	push	{r4, lr}
	ldr	r4, .L8
	ldr	r1, .L8+4
	str	r2, [r4, #4]
	str	r2, [r4, #12]
	str	r3, [r4]
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r1
	ands	r0, r0, #1
	mov	r3, #3
	mvneq	r0, #0
	mvn	r1, #2
	mov	r2, #252
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	strh	r2, [r4, #32]	@ movhi
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	ball
	.word	rand
	.size	initBall, .-initBall
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"1. x: %d, width: %d\000"
	.align	2
.LC2:
	.ascii	"2. x: %d, width: %d\000"
	.align	2
.LC3:
	.ascii	"3. x: %d, width: %d\000"
	.align	2
.LC4:
	.ascii	"4. x: %d, width: %d\000"
	.align	2
.LC5:
	.ascii	"5. x: %d, width: %d\000"
	.text
	.align	2
	.global	initBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L24
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r1, #0
	mov	lr, #4
	mov	ip, #1
	ldr	r0, .L24+8
.L11:
	umull	r5, r3, r0, r1
	lsr	r3, r3, #2
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #1
	add	r1, r1, #1
	add	r3, r3, #10
	cmp	r1, #30
	str	lr, [r2, #16]
	str	ip, [r2, #28]
	str	r3, [r2, #4]
	add	r2, r2, #36
	bne	.L11
	mov	r7, #2
	mov	r10, #36
	mov	r9, #253
	ldr	r5, .L24
	ldr	r6, .L24+12
	ldr	r8, .L24+16
.L12:
	str	r7, [r5]
	mov	r1, r7
	str	r10, [r5, #20]
	strh	r9, [r5, #24]	@ movhi
	mov	r2, #36
	mov	r0, r8
	add	r7, r7, #40
	mov	lr, pc
	bx	r6
	cmp	r7, #242
	add	r5, r5, #36
	bne	.L12
	mov	r5, #2
	mov	r9, #35
	mov	r8, #252
	ldr	r7, .L24+20
.L13:
	str	r5, [r4, #216]
	mov	r1, r5
	mov	r2, #35
	mov	r0, r7
	add	r5, r5, #40
	str	r9, [r4, #236]
	strh	r8, [r4, #240]	@ movhi
	mov	lr, pc
	bx	r6
	cmp	r5, #242
	add	r4, r4, #36
	bne	.L13
	mov	r5, #1
	mov	r9, #35
	mov	r8, #250
	ldr	r4, .L24+24
	ldr	r7, .L24+28
.L14:
	str	r5, [r4]
	mov	r1, r5
	mov	r2, #35
	mov	r0, r7
	add	r5, r5, #40
	str	r9, [r4, #20]
	strh	r8, [r4, #24]	@ movhi
	mov	lr, pc
	bx	r6
	cmp	r5, #241
	add	r4, r4, #36
	bne	.L14
	mov	r5, #2
	mov	r9, #35
	mov	r8, #255
	ldr	r4, .L24+32
	ldr	r7, .L24+36
.L15:
	str	r5, [r4]
	mov	r1, r5
	mov	r2, #35
	mov	r0, r7
	add	r5, r5, #40
	str	r9, [r4, #20]
	strh	r8, [r4, #24]	@ movhi
	mov	lr, pc
	bx	r6
	cmp	r5, #242
	add	r4, r4, #36
	bne	.L15
	mov	r5, #1
	mov	r9, #36
	mov	r8, #251
	ldr	r4, .L24+40
	ldr	r7, .L24+44
.L16:
	str	r5, [r4]
	mov	r1, r5
	mov	r2, #36
	mov	r0, r7
	add	r5, r5, #40
	str	r9, [r4, #20]
	strh	r8, [r4, #24]	@ movhi
	mov	lr, pc
	bx	r6
	cmp	r5, #241
	add	r4, r4, #36
	bne	.L16
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	blocks
	.word	mgba_open
	.word	-1431655765
	.word	mgba_printf
	.word	.LC1
	.word	.LC2
	.word	blocks+432
	.word	.LC3
	.word	blocks+648
	.word	.LC4
	.word	blocks+864
	.word	.LC5
	.size	initBlocks, .-initBlocks
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	ip, #0
	mov	r0, #128
	mov	r1, #100
	mov	r2, #32
	sub	sp, sp, #20
	mov	r4, sp
	ldr	r3, .L30
	ldr	lr, .L30+4
	str	ip, [r3, #16]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	ip, [lr]
	bl	initBall
	bl	initBlocks
	ldr	r3, .L30+8
	ldm	r3, {r0, r1, r2, r3}
	ldr	r5, .L30+12
	stm	r4, {r0, r1, r2, r3}
	mov	r3, #512
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L30+16
	mov	lr, pc
	bx	r5
	mov	r2, r4
	ldr	r3, .L30+20
	ldr	r0, .L30+24
.L27:
	ldrh	r1, [r2], #2
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L27
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	score
	.word	.LANCHOR0
	.word	DMANow
	.word	imposterPal
	.word	83886576
	.word	83886592
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r1, [r3]
	ldr	r3, .L37+4
	tst	r1, #32
	ldr	r2, [r3]
	bne	.L33
	cmp	r2, #1
	mvngt	r0, #2
	strgt	r0, [r3, #16]
	addgt	r1, r2, r0
	bgt	.L34
.L33:
	tst	r1, #16
	beq	.L36
.L35:
	mov	r0, #0
	mov	r1, r2
	str	r0, [r3, #16]
.L34:
	str	r2, [r3, #8]
	str	r1, [r3]
	bx	lr
.L36:
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #238
	bgt	.L35
	mov	r0, #3
	str	r0, [r3, #16]
	add	r1, r2, r0
	b	.L34
.L38:
	.align	2
.L37:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L48
	ldr	r1, [r4, #4]
	cmp	r1, #1
	movle	r3, #2
	strle	r3, [r4, #20]
	ldr	r3, [r4, #24]
	add	r2, r1, r3
	cmp	r2, #158
	mvngt	r0, #0
	mvngt	ip, #1
	ldrgt	r2, .L48+4
	strgt	r0, [r2]
	ldr	r0, [r4]
	strgt	ip, [r4, #20]
	cmp	r0, #1
	movle	r2, #1
	strle	r2, [r4, #16]
	ldr	r2, [r4, #28]
	add	ip, r0, r2
	cmp	ip, #238
	mvngt	ip, #0
	ldr	r5, .L48+8
	strgt	ip, [r4, #16]
	ldr	ip, [r5, #24]
	add	ip, ip, ip, lsr #31
	sub	sp, sp, #16
	asr	ip, ip, #1
	ldr	r6, [r5, #20]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L48+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L44
	mvn	r2, #0
	ldr	r3, [r4, #20]
	rsb	r3, r3, #0
	str	r3, [r4, #20]
	str	r2, [r4, #16]
.L45:
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	add	r3, r0, r3
	add	r2, r1, r2
	str	r3, [r4, #4]
	str	r0, [r4, #12]
	str	r2, [r4]
	str	r1, [r4, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L44:
	ldr	r3, [r5, #24]
	ldr	r2, [r5]
	add	r3, r3, r3, lsr #31
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #4]
	asr	r3, r3, #1
	add	r2, r3, r2
	str	r3, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r1, #1
	ldrne	r3, [r4, #20]
	addeq	r2, r4, #16
	rsbne	r3, r3, #0
	movne	r2, r1
	ldmeq	r2, {r2, r3}
	strne	r3, [r4, #20]
	strne	r1, [r4, #16]
	b	.L45
.L49:
	.align	2
.L48:
	.word	ball
	.word	score
	.word	player
	.word	collision
	.size	updateBall, .-updateBall
	.align	2
	.global	updateBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlocks, %function
updateBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	add	r6, r0, #16
	ldm	r6, {r6, ip}
	sub	sp, sp, #20
	ldr	lr, [r0, #4]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	r5, .L67
	ldr	ip, [r4]
	ldr	r3, [r5, #24]
	stm	sp, {ip, lr}
	ldr	r2, [r5, #28]
	ldm	r5, {r0, r1}
	ldr	r6, .L67+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L66
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L66:
	add	r0, r4, #16
	ldm	r0, {r0, r3}
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [sp, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	subs	r7, r0, #0
	beq	.L54
	mov	r2, #0
	mvn	r1, #0
	ldr	r3, [r5, #20]
	rsb	r3, r3, #0
	str	r3, [r5, #20]
	str	r1, [r5, #16]
	str	r2, [r4, #28]
	str	r2, [r4, #32]
.L55:
	ldr	r2, .L67+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L54:
	ldr	r3, [r4, #20]
	ldr	r2, [r4]
	add	r3, r3, r3, lsr #31
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #4]
	asr	r3, r3, #1
	add	r2, r3, r2
	str	r3, [sp, #8]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L55
	mov	r2, #1
	ldr	r3, [r5, #20]
	rsb	r3, r3, #0
	str	r7, [r4, #28]
	str	r7, [r4, #32]
	str	r3, [r5, #20]
	str	r2, [r5, #16]
	b	.L55
.L68:
	.align	2
.L67:
	.word	ball
	.word	collision
	.word	score
	.size	updateBlocks, .-updateBlocks
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	bl	updateBall
	ldr	r4, .L73
	add	r5, r4, #1072
	add	r5, r5, #8
.L70:
	mov	r0, r4
	add	r4, r4, #36
	bl	updateBlocks
	cmp	r4, r5
	bne	.L70
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	blocks
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L77
	ldr	ip, .L77+4
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r4, .L77+8
	ldm	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	player
	.word	imposterBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L81
	ldrb	r2, [r0, #32]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r4, .L81+4
	ldr	r2, [r0, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	ball
	.word	drawRect4
	.size	drawBall, .-drawBall
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
	ldr	r4, .L92
	mov	r0, #255
	ldr	r3, .L92+4
	sub	sp, sp, #8
	add	r5, r4, #1072
	mov	lr, pc
	bx	r3
	ldr	r6, .L92+8
	bl	drawPlayer
	add	r5, r5, #8
	bl	drawBall
	b	.L85
.L84:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L91
.L85:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L84
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #20]
	add	r4, r4, #36
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L85
.L91:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	blocks
	.word	fillScreen4
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	drawBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlocks, %function
drawBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r2, [r0, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L103
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	drawRect4
	.size	drawBlocks, .-drawBlocks
	.comm	score,4,4
	.comm	blocks,1080,4
	.comm	ball,36,4
	.comm	player,28,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	3173
	.short	9522
	.short	7415
	.short	1626
	.short	5322
	.short	10583
	.short	26427
	.ident	"GCC: (devkitARM release 53) 9.1.0"
