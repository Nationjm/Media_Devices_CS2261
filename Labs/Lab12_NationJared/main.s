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
	.type	spawnFood.part.0, %function
spawnFood.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+4
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	ldr	r4, .L4+8
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #2
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	rsbs	r3, r0, #0
	and	r3, r3, #15
	and	r0, r0, #15
	rsbpl	r0, r3, #0
	add	r0, r0, #2
	stmib	r4, {r0, r2}
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	rand
	.word	1321528399
	.word	food
	.size	spawnFood.part.0, .-spawnFood.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw.part.0, %function
draw.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r3, [r3, #4]
	push	{r4, lr}
	add	r2, r2, #1
	ldr	r4, .L12+8
	lsl	r0, r0, #3
	lsl	r1, r1, #3
	orr	r2, r2, #1024
	cmp	r3, #0
	strh	r0, [r4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	beq	.L9
	mov	r2, r4
	mov	ip, #1
	mov	lr, #1024
.L8:
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r3, [r3, #4]
	lsl	r0, r0, #3
	lsl	r1, r1, #3
	cmp	r3, #0
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	add	ip, ip, #1
	add	r2, r2, #8
	bne	.L8
.L7:
	mov	lr, #5
	ldr	r2, .L12+12
	ldm	r2, {r0, r3}
	lsl	r2, ip, #3
	lsl	r3, r3, #3
	add	ip, r4, ip, lsl #3
	lsl	r0, r0, #3
	strh	r3, [r4, r2]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	ldr	r4, .L12+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	mov	ip, #1
	b	.L7
.L13:
	.align	2
.L12:
	.word	snakeList
	.word	direction
	.word	shadowOAM
	.word	food
	.word	DMANow
	.size	draw.part.0, .-draw.part.0
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r1, .L21
	ldr	ip, .L21+4
	strh	r3, [r2]	@ movhi
	sub	sp, sp, #48
	strh	r1, [r2, #8]	@ movhi
	ldr	r5, .L21+8
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L21+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+20
	ldr	r2, .L21+24
	add	r1, sp, #6
	mov	r0, #3
	strh	r4, [sp, #6]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #1
	ldr	r2, .L21+24
.L15:
	lsl	ip, r3, #1
	add	r0, r2, r3, lsl #1
	add	r3, r3, #32
	cmp	r3, #640
	strh	r1, [r2, ip]	@ movhi
	strh	r1, [r0, #58]	@ movhi
	bne	.L15
	mov	r3, #0
	mov	r0, #1
	ldr	r1, .L21+24
.L16:
	lsl	ip, r3, #1
	add	r2, r3, #608
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #30
	strh	r0, [r1, ip]	@ movhi
	strh	r0, [r1, r2]	@ movhi
	bne	.L16
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L21+28
	ldr	r1, .L21+32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L21+36
	ldr	r1, .L21+40
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L21+52
	mov	lr, pc
	bx	r5
	mov	r1, #0
	ldr	r3, .L21+56
	ldr	r2, .L21+60
	ldrh	ip, [r3, #48]
	ldr	r0, .L21+64
	ldr	r3, .L21+68
	mov	r6, #10
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #20
	ldr	r5, .L21+72
	ldr	r4, .L21+76
	mov	r1, r3
	mov	r2, r6
	str	r3, [sp, #8]
	str	r6, [sp, #12]
	str	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r3, #19
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #16]
	ldr	r0, [r5]
	str	r6, [sp, #20]
	mov	lr, pc
	bx	r4
	mov	r3, #18
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #24]
	ldr	r0, [r5]
	str	r6, [sp, #28]
	mov	lr, pc
	bx	r4
	mov	r3, #17
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #32]
	ldr	r0, [r5]
	str	r6, [sp, #36]
	mov	lr, pc
	bx	r4
	mov	r3, #16
	str	r6, [sp, #44]
	str	r3, [sp, #40]
	add	r3, sp, #48
	ldmdb	r3, {r1, r2}
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L21+80
	ldr	r1, [r3, #8]
	ldr	r3, .L21+84
	cmp	r1, #0
	str	r2, [r3]
	bleq	spawnFood.part.0
.L17:
	ldr	r3, .L21+88
	mov	lr, pc
	bx	r3
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	7937
	.word	.LANCHOR0
	.word	DMANow
	.word	tilesTiles
	.word	tilesPal
	.word	16778240
	.word	100726784
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	createList
	.word	snakeList
	.word	pushFront
	.word	food
	.word	direction
	.word	mgba_open
	.size	initialize, .-initialize
	.align	2
	.global	checkForLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForLose, %function
checkForLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L35
	ldr	r3, [r4]
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	sub	r2, r1, #1
	sub	ip, r0, #1
	cmp	r2, #27
	cmpls	ip, #17
	sub	sp, sp, #8
	bls	.L33
.L24:
	mov	r5, #1
	mov	r0, #3
	ldr	r3, .L35+4
	ldr	r2, .L35+8
	ldr	r6, .L35+12
	add	r1, sp, #6
	strh	r5, [sp, #6]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r2, .L35+16
	ldr	r0, [r4]
	ldr	r3, .L35+20
	str	r5, [r2]
	mov	lr, pc
	bx	r3
.L23:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	ldr	r2, [r3, #12]
	cmp	r2, r0
	beq	.L24
.L33:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L23
	ldr	r2, [r3, #8]
	cmp	r2, r1
	bne	.L33
	b	.L34
.L36:
	.align	2
.L35:
	.word	snakeList
	.word	16778240
	.word	100726784
	.word	DMANow
	.word	.LANCHOR0
	.word	deleteList
	.size	checkForLose, .-checkForLose
	.align	2
	.global	headIsCollidingWithBody
	.syntax unified
	.arm
	.fpu softvfp
	.type	headIsCollidingWithBody, %function
headIsCollidingWithBody:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldr	r3, [r3]
	ldr	ip, [r3]
	ldr	r0, [ip, #4]
	cmp	r0, #0
	bxeq	lr
	ldr	r2, [ip, #8]
	b	.L40
.L39:
	ldr	r0, [r0, #4]
	cmp	r0, #0
	bxeq	lr
.L40:
	ldr	r3, [r0, #8]
	cmp	r3, r2
	bne	.L39
	ldr	r1, [r0, #12]
	ldr	r3, [ip, #12]
	cmp	r1, r3
	bne	.L39
	mov	r0, #1
	bx	lr
.L46:
	.align	2
.L45:
	.word	snakeList
	.size	headIsCollidingWithBody, .-headIsCollidingWithBody
	.align	2
	.global	checkForFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForFood, %function
checkForFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L51
	ldr	r0, [r3]
	push	{r4, lr}
	ldr	r3, [r0]
	ldr	r4, .L51+4
	ldr	r2, [r3, #8]
	ldr	r1, [r4]
	cmp	r1, r2
	ldr	r2, [r3, #12]
	bne	.L47
	ldr	r3, [r4, #4]
	cmp	r3, r2
	beq	.L50
.L47:
	pop	{r4, lr}
	bx	lr
.L50:
	mov	ip, #0
	ldr	r3, [r0, #4]
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	r3, .L51+8
	str	ip, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L47
	pop	{r4, lr}
	b	spawnFood.part.0
.L52:
	.align	2
.L51:
	.word	snakeList
	.word	food
	.word	pushBack
	.size	checkForFood, .-checkForFood
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	beq	.L54
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	tst	r2, #32
	moveq	r1, #3
	ldreq	r2, .L85+8
	streq	r1, [r2]
.L54:
	tst	r3, #16
	beq	.L55
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	tst	r2, #16
	moveq	r1, #1
	ldreq	r2, .L85+8
	streq	r1, [r2]
.L55:
	tst	r3, #64
	beq	.L56
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	ands	r2, r2, #64
	ldreq	r1, .L85+8
	streq	r2, [r1]
.L56:
	tst	r3, #128
	beq	.L57
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	tst	r2, #128
	moveq	r1, #2
	ldreq	r2, .L85+8
	streq	r1, [r2]
.L57:
	tst	r3, #4
	beq	.L58
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L84
.L58:
	ldr	r2, .L85+12
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #9
	bgt	.L59
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r1, #0
	ldr	r4, .L85+16
	ldr	r3, .L85+20
	ldr	r0, [r4]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+8
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L61
.L63:
	.word	.L66
	.word	.L65
	.word	.L64
	.word	.L62
.L62:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #8]
	sub	r3, r3, #1
	str	r3, [r2, #8]
.L61:
	bl	checkForFood
	pop	{r4, lr}
	b	checkForLose
.L84:
	ldr	r3, .L85+16
	ldr	r0, [r3]
	ldr	r3, [r0, #4]
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	r3, .L85+24
	mov	lr, pc
	bx	r3
	b	.L58
.L64:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, #1
	str	r3, [r2, #12]
	b	.L61
.L65:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	b	.L61
.L66:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	str	r3, [r2, #12]
	b	.L61
.L86:
	.align	2
.L85:
	.word	oldButtons
	.word	buttons
	.word	direction
	.word	skipFrames
	.word	snakeList
	.word	updateNodePositions
	.word	pushBack
	.size	update, .-update
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r5, .L101
	push	{r4, r7, fp, lr}
	ldr	r9, .L101+4
	mov	lr, pc
	bx	r9
	ldr	r4, .L101+8
	ldr	r3, [r5]
	ldr	r7, .L101+12
	ldr	r6, .L101+16
	ldr	r8, .L101+20
	ldr	r10, .L101+24
	ldr	fp, .L101+28
	b	.L95
.L99:
	ldrh	r2, [r4]
.L90:
	strh	r2, [r10]	@ movhi
	ldrh	r2, [fp, #48]
	strh	r2, [r4]	@ movhi
.L95:
	cmp	r3, #0
	beq	.L88
	cmp	r3, #1
	bne	.L99
	ldrh	r3, [r10]
	tst	r3, #8
	ldrh	r3, [r4]
	bne	.L92
.L98:
	strh	r3, [r10]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r4]	@ movhi
	ldrh	r3, [r10]
	tst	r3, #8
	ldrh	r3, [r4]
	beq	.L98
.L92:
	tst	r3, #8
	bne	.L98
	mov	lr, pc
	bx	r9
	ldrh	r2, [r4]
	ldr	r3, [r5]
	b	.L90
.L88:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L99
	mov	lr, pc
	bx	r8
	ldrh	r2, [r4]
	ldr	r3, [r5]
	b	.L90
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
	.word	initialize
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw.part.0
	.word	oldButtons
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	spawnFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnFood, %function
spawnFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L105
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bxne	lr
	b	spawnFood.part.0
.L106:
	.align	2
.L105:
	.word	food
	.size	spawnFood, .-spawnFood
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L109
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	draw.part.0
.L110:
	.align	2
.L109:
	.word	.LANCHOR0
	.size	draw, .-draw
	.comm	food,12,4
	.global	state
	.comm	skipFrames,4,4
	.comm	direction,4,4
	.comm	snakeList,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
