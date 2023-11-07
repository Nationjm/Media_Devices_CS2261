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
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	luffyStartScreenPal
	.word	DMANow
	.word	luffyStartScreenBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	wanoInstructionsPal
	.word	DMANow
	.word	wanoInstructionsBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	instructions, .-instructions
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
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	flipPage
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
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L16
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L16+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	LuffyWinScreenPal
	.word	DMANow
	.word	LuffyWinScreenBitmap
	.word	drawFullscreenImage4
	.word	flipPage
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
	push	{r4, lr}
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	flipPage
	.size	lose, .-lose
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L23
	strh	r2, [r3]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L26
	strh	r2, [r3]	@ movhi
	bx	lr
.L27:
	.align	2
.L26:
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToKaido1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToKaido1, %function
goToKaido1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #67108864
	mov	r4, #2
	mov	ip, #7168
	mov	r1, #4352
	ldr	r2, .L30
	mov	r3, #512
	strh	r4, [r2]	@ movhi
	ldr	r5, .L30+4
	strh	r1, [r0]	@ movhi
	mov	r2, #117440512
	strh	ip, [r0, #8]	@ movhi
	ldr	r1, .L30+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	lr, #200
	mov	ip, #110
	mov	r0, #10
	mov	r1, #4
	ldr	r3, .L30+12
	strb	r2, [r3, #44]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	luffy
	.size	goToKaido1, .-goToKaido1
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #3
	mov	r3, #67108864
	ldr	r1, .L33
	ldr	r2, .L33+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
	.word	state
	.word	1044
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #4
	mov	r3, #67108864
	ldr	r1, .L36
	ldr	r2, .L36+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	state
	.word	1044
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #5
	mov	r3, #67108864
	ldr	r1, .L39
	ldr	r2, .L39+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
	.word	state
	.word	1044
	.size	goToLose, .-goToLose
	.align	2
	.global	initLuffy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLuffy, %function
initLuffy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r1, #2
	mov	r4, #200
	mov	lr, #110
	mov	ip, #10
	mov	r0, #4
	ldr	r3, .L43
	strb	r2, [r3, #44]
	stm	r3, {r4, lr}
	str	ip, [r3, #36]
	str	r0, [r3, #28]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	luffy
	.size	initLuffy, .-initLuffy
	.global	__aeabi_idivmod
	.align	2
	.global	luffyUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyUpdate, %function
luffyUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r2, .L64
	ldrh	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L64+4
	ands	ip, r2, #32
	str	r3, [r4, #16]
	ldr	r3, [r4]
	bne	.L46
	cmp	r3, #0
	ble	.L46
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	mvn	r1, r1, lsl #17
	mov	r2, #1
	mvn	r1, r1, lsr #17
	ldrb	r5, [r4, #44]	@ zero_extendqisi2
	ldr	r0, [r4, #20]
	ldr	r6, .L64+8
	sub	r3, r3, r0
	lsl	r5, r5, #3
	str	r3, [r4]
	str	ip, [r4, #40]
	lsl	r3, r3, #23
	strh	r1, [r6, r5]	@ movhi
	str	r2, [r4, #16]
	lsr	r3, r3, #23
.L47:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	r1, r6, r5
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	bne	.L53
.L62:
	ldr	r0, [r4, #32]
	ldr	r3, .L64+12
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r5, r6, r5
	lsl	r3, r1, #2
	strh	r3, [r5, #4]	@ movhi
	mov	r3, #9
	str	r1, [r4, #32]
.L54:
	str	r3, [r4, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	tst	r2, #16
	bne	.L60
	cmp	r3, #239
	bgt	.L60
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	mov	r2, #1
	ldr	r0, [r4, #20]
	ldrb	r5, [r4, #44]	@ zero_extendqisi2
	add	r0, r3, r0
	ldr	r6, .L64+8
	lsl	r3, r0, #23
	lsl	r5, r5, #3
	lsr	r3, r3, #23
	strh	r1, [r6, r5]	@ movhi
	orr	r3, r3, #53248
	add	r1, r6, r5
	str	r0, [r4]
	str	r2, [r4, #40]
	str	r2, [r4, #16]
	strh	r3, [r1, #2]	@ movhi
.L63:
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	beq	.L62
.L53:
	cmp	r3, #0
	bne	.L55
	cmp	r2, #1
	mvnne	r3, #0
	bne	.L54
	ldr	r2, [r4, #32]
	ldr	r3, .L64+16
	add	r2, r2, #1
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	add	r2, r3, #4
	add	r5, r6, r5
	lsl	r2, r2, #2
	str	r3, [r4, #32]
	strh	r2, [r5, #4]	@ movhi
	mov	r3, #9
	b	.L54
.L60:
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r4, #40]
	ldrb	r5, [r4, #44]	@ zero_extendqisi2
	ldr	r6, .L64+8
	lsl	r3, r3, #23
	lsl	r5, r5, #3
	cmp	r1, #1
	strh	r2, [r6, r5]	@ movhi
	lsr	r3, r3, #23
	mov	r2, #0
	bne	.L47
	orr	r3, r3, #53248
	add	r1, r6, r5
	strh	r3, [r1, #2]	@ movhi
	b	.L63
.L55:
	movlt	r3, #9
	subge	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	buttons
	.word	luffy
	.word	shadowOAM
	.word	__aeabi_idivmod
	.word	1431655766
	.size	luffyUpdate, .-luffyUpdate
	.align	2
	.global	kaido1
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaido1, %function
kaido1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L68
	ldr	r4, .L68+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L68+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L68+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L68+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L68+20
	ldr	r1, .L68+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L68+28
	ldr	r1, .L68+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L68+36
	ldr	r1, .L68+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	Rooftop_Ground_TilesetBitmapTiles
	.word	Rooftop_Ground_TilesetBitmapPal
	.word	100720640
	.word	RooftopGroundBackgroundMap
	.word	83886592
	.word	LuffyandKaidoSpritesPal
	.word	100728832
	.word	LuffyandKaidoSpritesTiles
	.size	kaido1, .-kaido1
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	luffy,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
