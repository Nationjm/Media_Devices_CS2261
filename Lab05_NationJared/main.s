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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	.ascii	"fall 2023\000"
	.align	2
.LC1:
	.ascii	"GAME BOY\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L7
	sub	sp, sp, #28
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	mov	r2, sp
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldm	r1, {r0, r1}
	mov	r6, r2
	stm	r2, {r0, r1}
	ldm	r3, {r0, r1, r2, r3}
	add	lr, sp, #8
	mov	r5, lr
	mov	r4, #72
	mov	ip, #71
	stm	lr, {r0, r1, r2, r3}
	ldr	r7, .L7+16
	b	.L3
.L6:
	ldrb	ip, [r6, #1]!	@ zero_extendqisi2
.L3:
	mov	r0, r4
	mov	r2, ip
	mov	r1, #70
	ldrh	r3, [r5], #2
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #168
	bne	.L6
	mov	r1, #96
	mov	r0, #84
	ldr	r3, .L7+20
	ldr	r2, .L7+24
	ldr	r4, .L7+28
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L7+32
	ldr	r2, .L7+36
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	28274
	.word	fillScreen
	.word	.LC1
	.word	.LANCHOR0
	.word	drawChar
	.word	15855
	.word	.LC2
	.word	drawString
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #2
	mvn	ip, #170
	mov	r2, #0
	ldr	r0, .L10
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L10+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L10+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L10+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"score: \000"
	.text
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L14
	ldr	r3, .L14+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L14+8
	ldr	r3, .L14+12
	ldr	r2, .L14+16
	mov	r1, #1
	mov	r0, #180
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L14+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	21951
	.word	.LC3
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L23
	ldr	r3, [r4]
	ldr	r2, .L23+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L23+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L23+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
.L16:
	pop	{r4, lr}
	bx	lr
.L22:
	ldr	r0, [r4]
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"got too stressed?\000"
	.align	2
.LC5:
	.ascii	"you're paused now!\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L27
	ldr	r0, .L27+4
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #136
	ldr	r2, .L27+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L27+20
	mov	r1, #18
	mov	r0, #130
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L27+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L41
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L39:
	pop	{r4, lr}
	b	goToGame
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"omg you won!!!\000"
	.align	2
.LC7:
	.ascii	"press start to play again\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L45
	ldr	r0, .L45+4
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #154
	ldr	r2, .L45+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L45+20
	mov	r1, #18
	mov	r0, #88
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L45+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L54
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L54+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L47:
	pop	{r4, lr}
	bx	lr
.L53:
	pop	{r4, lr}
	b	goToStart
.L55:
	.align	2
.L54:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"you lost :(\000"
	.align	2
.LC9:
	.ascii	"better luck next time <3\000"
	.align	2
.LC10:
	.ascii	"press start to try again\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L58
	ldr	r0, .L58+4
	ldr	r3, .L58+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L58+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #172
	ldr	r2, .L58+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #18
	mov	r0, #94
	ldr	r2, .L58+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L58+24
	mov	r1, #28
	mov	r0, #94
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L58+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC11:
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
	push	{r4, r5, lr}
	ldr	r4, .L71
	sub	sp, sp, #12
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L71+8
	ldr	r3, .L71+12
	ldr	r0, .L71+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L71+24
	mov	r3, #8
	mov	r1, #1
	mov	r0, #220
	str	r2, [sp]
	ldr	r5, .L71+28
	mov	r2, #12
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r0, #220
	ldr	r3, .L71+32
	ldr	r2, .L71+16
	ldr	r5, .L71+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L71+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L71+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L61:
	ldr	r3, [r4]
	cmn	r3, #1
	beq	.L69
.L62:
	cmp	r3, #30
	beq	.L70
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L70:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L69:
	bl	goToLose
	ldr	r3, [r4]
	b	.L62
.L68:
	bl	goToPause
	b	.L61
.L72:
	.align	2
.L71:
	.word	score
	.word	updateGame
	.word	.LC11
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	31676
	.word	drawRect
	.word	28274
	.word	drawString
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	mov	r3, #67108864
	mvn	r0, #170
	mov	r1, #2
	mov	r2, #0
	ldr	ip, .L84
	push	{r4, r7, fp, lr}
	strh	ip, [r3]	@ movhi
	ldr	r4, .L84+4
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L84+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L84+12
	ldr	r3, .L84+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L84+20
	ldr	r10, .L84+24
	ldr	r9, .L84+28
	ldr	r8, .L84+32
	ldr	r7, .L84+36
.L74:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L75:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L75
.L77:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L76
	.word	.L76
.L76:
	mov	lr, pc
	bx	r7
	b	.L74
.L78:
	mov	lr, pc
	bx	r8
	b	.L74
.L79:
	mov	lr, pc
	bx	r9
	b	.L74
.L80:
	mov	lr, pc
	bx	r10
	b	.L74
.L85:
	.align	2
.L84:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	b	win
	.size	lose, .-lose
	.comm	rSeed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	31
	.short	511
	.short	1023
	.short	992
	.short	31744
	.short	32736
	.short	16896
	.short	31775
	.ident	"GCC: (devkitARM release 53) 9.1.0"
