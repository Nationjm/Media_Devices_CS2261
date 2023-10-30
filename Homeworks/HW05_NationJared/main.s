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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7168
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #16384
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r0, #16
	mov	r2, #0
	mov	lr, #2
	mov	r1, #1
	mov	r4, #100
	mov	ip, #10
	ldr	r3, .L4+32
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	ldr	r0, .L4+36
	str	r4, [r3]
	str	lr, [r3, #40]
	str	ip, [r3, #24]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	strb	r2, [r3, #44]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	mov	lr, pc
	bx	r0
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	100728832
	.word	BubbleBobbleSpritesheetTiles
	.word	83886592
	.word	BubbleBobbleSpritesheetPal
	.word	player
	.word	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L23
	ldr	ip, .L23+4
	ldr	r1, [r3, #4]
	ldrh	ip, [ip, #48]
	ldr	r0, [r3, #20]
	tst	ip, #32
	add	r0, r1, r0
	push	{r4, r5, lr}
	sub	ip, r0, #1
	str	r2, [r3, #32]
	ldr	r0, [r3]
	ldr	r4, [r3, #16]
	bne	.L17
	ldr	r2, .L23+8
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	add	lr, r0, r1, lsl #8
	ldrb	lr, [lr, r2]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L22
.L17:
	mov	r2, r0
.L7:
	ldr	lr, .L23+4
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L21
	ldr	lr, .L23+8
	add	r0, r4, r0
	sub	r0, r0, #1
	lsl	lr, lr, #16
	add	r5, r0, r1, lsl #8
	lsr	lr, lr, #16
	ldrb	r5, [r5, lr]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L11
.L21:
	ldr	r0, [r3, #28]
	cmp	r0, #1
	ldr	lr, .L23+12
	movne	lr, #576
	ldr	r0, .L23+16
	ldrb	ip, [r3, #44]	@ zero_extendqisi2
	ldr	r4, [r3, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	add	r1, r1, r4
	orr	r2, r2, #16384
	add	r4, r0, ip, lsl #3
	strh	r2, [r4, #2]	@ movhi
	lsl	ip, ip, #3
	and	r2, r1, #255
	strh	r2, [r0, ip]	@ movhi
	add	r0, r0, ip
	strh	lr, [r0, #4]	@ movhi
	str	r1, [r3, #4]
	pop	{r4, r5, lr}
	bx	lr
.L11:
	add	r0, r0, ip, lsl #8
	ldrb	r0, [r0, lr]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L21
	rsb	r4, r4, #240
	cmp	r4, r2
	mov	r4, #1
	ldrgt	r0, [r3, #8]
	addgt	r2, r2, r0
	ldrb	ip, [r3, #44]	@ zero_extendqisi2
	ldr	r0, .L23+16
	ldr	lr, [r3, #12]
	strgt	r2, [r3]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	add	r1, r1, lr
	orr	r2, r2, #16384
	add	lr, r0, ip, lsl #3
	strh	r2, [lr, #2]	@ movhi
	lsl	ip, ip, #3
	ldr	lr, .L23+12
	and	r2, r1, #255
	strh	r2, [r0, ip]	@ movhi
	add	r0, r0, ip
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	strh	lr, [r0, #4]	@ movhi
	str	r1, [r3, #4]
	pop	{r4, r5, lr}
	bx	lr
.L22:
	add	lr, r0, ip, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L17
	mov	r5, #0
	mov	lr, #1
	cmp	r0, #0
	ldrgt	r2, [r3, #8]
	subgt	r2, r0, r2
	movle	r2, r0
	strgt	r2, [r3]
	str	r5, [r3, #28]
	str	lr, [r3, #32]
	b	.L7
.L24:
	.align	2
.L23:
	.word	player
	.word	67109120
	.word	Level1CollisionBitmapBitmap
	.word	578
	.word	shadowOAM
	.size	update, .-update
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
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r6, .L53+4
	ldr	r5, .L53+8
	ldr	fp, .L53+12
	ldr	r10, .L53+16
	ldr	r4, .L53+20
	ldr	r7, .L53+24
	ldr	r9, .L53+28
	ldr	r8, .L53+32
.L27:
	ldrh	r3, [r5]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r7, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r10
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r9
	mov	r0, #3
	ldr	ip, .L53+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L53+40
	mov	r0, r8
	ldr	r1, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L27
.L29:
	.word	.L34
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L30
	.word	.L28
.L28:
	ldr	r3, .L53+44
	mov	lr, pc
	bx	r3
	b	.L27
.L30:
	ldr	r3, .L53+48
	mov	lr, pc
	bx	r3
	b	.L27
.L31:
	ldr	r3, .L53+52
	mov	lr, pc
	bx	r3
	b	.L27
.L32:
	ldr	r3, .L53+56
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L27
	ldrh	r3, [r7, #48]
	tst	r3, #4
	bne	.L27
	ldr	r3, .L53+60
	mov	lr, pc
	bx	r3
	b	.L27
.L33:
	ldr	r3, .L53+64
	mov	lr, pc
	bx	r3
	b	.L27
.L34:
	ldr	r3, .L53+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L35
	ldrh	r2, [r7, #48]
	tst	r2, #8
	bne	.L35
.L36:
	ldr	r3, .L53+72
	mov	lr, pc
	bx	r3
	b	.L27
.L35:
	tst	r3, #1
	beq	.L27
	ldrh	r3, [r7, #48]
	tst	r3, #1
	bne	.L27
	b	.L36
.L54:
	.align	2
.L53:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	update
	.word	state
	.word	67109120
	.word	shadowOAM
	.word	.LC0
	.word	DMANow
	.word	mgba_printf
	.word	lose
	.word	win
	.word	game2
	.word	game1
	.word	goToGame2
	.word	pause
	.word	start
	.word	goToGame1
	.size	main, .-main
	.text
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L57
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	DMANow
	.word	shadowOAM
	.size	draw, .-draw
	.global	hOff
	.global	vOff
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	STATE,1,1
	.data
	.align	2
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	2
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
