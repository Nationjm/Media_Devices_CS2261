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
	ldr	r2, .L8+20
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
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
	.word	rSeed
	.size	instructions, .-instructions
	.align	2
	.global	betweenFight
	.syntax unified
	.arm
	.fpu softvfp
	.type	betweenFight, %function
betweenFight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L12
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L12+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	betweenFightScreenPal
	.word	DMANow
	.word	betweenFightScreenBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.size	betweenFight, .-betweenFight
	.align	2
	.global	bigMom1
	.syntax unified
	.arm
	.fpu softvfp
	.type	bigMom1, %function
bigMom1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	hideSprites
	.size	bigMom1, .-bigMom1
	.align	2
	.global	bigMom2
	.syntax unified
	.arm
	.fpu softvfp
	.type	bigMom2, %function
bigMom2:
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
	.word	hideSprites
	.size	bigMom2, .-bigMom2
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
	mov	r2, #83886080
	ldr	r1, .L24
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L24+8
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	PauseScreenPal
	.word	DMANow
	.word	PauseScreenBitmap
	.word	drawFullscreenImage4
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
	ldr	r1, .L28
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L28+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+8
	ldr	r3, .L28+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	mov	r2, #83886080
	ldr	r1, .L32
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L32+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L32+8
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	loseScreenPal
	.word	DMANow
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
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
	mov	r3, #0
	mov	ip, #1
	ldr	r0, .L35
	ldr	r1, .L35+4
	ldr	r2, .L35+8
	str	ip, [r0]
	str	r3, [r1]
	strh	r3, [r2]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.word	.LANCHOR1
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
	ldr	r3, .L38
	strh	r2, [r3]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
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
	push	{r4, lr}
	mov	ip, #18432
	mov	r0, #67108864
	mov	r4, #2
	mov	r3, #5888
	mov	r2, #7168
	mov	r1, #20480
	ldr	lr, .L42
	strh	r4, [lr]	@ movhi
	ldr	r4, .L42+4
	strh	r3, [r0]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	mov	r3, #512
	strh	r1, [r0, #10]	@ movhi
	mov	r2, #117440512
	strh	ip, [r0, #12]	@ movhi
	ldr	r1, .L42+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L42+12
	ldr	r3, .L42+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L42+20
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L42+36
	ldr	r1, .L42+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L42+44
	ldr	r1, .L42+48
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L42+52
	ldr	r1, .L42+56
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L42+60
	ldr	r1, .L42+64
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	rSeed
	.word	srand
	.word	83886592
	.word	LuffyandKaidoSpritesPal
	.word	Rooftop_Ground_TilesetBitmapTiles
	.word	Rooftop_Ground_TilesetBitmapPal
	.word	100720640
	.word	RooftopGroundBackgroundMap
	.word	100728832
	.word	LuffyandKaidoSpritesTiles
	.word	100696064
	.word	MovingMountainsMap
	.word	100679680
	.word	CloudsMap
	.size	goToKaido1, .-goToKaido1
	.align	2
	.global	goToBetweenFight
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBetweenFight, %function
goToBetweenFight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #9
	mov	r3, #67108864
	ldr	r1, .L45
	ldr	r2, .L45+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	state
	.word	1044
	.size	goToBetweenFight, .-goToBetweenFight
	.align	2
	.global	goToKaido2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToKaido2, %function
goToKaido2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #18432
	mov	r4, #3
	mov	r1, #67108864
	mov	r0, #5888
	mov	r3, #7168
	mov	r2, #20480
	ldr	lr, .L49
	ldr	r5, .L49+4
	strh	r4, [lr]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	mov	r0, r4
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #512
	strh	ip, [r1, #12]	@ movhi
	mov	r2, #117440512
	ldr	r1, .L49+8
	mov	lr, pc
	bx	r5
	ldr	r2, .L49+12
	ldr	r3, .L49+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #9600
	mov	r2, #100663296
	ldr	r1, .L49+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L49+24
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L49+28
	ldr	r1, .L49+32
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #16384
	ldr	r2, .L49+36
	ldr	r1, .L49+40
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2048
	ldr	r2, .L49+44
	ldr	r1, .L49+48
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2048
	ldr	r2, .L49+52
	ldr	r1, .L49+56
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	rSeed
	.word	srand
	.word	Rooftop_Ground_TilesetBitmapTiles
	.word	Rooftop_Ground_TilesetBitmapPal
	.word	100720640
	.word	RooftopGroundBackgroundMap
	.word	100728832
	.word	LuffyandKaidoSpritesTiles
	.word	100696064
	.word	MovingMountainsMap
	.word	100679680
	.word	CloudsMap
	.size	goToKaido2, .-goToKaido2
	.align	2
	.global	goToBigMom1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBigMom1, %function
goToBigMom1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L52
	strh	r2, [r3]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
	.word	state
	.size	goToBigMom1, .-goToBigMom1
	.align	2
	.global	goToBigMom2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBigMom2, %function
goToBigMom2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L55
	strh	r2, [r3]	@ movhi
	bx	lr
.L56:
	.align	2
.L55:
	.word	state
	.size	goToBigMom2, .-goToBigMom2
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
	mov	r0, #6
	mov	r3, #67108864
	ldr	r1, .L58
	ldr	r2, .L58+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L59:
	.align	2
.L58:
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
	mov	r2, #7
	mov	r1, #67108864
	push	{r4, lr}
	ldr	ip, .L62
	ldr	r0, .L62+4
	ldr	r3, .L62+8
	strh	r2, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r1, [r3]
	ldr	r0, .L62+12
	ldr	r3, .L62+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	state
	.word	1044
	.word	BinksBrew_length
	.word	BinksBrew_data
	.word	playSong
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
	mov	r0, #8
	mov	r3, #67108864
	ldr	r1, .L65
	ldr	r2, .L65+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L66:
	.align	2
.L65:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #85
	mov	r0, #200
	mov	fp, #110
	mov	ip, #126
	mov	r2, #0
	ldr	r3, .L69
	str	lr, [r3, #56]
	ldr	lr, .L69+4
	stm	r3, {r0, fp}
	mov	r10, #2
	mov	r9, #40
	mov	r8, #32
	mov	r7, #1
	mov	r6, #10
	mov	r5, #4
	mov	r4, #22
	stm	lr, {r0, ip}
	ldr	r0, .L69+8
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	strb	r2, [r3, #64]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	mov	r1, #8
	str	r2, [r0]
	mov	r2, #3
	str	r10, [r3, #20]
	str	r9, [r3, #12]
	str	r8, [r3, #8]
	str	r7, [r3, #24]
	str	r6, [r3, #36]
	str	r5, [r3, #28]
	str	r4, [r3, #48]
	ldr	r3, .L69+12
	str	r1, [lr, #12]
	str	r1, [lr, #8]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	luffy
	.word	luffyFist
	.word	luffyPunched
	.word	luffyLives
	.size	initLuffy, .-initLuffy
	.align	2
	.global	luffyJumping
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyJumping, %function
luffyJumping:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L84
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [r3, #4]
	and	r5, r4, #255
	mvn	lr, r5, lsl #17
	mvn	lr, lr, lsr #17
	ldr	r0, [r3]
	ldrb	ip, [r3, #64]	@ zero_extendqisi2
	ldr	r6, [r3, #40]
	ldr	r2, .L84+4
	lsl	r0, r0, #23
	cmp	r6, #1
	lsr	r0, r0, #23
	lsl	r1, ip, #3
	strh	lr, [r2, r1]	@ movhi
	add	ip, r2, ip, lsl #3
	orreq	lr, r0, #53248
	orr	r7, r0, #49152
	strh	r7, [ip, #2]	@ movhi
	strheq	lr, [ip, #2]	@ movhi
	ldr	lr, [r3, #56]
	sub	ip, lr, #71
	cmp	ip, #13
	bhi	.L73
	mov	r5, #268
	ldr	r0, [r3, #24]
	add	r2, r2, r1
	sub	r4, r4, r0, lsl #1
	strh	r5, [r2, #4]	@ movhi
	str	r4, [r3, #4]
	sub	ip, lr, #1
.L78:
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L73:
	sub	ip, lr, #36
	cmp	ip, #33
	bhi	.L75
	cmp	r6, #1
	add	ip, r2, r1
	orreq	r0, r0, #53248
	strheq	r0, [ip, #2]	@ movhi
	mov	r0, #272
	orr	r5, r5, #16384
	strh	r5, [r2, r1]	@ movhi
	add	r2, r2, r1
	ldr	r1, [r3, #24]
	strhne	r7, [ip, #2]	@ movhi
	sub	r4, r4, r1
	sub	ip, lr, #1
	str	r4, [r3, #4]
	strh	r0, [r2, #4]	@ movhi
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L75:
	sub	ip, lr, #1
	cmp	ip, #33
	bhi	.L79
	ldr	r4, [r3, #4]
	and	lr, r4, #255
	mvn	lr, lr, lsl #17
	mvn	lr, lr, lsr #17
	cmp	r6, #1
	orreq	r0, r0, #53248
	strh	lr, [r2, r1]	@ movhi
	add	lr, r2, r1
	strheq	r0, [lr, #2]	@ movhi
	mov	r0, #280
	strhne	r7, [lr, #2]	@ movhi
	add	r2, r2, r1
	cmp	r4, #109
	strh	r0, [r2, #4]	@ movhi
	bgt	.L78
	ldr	r2, [r3, #24]
	add	r4, r4, r2, lsl #1
	str	r4, [r3, #4]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L79:
	cmp	lr, #0
	movlt	r1, #0
	movlt	r2, #1
	movlt	ip, #84
	strlt	r1, [r3, #52]
	strlt	r2, [r3, #36]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	luffy
	.word	shadowOAM
	.size	luffyJumping, .-luffyJumping
	.align	2
	.global	gearFive
	.syntax unified
	.arm
	.fpu softvfp
	.type	gearFive, %function
gearFive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mvn	r2, #32768
	mov	lr, #2
	mov	r0, #1
	ldr	r3, .L88
	ldr	ip, .L88+4
	ldr	r1, .L88+8
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	str	lr, [ip]
	str	r0, [r1]
	ldr	lr, [sp], #4
	bx	lr
.L89:
	.align	2
.L88:
	.word	83886592
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	gearFive, .-gearFive
	.align	2
	.global	groundChange
	.syntax unified
	.arm
	.fpu softvfp
	.type	groundChange, %function
groundChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	ip, .L93
	ldr	r3, [ip, #4]
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	ldr	r0, [ip, #8]
	add	r2, r3, #57344
	push	{r4, r5, r6, r7, lr}
	cmp	r0, #0
	add	r7, r2, #896
	add	r6, r2, #960
	add	r4, r2, #1088
	add	r5, r3, #58368
	add	lr, r2, #1152
	add	r3, r3, #58624
	add	r2, r2, #1216
	strh	r1, [r7]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r1, [lr]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	bne	.L90
	strh	r0, [r7]	@ movhi
	str	r0, [ip, #12]
	strh	r0, [r6]	@ movhi
	strh	r0, [r5]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r0, [r3]	@ movhi
.L90:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	.LANCHOR1
	.size	groundChange, .-groundChange
	.align	2
	.global	initKaido
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKaido, %function
initKaido:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #30
	mov	r2, #0
	ldr	r3, .L97
	str	r6, [r3, #32]
	ldr	r6, .L97+4
	str	r2, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #40]
	str	r2, [r3, #36]
	str	r2, [r6, #28]
	mov	r2, #32
	str	r2, [r6, #8]
	mov	r2, #16
	mov	r7, #7
	str	r2, [r6, #12]
	mov	r2, #8
	mov	lr, #2
	mvn	fp, #24
	mov	r10, #100
	mov	r9, #24
	mov	r8, #58
	mov	r5, #66
	mov	r4, #125
	mov	ip, #1
	mov	r0, #20
	mov	r1, #10
	strb	r2, [r6, #40]
	strb	r7, [r3, #48]
	ldr	r2, .L97+8
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r9, [r3, #12]
	str	r8, [r3, #8]
	str	r5, [r6]
	str	r4, [r6, #4]
	str	lr, [r3, #24]
	str	lr, [r6, #24]
	str	ip, [r3, #20]
	str	ip, [r6, #16]
	str	r0, [r3, #44]
	str	r0, [r6, #36]
	str	r1, [r6, #20]
	str	r1, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	kaido
	.word	fireball
	.word	kaidoHealth
	.size	initKaido, .-initKaido
	.global	__aeabi_idivmod
	.align	2
	.global	kaidoUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaidoUpdate, %function
kaidoUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L110
	ldr	r3, [r6]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #128
	mvn	r3, r3, lsr #18
	ldr	r7, .L110+4
	ldr	r2, [r7, #4]
	ldr	r0, [r6, #28]
	strh	r1, [r2, #30]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	ldr	r5, .L110+8
	ldrb	r2, [r6, #48]	@ zero_extendqisi2
	add	r1, r0, #64
	add	lr, r5, r2, lsl #3
	ldrb	ip, [r6, #4]	@ zero_extendqisi2
	strh	r3, [lr, #2]	@ movhi
	lsl	r1, r1, #3
	ldr	r3, [r6, #32]
	and	r1, r1, #1016
	lsl	r4, r2, #3
	orr	ip, ip, #768
	orr	r2, r1, #4096
	cmp	r3, #0
	strh	ip, [r5, r4]	@ movhi
	strh	r2, [lr, #4]	@ movhi
	bne	.L100
	ldr	r3, .L110+12
	ldr	r1, [r6, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r2, #29
	str	r1, [r6, #28]
.L101:
	mov	lr, #2
	mov	r9, #100
	mov	r8, #116
	mov	r0, #132
	ldr	r3, [r7, #8]
	ldr	ip, .L110+16
	add	r1, r3, #1
	str	r2, [r6, #32]
	lsl	r2, r1, #3
	lsl	r6, r3, #3
	strh	ip, [r5, r6]	@ movhi
	strh	ip, [r5, r2]	@ movhi
	ldr	r2, .L110+20
	ldr	r6, .L110+24
	ldr	ip, [r2]
	add	r2, r3, lr
	add	r3, r5, r3, lsl #3
	strh	r6, [r3, #4]	@ movhi
	strh	r9, [r3, #2]	@ movhi
	ldr	r3, .L110+28
	add	r1, r5, r1, lsl #3
	strh	r3, [r1, #4]	@ movhi
	strh	r8, [r1, #2]	@ movhi
	ldr	r1, .L110+32
	add	r3, r5, r2, lsl #3
	lsl	r6, r2, #3
	cmp	ip, #0
	strh	lr, [r5, r6]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ble	.L105
	mov	r6, #10
	mov	r3, #80
	add	ip, ip, r6
	lsl	ip, ip, #19
	ldr	lr, .L110+36
	lsr	ip, ip, #16
	add	r2, r5, r4
.L104:
	add	r0, r3, #8
	and	r1, r3, #504
	lsl	r3, r0, #16
	lsr	r3, r3, #16
	cmp	r3, ip
	strh	r6, [r2, #16]	@ movhi
	strh	lr, [r2, #20]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	add	r2, r2, #8
	bne	.L104
.L105:
	ldr	r0, .L110+8
	mov	ip, #72
	mov	r1, #10
	mov	r3, r0
	ldr	r2, .L110+40
	strh	ip, [r5, #178]	@ movhi
	strh	r1, [r5, #176]	@ movhi
	strh	r2, [r5, #180]	@ movhi
	ldr	ip, .L110+44
	add	r0, r0, #80
	rsb	lr, r3, #80
.L103:
	add	r2, lr, r3
	strh	r1, [r3, #184]	@ movhi
	strh	ip, [r3, #188]	@ movhi
	strh	r2, [r3, #186]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	bne	.L103
	mov	r0, #160
	ldr	r3, .L110+48
	ldr	r2, .L110+52
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L100:
	movlt	r2, #29
	subge	r2, r3, #1
	b	.L101
.L111:
	.align	2
.L110:
	.word	kaido
	.word	.LANCHOR0
	.word	shadowOAM
	.word	__aeabi_idivmod
	.word	16386
	.word	kaidoHealth
	.word	5093
	.word	5095
	.word	5097
	.word	5099
	.word	5098
	.word	5100
	.word	shadowOAM+272
	.word	5101
	.size	kaidoUpdate, .-kaidoUpdate
	.align	2
	.global	shootFireball
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootFireball, %function
shootFireball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L116
	push	{r4, r5, lr}
	ldr	lr, [r2]
	lsl	r1, lr, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	r3, [r2, #28]
	ldr	ip, [r2, #8]
	lsl	r3, r3, #6
	add	ip, ip, #240
	ldrb	r0, [r2, #40]	@ zero_extendqisi2
	ldr	r4, .L116+4
	add	r3, r3, #28
	cmp	lr, ip
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	and	r3, r3, #1020
	add	r5, r4, r0, lsl #3
	orr	ip, ip, #16384
	lsl	r0, r0, #3
	orr	r3, r3, #4096
	strh	r1, [r5, #2]	@ movhi
	strh	ip, [r4, r0]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	ble	.L113
	mov	r0, #0
	ldr	r1, .L116+8
	ldr	ip, [r1, #8]
	ldr	r3, [r1]
	add	r3, r3, ip, lsl #1
	sub	r3, r3, #25
	str	r3, [r2]
	str	r0, [r2, #32]
	pop	{r4, r5, lr}
	bx	lr
.L113:
	ldr	r3, [r2, #16]
	add	lr, r3, lr
	str	lr, [r2]
	pop	{r4, r5, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	fireball
	.word	shadowOAM
	.word	kaido
	.size	shootFireball, .-shootFireball
	.align	2
	.global	fireballCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballCollision, %function
fireballCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L120
	ldm	r3, {r1, r2, ip, lr}
	sub	sp, sp, #16
	add	r3, r2, #6
	stm	sp, {r1, r3, ip, lr}
	ldr	r0, .L120+4
	ldr	r4, .L120+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	luffy
	.word	fireball
	.word	collision
	.size	fireballCollision, .-fireballCollision
	.align	2
	.global	fireballUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballUpdate, %function
fireballUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L147
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L142
.L123:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L124
	ldr	r0, [r4, #28]
	ldr	r3, .L147+4
	ldr	r1, [r4, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #9
	str	r1, [r4, #28]
.L125:
	str	r3, [r4, #20]
	bl	fireballCollision
	cmp	r0, #0
	beq	.L127
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L143
.L127:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L144
.L129:
	blt	.L145
.L130:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldreq	r3, [r4, #36]
	ldr	r2, .L147+8
	subeq	r3, r3, #1
	streq	r3, [r4, #36]
	ldr	r0, [r4, #8]
	ldr	r3, [r4]
	ldr	r1, [r2, #4]
	add	r3, r3, r0
	cmp	r3, r1, lsl #3
	ble	.L122
	ldr	r3, [r2, #12]
	cmp	r3, #1
	beq	.L146
.L122:
	pop	{r4, lr}
	bx	lr
.L143:
	mov	r0, #67108864
	mov	lr, #4352
	mov	ip, #0
	ldr	r2, .L147+12
	ldr	r3, [r2]
	ldr	r1, [r2, #8]
	ldr	r2, .L147+16
	add	r3, r3, r1, lsl #1
	sub	r3, r3, #25
	ldr	r1, [r2]
	str	r3, [r4]
	ldr	r3, .L147+20
	sub	r1, r1, #1
	str	r1, [r2]
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	str	lr, [r0, #76]
	ldr	r1, .L147+24
	ldr	r2, [r2]
	lsl	r3, r3, #3
	cmp	r2, ip
	ldrh	r2, [r1, r3]
	orr	r2, r2, #4096
	strh	r2, [r1, r3]	@ movhi
	moveq	r1, #8
	ldreq	r3, .L147+28
	ldreq	r2, .L147+32
	str	ip, [r4, #32]
	strheq	r1, [r2]	@ movhi
	strheq	r3, [r0]	@ movhi
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L129
.L144:
	mov	r2, #1
	ldr	r3, .L147+36
	str	r2, [r4, #32]
.L141:
	mov	lr, pc
	bx	r3
	ldr	r3, .L147+40
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #4
	str	r0, [r4, #36]
	b	.L130
.L124:
	movlt	r3, #9
	subge	r3, r3, #1
	b	.L125
.L142:
	bl	shootFireball
	b	.L123
.L145:
	ldr	r3, .L147+36
	b	.L141
.L146:
	mov	r1, #0
	ldr	r2, .L147+12
	ldr	r0, [r2, #8]
	ldr	r3, [r2]
	add	r3, r3, r0, lsl #1
	sub	r3, r3, #25
	str	r3, [r4]
	str	r1, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L148:
	.align	2
.L147:
	.word	fireball
	.word	__aeabi_idivmod
	.word	.LANCHOR1
	.word	kaido
	.word	luffyLives
	.word	luffy
	.word	shadowOAM
	.word	1044
	.word	state
	.word	rand
	.word	1717986919
	.size	fireballUpdate, .-fireballUpdate
	.align	2
	.global	punchCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	punchCollision, %function
punchCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L151
	ldr	r0, .L151+4
	ldr	ip, [r1, #12]
	sub	sp, sp, #16
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	ldr	lr, [r1, #8]
	str	ip, [sp, #12]
	ldm	r1, {r1, ip}
	stm	sp, {r1, ip, lr}
	ldr	r4, .L151+8
	ldm	r0, {r0, r1}
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	luffyFist
	.word	kaido
	.word	collision
	.size	punchCollision, .-punchCollision
	.align	2
	.global	luffyPunching
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyPunching, %function
luffyPunching:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L164
	ldr	lr, .L164+4
	ldr	r0, [r4]
	and	r6, r0, lr
	mvn	ip, r6, lsl #18
	mvn	ip, ip, lsr #18
	mov	r8, #227
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	ldr	r3, .L164+8
	ldr	r7, [r4, #40]
	ldrh	r1, [r4, #4]
	add	r5, r3, r2, lsl #3
	strh	ip, [r5, #2]	@ movhi
	cmp	r7, #1
	and	ip, r1, #255
	lsl	r7, r2, #3
	strh	ip, [r3, r7]	@ movhi
	strh	r8, [r5, #4]	@ movhi
	ldr	ip, [r4, #48]
	beq	.L163
	cmp	ip, #19
	bgt	.L156
	add	r6, r2, #1
	lsl	r5, r0, #16
	add	r1, r1, #16
	lsl	r8, r6, #3
	lsr	r5, r5, #16
	and	r1, r1, #255
	strh	r1, [r3, r8]	@ movhi
	sub	r7, r5, #8
	ldr	r8, .L164+12
	add	r6, r3, r6, lsl #3
	and	r7, r7, lr
	cmp	ip, #17
	strh	r7, [r6, #2]	@ movhi
	strh	r8, [r6, #4]	@ movhi
	bgt	.L156
	add	r7, r2, #2
	lsl	r6, r7, #3
	sub	r9, r5, #12
	add	r7, r3, r7, lsl #3
	strh	r1, [r3, r6]	@ movhi
	and	r9, r9, lr
	ldr	r6, .L164+16
	strh	r8, [r7, #4]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	cmp	ip, #15
	sub	r7, r0, #12
	str	r7, [r6]
	bgt	.L156
	add	r7, r2, #3
	lsl	r10, r7, #3
	sub	r9, r5, #16
	add	r7, r3, r7, lsl #3
	strh	r1, [r3, r10]	@ movhi
	and	r9, r9, lr
	sub	r10, r0, #16
	cmp	ip, #13
	strh	r8, [r7, #4]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	str	r10, [r6]
	bgt	.L156
	add	r7, r2, #4
	lsl	r10, r7, #3
	sub	r9, r5, #20
	add	r7, r3, r7, lsl #3
	strh	r1, [r3, r10]	@ movhi
	and	r9, r9, lr
	sub	r10, r0, #20
	cmp	ip, #11
	strh	r8, [r7, #4]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	str	r10, [r6]
	bgt	.L156
	add	r7, r2, #5
	lsl	r10, r7, #3
	sub	r9, r5, #24
	add	r7, r3, r7, lsl #3
	strh	r1, [r3, r10]	@ movhi
	and	r9, r9, lr
	sub	r10, r0, #24
	cmp	ip, #9
	strh	r8, [r7, #4]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	str	r10, [r6]
	bgt	.L156
	mov	r7, #288
	sub	r5, r5, #36
	add	r2, r2, #6
	and	lr, lr, r5
	orr	lr, lr, #16384
	sub	r0, r0, #28
	cmp	ip, #0
	add	ip, r3, r2, lsl #3
	lsl	r2, r2, #3
	str	r0, [r6]
	strh	lr, [ip, #2]	@ movhi
	strh	r1, [r3, r2]	@ movhi
	strh	r7, [ip, #4]	@ movhi
	bge	.L156
.L158:
	mov	r1, #22
	mov	r2, #0
	mov	r3, #1
	str	r1, [r4, #48]
	str	r2, [r4, #44]
	str	r3, [r4, #36]
.L156:
	bl	punchCollision
	ldr	r3, .L164+20
	ldr	r2, [r3]
	cmp	r2, #1
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	bne	.L159
	ldr	r3, .L164+24
	ldr	r3, [r3]
.L160:
	cmp	r3, #0
	bgt	.L161
	mov	r0, #9
	mov	r3, #67108864
	ldr	r1, .L164+28
	ldr	r2, .L164+32
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
.L161:
	ldr	r3, [r4, #48]
	sub	r3, r3, #1
	str	r3, [r4, #48]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L163:
	orr	r6, r6, #53248
	cmp	ip, #19
	strh	r6, [r5, #2]	@ movhi
	bgt	.L156
	ldr	r6, [r4, #8]
	add	r5, r0, r6
	lsl	r5, r5, #16
	lsr	r5, r5, #16
	add	r7, r2, #1
	add	r1, r1, #16
	add	r8, r5, #32
	lsl	r10, r7, #3
	and	r8, r8, lr
	add	r7, r3, r7, lsl #3
	and	r1, r1, #255
	ldr	r9, .L164+12
	strh	r1, [r3, r10]	@ movhi
	strh	r8, [r7, #2]	@ movhi
	add	r10, r0, #32
	ldr	r8, .L164+16
	add	r10, r10, r6
	cmp	ip, #17
	strh	r9, [r7, #4]	@ movhi
	str	r10, [r8]
	bgt	.L156
	add	r7, r2, #2
	lsl	fp, r7, #3
	strh	r1, [r3, fp]	@ movhi
	add	r10, r5, #36
	add	fp, r0, #36
	add	r7, r3, r7, lsl #3
	and	r10, r10, lr
	add	fp, fp, r6
	cmp	ip, #15
	strh	r9, [r7, #4]	@ movhi
	strh	r10, [r7, #2]	@ movhi
	str	fp, [r8]
	bgt	.L156
	add	r7, r2, #3
	lsl	fp, r7, #3
	strh	r1, [r3, fp]	@ movhi
	add	r10, r5, #40
	add	fp, r0, #40
	add	r7, r3, r7, lsl #3
	and	r10, r10, lr
	add	fp, fp, r6
	cmp	ip, #13
	strh	r9, [r7, #4]	@ movhi
	strh	r10, [r7, #2]	@ movhi
	str	fp, [r8]
	bgt	.L156
	add	r7, r2, #4
	lsl	fp, r7, #3
	strh	r1, [r3, fp]	@ movhi
	add	r10, r5, #44
	add	fp, r0, #44
	add	r7, r3, r7, lsl #3
	and	r10, r10, lr
	add	fp, fp, r6
	cmp	ip, #11
	strh	r9, [r7, #4]	@ movhi
	strh	r10, [r7, #2]	@ movhi
	str	fp, [r8]
	bgt	.L156
	add	r7, r2, #5
	lsl	fp, r7, #3
	strh	r1, [r3, fp]	@ movhi
	add	r10, r5, #48
	add	fp, r0, #48
	add	r7, r3, r7, lsl #3
	and	r10, r10, lr
	add	fp, fp, r6
	cmp	ip, #9
	strh	r9, [r7, #4]	@ movhi
	strh	r10, [r7, #2]	@ movhi
	str	fp, [r8]
	bgt	.L156
	mov	r7, #288
	add	r5, r5, #52
	add	r2, r2, #6
	add	r0, r0, #56
	and	lr, lr, r5
	add	r6, r0, r6
	orr	lr, lr, #20480
	add	r0, r3, r2, lsl #3
	cmp	ip, #0
	lsl	r2, r2, #3
	str	r6, [r8]
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [r3, r2]	@ movhi
	strh	r7, [r0, #4]	@ movhi
	blt	.L158
	b	.L156
.L159:
	mov	ip, #0
	ldr	r2, .L164+36
	ldr	r0, .L164+40
	ldr	r1, [r2]
	ldr	r2, .L164+44
	str	ip, [r3]
	mov	lr, pc
	bx	r2
	ldr	r2, .L164+24
	ldr	r1, .L164+48
	ldr	r3, [r2]
	ldr	r1, [r1]
	sub	r3, r3, r1
	str	r3, [r2]
	b	.L160
.L165:
	.align	2
.L164:
	.word	luffy
	.word	511
	.word	shadowOAM
	.word	290
	.word	luffyFist
	.word	luffyPunched
	.word	kaidoHealth
	.word	state
	.word	1044
	.word	LuffyPunchSound_length
	.word	LuffyPunchSound_data
	.word	playSoundEffect
	.word	.LANCHOR0
	.size	luffyPunching, .-luffyPunching
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
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L223
	ldr	r4, .L223+4
	ldrh	r5, [r6]
	ldr	r2, .L223+8
	ldr	r3, [r4]
	tst	r5, #32
	str	r3, [r2]
	str	r1, [r4, #16]
	ldr	r2, [r4, #44]
	bne	.L167
	cmp	r2, r1
	bne	.L168
	cmp	r3, r1
	str	r2, [r4, #40]
	ldrgt	r2, [r4, #20]
	subgt	r3, r3, r2
	strgt	r3, [r4]
.L170:
	mov	r3, #1
	str	r3, [r4, #16]
.L171:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L176
	ldr	r3, [r4]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r1, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r1, r1, lsr #18
	mvn	r2, r2, lsr #17
	ldr	lr, [r4, #40]
	ldrb	r0, [r4, #64]	@ zero_extendqisi2
	ldr	r8, .L223+12
	cmp	lr, #1
	orreq	r3, r3, #53248
	add	ip, r8, r0, lsl #3
	lsl	r7, r0, #3
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [r8, r7]	@ movhi
	strheq	r3, [ip, #2]	@ movhi
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	beq	.L218
	cmp	r3, #0
	bne	.L177
	cmp	r2, #1
	beq	.L219
.L176:
	ldr	r7, .L223+16
	ldrh	r3, [r7]
	tst	r3, #1
	bne	.L192
.L216:
	tst	r3, #64
	bne	.L220
.L183:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L184
	ldr	r2, .L223+20
	tst	r3, #128
	ldr	r3, [r2, #12]
	bne	.L221
.L186:
	cmp	r3, #1
	beq	.L222
.L188:
	ldr	r3, .L223+24
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L191
	ldr	r3, [r4]
	add	r3, r3, #2
	lsl	r3, r3, #16
	ldr	lr, [r4, #4]
	add	r1, r1, r1, lsl #2
	lsr	r3, r3, #16
	add	r1, r3, r1, lsl #1
	lsl	r1, r1, #16
	sub	lr, lr, #10
	ldr	r2, .L223+28
	ldr	r6, .L223+32
	ldr	r5, .L223+36
	lsr	r1, r1, #16
	and	lr, lr, #255
.L190:
	add	ip, r3, #10
	and	r0, r3, r6
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r1, r3
	strh	lr, [r2]	@ movhi
	strh	r5, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L190
.L191:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L167:
	tst	r5, #16
	bne	.L172
	cmp	r2, #0
	bne	.L168
	mov	r1, #1
	ldr	r2, [r4, #8]
	rsb	r2, r2, #240
	cmp	r3, r2
	str	r1, [r4, #40]
	ldrlt	r2, [r4, #20]
	addlt	r3, r2, r3
	strlt	r3, [r4]
	b	.L170
.L172:
	cmp	r2, #0
	beq	.L171
.L168:
	ldr	r7, .L223+16
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L180
.L192:
	tst	r5, #1
	bne	.L179
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L179
	mov	r3, #1
	ldr	r2, .L223+40
	str	r3, [r4, #44]
	str	r3, [r2]
.L180:
	bl	luffyPunching
	b	.L215
.L179:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L180
.L215:
	ldrh	r3, [r7]
	tst	r3, #64
	beq	.L183
.L220:
	ldrh	r2, [r6]
	ands	r2, r2, #64
	bne	.L183
	mov	r3, #1
	str	r2, [r4, #44]
	str	r3, [r4, #52]
.L184:
	bl	luffyJumping
	ldrh	r3, [r7]
	ldr	r2, .L223+20
	tst	r3, #128
	ldr	r3, [r2, #12]
	beq	.L186
.L221:
	ldrh	r1, [r6]
	tst	r1, #128
	bne	.L186
	ldr	r1, [r4, #52]
	cmp	r1, #1
	beq	.L186
	ldr	r1, [r2]
	cmp	r1, #1
	bne	.L186
	cmp	r3, #0
	bne	.L186
	ldr	r3, [r4]
	add	r0, r3, #7
	cmp	r3, #0
	movlt	r3, r0
	asr	r3, r3, #3
	sub	r3, r3, #2
	str	r3, [r2, #4]
	mov	r3, #45
	sub	r3, r3, #1
	str	r1, [r2, #12]
	str	r3, [r2, #8]
	bl	groundChange
	b	.L188
.L222:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	ble	.L188
	sub	r3, r3, #1
	str	r3, [r2, #8]
	bl	groundChange
	b	.L188
.L218:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L223+44
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r7
	ldr	r7, .L223+16
	lsl	r2, r1, #2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r7]
	tst	r3, #1
	str	r1, [r4, #32]
	beq	.L216
	b	.L192
.L177:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L176
.L219:
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L223+48
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	add	r1, r2, #4
	add	r3, r8, r7
	lsl	r1, r1, #2
	str	r2, [r4, #32]
	strh	r1, [r3, #4]	@ movhi
	str	r0, [r4, #36]
	b	.L176
.L224:
	.align	2
.L223:
	.word	buttons
	.word	luffy
	.word	luffyFist
	.word	shadowOAM
	.word	oldButtons
	.word	.LANCHOR1
	.word	luffyLives
	.word	shadowOAM+280
	.word	511
	.word	1006
	.word	luffyPunched
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
	ldr	r3, .L229
	mov	lr, pc
	bx	r3
	ldr	r4, .L229+4
	bl	luffyUpdate
	bl	kaidoUpdate
	bl	fireballUpdate
	mov	r3, #512
	ldr	r1, .L229+8
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	ip, .L229+12
	ldr	r2, [ip, #16]
	tst	r2, #1
	ldreq	r1, .L229+16
	ldrne	r3, .L229+16
	ldreq	r3, [r1]
	ldrne	r3, [r3]
	addeq	r3, r3, #1
	streq	r3, [r1]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r1, r3, #17
	add	r2, r2, #1
	lsr	r1, r1, #16
	str	r2, [ip, #16]
	pop	{r4, lr}
	strh	r3, [r0, #20]	@ movhi
	strh	r1, [r0, #24]	@ movhi
	bx	lr
.L230:
	.align	2
.L229:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR1
	.word	hOff
	.size	kaido1, .-kaido1
	.align	2
	.global	initLightning
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLightning, %function
initLightning:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #38
	mov	r1, #0
	mov	r4, #15
	mov	lr, #40
	mov	ip, #1
	ldr	r3, .L235
.L232:
	add	r0, r2, #1
	strb	r2, [r3, #32]
	and	r2, r0, #255
	cmp	r2, #42
	str	r1, [r3]
	str	r1, [r3, #4]
	str	r1, [r3, #24]
	str	r4, [r3, #12]
	str	lr, [r3, #8]
	str	ip, [r3, #28]
	add	r3, r3, #36
	bne	.L232
	pop	{r4, lr}
	bx	lr
.L236:
	.align	2
.L235:
	.word	lightning
	.size	initLightning, .-initLightning
	.align	2
	.global	luffyLightningThrow
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyLightningThrow, %function
luffyLightningThrow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L238
	str	r2, [r3, #60]
	bx	lr
.L239:
	.align	2
.L238:
	.word	luffy
	.size	luffyLightningThrow, .-luffyLightningThrow
	.align	2
	.global	luffyUpdate2
	.syntax unified
	.arm
	.fpu softvfp
	.type	luffyUpdate2, %function
luffyUpdate2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L292
	ldrh	r5, [r6]
	ldr	r4, .L292+4
	ands	r2, r5, #32
	str	r3, [r4, #16]
	bne	.L241
	ldr	r3, [r4]
	cmp	r3, #0
	str	r2, [r4, #40]
	ldrgt	r2, [r4, #20]
	subgt	r3, r3, r2
	strgt	r3, [r4]
.L243:
	mov	r3, #1
	str	r3, [r4, #16]
.L244:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L247
	ldr	r3, [r4]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r1, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r1, r1, lsr #18
	mvn	r2, r2, lsr #17
	ldr	lr, [r4, #40]
	ldrb	r0, [r4, #64]	@ zero_extendqisi2
	ldr	r8, .L292+8
	cmp	lr, #1
	orreq	r3, r3, #53248
	add	ip, r8, r0, lsl #3
	lsl	r7, r0, #3
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [r8, r7]	@ movhi
	strheq	r3, [ip, #2]	@ movhi
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	bne	.L249
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L292+12
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r7
	lsl	r2, r1, #2
	str	r1, [r4, #32]
	strh	r2, [r3, #4]	@ movhi
.L247:
	ldr	r7, .L292+16
	ldrh	r1, [r7]
	tst	r1, #1
	beq	.L252
	tst	r5, #1
	bne	.L252
	mov	r3, #1
	ldr	r5, .L292+20
	str	r3, [r4, #60]
	str	r3, [r5, #20]
.L253:
	ldr	ip, .L292+24
	mov	r3, #0
	mov	r2, ip
.L256:
	ldr	r0, [r2, #24]
	cmp	r0, #0
	beq	.L288
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #36
	bne	.L256
.L254:
	tst	r1, #64
	beq	.L257
	ldrh	r3, [r6]
	ands	r3, r3, #64
	beq	.L289
.L257:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L258
.L259:
	tst	r1, #128
	ldr	r3, [r5, #12]
	beq	.L260
	ldrh	r2, [r6]
	tst	r2, #128
	beq	.L290
.L260:
	cmp	r3, #1
	beq	.L291
.L262:
	ldr	r3, .L292+28
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L265
	ldr	r3, [r4]
	add	r3, r3, #2
	lsl	r3, r3, #16
	ldr	lr, [r4, #4]
	add	r1, r1, r1, lsl #2
	lsr	r3, r3, #16
	add	r1, r3, r1, lsl #1
	lsl	r1, r1, #16
	sub	lr, lr, #10
	ldr	r2, .L292+32
	ldr	r6, .L292+36
	ldr	r5, .L292+40
	lsr	r1, r1, #16
	and	lr, lr, #255
.L264:
	add	ip, r3, #10
	and	r0, r3, r6
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r1, r3
	strh	lr, [r2]	@ movhi
	strh	r5, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L264
.L265:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L252:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	ldr	r5, .L292+20
	beq	.L254
	b	.L253
.L290:
	ldr	r2, [r4, #52]
	cmp	r2, #1
	beq	.L260
	ldr	r2, [r5]
	cmp	r2, #1
	bne	.L260
	cmp	r3, #0
	bne	.L260
	ldr	r3, [r4]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	asr	r3, r3, #3
	sub	r3, r3, #2
	str	r3, [r5, #4]
	mov	r3, #45
	sub	r3, r3, #1
	str	r2, [r5, #12]
	str	r3, [r5, #8]
	bl	groundChange
	b	.L262
.L289:
	mov	r2, #1
	str	r3, [r4, #44]
	str	r2, [r4, #52]
.L258:
	bl	luffyJumping
	ldrh	r1, [r7]
	b	.L259
.L249:
	cmp	r3, #0
	bne	.L250
	cmp	r2, #1
	bne	.L247
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L292+44
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	add	r1, r2, #4
	add	r3, r8, r7
	lsl	r1, r1, #2
	str	r2, [r4, #32]
	strh	r1, [r3, #4]	@ movhi
	str	r0, [r4, #36]
	b	.L247
.L241:
	tst	r5, #16
	bne	.L244
	mov	r1, #1
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	rsb	r3, r3, #240
	cmp	r2, r3
	str	r1, [r4, #40]
	ldrlt	r3, [r4, #20]
	addlt	r2, r3, r2
	strlt	r2, [r4]
	b	.L243
.L291:
	ldr	r3, [r5, #8]
	cmp	r3, #0
	ble	.L262
	sub	r3, r3, #1
	str	r3, [r5, #8]
	bl	groundChange
	b	.L262
.L250:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L247
.L288:
	mov	r2, #1
	ldr	r1, [r4]
	add	r3, r3, r3, lsl #3
	add	r0, ip, r3, lsl #2
	str	r1, [ip, r3, lsl #2]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #40]
	str	r1, [r0, #4]
	str	r2, [r0, #24]
	str	r3, [r0, #28]
	bl	luffyLightningThrow
	ldrh	r1, [r7]
	b	.L254
.L293:
	.align	2
.L292:
	.word	buttons
	.word	luffy
	.word	shadowOAM
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	.LANCHOR1
	.word	lightning
	.word	luffyLives
	.word	shadowOAM+280
	.word	511
	.word	1006
	.word	1431655766
	.size	luffyUpdate2, .-luffyUpdate2
	.align	2
	.global	kaidoUpdate2
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaidoUpdate2, %function
kaidoUpdate2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L326
	ldr	r9, [r6]
	lsl	r2, r9, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mov	r1, #128
	mvn	r2, r2, lsr #18
	ldr	r8, .L326+4
	ldr	r3, [r8, #4]
	ldr	r0, [r6, #28]
	strh	r1, [r3, #30]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r5, .L326+8
	ldrb	r4, [r6, #48]	@ zero_extendqisi2
	ldr	r7, [r6, #4]
	add	r3, r0, #64
	add	r1, r5, r4, lsl #3
	ldr	ip, [r6, #32]
	lsl	r3, r3, #3
	strh	r2, [r1, #2]	@ movhi
	and	r3, r3, #1016
	and	r2, r7, #255
	lsl	r4, r4, #3
	orr	r3, r3, #4096
	orr	r2, r2, #768
	cmp	ip, #0
	strh	r2, [r5, r4]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bne	.L295
	ldr	r3, .L326+12
	ldr	r1, [r6, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r0, #29
	str	r1, [r6, #28]
.L296:
	mov	ip, #2
	mov	lr, #116
	mov	r10, #100
	ldr	r3, [r8, #8]
	ldr	r1, .L326+16
	add	r2, r3, #1
	lsl	fp, r2, #3
	str	r0, [r6, #32]
	lsl	r0, r3, #3
	strh	r1, [r5, r0]	@ movhi
	strh	r1, [r5, fp]	@ movhi
	ldr	r1, .L326+20
	add	r2, r5, r2, lsl #3
	ldr	r0, [r1]
	add	r1, r3, ip
	add	r3, r5, r3, lsl #3
	strh	r10, [r3, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	ldr	lr, .L326+24
	strh	lr, [r3, #4]	@ movhi
	ldr	r3, .L326+28
	lsl	lr, r1, #3
	strh	r3, [r2, #4]	@ movhi
	add	r3, r5, r1, lsl #3
	mov	r1, #132	@ movhi
	ldr	r2, .L326+32
	cmp	r0, #0
	strh	ip, [r5, lr]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ble	.L300
	mov	ip, #10
	mov	r3, #80
	add	r0, r0, ip
	lsl	r0, r0, #19
	ldr	lr, .L326+36
	lsr	r0, r0, #16
	add	r4, r5, r4
.L299:
	add	r1, r3, #8
	and	r2, r3, #504
	lsl	r3, r1, #16
	lsr	r3, r3, #16
	cmp	r3, r0
	strh	ip, [r4, #16]	@ movhi
	strh	lr, [r4, #20]	@ movhi
	strh	r2, [r4, #18]	@ movhi
	add	r4, r4, #8
	bne	.L299
.L300:
	ldr	r0, .L326+8
	mov	ip, #72
	mov	r1, #10
	mov	r3, r0
	ldr	r2, .L326+40
	strh	ip, [r5, #178]	@ movhi
	strh	r1, [r5, #176]	@ movhi
	strh	r2, [r5, #180]	@ movhi
	ldr	ip, .L326+44
	add	r0, r0, #80
	rsb	lr, r3, #80
.L298:
	add	r2, lr, r3
	strh	r1, [r3, #184]	@ movhi
	strh	ip, [r3, #188]	@ movhi
	strh	r2, [r3, #186]	@ movhi
	add	r3, r3, #8
	cmp	r0, r3
	bne	.L298
	mov	ip, #160
	ldr	r3, [r6, #12]
	ldr	r2, .L326+48
	rsb	r3, r3, #80
	ldr	r0, .L326+52
	cmp	r7, r3, lsl #1
	strh	ip, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	lsl	r3, r3, #1
	bgt	.L301
	ldr	r2, [r6, #36]
	cmp	r2, #1
	addeq	r7, r7, #1
	streq	r7, [r6, #4]
	beq	.L303
	cmp	r7, #0
	blt	.L304
	cmp	r2, #0
	subeq	r7, r7, #1
	streq	r7, [r6, #4]
.L303:
	cmp	r3, r7
	beq	.L311
.L305:
	cmp	r7, #0
	moveq	r3, #1
	streq	r3, [r6, #36]
.L306:
	ldr	r3, [r8, #12]
	cmp	r3, #0
	bne	.L307
	ldr	ip, .L326+56
	mov	r2, r3
	mov	r1, ip
.L310:
	ldr	r0, [r1, #32]
	cmp	r0, #0
	beq	.L325
	add	r2, r2, #1
	cmp	r2, #5
	add	r1, r1, #44
	bne	.L310
.L309:
	sub	r3, r3, #1
	str	r3, [r8, #12]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L301:
	cmp	r7, #0
	blt	.L306
	ldr	r2, [r6, #36]
	cmp	r2, #0
	bne	.L305
	sub	r7, r7, #1
	str	r7, [r6, #4]
	b	.L303
.L307:
	bge	.L309
	ldr	r3, .L326+60
.L323:
	mov	lr, pc
	bx	r3
	ldr	r3, .L326+64
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	add	r3, r3, #30
	sub	r3, r3, #1
	str	r3, [r8, #12]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L295:
	movlt	r0, #29
	subge	r0, ip, #1
	b	.L296
.L304:
	cmp	r7, r3
	bne	.L306
.L311:
	mov	r3, #0
	str	r3, [r6, #36]
	b	.L306
.L325:
	mov	r0, #1
	ldr	r3, [r6, #8]
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl r0
	add	r3, r9, r3, lsl r0
	sub	r3, r3, #25
	add	r1, ip, r2, lsl #2
	str	r3, [ip, r2, lsl #2]
	str	r7, [r1, #4]
	ldr	r3, .L326+60
	str	r0, [r1, #32]
	b	.L323
.L327:
	.align	2
.L326:
	.word	kaido
	.word	.LANCHOR0
	.word	shadowOAM
	.word	__aeabi_idivmod
	.word	16386
	.word	kaidoHealth
	.word	5093
	.word	5095
	.word	5097
	.word	5099
	.word	5098
	.word	5100
	.word	shadowOAM+272
	.word	5101
	.word	fireballs
	.word	rand
	.word	1717986919
	.size	kaidoUpdate2, .-kaidoUpdate2
	.align	2
	.global	initFireball2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFireball2, %function
initFireball2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #42
	mov	r2, #0
	mov	r6, #16
	mov	r5, #32
	mov	r4, #2
	mov	lr, #1
	mov	ip, #10
	ldr	r3, .L332
.L329:
	add	r0, r1, #1
	strb	r1, [r3, #40]
	and	r1, r0, #255
	cmp	r1, #47
	str	r2, [r3, #32]
	str	r2, [r3, #28]
	str	r6, [r3, #12]
	str	r5, [r3, #8]
	str	r4, [r3, #24]
	str	r2, [r3]
	str	lr, [r3, #16]
	str	r2, [r3, #4]
	str	ip, [r3, #20]
	str	r2, [r3, #36]
	add	r3, r3, #44
	bne	.L329
	pop	{r4, r5, r6, lr}
	bx	lr
.L333:
	.align	2
.L332:
	.word	fireballs
	.size	initFireball2, .-initFireball2
	.align	2
	.global	shootFireball2
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootFireball2, %function
shootFireball2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, [r0]
	lsl	r2, r4, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	ldr	r3, [r0, #28]
	ldr	lr, [r0, #8]
	lsl	r3, r3, #6
	ldrb	r1, [r0, #40]	@ zero_extendqisi2
	ldr	r5, .L338
	add	r3, r3, #28
	add	lr, lr, #240
	and	r3, r3, #1020
	cmp	r4, lr
	orr	r3, r3, #4096
	add	lr, r5, r1, lsl #3
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	mvn	r2, r2, lsr #17
	strh	r3, [lr, #4]	@ movhi
	movgt	r3, #0
	ldrle	r3, [r0, #16]
	lsl	r1, r1, #3
	addle	r4, r3, r4
	orr	ip, ip, #16384
	strh	r2, [lr, #2]	@ movhi
	strh	ip, [r5, r1]	@ movhi
	strle	r4, [r0]
	strgt	r3, [r0, #32]
	pop	{r4, r5, lr}
	bx	lr
.L339:
	.align	2
.L338:
	.word	shadowOAM
	.size	shootFireball2, .-shootFireball2
	.align	2
	.global	lightningCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	lightningCollision, %function
lightningCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, [r0, #4]
	ldr	ip, .L342
	sub	sp, sp, #16
	add	r2, r2, #9
	ldr	r4, [r0, #12]
	ldr	lr, [r0, #8]
	ldr	r1, [r0]
	ldr	r3, [ip, #12]
	str	r2, [sp, #4]
	ldr	r2, [ip, #8]
	str	r4, [sp, #12]
	str	r1, [sp]
	str	lr, [sp, #8]
	ldm	ip, {r0, r1}
	ldr	r4, .L342+4
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L343:
	.align	2
.L342:
	.word	kaido
	.word	collision
	.size	lightningCollision, .-lightningCollision
	.align	2
	.global	lightningUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	lightningUpdate, %function
lightningUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L363
	ldr	r8, .L363+4
	ldr	r10, .L363+8
	ldr	r6, .L363+12
	ldr	r5, .L363+16
	ldr	r7, .L363+20
	add	r9, r4, #144
.L354:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L345
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
.L353:
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r8, r3]	@ movhi
.L346:
	add	r4, r4, #36
	cmp	r4, r9
	bne	.L354
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L362
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L345:
	ldr	r2, [r4, #28]
	ldr	r3, [r4]
	cmp	r2, #0
	subeq	r3, r3, #2
	streq	r3, [r4]
	beq	.L348
	cmp	r2, #1
	addeq	r3, r3, #2
	streq	r3, [r4]
.L348:
	ldr	r2, [r4, #8]
	cmn	r3, r2
	bmi	.L361
	cmp	r3, #240
	ble	.L350
.L361:
	mov	r3, #0
	str	r3, [r4, #24]
.L350:
	mov	r0, r4
	bl	lightningCollision
	cmp	r0, #0
	movne	r2, #0
	movne	r0, r2
	ldrne	r3, [r10]
	ldrne	r1, [r7]
	strne	r2, [r4, #24]
	subne	r3, r3, r1
	ldr	r2, [r4]
	ldreq	r0, [r4, #24]
	strne	r3, [r10]
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	and	r2, r2, r6
	orr	r2, r2, r5
	cmp	r0, #0
	add	r0, r8, r3, lsl #3
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strh	r2, [r0, #2]	@ movhi
	ldr	r2, .L363+24
	orr	r1, r1, #16384
	strh	r2, [r0, #4]	@ movhi
	lsl	r2, r3, #3
	strh	r1, [r8, r2]	@ movhi
	bne	.L346
	b	.L353
.L362:
	mov	r2, #7
	mov	r1, #67108864
	ldr	ip, .L363+28
	ldr	r0, .L363+32
	ldr	r3, .L363+36
	strh	r2, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r1, [r3]
	ldr	r0, .L363+40
	ldr	r3, .L363+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L364:
	.align	2
.L363:
	.word	lightning
	.word	shadowOAM
	.word	kaidoHealth
	.word	511
	.word	-16384
	.word	.LANCHOR0
	.word	4789
	.word	state
	.word	1044
	.word	BinksBrew_length
	.word	BinksBrew_data
	.word	playSong
	.size	lightningUpdate, .-lightningUpdate
	.align	2
	.global	fireballCollision2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballCollision2, %function
fireballCollision2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L367
	add	r4, r3, #8
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	sub	sp, sp, #20
	ldm	r0, {r0, r1, r2, r3}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L367+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L368:
	.align	2
.L367:
	.word	luffy
	.word	collision
	.size	fireballCollision2, .-fireballCollision2
	.align	2
	.global	fireballUpdate2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireballUpdate2, %function
fireballUpdate2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #512
	ldr	r4, .L382
	ldr	r10, .L382+4
	ldr	r6, .L382+8
	ldr	r8, .L382+12
	ldr	r9, .L382+16
	ldr	fp, .L382+20
	add	r5, r4, #220
.L376:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L381
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r7, [r6, r3]	@ movhi
.L380:
	ldr	r3, [r4]
.L374:
	ldr	r0, [r4, #8]
	ldr	r1, [r10, #4]
	add	r3, r3, r0
	cmp	r3, r1, lsl #3
	ble	.L375
	ldr	r3, [r10, #12]
	cmp	r3, #1
	bne	.L375
	mov	r1, #0
	ldr	r0, [r8, #8]
	ldr	r3, [r8]
	add	r3, r3, r0, lsl #1
	sub	r3, r3, #25
	str	r3, [r4]
	str	r1, [r4, #32]
.L375:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L376
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L381:
	mov	r0, r4
	bl	shootFireball2
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L371
	add	r1, r4, #24
	ldm	r1, {r1, r3}
	add	r3, r3, #1
	and	r3, r3, r1
	str	r3, [r4, #28]
	mov	r3, #9
.L372:
	mov	r0, r4
	str	r3, [r4, #20]
	bl	fireballCollision2
	cmp	r0, #0
	beq	.L380
	mov	r1, #0
	ldr	r3, [r9]
	sub	r3, r3, #1
	str	r3, [r9]
	cmp	r3, r1
	ldr	r3, [r8]
	str	r1, [r4, #32]
	str	r3, [r4]
	bne	.L374
	mov	r0, #8
	mov	r1, #67108864
	ldr	r2, .L382+24
	strh	r0, [fp]	@ movhi
	strh	r2, [r1]	@ movhi
	b	.L374
.L371:
	movlt	r3, #9
	subge	r3, r3, #1
	b	.L372
.L383:
	.align	2
.L382:
	.word	fireballs
	.word	.LANCHOR1
	.word	shadowOAM
	.word	kaido
	.word	luffyLives
	.word	state
	.word	1044
	.size	fireballUpdate2, .-fireballUpdate2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	kaido2
	.syntax unified
	.arm
	.fpu softvfp
	.type	kaido2, %function
kaido2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L388
	mov	lr, pc
	bx	r3
	ldr	r4, .L388+4
	bl	luffyUpdate2
	bl	kaidoUpdate2
	bl	lightningUpdate
	bl	fireballUpdate2
	mov	r3, #512
	ldr	r1, .L388+8
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	lr, #67108864
	ldr	ip, .L388+12
	ldr	r2, [ip, #16]
	tst	r2, #1
	ldreq	r1, .L388+16
	ldrne	r3, .L388+16
	ldreq	r3, [r1]
	ldrne	r3, [r3]
	addeq	r3, r3, #1
	streq	r3, [r1]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r0, r3, #17
	ldr	r1, .L388+20
	lsr	r0, r0, #16
	strh	r3, [lr, #20]	@ movhi
	ldr	r1, [r1, #28]
	add	r2, r2, #1
	strh	r0, [lr, #24]	@ movhi
	ldr	r3, .L388+24
	ldr	r0, .L388+28
	str	r2, [ip, #16]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L389:
	.align	2
.L388:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR1
	.word	hOff
	.word	lightning
	.word	mgba_printf
	.word	.LC0
	.size	kaido2, .-kaido2
	.global	SHADOW_OAM_AFF
	.comm	hOff,4,4
	.comm	vOff,4,4
	.global	offVariable
	.global	timeUntilNextFireball
	.global	luffyLightning
	.global	tileTemp
	.global	groundFrames
	.global	groundChanging
	.global	gearFifth
	.global	punchDamage
	.comm	rSeed,4,4
	.global	kaidoWordOAMIndex
	.comm	luffyPunched,4,4
	.comm	kaidoHealth,4,4
	.comm	luffyLives,4,4
	.comm	shadowOAM,1024,4
	.comm	KAIDODIRECTION,1,1
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	soundEffect,28,4
	.comm	song,28,4
	.comm	lightning,144,4
	.comm	fireballs,220,4
	.comm	fireball,44,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,68,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	punchDamage, %object
	.size	punchDamage, 4
punchDamage:
	.word	1
	.type	SHADOW_OAM_AFF, %object
	.size	SHADOW_OAM_AFF, 4
SHADOW_OAM_AFF:
	.word	shadowOAM
	.type	kaidoWordOAMIndex, %object
	.size	kaidoWordOAMIndex, 4
kaidoWordOAMIndex:
	.word	19
	.type	timeUntilNextFireball, %object
	.size	timeUntilNextFireball, 4
timeUntilNextFireball:
	.word	20
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gearFifth, %object
	.size	gearFifth, 4
gearFifth:
	.space	4
	.type	tileTemp, %object
	.size	tileTemp, 4
tileTemp:
	.space	4
	.type	groundFrames, %object
	.size	groundFrames, 4
groundFrames:
	.space	4
	.type	groundChanging, %object
	.size	groundChanging, 4
groundChanging:
	.space	4
	.type	offVariable, %object
	.size	offVariable, 4
offVariable:
	.space	4
	.type	luffyLightning, %object
	.size	luffyLightning, 4
luffyLightning:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
