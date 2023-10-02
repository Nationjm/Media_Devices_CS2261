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
	.file	"gba.c"
	.text
	.align	2
	.global	drawRectangle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r5, r0, r2
	cmp	r0, r5
	ldrh	ip, [sp, #16]
	bge	.L1
	ldr	r2, .L10
	add	lr, r1, r3
	ldr	r2, [r2]
	rsb	r3, lr, lr, lsl #4
	rsb	r4, r1, r1, lsl #4
	add	r3, r0, r3, lsl #4
	lsl	r4, r4, #5
	sub	r6, lr, lr, lsl #4
	add	r2, r2, r3, lsl #1
	add	r4, r4, r6, lsl #5
.L3:
	cmp	r1, lr
	addlt	r3, r2, r4
	bge	.L6
.L4:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L4
.L6:
	add	r0, r0, #1
	cmp	r0, r5
	add	r2, r2, #2
	bne	.L3
.L1:
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawRightTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRightTriangle, %function
drawRightTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	ldr	ip, .L22
	ldr	ip, [ip]
	push	{r4, lr}
	add	lr, r2, r1
	rsb	r2, r1, r1, lsl #4
	add	r4, r0, r2, lsl #4
	add	r1, ip, #2
	rsb	lr, lr, lr, lsl #4
	lsl	lr, lr, #4
	lsl	r0, r2, #4
	add	r1, r1, r4, lsl #1
	add	ip, ip, r4, lsl #1
.L15:
	mov	r2, ip
.L14:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L14
	add	r0, r0, #240
	add	r1, r1, #480
	cmp	r0, lr
	add	r1, r1, #2
	add	ip, ip, #480
	bne	.L15
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	drawRightTriangle, .-drawRightTriangle
	.align	2
	.global	drawParallelogram
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawParallelogram, %function
drawParallelogram:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L24
	rsb	r1, r1, r1, lsl #4
	add	r3, r2, r1, lsl #4
	add	r3, r3, r0
	mov	r0, #0
	ldr	r4, .L32
	ldr	r1, [r4]
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L26:
	add	r3, r0, r2
	cmp	r0, r3
	addlt	r3, r1, r4
	bge	.L29
.L27:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L27
.L29:
	add	r0, r0, #1
	add	r1, r1, #480
	cmp	lr, r0
	add	r1, r1, #2
	bne	.L26
.L24:
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.size	drawParallelogram, .-drawParallelogram
	.align	2
	.global	drawCircle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCircle, %function
drawCircle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	sub	r6, r0, r2
	add	r8, r0, r2, lsl #1
	cmp	r6, r8
	bge	.L34
	mul	r4, r2, r2
	ldr	lr, .L45
	rsb	ip, r1, r1, lsl #4
	ldr	r5, [lr]
	add	ip, r6, ip, lsl #4
	sub	r8, r8, r0
	sub	r6, r6, r0
	add	r5, r5, ip, lsl #1
	sub	r9, r1, r2
	add	r7, r1, r2, lsl #1
	lsl	lr, r2, #1
.L37:
	cmp	r9, r7
	mullt	ip, r6, r6
	rsblt	r1, r2, #0
	bge	.L41
.L40:
	mla	r0, r1, r1, ip
	cmp	r0, r4
	rsble	r0, r1, r1, lsl #4
	lslle	r0, r0, #5
	add	r1, r1, #1
	strhle	r3, [r0, r5]	@ movhi
	cmp	lr, r1
	bne	.L40
.L41:
	add	r6, r6, #1
	cmp	r6, r8
	add	r5, r5, #2
	bne	.L37
.L34:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawCircle, .-drawCircle
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldr	r3, [r3, #4]
.L48:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L48
.L49:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L49
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.global	scanlineCounter
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.ident	"GCC: (devkitARM release 53) 9.1.0"
