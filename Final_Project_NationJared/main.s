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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
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
	ldr	r4, .L57
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L57+8
	ldrh	r3, [r4]
	ldr	r10, .L57+12
	ldr	r5, .L57+16
	ldr	r9, .L57+20
	ldr	fp, .L57+24
	ldr	r8, .L57+28
	ldr	r7, .L57+32
.L40:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r8, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r10
	mov	r0, r7
	ldr	r1, [r5]
	mov	lr, pc
	bx	r9
	ldr	r3, [r5]
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L41
.L33:
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L41
	.word	.L41
	.word	.L35
	.word	.L34
	.word	.L32
.L34:
	ldr	r3, .L57+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	bne	.L49
.L41:
	ldrh	r3, [r4]
	b	.L40
.L32:
	ldr	r3, .L57+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L41
.L49:
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L40
	ldr	r3, .L57+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L40
.L35:
	ldr	r3, .L57+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L41
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L40
	ldr	r3, .L57+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L40
.L36:
	ldr	r3, .L57+56
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	fp
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L41
	ldrh	r3, [r4]
	tst	r3, #4
	bne	.L40
	ldr	r3, .L57+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L40
.L38:
	ldr	r3, .L57+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L41
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L40
	ldr	r3, .L57+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L40
.L37:
	ldr	r3, .L57+76
	mov	lr, pc
	bx	r3
	ldrh	r2, [r6]
	tst	r2, #4
	ldrh	r3, [r4]
	beq	.L46
	tst	r3, #4
	beq	.L56
.L46:
	tst	r2, #256
	beq	.L40
	tst	r3, #768
	bne	.L40
	mov	lr, pc
	bx	fp
	ldrh	r3, [r4]
	b	.L40
.L39:
	ldr	r3, .L57+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L41
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L40
	ldr	r3, .L57+84
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L40
.L56:
	ldr	r3, .L57+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	ldrh	r2, [r6]
	b	.L46
.L58:
	.align	2
.L57:
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	waitForVBlank
	.word	state
	.word	mgba_printf
	.word	gearFive
	.word	67109120
	.word	.LC0
	.word	win
	.word	lose
	.word	goToStart
	.word	pause
	.word	goToKaido1
	.word	kaido2
	.word	goToPause
	.word	instructions
	.word	initLuffy
	.word	initKaido
	.word	kaido1
	.word	start
	.word	goToInstructions
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
	ldr	r3, .L61
	ldr	r1, .L61+4
	ldr	r0, .L61+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L62:
	.align	2
.L61:
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
	.comm	luffy,68,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
