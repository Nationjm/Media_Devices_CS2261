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
	ldr	r3, .L23
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r4, .L23+4
	ldr	r3, [r4, #8]
	cmp	r3, r2
	beq	.L5
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	blt	.L6
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L19
	ldr	r1, .L23+8
	ldr	r2, .L23+12
	ldr	r1, [r1]
	str	r3, [r4, #8]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L6:
	ldr	r3, .L23+16
	ldr	r2, [r4, #20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L20
.L5:
	ldr	r3, .L23+20
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
.L22:
	ldr	r2, [r3, #24]
	ldr	r1, [r3, #16]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #24]
	blt	.L10
	mov	r2, #0
	ldr	r0, .L23+8
	ldr	r1, .L23+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L10:
	ldr	r3, .L23+16
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L21
.L3:
	mov	r1, #1
	ldr	r3, .L23
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L21:
	ldr	r3, .L23+24
	mov	lr, pc
	bx	r3
	b	.L3
.L20:
	ldr	r3, .L23+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+20
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	b	.L22
.L19:
	mov	r2, #7
	ldm	r4, {r0, r1}
	ldr	r3, .L23+32
	mov	lr, pc
	bx	r3
	b	.L6
.L24:
	.align	2
.L23:
	.word	67109376
	.word	song
	.word	dma
	.word	67109120
	.word	state
	.word	soundEffect
	.word	stopSoundEffect
	.word	stopSong
	.word	playSong
	.size	interruptHandler, .-interruptHandler
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	mov	r4, #0
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r2, .L27+4
	ldr	r3, .L27+8
	strh	r2, [r5]	@ movhi
	ldr	r1, .L27+12
	ldrh	r0, [r3, #48]
	ldr	r2, .L27+16
	ldr	r3, .L27+20
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r2, #1
	ldr	r3, .L27+24
	ldr	r0, .L27+28
	ldr	ip, .L27+32
	strh	r1, [r5, #4]	@ movhi
	ldr	r1, .L27+36
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L27+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	mgba_open
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	state
	.word	goToStart
	.size	initialize, .-initialize
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
	ldr	r4, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L58+8
	ldrh	r3, [r4]
	ldr	r8, .L58+12
	ldr	r7, .L58+16
	ldr	fp, .L58+20
	ldr	r10, .L58+24
	ldr	r9, .L58+28
	ldr	r6, .L58+32
.L39:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L40
.L33:
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L40
	.word	.L40
	.word	.L40
	.word	.L35
	.word	.L34
	.word	.L32
.L34:
	ldr	r3, .L58+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L47
.L40:
	ldrh	r3, [r4]
	b	.L39
.L32:
	ldr	r3, .L58+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L40
.L47:
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L39
	ldr	r3, .L58+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L35:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L40
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L39
	ldr	r3, .L58+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L36:
	ldr	r3, .L58+52
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L45
	tst	r3, #4
	beq	.L57
.L45:
	tst	r2, #512
	beq	.L39
	tst	r2, #256
	beq	.L39
	tst	r3, #768
	bne	.L39
	ldr	r3, .L58+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L37:
	mov	lr, pc
	bx	r10
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L40
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L39
	ldr	r3, .L58+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L38:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L40
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L39
	ldr	r3, .L58+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L57:
	ldr	r3, .L58+72
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	ldrh	r3, [r4]
	b	.L45
.L59:
	.align	2
.L58:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	state
	.word	start
	.word	instructions
	.word	pause
	.word	67109120
	.word	win
	.word	lose
	.word	goToStart
	.word	goToKaido1
	.word	kaido1
	.word	gearFive
	.word	initLuffy
	.word	initKaido
	.word	goToInstructions
	.word	goToPause
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
	ldr	r3, .L62
	ldr	r1, .L62+4
	ldr	r0, .L62+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L63:
	.align	2
.L62:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	state,4,4
	.comm	STATE,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	soundEffect,28,4
	.comm	song,28,4
	.comm	fireball,44,4
	.comm	kaido,52,4
	.comm	luffyFist,20,4
	.comm	luffy,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
