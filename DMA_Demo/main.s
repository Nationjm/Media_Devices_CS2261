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
	mov	r3, #67108864
	push	{r4, r5, r6, lr}
	mov	ip, #0
	mov	lr, #50
	ldr	r2, .L4
	ldr	r1, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L4+8
	ldr	r2, .L4+12
	ldr	r3, .L4+16
	ldrh	r4, [r0, #48]
	strh	r3, [r2]	@ movhi
	ldr	r3, [r1, #16]
	ldrh	r0, [r2]
	add	r2, r3, r3, lsr #31
	ldr	r3, [r1, #20]
	ldr	r5, .L4+20
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #120
	asr	r3, r3, #1
	strh	r4, [r5]	@ movhi
	str	r2, [r1]
	ldr	r4, .L4+24
	ldr	r2, .L4+28
	rsb	r3, r3, #80
	str	r3, [r1, #4]
	ldr	r3, .L4+32
	str	lr, [r1, #20]
	str	lr, [r1, #16]
	strh	ip, [r4]	@ movhi
	strh	ip, [r1, #24]	@ movhi
	str	ip, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	rectangle
	.word	67109120
	.word	backgroundColor
	.word	31775
	.word	buttons
	.word	oldButtons
	.word	changeBackground
	.word	fillScreen
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
	ldr	r2, .L49
	ldr	r3, .L49+4
	ldrh	r1, [r2]
	ldr	ip, [r3]
	lsr	r2, r1, #5
	eor	r2, r2, #1
	cmp	ip, #0
	movle	r2, #0
	andgt	r2, r2, #1
	cmp	r2, #0
	ldr	r0, [r3, #4]
	str	ip, [r3, #8]
	subne	ip, ip, #1
	strne	ip, [r3]
	tst	r1, #16
	str	r0, [r3, #12]
	bne	.L8
	ldr	r2, [r3, #16]
	ldr	ip, [r3]
	rsb	r2, r2, #240
	cmp	ip, r2
	addlt	ip, ip, #1
	strlt	ip, [r3]
.L8:
	lsr	r2, r1, #6
	eor	r2, r2, #1
	cmp	r0, #0
	movle	r2, #0
	andgt	r2, r2, #1
	cmp	r2, #0
	subne	r0, r0, #1
	strne	r0, [r3, #4]
	tst	r1, #128
	bne	.L10
	ldr	r2, [r3, #20]
	ldr	r0, [r3, #4]
	rsb	r2, r2, #160
	cmp	r0, r2
	addlt	r0, r0, #1
	strlt	r0, [r3, #4]
.L10:
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	ldr	r2, .L49+12
	tst	r3, #8
	ldr	r3, [r2]
	beq	.L11
	tst	r1, #8
	beq	.L42
.L11:
	cmp	r3, #0
	bxeq	lr
.L46:
	ldr	r0, .L49+16
	ldrsh	r2, [r0]
	ldr	ip, .L49+20
	cmp	r2, #31
	str	lr, [sp, #-4]!
	ldrsh	r1, [r0, #2]
	ldrsh	r3, [ip]
	beq	.L43
	cmp	r2, #0
	bgt	.L44
	bne	.L19
	cmp	r3, #31
	beq	.L45
	cmp	r3, #0
	bgt	.L21
.L19:
	cmp	r3, #0
	bne	.L16
	cmp	r1, #31
	addeq	r2, r2, #1
	lsleq	r2, r2, #16
	asreq	r2, r2, #16
.L16:
	and	r1, r1, #31
	and	r3, r3, #31
	lsl	lr, r1, #10
	and	r2, r2, #31
	orr	lr, lr, r3, lsl #5
	orr	lr, r2, lr
	strh	r2, [r0]	@ movhi
	ldr	r2, .L49+24
	strh	r3, [ip]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L42:
	rsbs	r3, r3, #1
	movcc	r3, #0
	cmp	r3, #0
	str	r3, [r2]
	bxeq	lr
	b	.L46
.L43:
	cmp	r3, #30
	bgt	.L14
	cmp	r1, #0
	beq	.L47
	cmp	r3, #0
	bne	.L16
	cmp	r1, #0
	subgt	r1, r1, #1
	lslgt	r1, r1, #16
	asrgt	r1, r1, #16
	b	.L16
.L44:
	cmp	r3, #31
	beq	.L48
	cmp	r2, #30
	bgt	.L16
	b	.L19
.L45:
	cmp	r1, #30
	addle	r1, r1, #1
	lslle	r1, r1, #16
	asrle	r1, r1, #16
	ble	.L16
.L21:
	cmp	r1, #31
	subeq	r3, r3, #1
	lsleq	r3, r3, #16
	asreq	r3, r3, #16
	b	.L16
.L14:
	cmp	r3, #31
	bne	.L16
	cmp	r1, #0
	movne	r2, r3
	bne	.L16
.L22:
	sub	r2, r2, #1
	lsl	r2, r2, #16
	mov	r1, #0
	asr	r2, r2, #16
	b	.L16
.L48:
	cmp	r1, #0
	bne	.L16
	b	.L22
.L47:
	add	r3, r3, #1
	lsl	r3, r3, #16
	asr	r3, r3, #16
	b	.L16
.L50:
	.align	2
.L49:
	.word	buttons
	.word	rectangle
	.word	oldButtons
	.word	changeBackground
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	backgroundColor
	.size	update, .-update
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
	push	{r4, r5, lr}
	ldr	r3, .L57
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r4, .L57+4
	sub	sp, sp, #12
	bne	.L55
.L52:
	ldrh	r3, [r4]
	ldr	r4, .L57+8
	str	r3, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L57+12
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L55:
	ldrh	r0, [r4]
	ldr	r3, .L57+16
	mov	lr, pc
	bx	r3
	b	.L52
.L58:
	.align	2
.L57:
	.word	changeBackground
	.word	backgroundColor
	.word	rectangle
	.word	drawRectangle
	.word	fillScreen
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
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r9, .L62+4
	ldr	r4, .L62+8
	ldr	r8, .L62+12
	ldr	r7, .L62+16
	ldr	r6, .L62+20
	ldr	r5, .L62+24
.L60:
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
	b	.L60
.L63:
	.align	2
.L62:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	changeBackground,4,4
	.comm	backgroundColor,2,2
	.comm	rectangle,28,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	1
	.set	.LANCHOR0,. + 0
	.type	red.4022, %object
	.size	red.4022, 2
red.4022:
	.short	31
	.type	blue.4024, %object
	.size	blue.4024, 2
blue.4024:
	.short	31
	.bss
	.align	1
	.set	.LANCHOR1,. + 0
	.type	green.4023, %object
	.size	green.4023, 2
green.4023:
	.space	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
