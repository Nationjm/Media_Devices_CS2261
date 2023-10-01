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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Start\000"
	.text
	.align	2
	.global	start
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L8
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+8
	mov	r3, #0
	mov	r1, #67
	mov	r0, #85
	ldr	r2, .L8+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	671
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	lose, .-lose
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #130
	mov	lr, #150
	mov	r2, #7
	mov	ip, #0
	ldr	r3, .L15
	ldr	r0, .L15+4
	str	lr, [r3, #4]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #20]
	strh	r0, [r3, #24]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	32736
	.size	initPlayer, .-initPlayer
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #20]
	add	r2, r0, #12
	cmp	r3, #0
	mov	r4, r0
	ldr	r1, [r0, #4]
	ldm	r2, {r2, r3}
	sub	sp, sp, #12
	bne	.L21
	ldr	r7, .L23
	ldr	r6, .L23+4
.L18:
	ldrh	r0, [r4, #24]
	str	r0, [sp]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r7
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	sub	r3, r1, #1
	rsb	r3, r3, r3, lsl #4
	add	r0, r2, #2
	add	r8, r2, #3
	ldrh	r9, [r4, #24]
	ldr	ip, [r6]
	add	r5, r0, r3, lsl #4
	add	lr, r8, r3, lsl #4
	lsl	r5, r5, #1
	lsl	lr, lr, #1
	strh	r9, [ip, r5]	@ movhi
	strh	r9, [ip, lr]	@ movhi
	lsl	lr, r3, #4
	sub	r5, lr, #240
	add	r9, r2, #4
	add	lr, lr, #240
	add	r8, r5, r8
	add	r5, r2, #6
	add	r3, r9, r3, lsl #4
	add	r2, r2, lr
	ldrh	r9, [r4, #24]
	add	lr, r5, lr
	ldr	r5, .L23+8
	lsl	lr, lr, #1
	lsl	r8, r8, #1
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	strh	r9, [ip, r3]	@ movhi
	add	r1, r1, #5
	strh	r9, [ip, r8]	@ movhi
	mov	r3, #2
	strh	r5, [ip, r2]	@ movhi
	strh	r5, [ip, lr]	@ movhi
	mov	r2, #3
	str	r5, [sp]
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r2, r2, #6
	rsb	r2, r2, r2, lsl #4
	add	r1, r3, #1
	add	r3, r3, #5
	ldr	r0, [r6]
	add	r1, r1, r2, lsl #4
	add	r3, r3, r2, lsl #4
	lsl	r3, r3, #1
	lsl	r2, r1, #1
	strh	r5, [r0, r2]	@ movhi
	strh	r5, [r0, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L21:
	ldr	r5, .L23+8
	str	r5, [sp]
	ldr	r7, .L23
	ldr	r0, [r0, #8]
	mov	lr, pc
	bx	r7
	ldmib	r4, {r1, r3}
	sub	r2, r1, #1
	rsb	r2, r2, r2, lsl #4
	add	ip, r3, #3
	add	r8, ip, r2, lsl #4
	mov	ip, r8
	ldr	r6, .L23+4
	add	lr, r3, #2
	add	r0, r3, #4
	add	r0, r0, r2, lsl #4
	add	r3, lr, r2, lsl #4
	sub	r8, r8, #240
	ldr	lr, [r6]
	lsl	r3, r3, #1
	lsl	r0, r0, #1
	lsl	ip, ip, #1
	lsl	r8, r8, #1
	strh	r5, [lr, r3]	@ movhi
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #16]
	strh	r5, [lr, ip]	@ movhi
	strh	r5, [lr, r0]	@ movhi
	strh	r5, [lr, r8]	@ movhi
	b	.L18
.L24:
	.align	2
.L23:
	.word	drawRectangle
	.word	videoBuffer
	.word	3105
	.size	drawPlayer, .-drawPlayer
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
	ldr	r3, .L31
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L31+4
	bne	.L26
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L26
	mov	r3, #1
	sub	r2, r2, #1
	str	r2, [r4]
	str	r3, [r4, #20]
.L27:
	ldr	r0, .L31+4
	bl	drawPlayer
	mov	r3, #0
	str	r3, [r4, #20]
	pop	{r4, lr}
	bx	lr
.L26:
	tst	r3, #16
	bne	.L27
	ldr	r3, [r4]
	cmp	r3, #232
	movle	r2, #1
	addle	r3, r3, r2
	strle	r3, [r4]
	strle	r2, [r4, #20]
	b	.L27
.L32:
	.align	2
.L31:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L39
	mov	r2, #0
	mov	r3, r4
	mov	ip, #31
	mov	r1, #5
	sub	sp, sp, #12
	add	r0, r4, #720
.L34:
	str	r2, [r3]
	str	r2, [r3, #4]
	strh	ip, [r3, #20]	@ movhi
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	add	r3, r3, #24
	cmp	r3, r0
	bne	.L34
	mov	r5, #15
	mov	r7, #10
	ldr	r6, .L39+4
.L35:
	ldrh	r3, [r4, #44]
	str	r5, [r4, #24]
	str	r3, [sp]
	add	r2, r4, #32
	mov	r0, r5
	ldm	r2, {r2, r3}
	mov	r1, #10
	add	r5, r5, #15
	str	r7, [r4, #28]
	mov	lr, pc
	bx	r6
	cmp	r5, #225
	add	r4, r4, #24
	bne	.L35
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	enemies
	.word	drawRectangle
	.size	initEnemies, .-initEnemies
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrh	r2, [r0, #20]
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L43
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	drawRectangle
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	eraseEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseEnemy, %function
eraseEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	ip, .L47
	sub	sp, sp, #12
	mov	r4, r0
	ldr	r5, .L47+4
	ldm	r0, {r0, r1, r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, .L47+8
	str	r3, [r4, #16]
	str	r3, [r2, #20]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	3105
	.word	drawRectangle
	.word	bullet
	.size	eraseEnemy, .-eraseEnemy
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"collision\000"
	.text
	.align	2
	.global	enemyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyCollision, %function
enemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r1, .L53
	ldr	lr, [r1]
	ldr	r2, [r1, #24]
	ldr	ip, [r0]
	add	r2, lr, r2
	sub	sp, sp, #12
	cmp	ip, r2
	str	r0, [sp, #4]
	bge	.L49
	ldr	r2, [r0, #8]
	add	ip, ip, r2
	cmp	lr, ip
	mov	r3, r0
	bge	.L49
	ldr	r0, [r1, #4]
	ldr	r2, [r1, #28]
	ldr	r1, [r3, #4]
	add	r2, r0, r2
	cmp	r1, r2
	bge	.L49
	ldr	r3, [r3, #12]
	add	r1, r1, r3
	cmp	r0, r1
	blt	.L52
.L49:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L52:
	add	r0, sp, #4
	bl	eraseEnemy
	ldr	r3, .L53+4
	ldr	r0, .L53+8
	mov	lr, pc
	bx	r3
	b	.L49
.L54:
	.align	2
.L53:
	.word	bullet
	.word	mgba_printf
	.word	.LC1
	.size	enemyCollision, .-enemyCollision
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #3
	mvn	r4, #32768
	mov	r0, #0
	mov	ip, #4
	ldr	r3, .L57
	ldm	r3, {r1, r2}
	ldr	r3, .L57+4
	add	r1, r1, lr
	str	r1, [r3]
	str	r1, [r3, #8]
	sub	r1, r2, #6
	sub	r2, r2, #2
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #24]
	str	r1, [r3, #4]
	str	r2, [r3, #12]
	str	ip, [r3, #28]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	player
	.word	bullet
	.size	initBullet, .-initBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L65
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #12
	bne	.L63
	ldr	r6, .L65+4
	ldr	r5, .L65+8
.L60:
	ldrh	r2, [r4, #32]
	ldm	r4, {r0, r1}
	str	r2, [sp]
	mov	r3, #4
	mov	r2, #1
	mov	lr, pc
	bx	r6
	mov	ip, #31
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	add	r1, r3, #1
	sub	r3, r3, #1
	ldr	r0, [r5]
	add	r1, r1, r2, lsl #4
	add	r3, r3, r2, lsl #4
	lsl	r3, r3, #1
	lsl	r2, r1, #1
	strh	ip, [r0, r2]	@ movhi
	strh	ip, [r0, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L63:
	ldr	r7, .L65+12
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	mov	r3, #4
	mov	r2, #1
	ldr	r6, .L65+4
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldr	r5, .L65+8
	add	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	add	r1, r3, #1
	sub	r3, r3, #1
	ldr	r0, [r5]
	add	r3, r3, r2, lsl #4
	add	r1, r1, r2, lsl #4
	lsl	r2, r1, #1
	lsl	r3, r3, #1
	strh	r7, [r0, r2]	@ movhi
	strh	r7, [r0, r3]	@ movhi
	b	.L60
.L66:
	.align	2
.L65:
	.word	bullet
	.word	drawRectangle
	.word	videoBuffer
	.word	3105
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L88
	ldr	r4, .L88+4
	ldrh	r2, [r3]
	ldm	r4, {r0, r3}
	tst	r2, #1
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	sub	sp, sp, #12
	bne	.L68
	ldr	r2, .L88+8
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L87
.L68:
	cmp	r3, #0
	beq	.L74
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L71
.L73:
	ldr	r3, .L88+12
	ldr	r3, [r3]
	add	r3, r3, #3
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L87:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r4, #20]
	cmp	r3, #0
	beq	.L74
.L75:
	mov	r2, #1
	sub	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #16]
	bl	drawBullet
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L73
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L74:
	mov	r1, #0
	ldr	r3, .L88+16
	mov	r2, #3
	str	r3, [sp]
	ldr	r5, .L88+20
	mov	r3, #4
	sub	r0, r0, #1
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, .L88+12
	ldr	r3, [r3, #4]
	sub	r3, r3, #6
	str	r3, [r4, #4]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L73
.L71:
	ldr	r3, [r4, #4]
	b	.L75
.L89:
	.align	2
.L88:
	.word	buttons
	.word	bullet
	.word	oldButtons
	.word	player
	.word	3105
	.word	drawRectangle
	.size	updateBullet, .-updateBullet
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L101
	ldr	r2, [r3]
	cmp	r0, #1
	push	{r4, r5, r6, lr}
	str	r2, [r3, #8]
	beq	.L99
.L91:
	ldr	r4, .L101+4
	ldr	r0, .L101
	bl	drawPlayer
	add	r5, r4, #720
	bl	updateBullet
	b	.L93
.L92:
	add	r4, r4, #24
	cmp	r4, r5
	beq	.L100
.L93:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L92
	mov	r0, r4
	add	r4, r4, #24
	bl	enemyCollision
	cmp	r4, r5
	bne	.L93
.L100:
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	ldr	r3, .L101+8
	add	r0, r0, #3104
	mov	lr, pc
	bx	r3
	bl	initEnemies
	b	.L91
.L102:
	.align	2
.L101:
	.word	player
	.word	enemies
	.word	fillScreen
	.size	game, .-game
	.comm	bullet,36,4
	.comm	enemies,720,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
