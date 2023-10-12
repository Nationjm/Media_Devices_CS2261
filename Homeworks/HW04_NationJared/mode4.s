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
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r0, r1, lsl #4
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r3, r3, r2, lsl #8
	orreq	r3, r3, r2
	strh	r3, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRectangle4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle4, %function
drawRectangle4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r2
	sub	sp, sp, #12
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	tst	r0, #1
	orr	r2, r2, ip, lsl #8
	strh	r2, [sp, #6]	@ movhi
	and	r2, r7, #1
	beq	.L8
	cmp	r2, #0
	beq	.L29
	cmp	r3, #0
	ble	.L7
	add	r3, r1, r3
	sub	r5, r7, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r4, r1, r1, lsl #4
	asr	r5, r5, #1
	ldr	r8, .L30
	ldr	r9, .L30+4
	add	r6, r0, r3, lsl #4
	add	r4, r0, r4, lsl #4
	orr	r5, r5, #16777216
	b	.L13
.L12:
	add	r4, r4, #240
	cmp	r6, r4
	beq	.L7
.L13:
	ldr	ip, [r8]
	bic	r3, r4, #1
	ldrh	r0, [sp, #6]
	ldrh	r1, [ip, r3]
	and	r0, r0, #255
	and	r1, r1, #255
	orr	r1, r1, r0, lsl #8
	cmp	r7, #2
	strh	r1, [ip, r3]	@ movhi
	ble	.L12
	add	r2, r4, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	mov	r3, r5
	mov	r0, #3
	add	r2, ip, r2
	add	r1, sp, #6
	add	r4, r4, #240
	mov	lr, pc
	bx	r9
	cmp	r6, r4
	bne	.L13
.L7:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	cmp	r2, #0
	beq	.L18
	cmp	r3, #0
	ble	.L7
	add	r3, r1, r3
	add	r2, r0, r7
	rsb	r3, r3, r3, lsl #4
	sub	fp, r7, #1
	add	r9, r2, r3, lsl #4
	add	r4, r0, #1
	sub	r3, r2, #1
	rsb	r1, r1, r1, lsl #4
	asr	fp, fp, #1
	sub	r6, r4, r2
	ldr	r8, .L30
	ldr	r10, .L30+4
	sub	r9, r9, #1
	add	r5, r3, r1, lsl #4
	and	r4, r3, #1
	orr	fp, fp, #16777216
	b	.L22
.L21:
	add	r5, r5, #240
	cmp	r9, r5
	beq	.L7
.L22:
	ldr	r0, [r8]
	bic	r1, r5, #1
	ldrh	r3, [sp, #6]
	ldrh	r2, [r0, r1]
	cmp	r4, #0
	and	ip, r2, #255
	and	lr, r3, #255
	biceq	r2, r2, #255
	andeq	r3, r3, #255
	orreq	r2, r2, r3
	orr	ip, ip, lr, lsl #8
	strhne	ip, [r0, r1]	@ movhi
	strheq	r2, [r0, r1]	@ movhi
	cmp	r7, #2
	ble	.L21
	add	r2, r6, r5
	ldr	r3, [r8]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	mov	r3, fp
	add	r1, sp, #6
	mov	lr, pc
	bx	r10
	b	.L21
.L18:
	cmp	r7, #1
	ble	.L7
	cmp	r3, #0
	ble	.L7
	add	r3, r3, r1
	rsb	r3, r3, r3, lsl #4
	asr	r7, r7, #1
	rsb	r4, r1, r1, lsl #4
	ldr	r8, .L30
	ldr	r9, .L30+4
	add	r6, r0, r3, lsl #4
	orr	r7, r7, #16777216
	add	r4, r0, r4, lsl #4
.L23:
	ldr	r2, [r8]
	add	r3, r4, r4, lsr #31
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r3, r7
	add	r4, r4, #240
	add	r1, sp, #6
	mov	lr, pc
	bx	r9
	cmp	r6, r4
	bne	.L23
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	cmp	r3, #0
	ble	.L7
	add	r3, r1, r3
	add	r6, r0, r7
	sub	fp, r7, #2
	rsb	r3, r3, r3, lsl #4
	rsb	r4, r1, r1, lsl #4
	sub	r6, r6, #1
	asr	fp, fp, #1
	ldr	r8, .L30
	ldr	r10, .L30+4
	add	r5, r0, r3, lsl #4
	add	r4, r0, r4, lsl #4
	and	r6, r6, #1
	orr	fp, fp, #16777216
	sub	r9, r7, #1
	b	.L17
.L16:
	add	r4, r4, #240
	cmp	r5, r4
	beq	.L7
.L17:
	ldr	r0, [r8]
	bic	r2, r4, #1
	ldrh	r1, [sp, #6]
	ldrh	r3, [r0, r2]
	and	r1, r1, #255
	and	r3, r3, #255
	orr	r3, r3, r1, lsl #8
	strh	r3, [r0, r2]	@ movhi
	add	r2, r9, r4
	bic	r2, r2, #1
	ldrh	r3, [sp, #6]
	ldrh	r1, [r0, r2]
	cmp	r6, #0
	and	ip, r1, #255
	and	lr, r3, #255
	biceq	r1, r1, #255
	andeq	r3, r3, #255
	orreq	r1, r1, r3
	orr	ip, ip, lr, lsl #8
	strhne	ip, [r0, r2]	@ movhi
	strheq	r1, [r0, r2]	@ movhi
	cmp	r7, #3
	ble	.L16
	add	r2, r4, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r0, r2
	mov	r3, fp
	mov	r0, #3
	add	r1, sp, #6
	mov	lr, pc
	bx	r10
	b	.L16
.L31:
	.align	2
.L30:
	.word	videoBuffer
	.word	DMANow
	.size	drawRectangle4, .-drawRectangle4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	lsl	ip, ip, #16
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	orr	ip, ip, r3, lsl #24
	ldr	r3, .L34
	orr	ip, ip, r1
	orr	ip, ip, r2, lsl #8
	mov	r0, #3
	ldr	r2, [r3]
	ldr	r4, .L34+4
	ldr	r3, .L34+8
	add	r1, sp, #12
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	videoBuffer
	.word	DMANow
	.word	83895680
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r6, r1, r3
	add	r2, r2, r2, lsr #31
	rsb	r6, r6, r6, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [sp, #32]
	ldr	r9, .L44
	ldr	r8, .L44+4
	add	r6, r0, r6, lsl #4
	add	r4, r0, r1, lsl #4
	asr	r10, r2, #1
	bic	r7, r2, #1
.L38:
	ldr	r3, [r9]
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	mov	r1, r5
	add	r2, r3, r2
	mov	r0, #3
	mov	r3, r10
	add	r4, r4, #240
	mov	lr, pc
	bx	r8
	cmp	r6, r4
	add	r5, r5, r7
	bne	.L38
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L48
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L48+4
	mov	r3, #19200
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L53
	moveq	r2, #100663296
	ldr	r1, .L53+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L66
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L66+4
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	lsl	r7, r3, #24
	ldr	r5, [ip]
	lsl	r9, r1, #4
	add	r4, r4, r2, lsl #4
	add	r10, r0, #6
	asr	r7, r7, #16
	and	r8, r3, #255
.L56:
	sub	r3, r4, #48
	add	ip, r9, r0
	and	r6, r0, #1
.L59:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	bic	lr, ip, #1
	beq	.L57
	ldrh	r1, [r5, lr]
	and	r2, r1, #255
	cmp	r6, #0
	orr	r2, r7, r2
	biceq	r1, r1, #255
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	orreq	r1, r1, r8
	strhne	r2, [r5, lr]	@ movhi
	strheq	r1, [r5, lr]	@ movhi
.L57:
	add	r3, r3, #6
	cmp	r3, r4
	add	ip, ip, #240
	bne	.L59
	add	r0, r0, #1
	cmp	r0, r10
	add	r4, r3, #1
	bne	.L56
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	videoBuffer
	.word	fontdata_6x8+48
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L68
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L70:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L70
.L68:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
