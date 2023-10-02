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
	mov	r2, #20
	mov	r1, #1
	mov	r0, #10
	ldr	r3, .L3
	ldr	ip, .L3+4
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	strh	ip, [r3, #32]	@ movhi
	str	r0, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #40]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	15855
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #4
	mov	ip, #2
	ldr	r3, .L9
	ldr	r0, .L9+4
	add	r1, r3, #440
.L6:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	strh	r0, [r3, #32]	@ movhi
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #40]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L6
	ldr	lr, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	bullets
	.word	15855
	.size	initBullets, .-initBullets
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r3, .L22
	add	ip, r3, #440
.L16:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L12
	ldr	r0, [r3]
	ldr	r1, [r3, #24]
	add	r1, r0, r1
	cmp	r1, #240
	ldr	r2, [r3, #4]
	strle	r1, [r3]
	ldr	r1, [r3, #28]
	str	r2, [r3, #12]
	add	r2, r2, r1
	strgt	lr, [r3, #36]
	cmp	r2, #160
	str	r0, [r3, #8]
	strgt	lr, [r3, #36]
	strle	r2, [r3, #4]
.L12:
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L16
	ldr	lr, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	bullets
	.size	updateBullets, .-updateBullets
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
	push	{r4, r5, lr}
	ldr	r3, [r0, #40]
	add	r2, r0, #16
	cmp	r3, #0
	mov	r4, r0
	ldm	r2, {r2, r3}
	sub	sp, sp, #12
	bne	.L28
	ldr	r5, .L30
.L25:
	ldrh	r1, [r4, #32]
	str	r1, [sp]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L28:
	ldr	r1, .L30+4
	str	r1, [sp]
	add	r0, r0, #8
	ldm	r0, {r0, r1}
	ldr	r5, .L30
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, [r4, #16]
	str	r3, [r4, #40]
	ldr	r3, [r4, #20]
	b	.L25
.L31:
	.align	2
.L30:
	.word	drawRect
	.word	32767
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L41
	mov	r8, #31
	ldr	r7, .L41+4
	ldr	r6, .L41+8
	sub	sp, sp, #8
	add	r5, r4, #440
	b	.L34
.L33:
	add	r4, r4, #44
	cmp	r4, r5
	beq	.L40
.L34:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L33
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	str	r8, [sp]
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	add	r4, r4, #44
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L34
.L40:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	bullets
	.word	32767
	.word	drawRect
	.size	drawBullets, .-drawBullets
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"boom\000"
	.text
	.align	2
	.global	newBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	newBullet, %function
newBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r9, .L49
	mov	r8, r0
	mov	r7, r1
	mov	r6, r2
	mov	r5, r3
	mov	ip, r9
	mov	r4, #0
	b	.L46
.L44:
	add	r4, r4, #1
	cmp	r4, #10
	add	ip, ip, #44
	beq	.L43
.L46:
	ldr	lr, [ip, #36]
	cmp	lr, #0
	bne	.L44
	ldr	r3, .L49+4
	ldr	r0, .L49+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	add	r3, r4, r4, lsl #2
	add	r4, r4, r3, lsl r2
	add	r3, r9, r4, lsl #2
	str	r8, [r9, r4, lsl #2]
	str	r7, [r3, #4]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r2, [r3, #36]
.L43:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	bullets
	.word	mgba_printf
	.word	.LC0
	.size	newBullet, .-newBullet
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
	ldr	r3, .L63
	push	{r4, lr}
	ldr	r4, .L63+4
	ldrh	r3, [r3]
	ldm	r4, {r0, r1}
	tst	r3, #1
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	beq	.L52
	ldr	r3, .L63+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	beq	.L61
.L52:
	ldr	r3, .L63+8
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L53
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #28]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	str	r2, [r4, #40]
.L54:
	ldr	r3, .L63+8
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L55
.L62:
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #24]
	add	r3, r3, r1
	str	r3, [r4]
	str	r2, [r4, #40]
.L51:
	pop	{r4, lr}
	bx	lr
.L53:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L54
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #28]
	add	r3, r3, r1
	str	r3, [r4, #4]
	ldr	r3, .L63+8
	str	r2, [r4, #40]
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L62
.L55:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L51
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #24]
	sub	r3, r3, r1
	str	r3, [r4]
	str	r2, [r4, #40]
	pop	{r4, lr}
	bx	lr
.L61:
	mov	r2, #1
	bl	newBullet
	b	.L52
.L64:
	.align	2
.L63:
	.word	oldButtons
	.word	player
	.word	67109120
	.size	updatePlayer, .-updatePlayer
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
	ldr	r0, .L67
	bl	drawPlayer
	pop	{r4, lr}
	b	drawBullets
.L68:
	.align	2
.L67:
	.word	player
	.size	drawGame, .-drawGame
	.comm	bullets,440,4
	.comm	player,44,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
