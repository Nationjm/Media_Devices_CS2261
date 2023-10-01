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
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #31
	mov	lr, #4
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L9
	add	r1, r3, #480
.L6:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	strh	r4, [r3, #32]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #44]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L6
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	bullets
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
	ldr	r3, .L27
	str	lr, [sp, #-4]!
	mov	r0, #0
	add	lr, r3, #480
	b	.L18
.L13:
	cmp	r1, #0
	strge	r1, [r3]
	blt	.L24
	ldr	r1, [r3, #28]
	add	r2, r2, r1
	cmp	r2, #160
	bgt	.L25
.L16:
	cmp	r2, #0
	strge	r2, [r3, #4]
	blt	.L25
.L12:
	add	r3, r3, #48
	cmp	r3, lr
	beq	.L26
.L18:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L12
	ldr	ip, [r3]
	ldr	r1, [r3, #24]
	ldr	r2, [r3, #4]
	add	r1, ip, r1
	cmp	r1, #240
	str	ip, [r3, #8]
	str	r2, [r3, #12]
	ble	.L13
.L24:
	ldr	r1, [r3, #28]
	add	r2, r2, r1
	cmp	r2, #160
	str	r0, [r3, #36]
	str	r0, [r3, #44]
	ble	.L16
.L25:
	str	r0, [r3, #36]
	str	r0, [r3, #44]
	add	r3, r3, #48
	cmp	r3, lr
	bne	.L18
.L26:
	ldr	lr, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
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
	bne	.L33
	ldr	r5, .L35
.L30:
	ldrh	r1, [r4, #32]
	str	r1, [sp]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L33:
	ldr	r1, .L35+4
	str	r1, [sp]
	add	r0, r0, #8
	ldm	r0, {r0, r1}
	ldr	r5, .L35
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, [r4, #16]
	str	r3, [r4, #40]
	ldr	r3, [r4, #20]
	b	.L30
.L36:
	.align	2
.L35:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L45
	ldr	r7, .L45+4
	ldr	r6, .L45+8
	sub	sp, sp, #12
	add	r5, r4, #480
	b	.L40
.L38:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L43
.L39:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L44
.L40:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L38
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #16]
	add	r4, r4, #48
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L40
.L44:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L43:
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	b	.L39
.L46:
	.align	2
.L45:
	.word	bullets
	.word	32767
	.word	drawRect
	.size	drawBullets, .-drawBullets
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"New bullet added\000"
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
	ldr	r9, .L53
	mov	r8, r0
	mov	r7, r1
	mov	r6, r2
	mov	r5, r3
	mov	ip, r9
	mov	r4, #0
	b	.L50
.L48:
	add	r4, r4, #1
	cmp	r4, #10
	add	ip, ip, #48
	beq	.L47
.L50:
	ldr	lr, [ip, #36]
	cmp	lr, #0
	bne	.L48
	ldr	r3, .L53+4
	ldr	r0, .L53+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	add	r4, r4, r4, lsl r2
	add	r3, r9, r4, lsl #4
	str	r8, [r9, r4, lsl #4]
	str	r7, [r3, #4]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r2, [r3, #36]
.L47:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L67
	push	{r4, lr}
	ldr	r4, .L67+4
	ldrh	r3, [r3]
	ldr	r2, [r4]
	ldr	r1, [r4, #4]
	tst	r3, #1
	str	r2, [r4, #8]
	str	r1, [r4, #12]
	beq	.L56
	ldr	r3, .L67+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	beq	.L65
.L56:
	ldr	r3, .L67+8
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L57
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #28]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	str	r2, [r4, #40]
.L58:
	ldr	r3, .L67+8
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L59
.L66:
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #24]
	add	r3, r3, r1
	str	r3, [r4]
	str	r2, [r4, #40]
.L55:
	pop	{r4, lr}
	bx	lr
.L57:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L58
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #28]
	add	r3, r3, r1
	str	r3, [r4, #4]
	ldr	r3, .L67+8
	str	r2, [r4, #40]
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L66
.L59:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L55
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #24]
	sub	r3, r3, r1
	str	r3, [r4]
	str	r2, [r4, #40]
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r0, [r4, #16]
	add	r0, r2, r0
	mov	r2, #1
	bl	newBullet
	b	.L56
.L68:
	.align	2
.L67:
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
	ldr	r0, .L71
	bl	drawPlayer
	pop	{r4, lr}
	b	drawBullets
.L72:
	.align	2
.L71:
	.word	player
	.size	drawGame, .-drawGame
	.comm	bullets,480,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
