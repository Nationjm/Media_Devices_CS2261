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
	.global	drawHorizontalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L10
	ldr	ip, [ip]
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	add	lr, r1, r0, lsl #4
	add	r0, r2, r0, lsl #4
	add	r1, ip, #2
	add	r2, ip, lr, lsl #1
	add	r1, r1, r0, lsl #1
.L3:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L3
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L20
	ldr	ip, [ip]
	rsb	r1, r1, r1, lsl #4
	str	lr, [sp, #-4]!
	rsb	lr, r2, r2, lsl #4
	add	r2, r0, r1, lsl #4
	add	r0, r0, lr, lsl #4
	add	r1, ip, #480
	add	r2, ip, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L14:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L14
	ldr	lr, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L22
	ldr	lr, .L30
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L24:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L27
.L25:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L25
.L27:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L24
.L22:
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r2, r3, #76800
.L33:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L33
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
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
	mov	r2, #67108864
.L39:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L39
	mov	r2, #67108864
.L40:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L40
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawFrame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame1, %function
drawFrame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #32768
	ldr	r3, .L62
	push	{r4, r5, lr}
	ldr	r0, [r3]
	add	ip, r0, #45568
	add	r2, ip, #92
	add	ip, ip, #202
.L45:
	sub	r3, r2, #26368
	sub	r3, r3, #32
.L46:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L46
	add	r2, r2, #2
	cmp	r2, ip
	bne	.L45
	mov	ip, #31
	mov	r1, ip
	add	r3, r0, #36096
	add	r2, r0, #36352
	strh	ip, [r3, #18]	@ movhi
	strh	ip, [r3, #20]	@ movhi
	strh	ip, [r3, #22]	@ movhi
	strh	ip, [r3, #24]	@ movhi
	add	r3, r2, #238
	add	r2, r2, #252
.L48:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L48
	mov	lr, #0
	add	r3, r0, #36864
	ldr	r2, .L62+4
	add	r4, r3, #680
	strh	lr, [r3, #212]	@ movhi
	add	ip, r3, #684
	strh	lr, [r3, #214]	@ movhi
	strh	lr, [r3, #216]	@ movhi
	strh	lr, [r3, #218]	@ movhi
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #210]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	add	r4, r3, #688
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	lr, [r4]	@ movhi
	add	ip, r3, #692
	strh	r2, [r4, #2]	@ movhi
	add	r4, r3, #696
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	add	r4, r3, #700
	strh	r2, [r4]	@ movhi
	mov	r1, r2
	strh	lr, [ip, #2]	@ movhi
	add	r2, r3, #1648
	add	ip, r0, #37888
	add	r5, r3, #1168
	strh	lr, [r4]	@ movhi
	strh	lr, [r5, #12]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	add	r2, ip, #136
	add	ip, ip, #156
.L49:
	strh	r1, [r2], #2	@ movhi
	cmp	ip, r2
	bne	.L49
	mov	ip, #0
	add	r2, r3, #1168
	add	lr, r3, #1152
	strh	ip, [lr, #14]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	add	lr, r3, #1632
	strh	ip, [r2, #6]	@ movhi
	add	r2, r3, #1648
	strh	ip, [lr, #10]	@ movhi
	strh	ip, [lr, #12]	@ movhi
	strh	ip, [lr, #14]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	ip, [r2, #10]	@ movhi
	add	r1, r0, #38912
	strh	ip, [r2, #12]	@ movhi
	strh	ip, [r2, #14]	@ movhi
	ldr	ip, .L62+4
	add	r2, r1, #76
	add	r1, r1, #92
.L50:
	strh	ip, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L50
	mov	r2, #31744
	add	r1, r3, #2608
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	r2, [r1, #6]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	add	r1, r0, #39936
	mov	ip, r2
	add	r2, r1, #14
	add	r1, r1, #30
.L51:
	strh	ip, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L51
	mov	r2, #31
	mvn	r4, #64512
	add	r1, r3, #3088
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	add	r1, r3, #3552
	strh	r2, [r1, #14]	@ movhi
	add	r1, r3, #3568
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	r2, [r1, #6]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	ip, [r1, #10]	@ movhi
	add	r4, r3, #4032
	strh	ip, [r1, #12]	@ movhi
	add	r3, r3, #4048
	add	r1, r0, #41216
	strh	r2, [r4, #12]	@ movhi
	mov	lr, r2
	strh	r2, [r4, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	add	r2, r1, #190
	strh	ip, [r3, #10]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	add	r3, r1, #172
.L52:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L52
	mov	r4, #31744
	mov	ip, #31
	ldr	r3, .L62+4
	add	r1, r0, #40960
	add	r2, r0, #41728
	add	lr, r1, #436
	add	r0, r1, #440
	strh	r3, [lr]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	add	r3, r2, #140
	add	r2, r2, #158
.L53:
	strh	ip, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L53
	mov	r3, #31744
	ldr	r2, .L62+4
	add	r0, r1, #916
	add	lr, r1, #920
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [lr]	@ movhi
	add	r0, r1, #1376
	add	r2, r1, #1392
	strh	ip, [r0, #14]	@ movhi
	add	lr, r1, #1856
	strh	ip, [r2]	@ movhi
	add	r0, r1, #1872
	strh	ip, [r2, #2]	@ movhi
	strh	ip, [r2, #6]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	ip, [r2, #10]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	add	r2, r1, #2336
	add	r1, r1, #2352
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [r0]	@ movhi
	pop	{r4, r5, lr}
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r0, #8]	@ movhi
	strh	r3, [r0, #10]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	18303
	.size	drawFrame1, .-drawFrame1
	.align	2
	.global	drawFrame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame2, %function
drawFrame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #32768
	ldr	r3, .L80
	push	{r4, r5, r6, r7, lr}
	ldr	r0, [r3]
	add	ip, r0, #45568
	add	r2, ip, #92
	add	ip, ip, #202
.L65:
	sub	r3, r2, #26368
	sub	r3, r3, #32
.L66:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L66
	add	r2, r3, #2
	cmp	ip, r2
	bne	.L65
	mov	r3, #31
	add	r2, r0, #36096
	add	lr, r0, #32768
	strh	r3, [r2, #12]	@ movhi
	add	ip, lr, #3344
	strh	r3, [r2, #14]	@ movhi
	add	r2, r0, #36352
	strh	r3, [ip]	@ movhi
	mov	r1, r3
	strh	r3, [ip, #2]	@ movhi
	add	r3, r2, #232
	add	r2, r2, #246
.L68:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L68
	mov	r4, #0
	ldr	r2, .L80+4
	add	r3, r0, #36864
	add	ip, r3, #676
	strh	r4, [r3, #206]	@ movhi
	add	r5, r3, #680
	strh	r4, [r3, #208]	@ movhi
	strh	r4, [r3, #210]	@ movhi
	strh	r4, [r3, #212]	@ movhi
	strh	r2, [r3, #202]	@ movhi
	strh	r2, [r3, #204]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	add	ip, r3, #684
	strh	r2, [r5]	@ movhi
	strh	r4, [r5, #2]	@ movhi
	strh	r2, [ip]	@ movhi
	add	r5, r3, #688
	strh	r2, [ip, #2]	@ movhi
	add	ip, r3, #692
	strh	r2, [r5]	@ movhi
	mov	r1, r2
	strh	r2, [r5, #2]	@ movhi
	add	r6, r3, #1168
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r4, [r5]	@ movhi
	add	r2, r3, #1648
	strh	r4, [ip, #2]	@ movhi
	add	ip, r0, #37888
	strh	r4, [r6, #6]	@ movhi
	strh	r4, [r2, #6]	@ movhi
	add	r2, ip, #130
	add	ip, ip, #150
.L69:
	strh	r1, [r2], #2	@ movhi
	cmp	ip, r2
	bne	.L69
	mov	r2, #0
	add	ip, r3, #1152
	add	r4, r3, #1168
	strh	r2, [ip, #8]	@ movhi
	strh	r2, [ip, #14]	@ movhi
	strh	r2, [r4]	@ movhi
	add	ip, r3, #1632
	add	r4, r3, #1648
	strh	r2, [ip, #4]	@ movhi
	strh	r2, [ip, #6]	@ movhi
	strh	r2, [ip, #8]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	strh	r1, [ip, #12]	@ movhi
	strh	r1, [ip, #14]	@ movhi
	strh	r1, [r4]	@ movhi
	add	ip, r0, #38912
	strh	r1, [r4, #2]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	ldr	r1, .L80+4
	strh	r2, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	add	r2, ip, #70
	add	ip, ip, #86
.L70:
	strh	r1, [r2], #2	@ movhi
	cmp	r2, ip
	bne	.L70
	mov	r2, #31744
	mov	r5, #31
	add	r4, r3, #2592
	strh	r1, [r4, #8]	@ movhi
	strh	r5, [r4, #12]	@ movhi
	strh	r2, [r4, #14]	@ movhi
	add	r4, r3, #2608
	strh	r2, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	add	r4, r0, #39936
	strh	r1, [r4, #6]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	strh	r2, [r4, #14]	@ movhi
	add	r4, r3, #3088
	strh	r2, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	add	r4, r3, #3552
	strh	r1, [r4, #8]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	strh	r2, [r4, #14]	@ movhi
	add	r4, r3, #3568
	strh	r2, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	add	r2, r0, #40704
	strh	r5, [r4, #4]	@ movhi
	strh	r5, [r4, #6]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	mov	r1, r2
	mov	ip, r5
	add	r2, r2, #200
	add	r1, r1, #220
.L71:
	strh	ip, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L71
	mov	r2, #31744
	mov	ip, #31
	add	r3, r3, #4048
	strh	r2, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	add	r2, r0, #41216
	add	r3, r2, #168
	add	r2, r2, #188
.L72:
	strh	ip, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L72
	mov	r5, #31744
	mov	r3, #0
	mov	r1, #992
	add	r4, r0, #40960
	add	r6, r4, #444
	strh	r5, [r6]	@ movhi
	strh	r5, [r6, #2]	@ movhi
	add	r6, r4, #904
	strh	ip, [r6, #2]	@ movhi
	add	r6, r4, #908
	strh	ip, [r6]	@ movhi
	strh	ip, [r6, #2]	@ movhi
	add	r6, r4, #916
	strh	ip, [r6]	@ movhi
	strh	ip, [r6, #2]	@ movhi
	add	r6, r4, #920
	strh	ip, [r6]	@ movhi
	strh	ip, [r6, #2]	@ movhi
	add	r6, r4, #924
	strh	r5, [r6]	@ movhi
	add	ip, r4, #1392
	strh	r5, [r6, #2]	@ movhi
	add	r6, r4, #1376
	strh	r5, [ip, #14]	@ movhi
	strh	r5, [r6, #12]	@ movhi
	strh	r5, [r6, #14]	@ movhi
	strh	r5, [ip]	@ movhi
	add	ip, r4, #1856
	add	r4, r4, #1872
	strh	r5, [ip, #10]	@ movhi
	strh	r5, [ip, #12]	@ movhi
	strh	r5, [ip, #14]	@ movhi
	strh	r5, [r4]	@ movhi
	add	ip, lr, #920
	add	r4, lr, #916
	add	r2, r0, #28672
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [ip]	@ movhi
	add	r4, lr, #924
	strh	r3, [ip, #2]	@ movhi
	add	ip, lr, #432
	add	lr, lr, #444
	strh	r3, [r4]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	add	r4, r2, #4048
	strh	r3, [lr, #2]	@ movhi
	add	ip, r2, #3568
	add	lr, r0, #32256
	strh	r3, [ip]	@ movhi
	add	r6, r0, #28160
	strh	r3, [r4]	@ movhi
	add	r0, r0, r5
	strh	r3, [lr]	@ movhi
	add	r4, r2, #4064
	add	lr, r2, #3088
	strh	r3, [r4]	@ movhi
	add	r5, r2, #1632
	strh	r3, [lr, #6]	@ movhi
	add	r4, r2, #3104
	strh	r3, [ip, #6]	@ movhi
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [ip, #10]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	add	ip, r2, #2608
	add	r0, r2, #2112
	strh	r3, [lr]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [r4]	@ movhi
	add	lr, r2, #1664
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	add	r4, r2, #2592
	strh	r3, [ip, #6]	@ movhi
	strh	r3, [ip, #8]	@ movhi
	strh	r3, [ip, #10]	@ movhi
	strh	r3, [ip, #12]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	add	r0, r2, #2144
	strh	r3, [r4, #12]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	add	r4, r2, #1152
	strh	r3, [r0, #4]	@ movhi
	add	lr, r2, #2624
	add	r0, r2, #1184
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	add	r4, r2, #704
	add	r0, r2, #688
	strh	r3, [r0]	@ movhi
	add	r7, r2, #692
	strh	r3, [r4]	@ movhi
	add	r5, r2, #700
	strh	r3, [r2, #210]	@ movhi
	add	r4, r2, #696
	strh	r3, [r2, #212]	@ movhi
	strh	r3, [r2, #220]	@ movhi
	strh	r3, [r2, #222]	@ movhi
	strh	r3, [r6, #246]	@ movhi
	strh	r3, [r6, #248]	@ movhi
	strh	r3, [r6, #250]	@ movhi
	add	r3, r2, #1168
	strh	r1, [r2, #214]	@ movhi
	strh	r1, [r2, #216]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	add	r0, r2, #1648
	add	r2, r2, #2128
	strh	r1, [r7]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	r1, [r2, #14]	@ movhi
	strh	r1, [ip, #14]	@ movhi
	strh	r1, [lr]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r1, [r0, #10]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	strh	r1, [r0, #12]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	18303
	.size	drawFrame2, .-drawFrame2
	.align	2
	.global	drawFrame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame3, %function
drawFrame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #32768
	ldr	r3, .L96
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r3]
	add	r0, ip, #45568
	add	r2, r0, #92
	add	r0, r0, #202
.L83:
	sub	r3, r2, #26368
	sub	r3, r3, #32
.L84:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L84
	add	r2, r3, #2
	cmp	r0, r2
	bne	.L83
	mov	r3, #31
	add	r2, ip, #28672
	add	r1, r2, #1168
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	add	r1, ip, #30208
	mov	r0, r3
	add	r3, r1, #116
	add	r1, r1, #130
.L86:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L86
	mov	lr, #0
	ldr	r3, .L96+4
	add	r4, r2, #2128
	add	r0, r2, #2144
	strh	lr, [r4, #10]	@ movhi
	add	r5, r2, #2624
	strh	lr, [r4, #12]	@ movhi
	strh	lr, [r4, #14]	@ movhi
	strh	lr, [r0]	@ movhi
	add	r0, r2, #2608
	strh	r3, [r4, #6]	@ movhi
	mov	r1, r3
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r0]	@ movhi
	add	r4, ip, #32256
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	lr, [r0, #6]	@ movhi
	strh	r3, [r0, #8]	@ movhi
	strh	r3, [r0, #10]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r5]	@ movhi
	strh	r3, [r5, #2]	@ movhi
	add	r3, r2, #3104
	strh	lr, [r0, #12]	@ movhi
	strh	lr, [r5, #2]	@ movhi
	add	r0, ip, #31744
	strh	lr, [r3, #2]	@ movhi
	strh	lr, [r4, #2]	@ movhi
	add	r3, r0, #14
	add	r0, r0, #34
.L87:
	strh	r1, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L87
	mov	lr, #0
	add	r3, r2, #3568
	add	r0, r2, #3088
	strh	lr, [r0, #4]	@ movhi
	add	r2, ip, #32512
	strh	lr, [r0, #10]	@ movhi
	strh	lr, [r0, #12]	@ movhi
	strh	lr, [r3]	@ movhi
	ldr	r0, .L96+4
	strh	lr, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	lr, [r3, #6]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	lr, [r4]	@ movhi
	strh	lr, [r4, #2]	@ movhi
	strh	lr, [r4, #4]	@ movhi
	add	r3, r2, #210
	add	r2, r2, #224
.L88:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L88
	mov	r3, #31
	add	r1, ip, #32768
	add	r5, r1, #428
	add	r4, r1, #908
	add	lr, r1, #1376
	strh	r0, [r5]	@ movhi
	add	r6, r1, #912
	strh	r0, [r4]	@ movhi
	strh	r0, [lr, #12]	@ movhi
	strh	r0, [r5, #2]	@ movhi
	add	r5, r1, #932
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [lr, #14]	@ movhi
	add	r4, r1, #1888
	strh	r0, [r6]	@ movhi
	add	lr, r1, #1408
	strh	r0, [r5, #2]	@ movhi
	add	r5, r1, #936
	strh	r0, [lr, #6]	@ movhi
	strh	r0, [r4, #6]	@ movhi
	strh	r0, [r5]	@ movhi
	strh	r0, [lr, #8]	@ movhi
	add	r5, r1, #444
	strh	r0, [r4, #8]	@ movhi
	strh	r0, [lr, #4]	@ movhi
	add	r4, r1, #440
	add	r0, r1, #920
	strh	r3, [r4]	@ movhi
	add	lr, r1, #924
	strh	r3, [r0]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r5]	@ movhi
	add	r5, ip, #34048
	mov	r2, r3
	strh	r3, [lr]	@ movhi
	add	r3, r5, #114
	add	r5, r5, #126
.L89:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	lr, r3, #960
	add	r0, r3, #1440
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r4]	@ movhi
	strh	r2, [lr]	@ movhi
	strh	r2, [r0]	@ movhi
	bne	.L89
	mov	r3, #31744
	mvn	r8, #64512
	add	r0, r1, #3312
	add	r7, r1, #2352
	add	r6, r1, #2832
	add	r5, r1, #1872
	add	lr, r1, #1888
	strh	r2, [r5, #14]	@ movhi
	add	r4, r1, #2368
	strh	r2, [r7, #14]	@ movhi
	add	r5, r1, #2848
	strh	r2, [r6, #14]	@ movhi
	strh	r2, [r0, #14]	@ movhi
	strh	r2, [lr]	@ movhi
	add	lr, ip, #36096
	strh	r2, [r4]	@ movhi
	add	r10, r1, #436
	strh	r2, [r5]	@ movhi
	add	r9, r1, #440
	strh	r2, [lr]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r2, [r5, #2]	@ movhi
	add	r4, r1, #1392
	strh	r2, [r5, #4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	add	r5, r1, #912
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r0, #6]	@ movhi
	add	r2, r1, #916
	strh	r8, [r4, #2]	@ movhi
	strh	r8, [r4, #10]	@ movhi
	strh	r3, [r10, #2]	@ movhi
	add	r8, r1, #924
	strh	r3, [r9]	@ movhi
	strh	r3, [r5, #2]	@ movhi
	add	r9, r1, #444
	strh	r3, [r2]	@ movhi
	add	r5, r1, #448
	strh	r3, [r2, #2]	@ movhi
	add	r2, r1, #928
	strh	r3, [r4]	@ movhi
	strh	r3, [r9, #2]	@ movhi
	strh	r3, [r8, #2]	@ movhi
	strh	r3, [r5]	@ movhi
	add	r8, r1, #452
	strh	r3, [r2]	@ movhi
	strh	r3, [r5, #2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	add	r5, r1, #932
	add	r2, r1, #1408
	strh	r3, [r8]	@ movhi
	strh	r3, [r5]	@ movhi
	add	r8, r1, #1856
	strh	r3, [r4, #14]	@ movhi
	add	r5, r1, #2336
	add	r4, ip, #35584
	strh	r3, [r2]	@ movhi
	add	ip, ip, #36864
	add	r2, r1, #3296
	add	r1, r1, #3808
	strh	r3, [r8, #14]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [r7]	@ movhi
	strh	r3, [r6]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [lr, #6]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	strh	r3, [ip, #192]	@ movhi
	strh	r3, [ip, #194]	@ movhi
	strh	r3, [ip, #196]	@ movhi
	bx	lr
.L97:
	.align	2
.L96:
	.word	.LANCHOR0
	.word	18303
	.size	drawFrame3, .-drawFrame3
	.align	2
	.global	drawFrame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame4, %function
drawFrame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #32768
	ldr	r3, .L116
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, [r3]
	add	ip, r0, #45568
	add	r2, ip, #92
	add	ip, ip, #202
.L99:
	sub	r3, r2, #26368
	sub	r3, r3, #32
.L100:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L100
	add	r2, r3, #2
	cmp	ip, r2
	bne	.L99
	mov	r3, #31
	add	r2, r0, #32768
	add	r1, r2, #3296
	strh	r3, [r1, #10]	@ movhi
	add	lr, r2, #3312
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	add	r1, r0, #36352
	mov	ip, r3
	strh	r3, [lr]	@ movhi
	add	r3, r1, #198
	add	r1, r1, #212
.L102:
	strh	ip, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L102
	mov	r4, #0
	add	r3, r0, #36864
	ldr	r1, .L116+4
	add	r5, r3, #640
	strh	r4, [r3, #172]	@ movhi
	add	lr, r3, #644
	strh	r4, [r3, #174]	@ movhi
	strh	r4, [r3, #176]	@ movhi
	strh	r4, [r3, #178]	@ movhi
	strh	r1, [r3, #168]	@ movhi
	strh	r1, [r3, #170]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	add	r5, r3, #648
	strh	r1, [lr]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r4, [r5]	@ movhi
	add	lr, r3, #652
	strh	r1, [r5, #2]	@ movhi
	add	r5, r3, #656
	strh	r1, [lr]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	add	r5, r3, #660
	strh	r1, [r5]	@ movhi
	mov	ip, r1
	strh	r4, [lr, #2]	@ movhi
	add	r1, r3, #1616
	add	lr, r0, #37888
	add	r6, r3, #1136
	strh	r4, [r5]	@ movhi
	strh	r4, [r6, #4]	@ movhi
	strh	r4, [r1, #4]	@ movhi
	add	r1, lr, #96
	add	lr, lr, #116
.L103:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, lr
	bne	.L103
	mov	r1, #0
	add	r4, r3, #1120
	strh	r1, [r4, #6]	@ movhi
	add	lr, r3, #1600
	strh	r1, [r4, #12]	@ movhi
	strh	r1, [r4, #14]	@ movhi
	add	r4, r3, #1616
	strh	r1, [lr, #2]	@ movhi
	strh	r1, [lr, #4]	@ movhi
	strh	r1, [lr, #6]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	strh	ip, [lr, #10]	@ movhi
	strh	ip, [lr, #12]	@ movhi
	strh	ip, [lr, #14]	@ movhi
	strh	ip, [r4]	@ movhi
	ldr	lr, .L116+4
	strh	ip, [r4, #2]	@ movhi
	add	ip, r0, #38912
	strh	r1, [r4, #2]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	strh	r1, [r4, #6]	@ movhi
	add	r1, ip, #36
	add	ip, ip, #52
.L104:
	strh	lr, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L104
	mov	r1, #31744
	add	ip, r0, #39424
	strh	r1, [ip, #8]	@ movhi
	add	r4, r3, #2576
	strh	r1, [ip, #10]	@ movhi
	strh	r1, [ip, #12]	@ movhi
	strh	r1, [ip, #14]	@ movhi
	add	ip, r0, #39680
	strh	r1, [r4]	@ movhi
	mov	lr, r1
	strh	r1, [r4, #2]	@ movhi
	add	r1, ip, #230
	add	ip, ip, #246
.L105:
	strh	lr, [r1], #2	@ movhi
	cmp	ip, r1
	bne	.L105
	mov	r1, #31
	mvn	r7, #64512
	add	ip, r3, #3520
	add	r5, r3, #3040
	add	r6, r3, #3536
	strh	r1, [r5, #10]	@ movhi
	strh	r1, [r5, #12]	@ movhi
	strh	r1, [ip, #6]	@ movhi
	add	r5, r3, #4000
	strh	r1, [ip, #8]	@ movhi
	add	r3, r3, #4016
	strh	r1, [ip, #10]	@ movhi
	strh	r1, [ip, #12]	@ movhi
	strh	r1, [ip, #14]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r7, [ip, #10]	@ movhi
	add	ip, r0, #41216
	strh	lr, [r6, #2]	@ movhi
	mov	r4, r1
	strh	lr, [r6, #4]	@ movhi
	strh	r1, [r5, #4]	@ movhi
	strh	r1, [r5, #6]	@ movhi
	strh	r1, [r5, #8]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	strh	r1, [r5, #12]	@ movhi
	strh	r1, [r5, #14]	@ movhi
	strh	lr, [r3]	@ movhi
	add	r1, ip, #150
	strh	lr, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	add	r3, ip, #132
.L106:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L106
	mov	r4, #31744
	mov	r1, #31
	ldr	r3, .L116+4
	add	lr, r0, #40960
	add	ip, lr, #396
	strh	r3, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	add	ip, lr, #400
	strh	r3, [ip]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	add	ip, r0, #41728
	add	r3, ip, #100
	add	ip, ip, #118
.L107:
	strh	r1, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L107
	mov	ip, #31744
	mvn	r3, #59904
	ldr	r5, .L116+4
	add	r4, lr, #1344
	add	r7, lr, #876
	add	r6, lr, #880
	strh	r5, [r7, #2]	@ movhi
	strh	r5, [r6]	@ movhi
	add	r7, lr, #1360
	strh	r1, [r4, #6]	@ movhi
	add	r6, lr, #1824
	strh	r1, [r4, #8]	@ movhi
	add	r5, lr, #1840
	strh	r1, [r4, #10]	@ movhi
	add	lr, lr, #2320
	strh	r1, [r4, #14]	@ movhi
	add	r4, r0, #43264
	strh	r1, [r7]	@ movhi
	add	r0, r0, #36096
	strh	r1, [r7, #2]	@ movhi
	add	r8, r2, #928
	strh	r1, [r7, #4]	@ movhi
	strh	ip, [r6, #6]	@ movhi
	add	r7, r2, #1408
	strh	ip, [r6, #8]	@ movhi
	add	r1, r2, #932
	strh	ip, [r6, #10]	@ movhi
	strh	ip, [r5]	@ movhi
	add	r6, r2, #1888
	strh	ip, [r5, #2]	@ movhi
	strh	ip, [r5, #4]	@ movhi
	strh	ip, [r4, #4]	@ movhi
	add	r5, r2, #2368
	strh	ip, [r4, #6]	@ movhi
	strh	ip, [r4, #8]	@ movhi
	strh	ip, [r4, #10]	@ movhi
	strh	ip, [r4, #14]	@ movhi
	strh	ip, [lr]	@ movhi
	add	r4, r2, #2848
	strh	ip, [lr, #2]	@ movhi
	strh	ip, [lr, #4]	@ movhi
	add	lr, r2, #3808
	add	ip, r2, #940
	strh	r3, [r1]	@ movhi
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	add	r1, r2, #3344
	strh	r3, [r7, #6]	@ movhi
	strh	r3, [r6, #6]	@ movhi
	strh	r3, [r5, #6]	@ movhi
	strh	r3, [r4, #6]	@ movhi
	strh	r3, [r0, #6]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [lr, #6]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	strh	r3, [r8, #2]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r7, #12]	@ movhi
	strh	r3, [r6, #12]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r3, [r7, #14]	@ movhi
	add	ip, r2, #3824
	strh	r3, [r6, #14]	@ movhi
	add	r7, r2, #948
	strh	r3, [r5, #14]	@ movhi
	add	r6, r2, #1424
	strh	r3, [r4, #14]	@ movhi
	add	r5, r2, #1904
	strh	r3, [r0, #14]	@ movhi
	add	r4, r2, #2384
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	add	r0, r2, #2864
	add	lr, r2, #956
	strh	r3, [r1]	@ movhi
	add	r8, r2, #964
	strh	r3, [ip]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	strh	r3, [r7]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r3, [r6, #6]	@ movhi
	add	r7, r2, #960
	strh	r3, [r5, #6]	@ movhi
	strh	r3, [r4, #6]	@ movhi
	strh	r3, [r0, #6]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r3, [r6, #12]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [ip, #12]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [r6, #14]	@ movhi
	add	lr, r2, #1920
	add	r6, r2, #1440
	add	r2, r2, #2400
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	strh	r3, [ip, #14]	@ movhi
	strh	r3, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r3, [r8]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [r6, #6]	@ movhi
	strh	r3, [lr, #6]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	.LANCHOR0
	.word	18303
	.size	drawFrame4, .-drawFrame4
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
