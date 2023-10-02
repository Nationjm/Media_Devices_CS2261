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
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L1
	ldr	lr, .L10
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L3:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L6
.L4:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L4
.L6:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L3
.L1:
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
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
	ldr	r3, .L16
	ldr	r3, [r3]
	add	r2, r3, #76800
.L13:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L13
	bx	lr
.L17:
	.align	2
.L16:
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
.L19:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L19
	mov	r2, #67108864
.L20:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L20
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L28
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L30
.L28:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L30:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L28
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	backgroundColors
	.syntax unified
	.arm
	.fpu softvfp
	.type	backgroundColors, %function
backgroundColors:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldr	r0, [r3]
	mov	r1, #0
	mov	r3, r0
	add	r2, r0, #76800
.L32:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L32
	mov	ip, #10
	mov	r1, #992
	add	r2, r0, #9600
	add	r2, r2, #20
.L33:
	sub	r3, r2, #4800
.L34:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L34
	add	ip, ip, #1
	cmp	ip, #230
	add	r2, r3, #2
	bne	.L33
	mov	ip, #10
	mov	r1, #31744
	add	r2, r0, #33536
	add	r2, r2, #84
.L37:
	sub	r3, r2, #23808
	sub	r3, r3, #192
.L36:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L36
	add	ip, ip, #1
	cmp	ip, #230
	add	r2, r2, #2
	bne	.L37
	mov	ip, #10
	mov	r1, #992
	add	r2, r0, #38400
	add	r2, r2, #20
.L38:
	sub	r3, r2, #4800
.L39:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L39
	add	ip, ip, #1
	cmp	ip, #230
	add	r2, r2, #2
	bne	.L38
	mov	ip, #10
	add	r2, r0, #66560
	ldr	r1, .L54+4
	add	r2, r2, #660
.L42:
	sub	r3, r2, #28672
	sub	r3, r3, #128
.L41:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L41
	add	ip, ip, #1
	cmp	ip, #230
	add	r2, r2, #2
	bne	.L42
	add	r2, r0, #71680
	mov	r1, #992
	mov	r0, #10
	add	r2, r2, #340
.L43:
	sub	r3, r2, #4800
.L44:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L44
	add	r0, r0, #1
	cmp	r0, #230
	add	r2, r2, #2
	bne	.L43
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	15855
	.size	backgroundColors, .-backgroundColors
	.align	2
	.global	lifeDisp
	.syntax unified
	.arm
	.fpu softvfp
	.type	lifeDisp, %function
