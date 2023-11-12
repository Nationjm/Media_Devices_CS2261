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
	mov	r3, #0
	ldr	r2, .L26
	ldrh	r1, [r2, #2]
	tst	r1, #32
	push	{r4, lr}
	strh	r3, [r2, #8]	@ movhi
	beq	.L3
	ldr	r1, .L26+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #59
	movle	r3, r2
	str	r3, [r1]
.L3:
	ldr	r3, .L26
	ldrh	r3, [r3, #2]
	tst	r3, #64
	beq	.L7
	ldr	r2, .L26+8
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #99
	movgt	r3, #0
	str	r3, [r2]
.L7:
	ldr	r3, .L26
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L11
	ldr	r3, .L26+12
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L13
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L13
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L24
	ldr	r0, .L26+16
	ldr	r1, .L26+20
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L13:
	ldr	r3, .L26+24
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L11
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L11
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L25
	ldr	r0, .L26+16
	ldr	r1, .L26+20
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L11:
	mov	r1, #1
	ldr	r3, .L26
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L24:
	ldm	r3, {r0, r1}
	ldr	r3, .L26+28
	mov	lr, pc
	bx	r3
	b	.L13
.L25:
	ldm	r3, {r0, r1}
	ldr	r3, .L26+32
	mov	lr, pc
	bx	r3
	b	.L11
.L27:
	.align	2
.L26:
	.word	67109376
	.word	second
	.word	minute
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	goToOff
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOff, %function
goToOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	mov	ip, #4352
	mov	r3, #0
	push	{r4, lr}
	ldr	r2, .L30
	strh	ip, [r0]	@ movhi
	ldr	r1, .L30+4
	ldr	lr, .L30+8
	ldr	r0, .L30+12
	ldr	ip, .L30+16
	str	r3, [lr]
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L30+20
	strh	ip, [r1, #24]	@ movhi
	strh	r0, [r1, #32]	@ movhi
	strh	r0, [r1, #40]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	67109120
	.word	shadowOAM
	.word	state
	.word	545
	.word	546
	.word	stopSounds
	.size	goToOff, .-goToOff
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #5120
	ldr	r2, .L34+4
	ldr	r4, .L34+8
	strh	r3, [r5, #8]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	mov	r3, #16
	ldr	r2, .L34+12
	ldr	r1, .L34+16
	mov	lr, pc
	bx	r4
	mov	r3, #1840
	mov	r0, #3
	ldr	r2, .L34+20
	ldr	r1, .L34+24
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L34+28
	mov	lr, pc
	bx	r4
	mov	r3, #1424
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L34+36
	ldr	r1, .L34+40
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L34+44
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r1, .L34+48
	add	r2, r2, #512
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L34+52
	ldr	r1, .L34+56
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+60
	mov	lr, pc
	bx	r3
	mov	lr, #128
	mov	r10, #4
	mov	r9, #195
	mov	r8, #12
	mov	r7, #44
	mov	ip, #108
	mov	r1, #130
	mov	r2, #3
	mov	r0, #0
	mov	r4, #8
	mov	r6, #3328
	ldr	r3, .L34+64
	strh	lr, [r3]	@ movhi
	ldr	lr, .L34+68
	strh	lr, [r3, #2]	@ movhi
	sub	lr, lr, #38
	strh	lr, [r3, #10]	@ movhi
	add	lr, lr, #72
	strh	lr, [r3, #18]	@ movhi
	ldr	lr, .L34+72
	strh	r10, [r3, #4]	@ movhi
	strh	r9, [r3, #26]	@ movhi
	strh	r8, [r3, #28]	@ movhi
	strh	r7, [r3, #36]	@ movhi
	strh	lr, [r3, #24]	@ movhi
	strh	ip, [r3, #44]	@ movhi
	ldr	ip, .L34+76
	ldr	lr, .L34+80
	ldrh	ip, [ip, #48]
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, .L34+84
	strh	lr, [r3, #34]	@ movhi
	strh	r1, [r3, #60]	@ movhi
	sub	lr, lr, #95
	ldr	r1, .L34+88
	strh	lr, [r3, #42]	@ movhi
	ldr	lr, .L34+92
	strh	ip, [r1]	@ movhi
	ldr	r1, .L34+96
	ldr	ip, .L34+100
	strh	lr, [r3, #50]	@ movhi
	add	lr, lr, #204
	strh	r6, [r3, #52]	@ movhi
	strh	lr, [r3, #58]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	strh	r1, [r3, #32]	@ movhi
	strh	r1, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	strh	r0, [ip]	@ movhi
	ldr	r0, .L34+104
	mov	lr, pc
	bx	r0
	mov	r2, #1
	ldr	r3, .L34+108
	ldr	r1, .L34+112
	ldr	r0, .L34+116
	strh	r4, [r5, #4]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r0, [r1, #4092]
	b	goToOff
.L35:
	.align	2
.L34:
	.word	mgba_open
	.word	6148
	.word	DMANow
	.word	83886112
	.word	screenPal+32
	.word	100679680
	.word	screenTiles
	.word	gbaplayerPal
	.word	gbaplayerTiles
	.word	100704256
	.word	gbaplayerMap
	.word	2114
	.word	buttonsPal
	.word	100728832
	.word	buttonsTiles
	.word	hideSprites
	.word	shadowOAM
	.word	-32660
	.word	546
	.word	67109120
	.word	16543
	.word	3332
	.word	buttons
	.word	-32766
	.word	545
	.word	oldButtons
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	off
	.syntax unified
	.arm
	.fpu softvfp
	.type	off, %function
off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	bne	.L41
	ldr	r4, .L44+4
.L37:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #8
	ldr	r4, .L44+4
	bne	.L37
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L44+20
	str	r2, [r3]
	b	.L37
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	init
	.word	srand
	.word	state
	.size	off, .-off
	.align	2
	.global	goToOn
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOn, %function
goToOn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	ldr	r2, .L48+4
	ldr	r3, .L48+8
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L48+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	init
	.word	seed
	.word	srand
	.word	state
	.size	goToOn, .-goToOn
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d VBlank count | %d min : %d sec\000"
	.text
	.align	2
	.global	on
	.syntax unified
	.arm
	.fpu softvfp
	.type	on, %function
on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L51
	ldr	r3, .L57+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L51:
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+12
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1, #20]
	ldr	r0, .L57+24
	ldr	r4, .L57+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L56:
	bl	goToOff
	b	.L51
.L58:
	.align	2
.L57:
	.word	oldButtons
	.word	buttons
	.word	update
	.word	second
	.word	minute
	.word	soundA
	.word	.LC0
	.word	mgba_printf
	.word	draw
	.size	on, .-on
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
	push	{r4, r7, fp, lr}
	ldr	r4, .L109
	ldr	r3, .L109+4
	mov	r10, r4
	mov	lr, pc
	bx	r3
	ldr	r5, .L109+8
	ldr	r8, .L109+12
	ldr	r7, .L109+16
	ldr	r9, .L109+20
	ldr	r6, .L109+24
	ldr	fp, .L109+28
	b	.L74
.L108:
	cmp	r3, #1
	ldreq	r3, .L109+32
	moveq	lr, pc
	bxeq	r3
.L73:
	mov	lr, pc
	bx	r9
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r10
	mov	r0, #3
	ldr	ip, .L109+36
	mov	lr, pc
	bx	ip
.L74:
	ldrh	r2, [r5]
	strh	r2, [r8]	@ movhi
	ldrh	r3, [r6, #48]
	tst	r2, #1
	strh	r3, [r5]	@ movhi
	beq	.L60
	tst	r3, #1
	beq	.L61
.L60:
	tst	r2, #32
	beq	.L62
	tst	r3, #32
	beq	.L61
.L62:
	tst	r2, #16
	beq	.L63
	tst	r3, #16
	beq	.L61
.L63:
	tst	r2, #512
	beq	.L64
	tst	r3, #512
	beq	.L61
.L64:
	tst	r2, #256
	and	r2, r3, #256
	beq	.L65
	cmp	r2, #0
	bne	.L65
.L61:
	ldr	r3, .L109+40
	mov	r2, #0
	ldr	r1, [r3]
	mov	r0, fp
	ldr	r3, .L109+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	and	r2, r3, #256
.L65:
	tst	r3, #1
	movne	lr, #4
	moveq	lr, #132
	tst	r3, #32
	movne	ip, #0
	moveq	ip, #128
	tst	r3, #16
	movne	r0, #8
	moveq	r0, #136
	tst	r3, #512
	moveq	r1, #5
	movne	r1, #3
	cmp	r2, #0
	moveq	r2, #5
	movne	r2, #3
	ldr	r3, [r7]
	cmp	r3, #0
	strh	lr, [r4, #4]	@ movhi
	strh	ip, [r4, #12]	@ movhi
	strh	r0, [r4, #20]	@ movhi
	strh	r1, [r4, #48]	@ movhi
	strh	r2, [r4, #56]	@ movhi
	bne	.L108
	ldr	r3, .L109+48
	mov	lr, pc
	bx	r3
	b	.L73
.L110:
	.align	2
.L109:
	.word	shadowOAM
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	waitForVBlank
	.word	67109120
	.word	buttonpress_data
	.word	on
	.word	DMANow
	.word	buttonpress_length
	.word	playSoundB
	.word	off
	.size	main, .-main
	.text
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
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #8
	mov	ip, #67108864
	ldr	r3, .L113
	ldr	r1, .L113+4
	ldr	r0, .L113+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L114:
	.align	2
.L113:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	currentSong,4,4
	.comm	shuffle,4,4
	.comm	seed,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,60,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
