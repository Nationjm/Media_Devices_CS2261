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
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L34
	ldrh	r1, [r3, #2]
	tst	r1, #2
	strh	r2, [r3, #8]	@ movhi
	bne	.L32
	ldrh	r3, [r3, #2]
	tst	r3, #8
	str	lr, [sp, #-4]!
	beq	.L5
	ldr	r2, .L34+4
	ldr	r3, [r2]
	subs	r1, r3, #1
	addmi	r3, r3, #99
	strmi	r3, [r2]
	strpl	r1, [r2]
	mov	r2, #8
	ldr	r3, .L34
	strh	r2, [r3, #2]	@ movhi
.L5:
	ldr	r3, .L34
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L8
	ldr	r2, .L34+8
	ldr	r3, [r2]
	subs	r1, r3, #1
	strpl	r1, [r2]
	ldr	r1, .L34+12
	addmi	r3, r3, #59
	strmi	r3, [r2]
	ldr	r3, [r1]
	cmp	r3, #0
	blt	.L33
	cmp	r3, #9
	bgt	.L13
	ldr	r3, .L34+16
	ldr	r2, .L34+20
	strh	r2, [r3]	@ movhi
.L12:
	mov	r2, #16
	ldr	r3, .L34
	strh	r2, [r3, #2]	@ movhi
.L8:
	ldr	r3, .L34
	ldrh	r2, [r3, #2]
	tst	r2, #32
	beq	.L15
	mov	r0, #32
	ldr	r1, .L34+12
	ldr	r2, [r1]
	sub	r2, r2, #1
	str	r2, [r1]
	strh	r0, [r3, #2]	@ movhi
.L15:
	mov	r2, #1
	ldr	r3, .L34
	ldr	lr, [sp], #4
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L32:
	ldrh	r2, [r3, #-208]
	ldr	r3, .L34+16
	tst	r2, #8
	ldrh	r2, [r3]
	bne	.L3
	mov	r3, #67108864
	ldrh	r3, [r3, #6]
	tst	r3, #16
	eorne	r2, r2, #32512
	eorne	r2, r2, #255
.L3:
	mov	ip, #83886080
	mov	r0, #2
	mov	r1, #1
	ldr	r3, .L34
	strh	r2, [ip]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L33:
	mov	r3, #0
	mov	ip, #31
	str	r3, [r1]
	ldr	lr, .L34+4
	ldr	r1, .L34+24
	ldr	r0, .L34+16
	str	r3, [r2]
	str	r3, [lr]
	strh	ip, [r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	b	.L12
.L13:
	cmp	r3, #29
	ldrle	r3, .L34+16
	ldrle	r2, .L34+28
	strhle	r2, [r3]	@ movhi
	ble	.L12
.L14:
	ldr	r3, .L34+32
	ldr	r3, [r3]
	ldr	r2, .L34+36
	rsb	r3, r3, r3, lsl #5
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	rsb	r3, r3, r2, asr #5
	ldr	r2, .L34+16
	orr	r3, r3, #640
	strh	r3, [r2]	@ movhi
	b	.L12
.L35:
	.align	2
.L34:
	.word	67109376
	.word	time_cs
	.word	time_s
	.word	time_m
	.word	.LANCHOR0
	.word	671
	.word	67109120
	.word	665
	.word	percent_complete
	.word	1374389535
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	displayTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	displayTime, %function
displayTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L43
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r3]
	ldr	r4, .L43+4
	smull	r1, r2, r4, r3
	ldr	r1, .L43+8
	ldr	r8, [r1]
	smull	r0, r1, r4, r8
	mov	r6, #136
	asr	r0, r3, #31
	rsb	r0, r0, r2, asr #2
	asr	r2, r8, #31
	rsb	r2, r2, r1, asr #2
	ldr	r1, .L43+12
	ldr	lr, [r1]
	smull	r1, r4, lr, r4
	lsl	ip, r0, #16
	ldr	r1, .L43+16
	add	r5, r0, r0, lsl #2
	asr	ip, ip, #16
	sub	r0, r3, r5, lsl #1
	add	r3, r1, ip, lsl #1
	ldrh	r10, [r3, #4]
	asr	r5, lr, #31
	ldr	r3, .L43+20
	rsb	r4, r5, r4, asr #2
	strh	r6, [r3, #20]	@ movhi
	lsl	r6, r4, #16
	strh	r10, [r3, #28]	@ movhi
	asr	r6, r6, #16
	add	r4, r4, r4, lsl #2
	add	r6, r1, r6, lsl #1
	ldrh	r6, [r6, #4]
	add	r9, r2, r2, lsl #2
	lsl	r5, r2, #16
	sub	lr, lr, r4, lsl #1
	ldr	r2, .L43+24
	add	lr, r1, lr, lsl #1
	ldrh	r4, [lr, #4]
	strh	r2, [r3, #2]	@ movhi
	strh	r6, [r3, #4]	@ movhi
	add	r2, r1, r0, lsl #1
	ldrh	lr, [r2, #4]
	strh	lr, [r3, #36]	@ movhi
	ldr	lr, .L43+28
	cmp	r8, #49
	strh	lr, [r3, #18]	@ movhi
	add	lr, lr, #560
	strh	lr, [r3, #34]	@ movhi
	ldrhle	lr, [r3, #62]
	suble	lr, lr, #8
	lslle	lr, lr, #16
	movgt	lr, #256
	lsrle	lr, lr, #16
	cmp	r0, #0
	mov	r7, #320
	movne	r0, #256
	strh	r4, [r3, #12]	@ movhi
	ldr	r4, .L43+32
	ldr	r2, .L43+36
	strh	r4, [r3, #16]	@ movhi
	add	r4, r4, #792
	strh	r2, [r3, #10]	@ movhi
	strh	r4, [r3, #26]	@ movhi
	strh	r7, [r3]	@ movhi
	strh	r7, [r3, #8]	@ movhi
	strh	r7, [r3, #24]	@ movhi
	strh	r7, [r3, #32]	@ movhi
	strh	lr, [r3, #62]	@ movhi
	strhne	r0, [r3, #94]	@ movhi
	sub	r2, r8, r9, lsl #1
	asr	r5, r5, #16
	bne	.L40
	ldrh	r0, [r3, #94]
	cmp	ip, #0
	sub	r0, r0, #2
	strh	r0, [r3, #94]	@ movhi
	movne	r0, #256
	ldrheq	r0, [r3, #126]
	subeq	r0, r0, #2
	lsleq	r0, r0, #16
	lsreq	r0, r0, #16
.L40:
	mov	r6, #138
	mov	ip, #320
	add	r5, r1, r5, lsl #1
	add	r2, r1, r2, lsl #1
	ldrh	r2, [r2, #4]
	ldrh	r1, [r5, #4]
	ldr	r4, .L43+32
	ldr	lr, .L43+40
	strh	r1, [r3, #52]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	ldr	r1, .L43+44
	ldr	r2, .L43+48
	strh	r6, [r3, #44]	@ movhi
	strh	r4, [r3, #40]	@ movhi
	strh	lr, [r3, #42]	@ movhi
	strh	r0, [r3, #126]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	strh	ip, [r3, #56]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r2, [r3, #58]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	time_s
	.word	1717986919
	.word	time_cs
	.word	time_m
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32760
	.word	-32696
	.word	-32448
	.word	-31192
	.word	-32616
	.word	-32600
	.word	-32568
	.size	displayTime, .-displayTime
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mvn	r5, #163
	mov	r1, #195
	mov	r4, #194
	mvn	lr, #59
	mov	ip, #196
	ldr	r3, .L47
	ldr	r0, .L47+4
	strh	r2, [r3, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldrh	r1, [r0]
	orr	r1, r1, #56
	strh	r2, [r3, #6]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	67109120
	.word	67109376
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	enableHBlankInterrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableHBlankInterrupt, %function
enableHBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	ldr	r1, .L50
	ldrh	r2, [r0, #4]
	ldrh	r3, [r1]
	orr	r2, r2, #16
	orr	r3, r3, #2
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
.L51:
	.align	2
.L50:
	.word	67109376
	.size	enableHBlankInterrupt, .-enableHBlankInterrupt
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mvn	r6, #163
	mov	r0, #195
	mov	r7, #1
	mov	ip, #67108864
	mov	r5, #194
	mvn	r4, #59
	mov	lr, #196
	ldr	r3, .L54
	ldr	r1, .L54+4
	strh	r2, [r3, #2]	@ movhi
	strh	r7, [r1, #8]	@ movhi
	strh	r6, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	ldrh	r0, [ip, #4]
	orr	r0, r0, #16
	strh	r2, [r3, #6]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	ldrh	r0, [r1]
	orr	r0, r0, #58
	strh	r2, [r3, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r1, .L54+8
	ldr	r0, .L54+12
	strh	r5, [r3, #6]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	str	r0, [r1, #4092]
	strh	r4, [r3, #8]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	__aeabi_idiv
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
	mov	r8, #256
	mov	r2, #4352
	mov	r3, #67108864
	ldr	r4, .L59
	push	{r7, lr}
	strh	r2, [r3]	@ movhi
	ldr	r3, .L59+4
	strh	r8, [r4, #6]	@ movhi
	strh	r8, [r4, #30]	@ movhi
	strh	r8, [r4, #38]	@ movhi
	strh	r8, [r4, #62]	@ movhi
	strh	r8, [r4, #70]	@ movhi
	strh	r8, [r4, #94]	@ movhi
	strh	r8, [r4, #102]	@ movhi
	strh	r8, [r4, #126]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #74
	mov	ip, #59
	mov	r1, #99
	ldr	r7, .L59+8
	ldr	r6, .L59+12
	ldr	r0, .L59+16
	ldr	r2, .L59+20
	str	r3, [r7]
	str	r3, [r6]
	ldr	r3, .L59+24
	str	ip, [r0]
	str	r1, [r2]
	ldr	r5, .L59+28
	mov	lr, pc
	bx	r3
	mov	r3, r8
	mov	r0, #3
	ldr	r2, .L59+32
	ldr	r1, .L59+36
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L59+40
	mov	r0, #3
	ldr	r1, .L59+44
	mov	lr, pc
	bx	r5
	mov	r3, #83886080
	ldr	r2, .L59+48
	ldrh	r2, [r2]
	ldr	r10, .L59+52
	strh	r2, [r3]	@ movhi
	ldr	r9, .L59+56
	ldr	r8, .L59+60
.L57:
	ldr	r1, [r6]
	ldr	r0, [r7]
	sub	r0, r1, r0
	add	r0, r0, r0, lsl #2
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r9
	str	r0, [r10]
	mov	lr, pc
	bx	r8
	.syntax divided
@ 195 "main.c" 1
	swi 0x02 << 16
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, #80
	mov	r1, r4
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L57
.L60:
	.align	2
.L59:
	.word	shadowOAM
	.word	hideSprites
	.word	time_m
	.word	initial_time_m
	.word	time_s
	.word	time_cs
	.word	setupInterrupts
	.word	DMANow
	.word	83886592
	.word	digitsPal
	.word	100728832
	.word	digitsTiles
	.word	.LANCHOR0
	.word	percent_complete
	.word	__aeabi_idiv
	.word	displayTime
	.size	main, .-main
	.global	digit_to_sprite_tile_index
	.global	pal0_color
	.comm	percent_complete,4,4
	.comm	striping_mode,4,4
	.comm	initial_time_m,4,4
	.comm	time_cs,4,4
	.comm	time_s,4,4
	.comm	time_m,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pal0_color, %object
	.size	pal0_color, 2
pal0_color:
	.short	640
	.space	2
	.type	digit_to_sprite_tile_index, %object
	.size	digit_to_sprite_tile_index, 20
digit_to_sprite_tile_index:
	.short	132
	.short	0
	.short	4
	.short	8
	.short	12
	.short	16
	.short	20
	.short	24
	.short	28
	.short	128
	.ident	"GCC: (devkitARM release 53) 9.1.0"
