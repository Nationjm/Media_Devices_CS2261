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
	.file	"lib.c"
	.text
	.align	2
	.global	waitForVBlank
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L2:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L2
	mov	r2, #67108864
.L3:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L3
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r1, r1, r1, lsl #4
	push	{r4, r5, lr}
	ldr	lr, .L18
	add	r4, r0, r1, lsl #4
	lsl	r4, r4, #1
	add	r2, r2, r2, lsl #1
	add	r4, r4, #100663296
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L9:
	mov	r1, r4
	sub	r2, lr, #48
.L11:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L11
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L9
	pop	{r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	fontdata_6x8+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawCharWithBGColor
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCharWithBGColor, %function
drawCharWithBGColor:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	rsb	r1, r1, r1, lsl #4
	add	ip, r0, r1, lsl #4
	ldr	r1, .L28
	add	ip, ip, #50331648
	add	ip, ip, #1920
	add	r2, r2, r2, lsl #1
	sub	r1, r1, r0
	ldrh	lr, [sp, #16]
	lsl	ip, ip, #1
	add	r6, r0, #6
	add	r5, r1, r2, lsl #4
.L21:
	add	r0, r5, r4
	sub	r2, ip, #3840
.L24:
	ldrb	r1, [r0], #6	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r1, lr
	movne	r1, r3
	strh	r1, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, ip
	bne	.L24
	add	r4, r4, #1
	cmp	r6, r4
	add	ip, r2, #2
	bne	.L21
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	fontdata_6x8
	.size	drawCharWithBGColor, .-drawCharWithBGColor
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L30
	mov	r4, r0
	mov	r6, r1
	mov	r7, r3
.L31:
	cmp	r4, #230
	subgt	r4, r4, #230
	addgt	r6, r6, #8
	mov	r0, r4
	mov	r3, r7
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L31
.L30:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	drawStringWithBGColor
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStringWithBGColor, %function
drawStringWithBGColor:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	sp, sp, #8
	cmp	r2, #0
	ldrh	r8, [sp, #32]
	beq	.L39
	mov	r4, r0
	mov	r6, r1
	mov	r7, r3
.L40:
	cmp	r4, #230
	subgt	r4, r4, #230
	addgt	r6, r6, #8
	mov	r0, r4
	mov	r3, r7
	mov	r1, r6
	str	r8, [sp]
	bl	drawCharWithBGColor
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L40
.L39:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawStringWithBGColor, .-drawStringWithBGColor
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #67108864
	mov	lr, #0
	mov	r1, #100663296
	sub	sp, sp, #12
	ldr	r2, .L50
	orr	r0, r0, r0, lsl #16
	add	ip, sp, #4
	str	r0, [sp, #4]
	str	lr, [r3, #220]
	str	ip, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L51:
	.align	2
.L50:
	.word	-2063578368
	.size	fillScreen, .-fillScreen
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
