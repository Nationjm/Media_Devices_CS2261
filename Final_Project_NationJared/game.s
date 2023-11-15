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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
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
	mov	r2, #0
	ldr	r3, .L31
	strh	r2, [r3]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r3, .L34
	strh	r2, [r3]	@ movhi
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L37
	strh	r2, [r3]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	state
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
	ldr	r3, .L40
	strh	r2, [r3]	@ movhi
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r3, .L43
	strh	r2, [r3]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r1, .L46
	ldr	r2, .L46+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L47:
	.align	2
.L46:
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
	ldr	ip, .L50
	ldr	r0, .L50+4
	ldr	r3, .L50+8
	strh	r2, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r1, [r3]
	ldr	r0, .L50+12
	ldr	r3, .L50+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r1, .L53
	ldr	r2, .L53+4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L57
	str	lr, [r3, #56]
	ldr	lr, .L57+4
	stm	r3, {r0, fp}
	mov	r10, #2
	mov	r9, #44
	mov	r8, #32
	mov	r7, #1
	mov	r6, #10
	mov	r5, #4
	mov	r4, #22
	stm	lr, {r0, ip}
	ldr	r0, .L57+8
	strb	r2, [r3, #60]
	mov	r1, #8
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r0]
	mov	r2, #3
	str	r10, [r3, #20]
	str	r9, [r3, #12]
	str	r8, [r3, #8]
	str	r7, [r3, #24]
	str	r6, [r3, #36]
	str	r5, [r3, #28]
	str	r4, [r3, #48]
	ldr	r3, .L57+12
	str	r1, [lr, #12]
	str	r1, [lr, #8]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r3, .L72
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [r3, #4]
	and	r5, r4, #255
	mvn	lr, r5, lsl #17
	mvn	lr, lr, lsr #17
	ldr	r0, [r3]
	ldrb	ip, [r3, #60]	@ zero_extendqisi2
	ldr	r6, [r3, #40]
	ldr	r2, .L72+4
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
	bhi	.L61
	mov	r5, #268
	ldr	r0, [r3, #24]
	add	r2, r2, r1
	sub	r4, r4, r0, lsl #1
	strh	r5, [r2, #4]	@ movhi
	str	r4, [r3, #4]
	sub	ip, lr, #1
.L66:
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L61:
	sub	ip, lr, #36
	cmp	ip, #33
	bhi	.L63
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
.L63:
	sub	ip, lr, #1
	cmp	ip, #33
	bhi	.L67
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
	bgt	.L66
	ldr	r2, [r3, #24]
	add	r4, r4, r2, lsl #1
	str	r4, [r3, #4]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L67:
	cmp	lr, #0
	movlt	r1, #0
	movlt	r2, #1
	movlt	ip, #84
	strlt	r1, [r3, #52]
	strlt	r2, [r3, #36]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	luffy
	.word	shadowOAM
	.size	luffyJumping, .-luffyJumping
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
	mov	r1, #1
	ldr	r3, .L76
	str	r6, [r3, #32]
	ldr	r6, .L76+4
	str	r1, [r3, #36]
	str	r1, [r3, #20]
	str	r1, [r6, #16]
	mov	r1, #32
	str	r1, [r6, #8]
	mov	r1, #16
	mov	r7, #7
	str	r1, [r6, #12]
	mov	r1, #8
	mov	r2, #0
	mov	lr, #2
	mvn	fp, #24
	mov	r10, #100
	mov	r9, #25
	mov	r8, #58
	mov	r5, #66
	mov	r4, #125
	mov	ip, #20
	mov	r0, #10
	strb	r1, [r6, #40]
	strb	r7, [r3, #48]
	ldr	r1, .L76+8
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r9, [r3, #12]
	str	r8, [r3, #8]
	str	r5, [r6]
	str	r4, [r6, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #40]
	str	r2, [r6, #28]
	str	lr, [r3, #24]
	str	lr, [r6, #24]
	str	ip, [r3, #44]
	str	ip, [r6, #36]
	str	r0, [r6, #20]
	str	r0, [r1]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	kaido
	.word	fireball
	.word	kaidoHealth
	.size	initKaido, .-initKaido
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
	mov	ip, #2
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7168
	ldr	r3, .L80
	push	{r4, lr}
	strh	ip, [r3]	@ movhi
	ldr	r4, .L80+4
	mov	r3, #512
	strh	r2, [r1]	@ movhi
	mov	r2, #117440512
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L80+8
	mov	lr, pc
	bx	r4
	bl	initLuffy
	bl	initKaido
	ldr	r2, .L80+12
	ldr	r3, .L80+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	state
	.word	DMANow
	.word	shadowOAM
	.word	rSeed
	.word	srand
	.size	goToKaido1, .-goToKaido1
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
	ldr	r6, .L93
	ldr	r3, [r6]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #128
	mvn	r3, r3, lsr #18
	ldr	r7, .L93+4
	ldr	r2, [r7]
	ldr	r0, [r6, #28]
	strh	r1, [r2, #30]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	ldr	r5, .L93+8
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
	bne	.L83
	ldr	r3, .L93+12
	ldr	r1, [r6, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r2, #29
	str	r1, [r6, #28]
.L84:
	mov	lr, #2
	mov	r9, #100
	mov	r8, #116
	mov	r0, #132
	ldr	r3, [r7, #4]
	ldr	ip, .L93+16
	add	r1, r3, #1
	str	r2, [r6, #32]
	lsl	r2, r1, #3
	lsl	r6, r3, #3
	strh	ip, [r5, r6]	@ movhi
	strh	ip, [r5, r2]	@ movhi
	ldr	r2, .L93+20
	ldr	r6, .L93+24
	ldr	ip, [r2]
	add	r2, r3, lr
	add	r3, r5, r3, lsl #3
	strh	r6, [r3, #4]	@ movhi
	strh	r9, [r3, #2]	@ movhi
	ldr	r3, .L93+28
	add	r1, r5, r1, lsl #3
	strh	r3, [r1, #4]	@ movhi
	strh	r8, [r1, #2]	@ movhi
	ldr	r1, .L93+32
	add	r3, r5, r2, lsl #3
	lsl	r6, r2, #3
	cmp	ip, #0
	strh	lr, [r5, r6]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ble	.L88
	mov	r6, #10
	mov	r3, #80
	add	ip, ip, r6
	lsl	ip, ip, #19
	ldr	lr, .L93+36
	lsr	ip, ip, #16
	add	r2, r5, r4
.L87:
	add	r0, r3, #8
	and	r1, r3, #504
	lsl	r3, r0, #16
	lsr	r3, r3, #16
	cmp	r3, ip
	strh	r6, [r2, #16]	@ movhi
	strh	lr, [r2, #20]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	add	r2, r2, #8
	bne	.L87
.L88:
	ldr	r0, .L93+8
	mov	ip, #72
	mov	r1, #10
	mov	r3, r0
	ldr	r2, .L93+40
	strh	ip, [r5, #178]	@ movhi
	strh	r1, [r5, #176]	@ movhi
	strh	r2, [r5, #180]	@ movhi
	ldr	ip, .L93+44
	add	r0, r0, #80
	rsb	lr, r3, #80
.L86:
	add	r2, lr, r3
	strh	r1, [r3, #184]	@ movhi
	strh	ip, [r3, #188]	@ movhi
	strh	r2, [r3, #186]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	bne	.L86
	mov	r0, #160
	ldr	r3, .L93+48
	ldr	r2, .L93+52
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L83:
	movlt	r2, #29
	subge	r2, r3, #1
	b	.L84
.L94:
	.align	2
.L93:
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
	ldr	r2, .L99
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
	ldr	r4, .L99+4
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
	ble	.L96
	mov	r0, #0
	ldr	r1, .L99+8
	ldr	ip, [r1, #8]
	ldr	r3, [r1]
	add	r3, r3, ip, lsl #1
	sub	r3, r3, #25
	str	r3, [r2]
	str	r0, [r2, #32]
	pop	{r4, r5, lr}
	bx	lr
.L96:
	ldr	r3, [r2, #16]
	add	lr, r3, lr
	str	lr, [r2]
	pop	{r4, r5, lr}
	bx	lr
.L100:
	.align	2
.L99:
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
	ldr	r3, .L103
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	sub	sp, sp, #16
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L103+4
	ldr	r4, .L103+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	luffy
	.word	fireball
	.word	collision
	.size	fireballCollision, .-fireballCollision
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
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
	ldr	r4, .L128
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L124
.L106:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L107
	ldr	r0, [r4, #28]
	ldr	r3, .L128+4
	ldr	r1, [r4, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #9
	str	r1, [r4, #28]
.L108:
	str	r3, [r4, #20]
	bl	fireballCollision
	cmp	r0, #0
	beq	.L110
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L125
.L110:
	ldr	r1, [r4, #36]
	cmp	r1, #0
	beq	.L126
.L112:
	blt	.L127
.L113:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	subeq	r1, r1, #1
	ldr	r0, .L128+8
	ldr	r3, .L128+12
	streq	r1, [r4, #36]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L125:
	mov	r0, #0
	ldr	r2, .L128+16
	ldr	r1, .L128+20
	ldr	ip, [r2, #8]
	ldr	r3, [r2]
	ldr	r2, [r1]
	add	r3, r3, ip, lsl #1
	sub	r2, r2, #1
	sub	r3, r3, #25
	cmp	r2, r0
	str	r3, [r4]
	str	r2, [r1]
	str	r0, [r4, #32]
	bne	.L110
	mov	r0, #8
	mov	r3, #67108864
	ldr	r1, .L128+24
	strh	r0, [r1]	@ movhi
	ldr	r1, [r4, #36]
	ldr	r2, .L128+28
	cmp	r1, #0
	strh	r2, [r3]	@ movhi
	bne	.L112
.L126:
	mov	r2, #1
	ldr	r3, .L128+32
	str	r2, [r4, #32]
.L123:
	mov	lr, pc
	bx	r3
	ldr	r1, .L128+36
	smull	r2, r3, r1, r0
	asr	r1, r0, #31
	rsb	r1, r1, r3, asr #5
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #4
	str	r1, [r4, #36]
	b	.L113
.L107:
	movlt	r3, #9
	subge	r3, r3, #1
	b	.L108
.L124:
	bl	shootFireball
	b	.L106
.L127:
	ldr	r3, .L128+32
	b	.L123
.L129:
	.align	2
.L128:
	.word	fireball
	.word	__aeabi_idivmod
	.word	.LC0
	.word	mgba_printf
	.word	kaido
	.word	luffyLives
	.word	state
	.word	1044
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
	ldr	r1, .L132
	ldr	r0, .L132+4
	ldr	ip, [r1, #12]
	sub	sp, sp, #16
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	ldr	lr, [r1, #8]
	str	ip, [sp, #12]
	ldm	r1, {r1, ip}
	stm	sp, {r1, ip, lr}
	ldr	r4, .L132+8
	ldm	r0, {r0, r1}
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
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
	ldr	r4, .L146
	ldr	lr, .L146+4
	ldr	r0, [r4]
	and	r6, r0, lr
	mvn	ip, r6, lsl #18
	mvn	ip, ip, lsr #18
	mov	r8, #227
	ldrb	r2, [r4, #60]	@ zero_extendqisi2
	ldr	r3, .L146+8
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
	beq	.L144
	cmp	ip, #19
	bgt	.L137
	add	r6, r2, #1
	lsl	r5, r0, #16
	add	r1, r1, #16
	lsl	r8, r6, #3
	lsr	r5, r5, #16
	and	r1, r1, #255
	strh	r1, [r3, r8]	@ movhi
	sub	r7, r5, #8
	ldr	r8, .L146+12
	add	r6, r3, r6, lsl #3
	and	r7, r7, lr
	cmp	ip, #17
	strh	r7, [r6, #2]	@ movhi
	strh	r8, [r6, #4]	@ movhi
	bgt	.L137
	add	r7, r2, #2
	lsl	r6, r7, #3
	sub	r9, r5, #12
	add	r7, r3, r7, lsl #3
	strh	r1, [r3, r6]	@ movhi
	and	r9, r9, lr
	ldr	r6, .L146+16
	strh	r8, [r7, #4]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	cmp	ip, #15
	sub	r7, r0, #12
	str	r7, [r6]
	bgt	.L137
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
	bgt	.L137
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
	bgt	.L137
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
	bgt	.L137
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
	bge	.L137
.L139:
	mov	r1, #22
	mov	r2, #0
	mov	r3, #1
	str	r1, [r4, #48]
	str	r2, [r4, #44]
	str	r3, [r4, #36]
.L137:
	bl	punchCollision
	ldr	r2, .L146+20
	ldr	r3, [r2]
	cmp	r3, #1
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	movne	r0, #0
	ldrne	r1, .L146+24
	ldreq	r3, .L146+24
	ldrne	r3, [r1]
	ldreq	r3, [r3]
	subne	r3, r3, #1
	strne	r3, [r1]
	strne	r0, [r2]
	cmp	r3, #0
	beq	.L145
.L142:
	ldr	r3, [r4, #48]
	sub	r3, r3, #1
	str	r3, [r4, #48]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L144:
	orr	r6, r6, #53248
	cmp	ip, #19
	strh	r6, [r5, #2]	@ movhi
	bgt	.L137
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
	ldr	r9, .L146+12
	strh	r1, [r3, r10]	@ movhi
	strh	r8, [r7, #2]	@ movhi
	add	r10, r0, #32
	ldr	r8, .L146+16
	add	r10, r10, r6
	cmp	ip, #17
	strh	r9, [r7, #4]	@ movhi
	str	r10, [r8]
	bgt	.L137
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
	bgt	.L137
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
	bgt	.L137
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
	bgt	.L137
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
	bgt	.L137
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
	blt	.L139
	b	.L137
.L145:
	mov	r2, #7
	mov	r1, #67108864
	ldr	ip, .L146+28
	ldr	r0, .L146+32
	ldr	r3, .L146+36
	strh	r2, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r1, [r3]
	ldr	r0, .L146+40
	ldr	r3, .L146+44
	mov	lr, pc
	bx	r3
	b	.L142
.L147:
	.align	2
.L146:
	.word	luffy
	.word	511
	.word	shadowOAM
	.word	290
	.word	luffyFist
	.word	luffyPunched
	.word	kaidoHealth
	.word	state
	.word	1044
	.word	BinksBrew_length
	.word	BinksBrew_data
	.word	playSong
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
	ldr	r7, .L194
	ldr	r4, .L194+4
	ldrh	r5, [r7]
	ldr	r2, .L194+8
	ldr	r3, [r4]
	tst	r5, #32
	str	r3, [r2]
	str	r1, [r4, #16]
	ldr	r2, [r4, #44]
	bne	.L149
	cmp	r2, r1
	bne	.L150
	cmp	r3, r1
	str	r2, [r4, #40]
	ldrgt	r2, [r4, #20]
	subgt	r3, r3, r2
	strgt	r3, [r4]
.L152:
	mov	r3, #1
	str	r3, [r4, #16]
.L153:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L158
	ldr	r3, [r4]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r1, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r1, r1, lsr #18
	mvn	r2, r2, lsr #17
	ldr	lr, [r4, #40]
	ldrb	r0, [r4, #60]	@ zero_extendqisi2
	ldr	r8, .L194+12
	cmp	lr, #1
	orreq	r3, r3, #53248
	add	ip, r8, r0, lsl #3
	lsl	r6, r0, #3
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [r8, r6]	@ movhi
	strheq	r3, [ip, #2]	@ movhi
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	orrs	r1, r3, r2
	beq	.L191
	cmp	r3, #0
	bne	.L159
	cmp	r2, #1
	beq	.L192
.L158:
	ldr	r6, .L194+16
	ldrh	r3, [r6]
	tst	r3, #1
	bne	.L171
.L189:
	tst	r3, #64
	bne	.L193
.L165:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L166
	ldr	r3, .L194+20
	ldr	r1, [r3]
	cmp	r1, #0
	bgt	.L168
.L170:
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L149:
	tst	r5, #16
	bne	.L154
	cmp	r2, #0
	bne	.L150
	mov	r1, #1
	ldr	r2, [r4, #8]
	rsb	r2, r2, #240
	cmp	r3, r2
	str	r1, [r4, #40]
	ldrlt	r2, [r4, #20]
	addlt	r3, r2, r3
	strlt	r3, [r4]
	b	.L152
.L154:
	cmp	r2, #0
	beq	.L153
.L150:
	ldr	r6, .L194+16
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L162
.L171:
	tst	r5, #1
	bne	.L161
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L161
	mov	r3, #1
	ldr	r2, .L194+24
	str	r3, [r4, #44]
	str	r3, [r2]
.L162:
	bl	luffyPunching
	b	.L188
.L161:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L162
.L188:
	ldrh	r3, [r6]
	tst	r3, #64
	beq	.L165
.L193:
	ldrh	r3, [r7]
	ands	r3, r3, #64
	bne	.L165
	mov	r2, #1
	str	r3, [r4, #44]
	str	r2, [r4, #52]
.L166:
	bl	luffyJumping
	ldr	r3, .L194+20
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L170
.L168:
	ldr	r3, [r4]
	add	r3, r3, #2
	lsl	r3, r3, #16
	ldr	lr, [r4, #4]
	add	r1, r1, r1, lsl #2
	lsr	r3, r3, #16
	add	r1, r3, r1, lsl #1
	lsl	r1, r1, #16
	sub	lr, lr, #10
	ldr	r2, .L194+28
	ldr	r6, .L194+32
	ldr	r5, .L194+36
	lsr	r1, r1, #16
	and	lr, lr, #255
.L169:
	add	ip, r3, #10
	and	r0, r3, r6
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r1, r3
	strh	lr, [r2]	@ movhi
	strh	r5, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L169
	b	.L170
.L191:
	mov	r2, #10
	ldr	r0, [r4, #32]
	ldr	r3, .L194+40
	str	r2, [r4, #36]
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r3, r8, r6
	ldr	r6, .L194+16
	lsl	r2, r1, #2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r6]
	tst	r3, #1
	str	r1, [r4, #32]
	beq	.L189
	b	.L171
.L159:
	movlt	r3, #10
	strlt	r3, [r4, #36]
	b	.L158
.L192:
	mov	r0, #10
	ldr	r3, [r4, #32]
	ldr	r2, .L194+44
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	add	r1, r2, #4
	add	r3, r8, r6
	lsl	r1, r1, #2
	str	r2, [r4, #32]
	strh	r1, [r3, #4]	@ movhi
	str	r0, [r4, #36]
	b	.L158
.L195:
	.align	2
.L194:
	.word	buttons
	.word	luffy
	.word	luffyFist
	.word	shadowOAM
	.word	oldButtons
	.word	luffyLives
	.word	luffyPunched
	.word	shadowOAM+280
	.word	511
	.word	1006
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
	ldr	r3, .L198
	mov	lr, pc
	bx	r3
	ldr	r4, .L198+4
	bl	luffyUpdate
	bl	kaidoUpdate
	bl	fireballUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L198+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L198+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L198+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L198+20
	ldr	r1, .L198+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L198+28
	ldr	r1, .L198+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L198+36
	ldr	r1, .L198+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L199:
	.align	2
.L198:
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
	ldr	r3, .L202
	ldr	r4, .L202+4
	mov	lr, pc
	bx	r3
	bl	luffyUpdate
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L202+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L202+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L202+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L202+20
	ldr	r1, .L202+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L202+28
	ldr	r1, .L202+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L202+36
	ldr	r1, .L202+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L203:
	.align	2
.L202:
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
	.size	kaido2, .-kaido2
	.global	SHADOW_OAM_AFF
	.comm	rSeed,4,4
	.global	kaidoWordOAMIndex
	.comm	luffyPunched,4,4
	.comm	kaidoHealth,4,4
	.comm	luffyLives,4,4
	.comm	shadowOAM,1024,4
	.comm	DIRECTION,1,1
	.comm	STATE,1,1
	.comm	soundEffect,28,4
	.comm	song,28,4
	.comm	fireball,44,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,64,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SHADOW_OAM_AFF, %object
	.size	SHADOW_OAM_AFF, 4
SHADOW_OAM_AFF:
	.word	shadowOAM
	.type	kaidoWordOAMIndex, %object
	.size	kaidoWordOAMIndex, 4
kaidoWordOAMIndex:
	.word	19
	.ident	"GCC: (devkitARM release 53) 9.1.0"
