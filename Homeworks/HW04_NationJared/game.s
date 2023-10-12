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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L6
	sub	sp, sp, #28
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	ldr	r0, .L6+4
	str	r3, [ip]
	add	r3, sp, #24
	sub	r0, r0, r3
	add	ip, sp, #22
	add	r3, sp, #2
.L2:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L2
	add	sp, sp, #28
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.word	83886594
	.size	initGame, .-initGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Press Start To Begin\000"
	.text
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
	mov	r0, #255
	ldr	r3, .L10
	mov	lr, pc
	bx	r3
	ldr	r4, .L10+4
	mov	r3, #0
	mov	r1, #70
	mov	r0, #60
	ldr	r2, .L10+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.size	start, .-start
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
	@ link register save eliminated.
	bx	lr
	.size	game, .-game
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
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	32767
	.short	15855
	.short	31
	.short	992
	.short	31744
	.short	32736
	.short	31775
	.short	1023
	.short	671
	.ident	"GCC: (devkitARM release 53) 9.1.0"
