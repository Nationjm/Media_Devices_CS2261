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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4
	ldr	r1, .L4+4
	ldr	r4, .L4+8
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r8, #3
	mov	r1, #1
	mov	r7, #4
	mov	r6, #2
	mov	r5, #68
	mov	r4, #20
	mov	lr, #10
	mov	r0, #16
	mov	ip, #6
	ldr	r3, .L4+12
	str	r2, [r3]
	ldr	r3, .L4+16
	str	r2, [r3]
	ldr	r3, .L4+20
	str	r8, [r3]
	ldr	r8, .L4+24
	str	r1, [r3, #4]
	str	r2, [r3, #8]
	str	r3, [r8]
	ldr	r3, .L4+28
	str	r1, [r3]
	ldr	r3, .L4+32
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r1, [r3, #8]
	ldr	r3, .L4+36
	strh	r2, [r3, #44]	@ movhi
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #32]
	str	r2, [r3, #36]
	str	ip, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	100679680
	.word	connectFourTiledMap
	.word	DMANow
	.word	gameStatus
	.word	dropping
	.word	yellow
	.word	currentColor
	.word	currentColumn
	.word	red
	.word	chipSprite
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
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L8
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.global	__aeabi_idivmod
	.align	2
	.global	animateChip
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateChip, %function
animateChip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L17
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	ldr	r1, [r4, #36]
	bne	.L11
	mov	r2, #10
	add	r0, r1, #1
	ldr	r3, .L17+4
	ldr	r1, [r4, #40]
	str	r2, [r4, #32]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L11:
	ldr	r3, .L17+8
	ldr	r2, .L17+12
	ldr	r0, [r3]
	ldr	r3, [r4]
	ldr	lr, [r2]
	ldr	r2, .L17+16
	ldrb	ip, [r4, #45]	@ zero_extendqisi2
	ldrb	r5, [r4, #44]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #3
	ldr	r0, .L17+20
	ldr	r6, [lr, #8]
	and	r2, r2, r1, lsl #1
	lsl	r3, r3, #23
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	add	lr, r0, ip, lsl #3
	cmp	r5, #0
	lsl	ip, ip, #3
	lsr	r3, r3, #23
	add	r2, r2, #512
	strh	r1, [r0, ip]	@ movhi
	orr	r2, r2, r6, lsl #12
	orr	r3, r3, #16384
	orrne	r1, r1, #512
	strh	r3, [lr, #2]	@ movhi
	strh	r2, [lr, #4]	@ movhi
	strhne	r1, [r0, ip]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	chipSprite
	.word	__aeabi_idivmod
	.word	currentColumn
	.word	currentColor
	.word	1022
	.word	shadowOAM
	.size	animateChip, .-animateChip
	.align	2
	.global	checkGameStatus
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkGameStatus, %function
checkGameStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #180
	ldr	r6, .L84
	ldr	lr, .L84+4
.L25:
	add	r3, r6, r5, lsl #1
	ldrh	r3, [r3, #-20]
	mov	ip, #0
	mov	r2, r3
	sub	r1, r5, #9
	b	.L24
.L74:
	tst	r4, lr
	add	ip, ip, #1
	bne	.L40
	cmp	ip, #3
	ble	.L20
	cmp	r0, #3
	beq	.L54
	cmp	r0, #4
	beq	.L58
.L20:
	cmp	r5, r1
	lsl	r3, r1, #1
	beq	.L23
.L75:
	ldrh	r3, [r6, r3]
	add	r1, r1, #1
.L24:
	and	r0, r3, lr
	cmp	r0, #2
	eor	r4, r3, r2
	mov	r2, r3
	bne	.L74
	cmp	r5, r1
	mov	ip, #0
	lsl	r3, r1, #1
	bne	.L75
.L23:
	add	r5, r5, #32
	cmp	r5, #404
	bne	.L25
	ldr	r6, .L84
	ldr	lr, .L84+4
	sub	r5, r5, #10
.L30:
	sub	r3, r5, #224
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	mov	ip, #0
	mov	r1, r3
	sub	r2, r5, #192
	b	.L29
.L76:
	tst	r4, lr
	add	ip, ip, #1
	bne	.L43
	cmp	ip, #3
	ble	.L26
	cmp	r0, #3
	beq	.L54
	cmp	r0, #4
	beq	.L58
.L26:
	cmp	r2, r5
	lsl	r3, r2, #1
	beq	.L28
.L77:
	ldrh	r3, [r6, r3]
	add	r2, r2, #32
.L29:
	and	r0, r3, lr
	cmp	r0, #2
	eor	r4, r3, r1
	mov	r1, r3
	bne	.L76
	cmp	r2, r5
	mov	ip, #0
	lsl	r3, r2, #1
	bne	.L77
.L28:
	add	r5, r2, #1
	cmp	r5, #404
	bne	.L30
	mov	r5, #96
	mov	lr, #4
	ldr	r6, .L84
	ldr	r4, .L84+4
.L34:
	add	r3, lr, #163
	lsl	r3, r3, #1
	ldrh	r1, [r6, r3]
	mov	ip, #0
	sub	r3, lr, #7
	b	.L33
.L79:
	add	r2, r3, r3, lsl #5
	add	r2, r2, r5
	add	r2, r2, #170
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	and	r0, r2, r4
	cmp	r0, #2
	beq	.L46
	eor	r1, r1, r2
	tst	r1, r4
	bne	.L47
	add	ip, ip, #1
	cmp	ip, #3
	ble	.L48
	cmp	r0, #3
	beq	.L54
	cmp	r0, #4
	beq	.L58
.L48:
	mov	r1, r2
.L31:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L78
.L33:
	cmp	r3, #9
	bls	.L79
	mov	ip, #0
.L82:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L33
.L78:
	cmp	r3, #13
	add	lr, r3, #1
	sub	r5, r5, #32
	bne	.L34
	mov	r6, #96
	mvn	r0, #3
	ldr	r4, .L84
	ldr	lr, .L84+4
.L38:
	add	r3, r0, #177
	lsl	r3, r3, #1
	ldrh	r1, [r4, r3]
	mov	ip, #0
	add	r3, r0, #7
	add	r5, r6, #170
	b	.L37
.L81:
	rsb	r2, r3, r3, lsl #27
	add	r2, r3, r2, lsl #5
	add	r2, r2, r5
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
	and	r7, r2, lr
	cmp	r7, #2
	beq	.L51
	eor	r1, r1, r2
	tst	r1, lr
	bne	.L52
	add	ip, ip, #1
	cmp	ip, #3
	ble	.L53
	cmp	r7, #3
	beq	.L54
	cmp	r7, #4
	beq	.L58
.L53:
	mov	r1, r2
.L35:
	sub	r3, r3, #1
	cmp	r0, r3
	beq	.L80
.L37:
	cmp	r3, #9
	bls	.L81
	mov	ip, #0
.L83:
	sub	r3, r3, #1
	cmp	r0, r3
	bne	.L37
.L80:
	add	r6, r6, #32
	cmp	r6, #416
	add	r0, r0, #1
	bne	.L38
	mov	r0, #0
	b	.L19
.L40:
	mov	ip, #1
	b	.L20
.L58:
	mov	r0, #2
.L19:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L43:
	mov	ip, #1
	b	.L26
.L54:
	mov	r0, #1
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L46:
	mov	r1, r2
	mov	ip, #0
	b	.L82
.L47:
	mov	r1, r2
	mov	ip, #1
	b	.L31
.L51:
	mov	r1, r2
	mov	ip, #0
	b	.L83
.L52:
	mov	r1, r2
	mov	ip, #1
	b	.L35
.L85:
	.align	2
.L84:
	.word	100679680
	.word	1023
	.size	checkGameStatus, .-checkGameStatus
	.align	2
	.global	dropChip
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropChip, %function
dropChip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, lr}
	ldr	r3, .L101
	ldr	r4, .L101+4
	ldr	r2, [r3]
	ldr	r5, [r4]
	add	r2, r2, r5, lsl #5
	ldr	r6, .L101+8
	add	r2, r2, #169
	lsl	r3, r2, r1
	strb	r1, [r6, #44]
	add	r3, r3, #100663296
	add	r3, r3, #16384
	ldrh	r1, [r3]
	ldr	r0, .L101+12
	and	r1, r1, r0
	cmp	r1, #2
	beq	.L87
	bl	checkGameStatus
	ldr	r3, .L101+16
	cmp	r0, #0
	str	r0, [r3]
	strbeq	r0, [r6, #44]
	beq	.L91
	ldr	r2, .L101+20
	ldr	r2, [r2]
	ldr	lr, [r2, #4]
	lsl	r5, lr, #28
	mov	r3, #0
	asr	r5, r5, #16
	lsl	lr, lr, #12
	b	.L92
.L100:
	ldrh	r2, [ip]
	orr	r2, lr, r2
	strh	r2, [ip]	@ movhi
.L90:
	add	r3, r3, #1
.L92:
	ldr	ip, .L101+24
	ldr	r0, .L101+28
	lsl	r1, r3, #1
	cmp	r3, #6
	add	r0, r1, r0
	add	ip, r1, ip
	bls	.L100
	ldrh	r2, [r0]
	cmp	r3, #13
	orr	r2, r5, r2
	strh	r2, [r0]	@ movhi
	bne	.L90
	ldr	r5, [r4]
.L91:
	cmp	r5, #0
	ble	.L93
	ldr	r2, .L101+20
	ldr	r3, .L101+32
	ldr	r0, [r2]
	ldr	r1, .L101+36
	cmp	r0, r3
	moveq	r3, r1
	str	r3, [r2]
.L93:
	mov	r3, #0
	ldr	r2, .L101+40
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r2]
.L86:
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	ldr	ip, [r4, #4]
	cmp	ip, #0
	subne	ip, ip, #1
	strne	ip, [r4, #4]
	bne	.L86
	ldr	ip, .L101+20
	ldr	ip, [ip]
	ldr	ip, [ip]
	cmp	r5, #0
	and	r0, r0, ip
	strh	r0, [r3]	@ movhi
	ldrgt	r3, .L101+44
	addgt	r2, r3, r2, lsl #1
	mov	r3, #10
	add	r5, r5, #1
	strhgt	r1, [r2, #-64]	@ movhi
	str	r5, [r4]
	str	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	currentColumn
	.word	.LANCHOR0
	.word	chipSprite
	.word	1023
	.word	gameStatus
	.word	currentColor
	.word	100680532
	.word	100680582
	.word	red
	.word	yellow
	.word	dropping
	.word	100679680
	.size	dropChip, .-dropChip
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
	ldr	r3, .L128
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L104
	mov	r3, #0
	ldr	r4, .L128+4
	str	r3, [r4]
.L105:
	ldr	r5, .L128+8
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L107
	ldr	r2, .L128+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L126
.L107:
	tst	r3, #32
	beq	.L108
.L127:
	ldr	r2, .L128+12
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L108
	ldr	r1, .L128+16
	ldr	r2, [r1]
	cmp	r2, #1
	subgt	r2, r2, #1
	strgt	r2, [r1]
.L108:
	tst	r3, #16
	beq	.L109
	ldr	r2, .L128+12
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L109
	ldr	r1, .L128+16
	ldr	r2, [r1]
	cmp	r2, #9
	addle	r2, r2, #1
	strle	r2, [r1]
.L109:
	tst	r3, #128
	beq	.L106
	ldr	r3, .L128+12
	ldrh	r3, [r3]
	tst	r3, #128
	moveq	r3, #1
	streq	r3, [r4]
.L106:
	pop	{r4, r5, r6, lr}
	b	animateChip
.L104:
	ldr	r4, .L128+4
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L105
	bl	dropChip
	pop	{r4, r5, r6, lr}
	b	animateChip
.L126:
	bl	initGame
	ldrh	r3, [r5]
	tst	r3, #32
	beq	.L108
	b	.L127
.L129:
	.align	2
.L128:
	.word	gameStatus
	.word	dropping
	.word	oldButtons
	.word	buttons
	.word	currentColumn
	.size	updateGame, .-updateGame
	.comm	chipSprite,48,4
	.comm	currentColor,4,4
	.comm	red,12,4
	.comm	yellow,12,4
	.comm	dropping,4,4
	.comm	currentColumn,4,4
	.comm	gameStatus,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	depth.4137, %object
	.size	depth.4137, 4
depth.4137:
	.space	4
	.type	fallthroughTimer.4136, %object
	.size	fallthroughTimer.4136, 4
fallthroughTimer.4136:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
