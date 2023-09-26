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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r4, #67108864
	mov	r2, #100663296
	mvn	r0, #32768
	str	lr, [sp, #-4]!
	mov	ip, #31
	mov	lr, #31744
	mov	r1, #992
	ldr	r3, .L7
	mov	r5, r3
	ldr	r6, .L7+4
	strh	r6, [r4]	@ movhi
	strh	r0, [r2]	@ movhi
	ldr	r0, .L7+8
	add	r2, r2, #256
	strh	ip, [r2, #224]	@ movhi
	ldr	r4, .L7+12
	strh	lr, [r0, #192]	@ movhi
	ldr	ip, .L7+16
	ldr	lr, .L7+20
	add	r2, r2, #1024
	strh	r1, [r2, #160]	@ movhi
	add	r0, r0, #19456
	add	r2, r2, #19968
	ldr	r1, .L7+24
	strh	r3, [ip, #200]	@ movhi
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r0, #136]	@ movhi
	strh	r3, [lr, #104]	@ movhi
	strh	r3, [r2, #72]	@ movhi
	strh	r3, [r0, #138]	@ movhi
	strh	r3, [ip, #204]	@ movhi
	strh	r3, [r4, #172]	@ movhi
	strh	r3, [r0, #140]	@ movhi
	strh	r3, [lr, #108]	@ movhi
	strh	r3, [r2, #76]	@ movhi
	strh	r3, [ip, #208]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r0, #144]	@ movhi
	strh	r3, [lr, #112]	@ movhi
	strh	r3, [r2, #80]	@ movhi
	strh	r3, [ip, #208]	@ movhi
	strh	r3, [ip, #210]	@ movhi
	strh	r3, [ip, #212]	@ movhi
	strh	r3, [r0, #144]	@ movhi
	strh	r3, [r0, #146]	@ movhi
	strh	r3, [r0, #148]	@ movhi
	strh	r3, [r2, #80]	@ movhi
	strh	r3, [r2, #82]	@ movhi
	strh	r3, [r2, #84]	@ movhi
	strh	r3, [ip, #216]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	strh	r3, [r0, #152]	@ movhi
	strh	r3, [lr, #120]	@ movhi
	strh	r3, [r2, #88]	@ movhi
	strh	r3, [r2, #88]	@ movhi
	strh	r3, [r2, #90]	@ movhi
	strh	r3, [r2, #92]	@ movhi
	strh	r3, [ip, #224]	@ movhi
	strh	r3, [r4, #192]	@ movhi
	strh	r3, [r0, #160]	@ movhi
	strh	r3, [lr, #128]	@ movhi
	strh	r3, [r2, #96]	@ movhi
	strh	r3, [r2, #96]	@ movhi
	strh	r3, [r2, #98]	@ movhi
	strh	r3, [r2, #100]	@ movhi
	strh	r3, [ip, #232]	@ movhi
	strh	r3, [r4, #200]	@ movhi
	strh	r3, [r0, #168]	@ movhi
	strh	r3, [lr, #136]	@ movhi
	strh	r3, [r2, #104]	@ movhi
	strh	r3, [ip, #234]	@ movhi
	strh	r3, [r2, #106]	@ movhi
	strh	r3, [ip, #236]	@ movhi
	strh	r3, [r4, #204]	@ movhi
	add	ip, ip, #5376
	strh	r3, [r0, #172]	@ movhi
	strh	r3, [lr, #140]	@ movhi
	add	r0, r0, #4864
	strh	r3, [r2, #108]	@ movhi
	add	lr, lr, #5376
	add	r2, r2, #4352
	strh	r3, [r1, #136]	@ movhi
	strh	r3, [ip, #104]	@ movhi
	strh	r3, [r0, #72]	@ movhi
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [r2, #44]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [r1, #144]	@ movhi
	strh	r3, [ip, #112]	@ movhi
	strh	r3, [r0, #80]	@ movhi
	strh	r3, [r1, #148]	@ movhi
	strh	r3, [ip, #116]	@ movhi
	strh	r3, [r0, #84]	@ movhi
	strh	r3, [r2, #52]	@ movhi
	strh	r3, [r1, #150]	@ movhi
	strh	r3, [lr, #22]	@ movhi
	strh	r3, [r1, #152]	@ movhi
	strh	r3, [ip, #120]	@ movhi
	strh	r3, [r0, #88]	@ movhi
	strh	r3, [r2, #56]	@ movhi
	strh	r3, [r1, #156]	@ movhi
	strh	r3, [ip, #124]	@ movhi
	strh	r3, [r0, #92]	@ movhi
	strh	r3, [r2, #60]	@ movhi
	strh	r3, [r1, #158]	@ movhi
	strh	r3, [r0, #94]	@ movhi
	strh	r3, [r1, #160]	@ movhi
	strh	r3, [r2, #64]	@ movhi
	strh	r3, [r1, #164]	@ movhi
	strh	r3, [ip, #132]	@ movhi
	strh	r3, [r0, #100]	@ movhi
	strh	r3, [r2, #68]	@ movhi
	strh	r3, [lr, #38]	@ movhi
	strh	r3, [r1, #170]	@ movhi
	strh	r3, [ip, #138]	@ movhi
	strh	r3, [r0, #106]	@ movhi
	strh	r3, [r2, #74]	@ movhi
	strh	r3, [r1, #172]	@ movhi
	add	r2, r2, #1472
	strh	r3, [lr, #44]	@ movhi
	add	r1, r1, #3056
	strh	r3, [ip, #142]	@ movhi
	strh	r3, [r0, #110]	@ movhi
	add	r2, r2, #8
	add	r1, r1, #2
.L2:
	strh	r5, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L2
.L3:
	b	.L3
.L8:
	.align	2
.L7:
	.word	5471
	.word	1027
	.word	100664064
	.word	100683008
	.word	100682496
	.word	100684032
	.word	100687360
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	add	r0, r0, #50331648
	lsl	r0, r0, #1
	strh	r2, [r0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r2
	bxgt	lr
	rsb	ip, r0, r0, lsl #4
	add	r0, r2, ip, lsl #4
	add	r0, r0, #50331648
	add	r2, r1, ip, lsl #4
	add	r0, r0, #1
	add	r2, r2, #50331648
	lsl	r1, r0, #1
	lsl	r2, r2, #1
.L12:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L12
	bx	lr
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
	@ link register save eliminated.
	cmp	r1, r2
	bxge	lr
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	rsb	ip, r2, r2, lsl #4
	add	r0, r0, #50331648
	add	r2, r1, #50331648
	add	r1, r0, ip, lsl #4
	lsl	r2, r2, #1
	lsl	r1, r1, #1
.L16:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L16
	bx	lr
	.size	drawVerticalLine, .-drawVerticalLine
	.ident	"GCC: (devkitARM release 53) 9.1.0"
