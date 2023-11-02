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
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	BubbleBobbleTitlePal
	.word	4176
	.word	BubbleBobbleTitleTiles
	.word	100720640
	.word	BubbleBobbleTitleMap
	.size	start, .-start
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16384
	ldr	r4, .L8
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L8+16
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	LevelTilesTiles
	.word	100720640
	.word	Level1MapMap
	.word	LevelTilesPal
	.word	updatePlayer
	.word	updateEnemy1
	.word	updateEnemy2
	.word	updateEnemy3
	.word	updateEnemy4
	.word	updateEnemy5
	.word	updateEnemy6
	.word	updateBubble
	.size	game1, .-game1
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, lr}
	beq	.L13
.L11:
	ldr	r2, .L14
	ldr	r1, .L14+4
	mov	r3, #2048
	mov	r0, #3
	ldr	r4, .L14+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L14+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	ldr	r3, .L14+44
	mov	lr, pc
	bx	r3
	b	.L11
.L15:
	.align	2
.L14:
	.word	100720640
	.word	Level2MapMap
	.word	DMANow
	.word	updatePlayer
	.word	updateEnemy1
	.word	updateEnemy2
	.word	updateEnemy3
	.word	updateEnemy4
	.word	updateEnemy5
	.word	updateEnemy6
	.word	updateBubble
	.word	initGame2
	.size	game2, .-game2
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
	push	{r4, lr}
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	mov	r3, #192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L19+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L19+16
	ldr	r1, .L19+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	hideSprites
	.word	DMANow
	.word	WinStatePal
	.word	WinStateTiles
	.word	100720640
	.word	WinStateMap
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
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+8
	mov	lr, pc
	bx	r4
	mov	r3, #128
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L23+16
	ldr	r1, .L23+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	hideSprites
	.word	DMANow
	.word	LoseStatePal
	.word	LoseStateTiles
	.word	100720640
	.word	LoseStateMap
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
	ldr	r3, .L26
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r2, #1
	ldr	r3, .L29
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L32
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
	.word	state
	.size	goToGame1, .-goToGame1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L35
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	state
	.size	goToGame2, .-goToGame2
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
	mov	r2, #4
	ldr	r3, .L38
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	state
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
	mov	r2, #5
	ldr	r3, .L41
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	state
	.size	goToLose, .-goToLose
	.comm	STATE,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