lifeDisp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #32768
	ldr	r2, .L64
	ldr	r2, [r2]
	push	{r4, r5, r6, r7, r8, r9, lr}
	add	ip, r2, #4096
	add	r5, r2, #1296
	add	r8, r2, #1776
	add	r4, r2, #2256
	add	r7, r2, #2736
	add	r6, r2, #3216
	add	lr, r2, #3696
	strh	r3, [r5, #4]	@ movhi
	add	r1, r2, #1792
	strh	r3, [r8, #4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [ip, #84]	@ movhi
	strh	r3, [ip, #84]	@ movhi
	strh	r3, [ip, #86]	@ movhi
	strh	r3, [ip, #88]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r8, #14]	@ movhi
	add	r5, r2, #1312
	strh	r3, [r4, #14]	@ movhi
	add	r8, r2, #2272
	strh	r3, [r7, #14]	@ movhi
	add	r4, r2, #2752
	strh	r3, [r6, #14]	@ movhi
	add	r7, r2, #3232
	add	r6, r2, #3712
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [ip, #94]	@ movhi
	add	lr, r2, #1328
	strh	r3, [r5, #4]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [r8, #4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [ip, #102]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r8, #8]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	add	r1, r2, #2768
	strh	r3, [r8, #14]	@ movhi
	cmp	r0, #1
	strh	r3, [r4, #14]	@ movhi
	add	r8, r2, #1808
	strh	r3, [r7, #14]	@ movhi
	strh	r3, [r6, #14]	@ movhi
	add	r7, r2, #3248
	strh	r3, [ip, #110]	@ movhi
	add	r6, r2, #2288
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [lr]	@ movhi
	add	r5, r2, #3728
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r1]	@ movhi
	add	r4, r2, #1824
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [ip, #110]	@ movhi
	strh	r3, [ip, #112]	@ movhi
	strh	r3, [ip, #114]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [lr, #12]	@ movhi
	add	lr, r2, #3744
	strh	r3, [ip, #120]	@ movhi
	strh	r3, [ip, #122]	@ movhi
	strh	r3, [ip, #124]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r8, #8]	@ movhi
	strh	r3, [r7, #12]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	beq	.L62
	cmp	r0, #2
	beq	.L63
	cmp	r0, #3
	bne	.L56
	add	r1, r2, #1360
	strh	r3, [r1, #4]	@ movhi
	add	r6, r2, #1840
	add	r5, r2, #2320
	add	r0, r2, #2800
	add	r1, r2, #3280
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	add	r6, r2, #3760
	strh	r3, [r0, #4]	@ movhi
	add	r5, r2, #1344
	strh	r3, [r1, #4]	@ movhi
	add	r0, r2, #2304
	add	r1, r2, #2784
	add	r2, r2, #3264
	strh	r3, [r6, #4]	@ movhi
	strh	r3, [ip, #148]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [ip, #142]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r0, #8]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	strh	r3, [ip, #136]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L63:
	mov	r1, #0
	add	r0, r2, #1360
	strh	r3, [r0, #4]	@ movhi
	add	r7, r2, #1840
	add	r6, r2, #2320
	add	r5, r2, #2800
	add	r0, r2, #3280
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	add	r7, r2, #3760
	strh	r3, [r5, #4]	@ movhi
	add	r6, r2, #1344
	strh	r3, [r0, #4]	@ movhi
	add	r5, r2, #2304
	add	r0, r2, #2784
	add	r2, r2, #3264
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [ip, #148]	@ movhi
	strh	r3, [r6, #14]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [ip, #142]	@ movhi
.L61:
	strh	r1, [r6, #8]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	strh	r1, [r5, #8]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	strh	r1, [ip, #136]	@ movhi
.L56:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L62:
	mov	r1, #0
	add	r6, r2, #1360
	add	r5, r2, #1840
	add	r0, r2, #2320
	strh	r3, [r6, #4]	@ movhi
	add	r9, r2, #2800
	strh	r3, [r5, #4]	@ movhi
	add	r8, r2, #3280
	strh	r3, [r0, #4]	@ movhi
	add	r7, r2, #3760
	add	r6, r2, #1344
	add	r5, r2, #2304
	add	r0, r2, #2784
	add	r2, r2, #3264
	strh	r3, [r9, #4]	@ movhi
	strh	r3, [r8, #4]	@ movhi
	strh	r3, [r7, #4]	@ movhi
	strh	r3, [ip, #148]	@ movhi
	strh	r1, [r6, #14]	@ movhi
	strh	r1, [r4, #14]	@ movhi
	strh	r1, [r5, #14]	@ movhi
	strh	r1, [r0, #14]	@ movhi
	strh	r1, [r2, #14]	@ movhi
	strh	r1, [lr, #14]	@ movhi
	strh	r1, [ip, #142]	@ movhi
	b	.L61
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.size	lifeDisp, .-lifeDisp
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	game, .-game
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxne	lr
	ldr	r3, .L117
	ldr	ip, [r3]
	mov	r3, ip
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, .L117+4
	add	r2, ip, #76800
.L69:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L69
	mov	lr, #65
	mov	r2, #0
	add	r0, ip, #26368
	add	r1, r0, #162
.L70:
	sub	r3, r1, #4800
.L71:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L71
	add	lr, lr, #1
	cmp	lr, #68
	add	r1, r1, #2
	bne	.L70
	mov	r4, #0
	add	r3, ip, #20480
	add	lr, ip, #16384
	add	r6, r3, #284
	add	r1, r3, #764
	add	r5, lr, #2928
	add	r8, lr, #3408
	add	r7, lr, #3888
	strh	r2, [r5, #14]	@ movhi
	strh	r2, [r8, #14]	@ movhi
	add	r5, r3, #1232
	strh	r2, [r7, #14]	@ movhi
	add	r8, lr, #2944
	strh	r2, [r6, #2]	@ movhi
	add	r7, lr, #3424
	strh	r2, [r1, #2]	@ movhi
	add	r6, lr, #3904
	add	r1, r3, #288
	strh	r2, [r5, #14]	@ movhi
	strh	r2, [r8]	@ movhi
	strh	r2, [r7]	@ movhi
	strh	r2, [r6]	@ movhi
	strh	r2, [r1]	@ movhi
	add	r1, ip, #21248
	strh	r2, [r1]	@ movhi
	add	r5, r3, #1248
	add	r1, r3, #776
	add	r9, r3, #296
	add	r3, ip, #19200
	strh	r2, [r5]	@ movhi
	strh	r2, [r8, #8]	@ movhi
	strh	r2, [r7, #8]	@ movhi
	strh	r2, [r6, #8]	@ movhi
	strh	r2, [r9]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	strh	r2, [r8, #10]	@ movhi
	strh	r2, [r7, #10]	@ movhi
	strh	r2, [r6, #10]	@ movhi
	strh	r2, [r9, #2]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	add	r1, r0, #174
	add	r2, r3, #142
.L73:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L73
	mov	r1, #0
	add	r2, r3, #144
	add	r4, r0, #176
.L74:
	strh	r1, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L74
	mov	r4, #0
	add	r2, lr, #2960
	add	lr, lr, #3440
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r1, [lr, #4]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	strh	r1, [lr, #6]	@ movhi
	add	r2, r3, #152
	add	r1, r0, #184
.L75:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L75
	mov	r1, #0
	add	r2, r3, #154
	add	lr, r0, #186
.L76:
	strh	r1, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, lr
	bne	.L76
	mov	r4, #0
	add	lr, ip, #24576
	add	r5, lr, #1008
	strh	r1, [r5, #2]	@ movhi
	add	r2, lr, #1488
	add	r5, lr, #1012
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	add	r2, r3, #158
	add	r1, r0, #190
.L77:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L77
	mov	r4, #0
	add	r2, r3, #160
	add	r1, r0, #192
.L78:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L78
	mov	r4, #0
	add	r2, r3, #168
	add	r1, r0, #200
.L79:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L79
	mov	r2, #0
	add	r3, r3, #170
	add	r0, r0, #202
.L80:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L80
	add	lr, lr, #1504
	add	r3, ip, #25600
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [lr, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [lr, #6]	@ movhi
	mov	lr, #135
	mov	r2, #0
	add	r1, ip, #55296
	add	r0, r1, #174
.L81:
	sub	r3, r0, #7168
	sub	r3, r3, #32
.L82:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L82
	add	lr, lr, #1
	cmp	lr, #138
	add	r0, r0, #2
	bne	.L81
	add	r4, ip, #53248
	add	lr, ip, #49152
	add	r7, r4, #1264
	add	r3, r4, #1744
	add	r9, lr, #2480
	add	r8, lr, #2960
	add	r5, lr, #3440
	add	r0, lr, #3920
	add	r6, r4, #312
	strh	r2, [r7, #4]	@ movhi
	add	r10, r4, #792
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r7, #8]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r9, #10]	@ movhi
	strh	r2, [r8, #10]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	strh	r2, [r6, #2]	@ movhi
	add	r6, r4, #316
	strh	r2, [r10, #2]	@ movhi
	strh	r2, [r7, #10]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r9, #12]	@ movhi
	strh	r2, [r8, #12]	@ movhi
	strh	r2, [r5, #12]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	mov	r5, #0
	strh	r2, [r6]	@ movhi
	mov	r6, #146
	add	r9, r4, #1760
	add	r8, ip, #54528
	add	r10, r4, #796
	strh	r2, [r10]	@ movhi
	strh	r2, [r7, #12]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	r2, [r7, #14]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	strh	r2, [r8]	@ movhi
	strh	r2, [r9]	@ movhi
	strh	r2, [r8, #2]	@ movhi
	strh	r2, [r9, #2]	@ movhi
	add	r0, r1, #196
.L84:
	sub	r3, r0, #7168
	sub	r3, r3, #32
.L85:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L85
	add	r6, r6, #1
	cmp	r6, #149
	add	r0, r3, #2
	bne	.L84
	mov	r5, #151
	mov	r0, #0
	add	r2, r1, #206
.L88:
	sub	r3, r2, #7168
	sub	r3, r3, #32
.L87:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L87
	add	r5, r5, #1
	cmp	r5, #154
	add	r2, r3, #2
	bne	.L88
	mov	r5, #157
	mov	r2, #0
	add	r0, r1, #218
.L89:
	sub	r3, r0, #7168
	sub	r3, r3, #32
.L90:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L90
	add	r5, r5, #1
	cmp	r5, #160
	add	r0, r0, #2
	bne	.L89
	add	r3, ip, #45056
	add	r0, r3, #3264
	add	r3, r3, #3744
	strh	r2, [r0]	@ movhi
	add	r7, lr, #1088
	strh	r2, [r3]	@ movhi
	add	r5, lr, #608
	strh	r2, [lr, #128]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r0, lr, #1568
	add	r3, lr, #612
	strh	r2, [lr, #130]	@ movhi
	add	r6, ip, #51200
	strh	r2, [r5, #2]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	add	r5, lr, #2528
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r7, #4]	@ movhi
	add	r3, lr, #3008
	strh	r2, [r0, #4]	@ movhi
	add	r7, r4, #356
	add	r0, lr, #3488
	add	lr, lr, #3968
	strh	r2, [r6, #4]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r6, #6]	@ movhi
	strh	r2, [r5, #6]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	mov	r5, #165
	strh	r2, [r0, #6]	@ movhi
	strh	r2, [lr, #6]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	mov	r0, #0
	add	r3, r4, #840
	add	ip, ip, #55040
	add	r6, r4, #360
	add	r4, r4, #1312
	strh	r2, [lr, #8]	@ movhi
	strh	r2, [r6]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r2, [ip, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	add	r1, r1, #234
.L92:
	sub	r3, r1, #7168
	sub	r3, r3, #32
.L93:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L93
	add	r5, r5, #1
	cmp	r5, #168
	add	r1, r1, #2
	bne	.L92
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.word	31775
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r0, #0
	bxne	lr
	ldr	r3, .L155
	ldr	r0, [r3]
	mov	r3, r0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r1, r0, #76800
	sub	sp, sp, #20
.L121:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L121
	mov	r1, #31
	add	r2, r0, #21504
	add	r3, r2, #226
	add	r2, r2, #244
.L122:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L122
	add	r2, r0, #20480
	add	r3, r0, #24576
	add	r4, r2, #1712
	add	fp, r2, #1728
	add	lr, r2, #2192
	strh	r1, [r4, #8]	@ movhi
	add	ip, r0, #28672
	strh	r1, [r4, #10]	@ movhi
	add	r10, r2, #2672
	strh	r1, [r4, #12]	@ movhi
	add	r9, r2, #3152
	strh	r1, [r4, #14]	@ movhi
	add	r5, r2, #3632
	strh	r1, [fp]	@ movhi
	add	r8, r3, #496
	strh	r1, [lr, #6]	@ movhi
	add	r7, r3, #972
	add	r4, r3, #1440
	add	lr, r3, #2400
	add	fp, r3, #1920
	strh	r1, [r10, #4]	@ movhi
	strh	r1, [r9, #2]	@ movhi
	add	r10, r3, #2880
	strh	r1, [r5, #2]	@ movhi
	add	r9, r3, #3360
	strh	r1, [r3, #16]	@ movhi
	add	r5, r0, #28416
	strh	r1, [r8]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	add	r8, ip, #720
	strh	r1, [r4, #14]	@ movhi
	add	r7, ip, #1200
	strh	r1, [fp, #14]	@ movhi
	add	r4, ip, #1680
	strh	r1, [lr, #14]	@ movhi
	add	lr, r0, #30720
	strh	r1, [r10, #14]	@ movhi
	strh	r1, [r9, #14]	@ movhi
	strh	r1, [r5, #14]	@ movhi
	strh	r1, [ip, #238]	@ movhi
	strh	r1, [r8]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	strh	r1, [r4, #6]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	mov	r1, lr
	mov	r6, #31
	add	lr, lr, #122
	add	r1, r1, #142
.L123:
	strh	r6, [lr], #2	@ movhi
	cmp	lr, r1
	bne	.L123
	mov	lr, #31
	add	r7, ip, #1696
	add	r5, r3, #3888
	add	r8, ip, #272
	add	r1, ip, #752
	add	r4, ip, #1712
	add	r10, ip, #1232
	strh	r6, [r7, #14]	@ movhi
	add	r9, r3, #3392
	strh	r6, [r5]	@ movhi
	add	r7, r3, #2912
	strh	r6, [r8]	@ movhi
	add	r5, r3, #2432
	strh	r6, [r1]	@ movhi
	add	r8, r3, #1936
	strh	r6, [r10]	@ movhi
	add	r1, r3, #1952
	strh	r6, [r4]	@ movhi
	add	r4, r0, #25856
	strh	r6, [r9, #14]	@ movhi
	strh	r6, [r7, #10]	@ movhi
	strh	r6, [r7, #12]	@ movhi
	strh	r6, [r5, #4]	@ movhi
	strh	r6, [r5, #6]	@ movhi
	strh	r6, [r5, #8]	@ movhi
	strh	r6, [r8, #14]	@ movhi
	add	r5, r4, #214
	strh	r6, [r1]	@ movhi
	strh	r6, [r1, #2]	@ movhi
	strh	r6, [r1, #4]	@ movhi
	add	r1, r4, #196
.L124:
	strh	lr, [r1], #2	@ movhi
	cmp	r1, r5
	bne	.L124
	add	r1, r0, #29440
	mov	r10, r1
	add	r9, ip, #1248
	add	r6, ip, #1728
	str	r1, [sp, #12]
	add	r1, r3, #3904
	strh	lr, [r10, #2]	@ movhi
	add	r8, ip, #292
	strh	lr, [r9, #2]	@ movhi
	add	r7, r3, #2944
	strh	lr, [r6, #2]	@ movhi
	add	r9, r3, #3424
	strh	lr, [r1, #4]	@ movhi
	add	r6, r3, #1504
	add	r1, r3, #1984
	strh	lr, [r8]	@ movhi
	strh	lr, [r7, #6]	@ movhi
	add	r8, r3, #2464
	strh	lr, [r9, #6]	@ movhi
	add	r7, r0, #25600
	strh	lr, [r6, #8]	@ movhi
	strh	lr, [r1, #8]	@ movhi
	add	r1, r0, #26368
	strh	lr, [r8, #8]	@ movhi
	strh	lr, [r7, #10]	@ movhi
	strh	lr, [r6, #10]	@ movhi
	strh	lr, [r6, #12]	@ movhi
	mov	lr, r1
	mov	r5, #31
	add	r1, r1, #204
	add	lr, lr, #218
.L125:
	strh	r5, [r1], #2	@ movhi
	cmp	lr, r1
	bne	.L125
	mov	r1, #31
	add	r6, r3, #556
	add	lr, r2, #3696
	strh	r5, [r6]	@ movhi
	strh	r5, [r3, #78]	@ movhi
	add	r6, r2, #1776
	strh	r5, [lr]	@ movhi
	add	lr, r2, #2256
	strh	r5, [r6, #2]	@ movhi
	strh	r5, [lr, #2]	@ movhi
	add	r6, r2, #2736
	add	lr, r2, #3216
	strh	r5, [r6, #2]	@ movhi
	add	r7, r0, #16384
	strh	r5, [lr, #2]	@ movhi
	add	lr, r2, #1296
	strh	r5, [lr, #4]	@ movhi
	str	r7, [sp, #4]
	add	lr, r2, #824
	add	r7, r7, #3952
	add	r6, r2, #344
	strh	r5, [r7, #8]	@ movhi
	strh	r5, [r6]	@ movhi
	strh	r5, [lr]	@ movhi
	add	lr, r0, #20736
	add	r4, r4, #246
	add	lr, lr, #86
.L126:
	strh	r1, [lr]	@ movhi
	add	lr, lr, #480
	cmp	lr, r4
	bne	.L126
	add	lr, r0, #21248
	add	r4, lr, #126
	str	lr, [sp, #8]
	mov	lr, r4
	add	fp, r3, #1520
	add	r10, r3, #2000
	add	r7, r3, #2480
	strh	r1, [fp, #8]	@ movhi
	add	r5, r3, #2960
	strh	r1, [r10, #8]	@ movhi
	add	r9, r3, #3440
	strh	r1, [r7, #8]	@ movhi
	add	r8, r3, #3920
	add	r6, ip, #312
	add	fp, ip, #792
	add	r10, ip, #1264
	add	r7, ip, #1744
	strh	r1, [r5, #8]	@ movhi
	strh	r1, [r9, #8]	@ movhi
	add	r5, ip, #2224
	strh	r1, [r8, #10]	@ movhi
	add	r9, ip, #808
	strh	r1, [r6, #2]	@ movhi
	add	r8, r0, #29952
	strh	r1, [fp, #2]	@ movhi
	add	r6, ip, #1760
	strh	r1, [r10, #10]	@ movhi
	add	fp, r3, #3456
	strh	r1, [r7, #12]	@ movhi
	add	r10, r3, #3936
	add	r7, ip, #328
	strh	r1, [r5, #12]	@ movhi
	strh	r1, [r9]	@ movhi
	add	r5, r3, #2496
	strh	r1, [r8, #8]	@ movhi
	add	r9, r3, #2976
	strh	r1, [r6, #8]	@ movhi
	add	r8, r2, #3712
	strh	r1, [fp, #10]	@ movhi
	add	r6, r3, #588
	strh	r1, [r10, #10]	@ movhi
	add	fp, r3, #1056
	strh	r1, [r7, #2]	@ movhi
	add	r10, r0, #26112
	add	r7, r3, #2016
	strh	r1, [r5, #12]	@ movhi
	strh	r1, [r9, #12]	@ movhi
	add	r5, r2, #2288
	strh	r1, [r8, #14]	@ movhi
	add	r9, r2, #2768
	strh	r1, [r3, #110]	@ movhi
	add	r8, r2, #3248
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [fp, #14]	@ movhi
	add	r6, r2, #1808
	strh	r1, [r10, #14]	@ movhi
	add	fp, r2, #372
	strh	r1, [r7, #14]	@ movhi
	add	r10, r2, #852
	add	r7, r2, #1328
	strh	r1, [r5]	@ movhi
	strh	r1, [r9]	@ movhi
	strh	r1, [r8]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [fp]	@ movhi
	strh	r1, [r10]	@ movhi
	strh	r1, [r7, #4]	@ movhi
	strh	r1, [fp, #2]	@ movhi
	strh	r1, [r10, #2]	@ movhi
	add	r10, r2, #3728
	strh	r1, [r7, #6]	@ movhi
	strh	r1, [r6, #6]	@ movhi
	strh	r1, [r5, #6]	@ movhi
	strh	r1, [r9, #6]	@ movhi
	strh	r1, [r8, #6]	@ movhi
	strh	r1, [r10, #6]	@ movhi
	strh	r1, [r3, #120]	@ movhi
	strh	r1, [r3, #122]	@ movhi
	strh	r1, [r9, #12]	@ movhi
	strh	r1, [r8, #12]	@ movhi
	ldr	r8, [sp, #4]
	strh	r1, [r10, #12]	@ movhi
	add	r8, r8, #4000
	strh	r1, [r7, #14]	@ movhi
	add	r7, r2, #384
	strh	r1, [r6, #14]	@ movhi
	strh	r1, [r5, #14]	@ movhi
	add	r6, r2, #864
	strh	r1, [r8]	@ movhi
	add	r5, r2, #1344
	strh	r1, [r7]	@ movhi
	add	r8, r2, #1824
	add	r7, r0, #22784
	strh	r1, [r6]	@ movhi
	strh	r1, [r5]	@ movhi
	add	r6, r2, #2784
	strh	r1, [r8]	@ movhi
	add	r5, r2, #3264
	strh	r1, [r7]	@ movhi
	add	r8, r2, #3744
	add	r7, r3, #608
	strh	r1, [r6]	@ movhi
	strh	r1, [r5]	@ movhi
	add	r6, r3, #1088
	strh	r1, [r8, #2]	@ movhi
	add	r5, r3, #1568
	strh	r1, [r3, #130]	@ movhi
	add	r8, r0, #26624
	strh	r1, [r7, #2]	@ movhi
	add	r7, r3, #2528
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	add	r6, r3, #3008
	strh	r1, [r8, #2]	@ movhi
	add	r5, r3, #3488
	strh	r1, [r7, #4]	@ movhi
	add	r8, r3, #3968
	add	r7, ip, #356
	strh	r1, [r6, #4]	@ movhi
	strh	r1, [r5, #4]	@ movhi
	strh	r1, [r8, #4]	@ movhi
	add	r5, r0, #27392
	strh	r1, [r7]	@ movhi
	add	r5, r5, #222
.L127:
	mov	r1, #31	@ movhi
	strh	r1, [lr]	@ movhi
	add	lr, lr, #480
	cmp	r5, lr
	bne	.L127
	mov	r7, #31	@ movhi
	mov	r1, #31
	add	lr, r3, #3040
	strh	r7, [lr]	@ movhi
	add	r6, r3, #3520
	add	lr, ip, #384
	add	r5, r3, #4000
	strh	r7, [r6]	@ movhi
	strh	r7, [r5]	@ movhi
	strh	r7, [lr]	@ movhi
	ldr	lr, [sp, #8]
	add	lr, lr, #140
.L128:
	strh	r1, [r4], #2	@ movhi
	cmp	lr, r4
	bne	.L128
	ldr	lr, [sp, #4]
	add	r5, r2, #428
	add	r4, lr, #4048
	add	r7, r2, #432
	add	lr, r0, #25088
	strh	r1, [r5]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	strh	r1, [r7]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	strh	r1, [r4, #6]	@ movhi
	mov	r1, lr
	mov	r6, #31
	add	lr, lr, #126
	add	r1, r1, #140
.L129:
	strh	r6, [lr], #2	@ movhi
	cmp	lr, r1
	bne	.L129
	mov	r1, #31
	strh	r6, [r3, #172]	@ movhi
	strh	r6, [r3, #174]	@ movhi
	add	r3, r2, #3776
	strh	r6, [r3, #14]	@ movhi
	add	r3, r2, #3792
	add	r2, r2, #3312
	strh	r6, [r3]	@ movhi
	strh	r6, [r2]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	ldr	r2, [sp, #12]
	add	r3, r2, #96
	add	r2, r2, #122
.L130:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L130
	mov	r3, #31
	add	ip, ip, #408
	add	r2, r0, #40960
	strh	r1, [ip, #2]	@ movhi
	add	r1, r2, #30
	add	ip, r2, #44
.L131:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L131
	mov	r6, #0
	mov	r4, #31
	add	lr, r0, #36864
	add	r5, lr, #3648
	add	r10, lr, #3664
	add	r9, r2, #508
	add	r8, r2, #988
	strh	r3, [r5, #8]	@ movhi
	add	ip, r0, #45056
	strh	r3, [r5, #10]	@ movhi
	add	fp, r2, #1456
	strh	r3, [r5, #12]	@ movhi
	add	r7, r2, #1936
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r10]	@ movhi
	strh	r3, [r9, #2]	@ movhi
	add	r10, r2, #2416
	strh	r3, [r8]	@ movhi
	add	r9, r2, #2896
	add	r8, r2, #3376
	strh	r3, [fp, #10]	@ movhi
	add	r1, r0, #49152
	strh	r3, [r7, #10]	@ movhi
	add	r5, r2, #3856
	strh	r3, [r10, #10]	@ movhi
	add	r7, ip, #728
	strh	r3, [r9, #10]	@ movhi
	add	r10, ip, #1200
	strh	r3, [r8, #10]	@ movhi
	add	r9, ip, #1680
	add	r8, ip, #2160
	strh	r3, [r5, #8]	@ movhi
	add	fp, ip, #3616
	strh	r3, [ip, #248]	@ movhi
	add	r5, ip, #2640
	strh	r3, [r7]	@ movhi
	strh	r3, [r10, #8]	@ movhi
	add	r7, ip, #3120
	strh	r3, [r9, #10]	@ movhi
	add	r10, r1, #492
	strh	r3, [r8, #10]	@ movhi
	add	r9, r1, #488
	add	r8, r1, #976
	strh	r3, [r5, #12]	@ movhi
	strh	r3, [r7, #12]	@ movhi
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r7, #14]	@ movhi
	strh	r6, [r5, #14]	@ movhi
	add	r7, r1, #980
	strh	r3, [fp]	@ movhi
	add	r5, r1, #504
	strh	r3, [r1, #2]	@ movhi
	add	fp, ip, #3152
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	strh	r3, [r9]	@ movhi
	strh	r3, [r9, #2]	@ movhi
	strh	r3, [r10]	@ movhi
	add	r9, ip, #3632
	strh	r3, [r10, #2]	@ movhi
	strh	r3, [r8]	@ movhi
	add	r10, ip, #2672
	strh	r3, [r8, #2]	@ movhi
	add	r8, ip, #288
	strh	r3, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r3, [r1, #24]	@ movhi
	add	r7, r0, #45824
	strh	r3, [r5]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	r3, [r5, #2]	@ movhi
	strh	r6, [r1, #24]	@ movhi
	add	r5, ip, #1248
	strh	r3, [r9, #12]	@ movhi
	add	r1, r2, #3408
	strh	r3, [r10, #14]	@ movhi
	add	r9, ip, #1728
	strh	r3, [fp, #14]	@ movhi
	add	r10, ip, #2208
	strh	r3, [r8]	@ movhi
	add	r8, r2, #3888
	strh	r3, [r7]	@ movhi
	strh	r3, [r5]	@ movhi
	add	r7, r2, #1968
	strh	r3, [r9]	@ movhi
	add	r5, r2, #2448
	strh	r3, [r10]	@ movhi
	add	r9, r2, #2928
	strh	r3, [r1, #14]	@ movhi
	add	r10, r2, #1016
	strh	r3, [r8, #14]	@ movhi
	add	r1, r2, #1488
	add	r8, r2, #532
	strh	r3, [r7, #12]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	add	r7, lr, #3216
	strh	r3, [r9, #12]	@ movhi
	add	r5, lr, #3696
	strh	r3, [r10]	@ movhi
	add	r9, r2, #564
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r10, #2]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	add	r10, r2, #1040
	strh	r6, [r1, #8]	@ movhi
	strh	r3, [r8, #2]	@ movhi
	add	r1, r2, #1520
	add	r8, r2, #2000
	strh	r3, [r2, #50]	@ movhi
	add	fp, ip, #320
	strh	r3, [r2, #52]	@ movhi
	strh	r3, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	add	r7, r2, #2480
	add	r5, r2, #2960
	strh	r3, [r2, #84]	@ movhi
	strh	r3, [r9, #2]	@ movhi
	strh	r3, [r10, #8]	@ movhi
	add	r9, r2, #3440
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r8, #10]	@ movhi
	add	r1, r2, #3936
	add	r8, ip, #804
	strh	r3, [r7, #10]	@ movhi
	add	r10, ip, #2240
	strh	r3, [r5, #12]	@ movhi
	add	r7, ip, #1760
	strh	r3, [r9, #14]	@ movhi
	add	r5, r0, #46336
	strh	r3, [r1]	@ movhi
	add	r9, ip, #2720
	strh	r3, [fp, #2]	@ movhi
	add	r1, ip, #3200
	strh	r3, [r8]	@ movhi
	add	r8, ip, #3680
	strh	r3, [r5, #4]	@ movhi
	strh	r3, [r7, #6]	@ movhi
	strh	r3, [r10, #6]	@ movhi
	strh	r3, [r9, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r3, [r8, #10]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r8, #12]	@ movhi
	strh	r6, [r1, #12]	@ movhi
	add	r8, r2, #3472
	strh	r3, [r5, #14]	@ movhi
	strh	r3, [r7, #14]	@ movhi
	add	r7, r2, #3952
	strh	r3, [r10, #14]	@ movhi
	add	r5, ip, #336
	strh	r3, [r9, #14]	@ movhi
	add	fp, ip, #816
	strh	r3, [r1, #14]	@ movhi
	add	r10, r2, #1552
	strh	r3, [r8]	@ movhi
	add	r9, r2, #2032
	strh	r3, [r7]	@ movhi
	add	r8, r2, #2512
	add	r7, r2, #2992
	strh	r3, [r5]	@ movhi
	add	r1, r2, #1072
	strh	r3, [fp]	@ movhi
	add	r5, r2, #596
	strh	r3, [r10, #2]	@ movhi
	add	fp, lr, #2768
	strh	r3, [r9, #2]	@ movhi
	add	r10, lr, #3248
	strh	r3, [r8, #2]	@ movhi
	add	r9, lr, #3728
	strh	r3, [r7, #2]	@ movhi
	add	r8, lr, #1808
	add	r7, lr, #2288
	strh	r3, [r2, #116]	@ movhi
	strh	r3, [r5]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	add	r5, r0, #44288
	strh	r3, [fp, #6]	@ movhi
	add	r1, r0, #38144
	strh	r3, [r10, #6]	@ movhi
	strh	r3, [r9, #6]	@ movhi
	strh	r3, [r8, #8]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	strh	r3, [r8, #10]	@ movhi
	strh	r3, [r7, #10]	@ movhi
	strh	r6, [r7, #10]	@ movhi
	add	r1, r1, #68
	add	r5, r5, #164
.L132:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L132
	add	r3, r2, #3488
	strh	r4, [r3, #6]	@ movhi
	add	r5, r0, #46848
	add	r3, r0, #47104
	add	r9, r2, #3968
	add	r8, ip, #356
	add	r7, ip, #836
	add	r6, ip, #1312
	strh	r4, [r9, #6]	@ movhi
	strh	r4, [r8, #2]	@ movhi
	strh	r4, [r7, #2]	@ movhi
	strh	r4, [r6, #6]	@ movhi
	strh	r4, [r5, #6]	@ movhi
	strh	r4, [r5, #8]	@ movhi
	mov	r4, r3
	mov	r1, #31
	add	r3, r3, #232
	add	r4, r4, #254
.L133:
	strh	r1, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L133
	mov	r3, #31
	add	r4, r2, #1568
	add	r10, ip, #1808
	strh	r1, [r10, #14]	@ movhi
	add	r5, r2, #1088
	strh	r1, [r4, #6]	@ movhi
	add	r9, r2, #1104
	strh	r1, [r4, #8]	@ movhi
	add	r7, r2, #628
	add	r6, r2, #632
	add	r4, r0, #37632
	add	r8, r2, #636
	strh	r1, [r5, #10]	@ movhi
	strh	r1, [r5, #12]	@ movhi
	strh	r1, [r5, #14]	@ movhi
	strh	r1, [r9]	@ movhi
	strh	r1, [r9, #2]	@ movhi
	strh	r1, [r7]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [r8]	@ movhi
	add	r1, r4, #102
	add	r4, r4, #116
.L134:
	strh	r3, [r1], #2	@ movhi
	cmp	r4, r1
	bne	.L134
	mov	r4, #31
	add	r5, r0, #32768
	add	r6, lr, #404
	add	r10, r5, #4016
	add	r8, lr, #408
	strh	r3, [r6]	@ movhi
	add	r1, r5, #2592
	strh	r3, [r6, #2]	@ movhi
	add	r9, r5, #3552
	strh	r3, [r8]	@ movhi
	add	r7, r0, #35840
	strh	r3, [r10, #10]	@ movhi
	add	r6, r5, #4032
	add	r8, lr, #424
	add	r10, lr, #904
	strh	r3, [r1, #10]	@ movhi
	add	fp, lr, #1376
	strh	r3, [r7, #10]	@ movhi
	strh	r3, [r9, #10]	@ movhi
	add	r7, lr, #1856
	strh	r3, [r6, #10]	@ movhi
	add	r9, lr, #2336
	strh	r3, [r8, #2]	@ movhi
	strh	r3, [r10, #2]	@ movhi
	add	r8, r0, #39680
	add	r10, lr, #3296
	strh	r3, [fp, #10]	@ movhi
	add	r6, lr, #3776
	strh	r3, [r7, #12]	@ movhi
	strh	r3, [r9, #12]	@ movhi
	add	r7, r2, #652
	strh	r3, [r8, #12]	@ movhi
	add	r9, r2, #1120
	strh	r3, [r10, #12]	@ movhi
	add	r8, r2, #1616
	add	r10, r2, #2096
	strh	r3, [r6, #12]	@ movhi
	add	fp, r2, #2576
	strh	r3, [r6, #14]	@ movhi
	strh	r3, [r2, #174]	@ movhi
	add	r6, r2, #4016
	strh	r3, [r7, #2]	@ movhi
	strh	r3, [r9, #14]	@ movhi
	add	r7, r2, #3056
	strh	r3, [r8]	@ movhi
	add	r9, r2, #3536
	strh	r3, [r10]	@ movhi
	add	r8, ip, #404
	add	r10, ip, #884
	add	ip, ip, #1360
	strh	r3, [fp]	@ movhi
	strh	r3, [r7]	@ movhi
	add	fp, r5, #2608
	strh	r3, [r9, #2]	@ movhi
	add	r7, r5, #3088
	strh	r3, [r6, #2]	@ movhi
	add	r9, r5, #3568
	strh	r3, [r8]	@ movhi
	strh	r3, [r10]	@ movhi
	add	r8, r5, #4048
	strh	r3, [ip, #4]	@ movhi
	add	r10, lr, #440
	strh	r3, [r1, #10]	@ movhi
	add	ip, lr, #444
	strh	r3, [r1, #12]	@ movhi
	strh	r3, [r1, #14]	@ movhi
	add	r1, lr, #924
	strh	r3, [fp]	@ movhi
	add	r6, lr, #1392
	strh	r3, [fp, #2]	@ movhi
	strh	r3, [fp, #4]	@ movhi
	strh	r3, [r7, #6]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	strh	r3, [r9, #8]	@ movhi
	add	r7, lr, #1872
	strh	r3, [r8, #8]	@ movhi
	add	r9, lr, #2352
	strh	r3, [r10, #2]	@ movhi
	add	r8, lr, #2832
	strh	r3, [ip]	@ movhi
	add	r10, lr, #3312
	strh	r3, [r1, #2]	@ movhi
	add	r1, r0, #40448
	strh	r3, [r6, #14]	@ movhi
	strh	r3, [r7, #14]	@ movhi
	strh	r3, [r9, #12]	@ movhi
	strh	r3, [r8, #10]	@ movhi
	strh	r3, [r10, #8]	@ movhi
	add	r3, r1, #208
	add	r1, r1, #222
.L135:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L135
	mov	r6, #0
	add	r3, r2, #672
	strh	r4, [r2, #190]	@ movhi
	strh	r4, [r3]	@ movhi
	add	r3, r2, #1152
	strh	r4, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	add	r3, r2, #1632
	strh	r4, [r3, #6]	@ movhi
	add	r3, r2, #2112
	strh	r4, [r3, #8]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	add	r3, r2, #2592
	strh	r4, [r3, #12]	@ movhi
	add	r1, r2, #3568
	add	r3, r2, #3088
	add	r0, r0, #44032
	strh	r4, [r0, #14]	@ movhi
	add	ip, r2, #2128
	strh	r4, [r1]	@ movhi
	add	r0, r2, #1168
	strh	r4, [r3, #8]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r1, #10]	@ movhi
	strh	r6, [r3, #10]	@ movhi
	add	r1, r2, #1648
	add	r3, r2, #692
	strh	r4, [ip, #8]	@ movhi
	strh	r4, [r0, #6]	@ movhi
	strh	r4, [r1, #6]	@ movhi
	add	r0, lr, #1904
	strh	r4, [r2, #212]	@ movhi
	add	r1, lr, #2384
	strh	r4, [r3]	@ movhi
	add	r2, lr, #2864
	add	r3, lr, #3344
	strh	r4, [r0, #2]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	add	r0, lr, #3824
	strh	r4, [r2, #2]	@ movhi
	add	r1, r5, #2640
	strh	r4, [r3, #2]	@ movhi
	add	r2, r5, #3120
	add	r3, r5, #3600
	strh	r4, [r0, #2]	@ movhi
	strh	r4, [r1]	@ movhi
	add	r0, r5, #4080
	strh	r4, [r2]	@ movhi
	add	r1, lr, #464
	strh	r4, [r3]	@ movhi
	add	r2, lr, #944
	add	r3, r5, #1664
	add	lr, lr, #1424
	add	r5, r5, #2144
	strh	r4, [r0]	@ movhi
	strh	r4, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r4, [lr]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	strh	r4, [r5, #14]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	.LANCHOR0
	.size	lose, .-lose
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
