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
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Pause\000"
	.text
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
	cmp	r0, #0
	push	{r4, lr}
	bne	.L16
.L11:
	ldr	r4, .L17
	mov	r1, #70
	mov	r0, #100
	ldr	r3, .L17+4
	ldr	r2, .L17+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L16:
	mov	r0, #0
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	b	.L11
.L18:
	.align	2
.L17:
	.word	drawString
	.word	32767
	.word	.LC1
	.word	fillScreen
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"You Win!\000"
	.text
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
	cmp	r0, #0
	push	{r4, lr}
	bne	.L25
.L20:
	ldr	r4, .L26
	mov	r3, #0
	mov	r1, #70
	mov	r0, #100
	ldr	r2, .L26+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L25:
	mov	r0, #31744
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
	b	.L20
.L27:
	.align	2
.L26:
	.word	drawString
	.word	.LC2
	.word	fillScreen
	.size	win, .-win
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
	mov	r1, #130
	str	lr, [sp, #-4]!
	mov	r2, #7
	mov	lr, #150
	mov	ip, #0
	mov	r0, #1
	ldr	r3, .L30
	str	r1, [r3]
	str	r1, [r3, #8]
	ldr	r1, .L30+4
	str	lr, [r3, #4]
	str	ip, [r3, #24]
	str	r0, [r3, #16]
	strh	r1, [r3, #28]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #20]
	sub	sp, sp, #12
	bne	.L36
	ldr	r7, .L38
	ldr	r6, .L38+4
.L33:
	ldrh	r0, [r4, #28]
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
	ldrh	r9, [r4, #28]
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
	ldrh	r9, [r4, #28]
	add	lr, r5, lr
	ldr	r5, .L38+8
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
.L36:
	ldr	r5, .L38+8
	str	r5, [sp]
	ldr	r7, .L38
	ldr	r0, [r0, #8]
	mov	lr, pc
	bx	r7
	ldmib	r4, {r1, r3}
	sub	r2, r1, #1
	rsb	r2, r2, r2, lsl #4
	add	ip, r3, #3
	add	r8, ip, r2, lsl #4
	mov	ip, r8
	ldr	r6, .L38+4
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
	ldr	r3, [r4, #20]
	strh	r5, [lr, ip]	@ movhi
	strh	r5, [lr, r0]	@ movhi
	strh	r5, [lr, r8]	@ movhi
	b	.L33
.L39:
	.align	2
.L38:
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
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L46+4
	bne	.L41
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L41
	mov	r3, #1
	ldr	r1, [r4, #16]
	sub	r2, r2, r1
	str	r2, [r4]
	str	r3, [r4, #24]
.L42:
	ldr	r0, .L46+4
	bl	drawPlayer
	mov	r3, #0
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L41:
	tst	r3, #16
	bne	.L42
	ldr	r3, [r4]
	cmp	r3, #231
	movle	r1, #1
	ldrle	r2, [r4, #16]
	addle	r3, r2, r3
	strle	r3, [r4]
	strle	r1, [r4, #24]
	b	.L42
.L47:
	.align	2
.L46:
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
	ldr	r2, .L56
	push	{r4, lr}
	mov	r1, #0
	mov	r3, r2
	mov	lr, #31
	mov	r0, #7
	add	ip, r2, #720
.L49:
	str	r1, [r3]
	str	r1, [r3, #4]
	strh	lr, [r3, #20]	@ movhi
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	add	r3, r3, #24
	cmp	r3, ip
	bne	.L49
	mov	r3, #0
	mov	r4, #25
	mov	ip, #1
	mov	lr, #10
.L52:
	ldr	r1, [r2, #16]
	add	r3, r3, #1
	cmp	r1, #0
	rsb	r1, r3, r3, lsl #4
	sub	r0, r1, #15
	bne	.L50
	cmp	r0, #219
	addhi	r1, r3, r3, lsl #2
	lslhi	r1, r1, #2
	subhi	r1, r1, #300
	stmls	r2, {r1, lr}
	strls	ip, [r2, #16]
	strhi	r4, [r2, #4]
	strhi	ip, [r2, #16]
	strhi	r1, [r2]
.L50:
	cmp	r3, #25
	add	r2, r2, #24
	bne	.L52
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	enemies
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
	ldr	r4, .L60
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	ip, .L64
	sub	sp, sp, #12
	mov	r4, r0
	ldr	r5, .L64+4
	ldm	r0, {r0, r1, r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #16]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	3105
	.word	drawRectangle
	.size	eraseEnemy, .-eraseEnemy
	.align	2
	.global	enemyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyCollision, %function
enemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L73
	add	r1, r0, #8
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	ldm	r1, {r1, ip}
	mov	r4, r0
	ldr	r0, [r5]
	sub	sp, sp, #16
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r2, #3
	mov	r3, #4
	str	ip, [sp, #12]
	ldr	r1, [r5, #4]
	ldr	r6, .L73+4
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L72
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	mov	r0, #2
	ldr	r3, .L73+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #0
	ldr	ip, .L73+12
	ldr	r0, [r5]
	str	ip, [sp]
	ldr	r3, .L73+16
	ldr	ip, .L73+20
	str	r2, [r3]
	str	r1, [r5, #20]
	str	r4, [ip]
	mov	r3, #4
	mov	r2, #3
	ldr	r1, [r5, #4]
	ldr	r4, .L73+24
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+28
	ldr	r3, [r3, #4]
	sub	r3, r3, #6
	str	r3, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	bullet
	.word	collision
	.word	playAnalogSound
	.word	3105
	.word	.LANCHOR0
	.word	enemyToErase
	.word	drawRectangle
	.word	player
	.size	enemyCollision, .-enemyCollision
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L81
	ldr	r4, [r3]
	cmp	r4, #0
	sub	sp, sp, #12
	beq	.L75
	ldr	ip, .L81+4
	ldm	r4, {r0, r1, r2, r3}
	ldr	r5, .L81+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #16]
.L75:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	enemyToErase
	.word	3105
	.word	drawRectangle
	.size	updateEnemy, .-updateEnemy
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
	ldr	r3, .L85
	ldm	r3, {r1, r2}
	ldr	r3, .L85+4
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
.L86:
	.align	2
.L85:
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
	ldr	r4, .L93
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #12
	bne	.L91
	ldr	r6, .L93+4
	ldr	r5, .L93+8
.L88:
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
.L91:
	ldr	r7, .L93+12
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	mov	r3, #4
	mov	r2, #1
	ldr	r6, .L93+4
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldr	r5, .L93+8
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
	b	.L88
.L94:
	.align	2
.L93:
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
	ldr	r3, .L114
	ldr	r4, .L114+4
	ldrh	r2, [r3]
	ldm	r4, {r0, r3}
	tst	r2, #1
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	sub	sp, sp, #12
	bne	.L96
	ldr	r2, .L114+8
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L112
.L96:
	cmp	r3, #0
	beq	.L103
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L99
.L101:
	ldr	r3, .L114+12
	ldr	r3, [r3]
	add	r3, r3, #3
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L112:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	beq	.L113
.L97:
	cmp	r3, #0
	ldreq	r0, [r4]
	beq	.L103
.L102:
	mov	r2, #1
	sub	r3, r3, #2
	str	r3, [r4, #4]
	str	r2, [r4, #16]
	bl	drawBullet
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L101
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L103:
	mov	r1, #0
	ldr	r3, .L114+16
	mov	r2, #3
	str	r3, [sp]
	ldr	r5, .L114+20
	mov	r3, #4
	sub	r0, r0, #1
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, .L114+12
	ldr	r3, [r3, #4]
	sub	r3, r3, #6
	str	r3, [r4, #4]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L101
.L99:
	ldr	r3, [r4, #4]
	b	.L102
.L113:
	ldr	r3, .L114+24
	mov	r0, #4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [r4, #4]
	str	r2, [r4, #20]
	b	.L97
.L115:
	.align	2
.L114:
	.word	buttons
	.word	bullet
	.word	oldButtons
	.word	player
	.word	3105
	.word	drawRectangle
	.word	playAnalogSound
	.size	updateBullet, .-updateBullet
	.align	2
	.global	initPowerUP
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPowerUP, %function
initPowerUP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #15
	mov	r1, #0
	mov	r2, #3
	mov	ip, #992
	ldr	r3, .L117
	str	r0, [r3]
	str	r0, [r3, #4]
	strh	ip, [r3, #24]	@ movhi
	str	r1, [r3, #8]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bx	lr
.L118:
	.align	2
.L117:
	.word	powerUP
	.size	initPowerUP, .-initPowerUP
	.align	2
	.global	dropPowerUP
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropPowerUP, %function
dropPowerUP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L124
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	mov	r1, #1
	ldr	r3, .L124+4
	ldr	r2, [r0, #4]
	ldr	r0, [r3]
	ldr	r3, .L124+8
	stm	r3, {r0, r2}
	str	r2, [r3, #8]
	str	r1, [r3, #20]
	bx	lr
.L125:
	.align	2
.L124:
	.word	.LANCHOR0
	.word	bullet
	.word	powerUP
	.size	dropPowerUP, .-dropPowerUP
	.align	2
	.global	drawPowerUP
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPowerUP, %function
drawPowerUP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L130
	ldr	r6, .L130+4
	ldr	r1, [r4, #4]
	sub	sp, sp, #8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #12]
	ldr	r0, [r4]
	ldr	r5, .L130+8
	sub	r1, r1, #1
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldm	r4, {r0, r1}
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #12]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #4]
	cmp	r1, #159
	bgt	.L129
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L129:
	str	r6, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #20]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	powerUP
	.word	3105
	.word	drawRectangle
	.size	drawPowerUP, .-drawPowerUP
	.align	2
	.global	powerUPCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	powerUPCollision, %function
powerUPCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L139
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #12]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	sub	sp, sp, #16
	ldr	r4, .L139+4
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r6, .L139+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L138
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	mov	ip, #0
	mov	r1, #2
	ldr	r3, .L139+12
	str	r3, [sp]
	add	r2, r4, #12
	str	r1, [r5, #16]
	str	ip, [r4, #20]
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L139+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	player
	.word	powerUP
	.word	collision
	.word	3105
	.word	drawRectangle
	.size	powerUPCollision, .-powerUPCollision
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L167
	ldr	r3, [r8]
	cmp	r0, #1
	str	r3, [r8, #8]
	sub	sp, sp, #12
	beq	.L162
	ldr	r4, .L167+4
.L142:
	ldr	r7, .L167+8
	ldr	r0, .L167
	bl	drawPlayer
	bl	updateBullet
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, #1
	str	r3, [r7, #8]
	beq	.L164
.L145:
	mov	fp, #0
	ldr	r9, .L167+12
	ldr	r6, .L167+16
	ldr	r5, .L167+20
	b	.L150
.L147:
	add	r9, r9, #24
	cmp	r9, r4
	beq	.L165
.L150:
	ldr	r2, [r9, #16]
	cmp	r2, #0
	beq	.L147
	mov	r0, r9
	bl	enemyCollision
	ldr	r10, [r5]
	cmp	r10, #1
	bne	.L147
	ldr	r1, [r6]
	sub	r1, r1, #1
	str	r1, [r6]
	bl	updateEnemy
	ldr	r3, .L167+24
	mov	lr, pc
	bx	r3
	ldr	ip, .L167+28
	smull	r3, ip, r0, ip
	asr	r1, r0, #31
	rsb	r1, r1, ip, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r0, r1, lsl #2
	bne	.L149
	ldr	r1, [r5]
	cmp	r1, #0
	beq	.L149
	ldr	r3, .L167+32
	ldr	r2, [r9, #4]
	ldr	r1, [r3]
	stm	r7, {r1, r2}
	str	r10, [r7, #20]
	str	r2, [r7, #8]
.L149:
	add	r9, r9, #24
	cmp	r9, r4
	str	fp, [r5]
	bne	.L150
.L165:
	ldr	r3, [r6]
	cmp	r3, #10
	mvneq	r3, #64512
	strheq	r3, [r8, #28]	@ movhi
	bl	updatePlayer
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L166
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L166:
	ldr	r3, .L167+36
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L164:
	bl	drawPowerUP
	bl	powerUPCollision
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
	b	.L145
.L162:
	ldr	r5, .L167+12
	ldr	r0, .L167+40
	ldr	r3, .L167+44
	mov	lr, pc
	bx	r3
	ldr	r6, .L167+48
	add	r4, r5, #720
	b	.L144
.L143:
	add	r5, r5, #24
	cmp	r5, r4
	beq	.L142
.L144:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L143
	ldrh	r2, [r5, #20]
	ldr	r3, [r5, #12]
	str	r2, [sp]
	ldm	r5, {r0, r1, r2}
	mov	lr, pc
	bx	r6
	b	.L143
.L168:
	.align	2
.L167:
	.word	player
	.word	enemies+720
	.word	powerUP
	.word	enemies
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	rand
	.word	1717986919
	.word	bullet
	.word	goToWin
	.word	3105
	.word	fillScreen
	.word	drawRectangle
	.size	game, .-game
	.align	2
	.global	updatePowerUP
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePowerUP, %function
updatePowerUP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L173
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #4]
	cmp	r2, #1
	str	r3, [r4, #8]
	beq	.L172
	pop	{r4, lr}
	bx	lr
.L172:
	bl	drawPowerUP
	bl	powerUPCollision
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	powerUP
	.size	updatePowerUP, .-updatePowerUP
	.global	activeEnemies
	.global	enemyErase
	.comm	enemyToErase,4,4
	.comm	NOTES,2,2
	.comm	powerUP,28,4
	.comm	bullet,36,4
	.comm	enemies,720,4
	.comm	player,32,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	activeEnemies, %object
	.size	activeEnemies, 4
activeEnemies:
	.word	25
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	enemyErase, %object
	.size	enemyErase, 4
enemyErase:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
