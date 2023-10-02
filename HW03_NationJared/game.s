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
	ldr	r3, .L31
	ldr	r0, .L31+4
	str	lr, [r3, #4]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #20]
	strh	r0, [r3, #24]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
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
	bne	.L37
	ldr	r7, .L39
	ldr	r6, .L39+4
.L34:
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
	ldr	r5, .L39+8
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
.L37:
	ldr	r5, .L39+8
	str	r5, [sp]
	ldr	r7, .L39
	ldr	r0, [r0, #8]
	mov	lr, pc
	bx	r7
	ldmib	r4, {r1, r3}
	sub	r2, r1, #1
	rsb	r2, r2, r2, lsl #4
	add	ip, r3, #3
	add	r8, ip, r2, lsl #4
	mov	ip, r8
	ldr	r6, .L39+4
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
	b	.L34
.L40:
	.align	2
.L39:
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
	ldr	r3, .L47
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L47+4
	bne	.L42
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L42
	mov	r3, #1
	sub	r2, r2, #1
	str	r2, [r4]
	str	r3, [r4, #20]
.L43:
	ldr	r0, .L47+4
	bl	drawPlayer
	mov	r3, #0
	str	r3, [r4, #20]
	pop	{r4, lr}
	bx	lr
.L42:
	tst	r3, #16
	bne	.L43
	ldr	r3, [r4]
	cmp	r3, #232
	movle	r2, #1
	addle	r3, r3, r2
	strle	r3, [r4]
	strle	r2, [r4, #20]
	b	.L43
.L48:
	.align	2
.L47:
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
	ldr	r2, .L57
	push	{r4, lr}
	mov	r1, #0
	mov	r3, r2
	mov	lr, #31
	mov	r0, #5
	add	ip, r2, #720
.L50:
	str	r1, [r3]
	str	r1, [r3, #4]
	strh	lr, [r3, #20]	@ movhi
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	add	r3, r3, #24
	cmp	r3, ip
	bne	.L50
	mov	r3, #0
	mov	r4, #25
	mov	ip, #1
	mov	lr, #10
.L53:
	ldr	r1, [r2, #16]
	add	r3, r3, #1
	cmp	r1, #0
	rsb	r1, r3, r3, lsl #4
	sub	r0, r1, #15
	bne	.L51
	cmp	r0, #219
	addhi	r1, r3, r3, lsl #2
	lslhi	r1, r1, #2
	subhi	r1, r1, #300
	stmls	r2, {r1, lr}
	strls	ip, [r2, #16]
	strhi	r4, [r2, #4]
	strhi	ip, [r2, #16]
	strhi	r1, [r2]
.L51:
	cmp	r3, #25
	add	r2, r2, #24
	bne	.L53
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r4, .L61
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	ip, .L65
	sub	sp, sp, #12
	mov	r4, r0
	ldr	r5, .L65+4
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
.L66:
	.align	2
.L65:
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
	ldr	r5, .L74
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
	ldr	r6, .L74+4
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L73
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	mov	r2, #1
	mov	r1, #0
	ldr	ip, .L74+8
	ldr	r0, [r5]
	str	ip, [sp]
	ldr	r3, .L74+12
	ldr	ip, .L74+16
	str	r2, [r3]
	str	r1, [r5, #20]
	str	r4, [ip]
	mov	r3, #4
	mov	r2, #3
	ldr	r1, [r5, #4]
	ldr	r4, .L74+20
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+24
	ldr	r3, [r3, #4]
	sub	r3, r3, #6
	str	r3, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	bullet
	.word	collision
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
	ldr	r3, .L82
	ldr	r4, [r3]
	cmp	r4, #0
	sub	sp, sp, #12
	beq	.L76
	ldr	ip, .L82+4
	ldm	r4, {r0, r1, r2, r3}
	ldr	r5, .L82+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #16]
.L76:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L83:
	.align	2
.L82:
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
	ldr	r3, .L86
	ldm	r3, {r1, r2}
	ldr	r3, .L86+4
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
.L87:
	.align	2
.L86:
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
	ldr	r4, .L94
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #12
	bne	.L92
	ldr	r6, .L94+4
	ldr	r5, .L94+8
.L89:
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
.L92:
	ldr	r7, .L94+12
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	mov	r3, #4
	mov	r2, #1
	ldr	r6, .L94+4
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldr	r5, .L94+8
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
	b	.L89
.L95:
	.align	2
.L94:
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
	ldr	r3, .L117
	ldr	r4, .L117+4
	ldrh	r2, [r3]
	ldm	r4, {r0, r3}
	tst	r2, #1
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	sub	sp, sp, #12
	bne	.L97
	ldr	r2, .L117+8
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L116
.L97:
	cmp	r3, #0
	beq	.L103
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L100
.L102:
	ldr	r3, .L117+12
	ldr	r3, [r3]
	add	r3, r3, #3
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L116:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r4, #20]
	cmp	r3, #0
	beq	.L103
.L104:
	mov	r2, #1
	sub	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #16]
	bl	drawBullet
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L102
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L103:
	mov	r1, #0
	ldr	r3, .L117+16
	mov	r2, #3
	str	r3, [sp]
	ldr	r5, .L117+20
	mov	r3, #4
	sub	r0, r0, #1
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, .L117+12
	ldr	r3, [r3, #4]
	sub	r3, r3, #6
	str	r3, [r4, #4]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L102
.L100:
	ldr	r3, [r4, #4]
	b	.L104
.L118:
	.align	2
.L117:
	.word	buttons
	.word	bullet
	.word	oldButtons
	.word	player
	.word	3105
	.word	drawRectangle
	.size	updateBullet, .-updateBullet
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"%d\000"
	.text
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L138
	ldr	r2, [r3]
	cmp	r0, #1
	str	r2, [r3, #8]
	sub	sp, sp, #12
	beq	.L134
	ldr	r5, .L138+4
.L120:
	ldr	r0, .L138
	bl	drawPlayer
	ldr	r4, .L138+8
	bl	updateBullet
	ldr	r7, .L138+12
	ldr	r6, .L138+16
	ldr	r9, .L138+20
	ldr	r8, .L138+24
	b	.L126
.L124:
	add	r4, r4, #24
	cmp	r4, r5
	beq	.L136
.L126:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L124
	mov	r0, r4
	bl	enemyCollision
	ldr	r3, [r6]
	cmp	r3, #1
	bne	.L124
	ldr	r1, [r7]
	mov	r0, r9
	sub	r1, r1, #1
	str	r1, [r7]
	mov	lr, pc
	bx	r8
	bl	updateEnemy
	mov	r3, #0
	add	r4, r4, #24
	cmp	r4, r5
	str	r3, [r6]
	bne	.L126
.L136:
	bl	updatePlayer
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L137
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L137:
	ldr	r3, .L138+28
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L134:
	ldr	r4, .L138+8
	ldr	r0, .L138+32
	ldr	r3, .L138+36
	mov	lr, pc
	bx	r3
	ldr	r6, .L138+40
	add	r5, r4, #720
	b	.L122
.L121:
	add	r4, r4, #24
	cmp	r4, r5
	beq	.L120
.L122:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L121
	ldrh	r2, [r4, #20]
	ldr	r3, [r4, #12]
	str	r2, [sp]
	ldm	r4, {r0, r1, r2}
	mov	lr, pc
	bx	r6
	b	.L121
.L139:
	.align	2
.L138:
	.word	player
	.word	enemies+720
	.word	enemies
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC3
	.word	mgba_printf
	.word	goToWin
	.word	3105
	.word	fillScreen
	.word	drawRectangle
	.size	game, .-game
	.global	activeEnemies
	.global	enemyErase
	.comm	enemyToErase,4,4
	.comm	bullet,36,4
	.comm	enemies,720,4
	.comm	player,28,4
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
