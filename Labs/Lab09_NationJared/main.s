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
	push	{r4, r5, r6, lr}
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
	mov	r1, #56320
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #2016
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	mov	r6, #16
	mov	r5, #21
	mov	r4, #200
	mov	lr, #150
	mov	r2, #1
	mov	ip, #3
	mov	r0, #0
	mov	r1, #10
	ldr	r3, .L4+48
	stm	r3, {r4, lr}
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	ip, [r3, #40]
	str	r0, [r3, #24]
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	littleroot_townTiles
	.word	100720640
	.word	littleroot_townMap
	.word	littleroot_townPal
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	player
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
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
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .L61
	ldr	r4, .L61+4
	ldrh	r0, [r2]
	ldr	r5, [r4]
	ldr	lr, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r6, [r4, #20]
	add	ip, lr, r5
	add	r2, r6, r3
	tst	r0, #64
	str	r1, [r4, #28]
	sub	ip, ip, #1
	sub	r2, r2, #1
	bne	.L7
	ldr	r1, .L61+8
	add	r7, r5, r3, lsl #9
	ldrb	r7, [r1, r7]	@ zero_extendqisi2
	cmp	r7, #0
	lsl	r7, r3, #9
	beq	.L7
	add	r7, ip, r7
	ldrb	r7, [r1, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L7
	cmp	r3, #0
	ldrgt	r6, [r4, #12]
	subgt	r6, r3, r6
	strgt	r6, [r4, #4]
	mov	r6, #1
	tst	r0, #32
	str	r6, [r4, #24]
	str	r6, [r4, #28]
	beq	.L14
	tst	r0, #16
	bne	.L18
.L33:
	add	r2, ip, r2, lsl #9
	ldrb	r3, [r1, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L58
.L18:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L59
.L21:
	mov	r2, #10
	str	r3, [r4, #36]
	str	r2, [r4, #32]
	ldr	r0, [r4, #24]
	ldr	r5, [r4]
.L23:
	ldr	ip, .L61+12
	ldr	r3, [ip]
	cmp	r3, #272
	ldrls	r3, [r4, #16]
	rsbls	r3, r3, #240
	addls	r3, r3, r3, lsr #31
	subls	r3, r5, r3, asr #1
	strls	r3, [ip]
	cmp	r3, #0
	blt	.L60
	cmp	r3, #272
	movgt	r3, #272
	movgt	r1, r3
	lslle	r1, r3, #16
	strgt	r3, [ip]
	lsrle	r1, r1, #16
.L26:
	ldr	r3, [ip, #4]
	cmp	r3, #352
	ldrcc	r2, [r4, #20]
	ldr	lr, [r4, #4]
	rsbcc	r2, r2, #160
	addcc	r2, r2, r2, lsr #31
	subcc	r3, lr, r2, asr #1
	strcc	r3, [ip, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [ip, #4]
	blt	.L30
	cmp	r3, #352
	movgt	r2, #352
	movgt	r3, r2
	lslle	r3, r3, #16
	strgt	r2, [ip, #4]
	lsrle	r3, r3, #16
.L30:
	sub	r5, r5, r1
	ldrb	r2, [r4, #48]	@ zero_extendqisi2
	sub	r3, lr, r3
	ldr	r4, .L61+16
	ldr	lr, .L61+20
	ldr	r1, .L61+24
	lsl	r5, r5, #23
	lsr	r5, r5, #23
	and	r3, r3, #255
	add	ip, r4, r2, lsl #3
	orr	r5, r5, lr
	orr	r3, r3, lr
	lsl	r2, r2, #3
	and	r0, r1, r0, lsl #1
	strh	r5, [ip, #2]	@ movhi
	strh	r3, [r4, r2]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	tst	r0, #128
	bne	.L12
	ldr	r1, .L61+8
	add	r7, r5, r2, lsl #9
	ldrb	r7, [r7, r1]	@ zero_extendqisi2
	cmp	r7, #0
	lsl	r7, r2, #9
	beq	.L12
	add	r7, ip, r7
	ldrb	r1, [r7, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L12
	rsb	r1, r6, #512
	cmp	r1, r3
	ldrgt	r1, [r4, #12]
	addgt	r1, r1, r3
	mov	r6, #0
	strgt	r1, [r4, #4]
	mov	r1, #1
	str	r6, [r4, #24]
	str	r1, [r4, #28]
.L12:
	tst	r0, #32
	bne	.L11
	ldr	r1, .L61+8
	add	r6, r5, r3, lsl #9
	ldrb	r6, [r1, r6]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L14
.L11:
	tst	r0, #16
	bne	.L18
	ldr	r1, .L61+8
	add	r3, ip, r3, lsl #9
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L21
.L59:
	ldr	r6, [r4, #24]
	ldr	r5, [r4]
.L32:
	ldr	r3, [r4, #32]
	ldr	r0, [r4, #36]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	addne	r0, r6, r0, lsl #6
	bne	.L23
	ldr	r3, .L61+28
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #36]
	str	r3, [r4, #32]
	add	r0, r6, r1, lsl #6
	b	.L23
.L14:
	add	r6, r5, r2, lsl #9
	ldrb	r1, [r1, r6]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L11
	cmp	r5, #0
	ldrgt	r3, [r4, #8]
	mov	r0, #3
	subgt	r5, r5, r3
	mov	r3, #1
	mov	r6, r0
	ldrle	r5, [r4]
	strgt	r5, [r4]
	str	r0, [r4, #24]
	str	r3, [r4, #28]
	b	.L32
.L60:
	mov	r3, #0
	mov	r1, r3
	str	r3, [ip]
	b	.L26
.L58:
	rsb	lr, lr, #512
	cmp	lr, r5
	ldrgt	r3, [r4, #8]
	mov	r0, #2
	addgt	r5, r5, r3
	mov	r3, #1
	mov	r6, r0
	ldrle	r5, [r4]
	strgt	r5, [r4]
	str	r0, [r4, #24]
	str	r3, [r4, #28]
	b	.L32
.L62:
	.align	2
.L61:
	.word	buttons
	.word	player
	.word	collisionmapBitmap
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32768
	.word	1022
	.word	__aeabi_idivmod
	.size	update, .-update
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #67108864
	ldr	r4, .L65
	ldr	r7, .L65+4
	ldrh	r3, [r4]
	ldr	r1, [r4, #4]
	mov	r0, r7
	strh	r3, [r5, #16]	@ movhi
	ldr	r6, .L65+8
	mov	lr, pc
	bx	r6
	mov	r0, r7
	ldr	r1, [r4]
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4, #4]
	mov	r3, #512
	strh	r2, [r5, #18]	@ movhi
	ldr	r4, .L65+12
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	.LC0
	.word	mgba_printf
	.word	DMANow
	.word	shadowOAM
	.size	draw, .-draw
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
	push	{r7, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r9, .L70+4
	ldr	r4, .L70+8
	ldr	r8, .L70+12
	ldr	r7, .L70+16
	ldr	r6, .L70+20
	ldr	r5, .L70+24
.L68:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L68
.L71:
	.align	2
.L70:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	player,52,4
	.global	vOff
	.global	hOff
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	2
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
