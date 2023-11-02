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
	ldr	r3, .L19
	strh	r2, [r3, #8]	@ movhi
	ldrh	r2, [r3, #2]
	tst	r2, #8192
	bne	.L16
	ldrh	r2, [r3, #2]
	tst	r2, #2
	bne	.L17
	ldrh	r3, [r3, #2]
	tst	r3, #1
	push	{r4, lr}
	bne	.L18
.L7:
	mov	r1, #1
	ldr	r3, .L19
	ldrh	r2, [r3, #2]
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	.syntax divided
@ 74 "main.c" 1
	swi 0x02 << 16
@ 0 "" 2
	.arm
	.syntax unified
	pop	{r4, lr}
	bx	lr
.L17:
	mov	r3, #67108864
	ldrh	r2, [r3, #6]
	cmp	r2, #159
	beq	.L14
	ldrh	r3, [r3, #6]
	cmp	r3, #79
	beq	.L14
.L6:
	mov	r1, #2
	mov	r2, #1
	ldr	r3, .L19
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L16:
	mov	r3, #83886080
	mov	r2, #31
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L14:
	mov	r3, #83886080
	ldr	r0, .L19+4
	ldrh	r1, [r3]
	eor	r1, r1, r0
	strh	r1, [r3]	@ movhi
	ldrh	r2, [r3, #2]
	eor	r2, r2, r0
	strh	r2, [r3, #2]	@ movhi
	b	.L6
.L18:
	mov	lr, #1
	ldr	ip, .L19+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L19+12
	ldr	r4, .L19+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	b	.L7
.L20:
	.align	2
.L19:
	.word	67109376
	.word	32767
	.word	enableInput
	.word	shadowOAM
	.word	DMANow
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setSpritePixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setSpritePixel, %function
setSpritePixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	strb	r3, [sp, #7]
	add	r1, r0, r1, lsl #3
	ldr	ip, .L29
	asr	r1, r1, #2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	add	r1, r1, #32768
	add	r2, r1, r2, lsl #4
	ldr	r1, [ip]
	rsbs	ip, r0, #0
	and	r3, r3, #15
	and	ip, ip, #3
	and	r0, r0, #3
	strb	r3, [sp, #7]
	rsbpl	r0, ip, #0
	lsl	r2, r2, #1
	ands	r0, r0, #255
	ldrh	r3, [r1, r2]
	bne	.L22
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	bic	r3, r3, #15
	orr	r3, r3, r0
	strh	r3, [r1, r2]	@ movhi
.L21:
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L22:
	cmp	r0, #1
	beq	.L27
	cmp	r0, #2
	beq	.L28
	cmp	r0, #3
	bne	.L21
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #20
	lsr	r3, r3, #20
	orr	r3, r3, r0, lsl #12
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1, r2]	@ movhi
	b	.L21
.L27:
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	bic	r3, r3, #240
	orr	r3, r3, r0, lsl #4
	strh	r3, [r1, r2]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L28:
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	bic	r3, r3, #3840
	orr	r3, r3, r0, lsl #8
	strh	r3, [r1, r2]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
	.word	videoBuffer
	.size	setSpritePixel, .-setSpritePixel
	.align	2
	.global	enableVBlankInterrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableVBlankInterrupt, %function
enableVBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldr	r1, .L32
	ldrh	r3, [r1]
	orr	r3, r3, #1
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2, #4]
	orr	r3, r3, #8
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	67109376
	.size	enableVBlankInterrupt, .-enableVBlankInterrupt
	.align	2
	.global	enableHBlankInterrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableHBlankInterrupt, %function
enableHBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldr	r1, .L35
	ldrh	r3, [r1]
	orr	r3, r3, #2
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2, #4]
	orr	r3, r3, #16
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	67109376
	.size	enableHBlankInterrupt, .-enableHBlankInterrupt
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
	mov	r1, #0
	mov	r2, #67108864
	mov	r0, #1
	ldr	r3, .L39
	str	lr, [sp, #-4]!
	strh	r1, [r3, #8]	@ movhi
	ldrh	r1, [r3]
	orr	r1, r1, #2
	strh	r1, [r3]	@ movhi
	ldrh	r1, [r2, #4]
	orr	r1, r1, #16
	strh	r1, [r2, #4]	@ movhi
	ldrh	r1, [r3]
	orr	r1, r1, r0
	strh	r1, [r3]	@ movhi
	ldrh	r1, [r2, #4]
	ldr	lr, .L39+4
	ldr	ip, .L39+8
	orr	r1, r1, #8
	strh	r1, [r2, #4]	@ movhi
	str	lr, [ip, #4092]
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L70
	mov	r1, #512
	mov	r3, r4
	add	r2, r4, #1024
.L42:
	strh	r1, [r3], #8	@ movhi
	cmp	r2, r3
	bne	.L42
	mov	r7, #67108864
	mov	r1, #83886080
	mov	r0, #5120
	mov	r5, #31
	mov	r2, #0
	ldr	r3, .L70+4
	strh	r0, [r7]	@ movhi
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r1]
	ldr	ip, .L70+8
	ldr	r0, .L70+12
	ldr	r6, .L70+16
	ldr	lr, .L70+20
	eor	r3, r3, #32512
	eor	r3, r3, #255
	strh	r3, [r1, #2]	@ movhi
	strh	r5, [r1, #4]	@ movhi
	ldr	r3, .L70+24
	strh	r0, [ip, #2]	@ movhi
	ldr	r5, .L70+28
	strh	r6, [ip, #4]	@ movhi
	ldr	r1, .L70+32
	strh	lr, [ip, #6]	@ movhi
	ldr	r0, .L70+36
	ldr	lr, .L70+40
	strh	r5, [ip, #8]	@ movhi
	strh	r1, [ip, #10]	@ movhi
	ldr	r5, .L70+44
	strh	r0, [ip, #12]	@ movhi
	mov	r1, r2
	strh	r3, [ip, #14]	@ movhi
	mov	r0, r2
	strh	lr, [ip, #16]	@ movhi
	mov	r3, #1
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r3, #2
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #2
	mov	r3, #3
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #3
	mov	r3, #4
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #4
	mov	r3, #5
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #5
	mov	r3, #6
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #6
	mov	r3, #7
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r1, #7
	mov	r3, #8
	mov	r0, r1
	mov	r2, #0
	mov	lr, pc
	bx	r5
	mov	r3, #1
	mov	r1, #0
	mov	r2, r3
	mov	r0, #7
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r3, #2
	mov	r1, r2
	mov	r0, #6
	mov	lr, pc
	bx	r5
	mov	r3, #3
	mov	r2, #1
	mov	r1, #2
	mov	r0, #5
	mov	lr, pc
	bx	r5
	mov	r3, #4
	mov	r2, #1
	mov	r0, r3
	mov	r1, #3
	mov	lr, pc
	bx	r5
	mov	r3, #5
	mov	r2, #1
	mov	r1, #4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #6
	mov	r2, #1
	mov	r1, #5
	mov	r0, #2
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r3, #7
	mov	r0, r2
	mov	r1, #6
	mov	lr, pc
	bx	r5
	mov	r3, #8
	mov	r2, #1
	mov	r1, #7
	mov	r0, #0
	mov	lr, pc
	bx	r5
	mov	r3, #1
	mov	r2, #32
	mov	r1, #7
	mov	r0, #0
	mov	lr, pc
	bx	r5
	mov	r3, #2
	mov	r2, #32
	mov	r1, #6
	mov	r0, #1
	mov	lr, pc
	bx	r5
	mov	r3, #3
	mov	r2, #32
	mov	r1, #5
	mov	r0, #2
	mov	lr, pc
	bx	r5
	mov	r3, #4
	mov	r2, #32
	mov	r1, r3
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #5
	mov	r2, #32
	mov	r1, #3
	mov	r0, #4
	mov	lr, pc
	bx	r5
	mov	r3, #6
	mov	r2, #32
	mov	r1, #2
	mov	r0, #5
	mov	lr, pc
	bx	r5
	mov	r3, #7
	mov	r2, #32
	mov	r1, #1
	mov	r0, #6
	mov	lr, pc
	bx	r5
	mov	r3, #8
	mov	r2, #32
	mov	r1, #0
	mov	r0, #7
	mov	lr, pc
	bx	r5
	mov	r1, #7
	mov	r3, #1
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r1, #6
	mov	r3, #2
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r1, #5
	mov	r3, #3
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r3, #4
	mov	r2, #33
	mov	r1, r3
	mov	r0, r3
	mov	lr, pc
	bx	r5
	mov	r1, #3
	mov	r3, #5
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r1, #2
	mov	r3, #6
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r3, #7
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r3, #8
	mov	r0, r1
	mov	r2, #33
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L70+48
	strh	r2, [r3, #8]	@ movhi
	mov	r6, r2
	mov	r8, r2
	mov	r10, r2
	ldrh	r2, [r3]
	orr	r2, r2, #2
	strh	r2, [r3]	@ movhi
	ldrh	r2, [r7, #4]
	orr	r2, r2, #16
	strh	r2, [r7, #4]	@ movhi
	ldrh	r2, [r3]
	orr	r2, r2, r1
	strh	r2, [r3]	@ movhi
	ldrh	r2, [r7, #4]
	orr	r2, r2, #8
	strh	r2, [r7, #4]	@ movhi
	ldr	r0, .L70+52
	ldr	r2, .L70+56
	strh	r1, [r3, #8]	@ movhi
	ldr	fp, .L70+60
	str	r2, [r0, #4092]
	ldr	r7, .L70+64
	ldr	r5, .L70+68
	ldr	r9, .L70+72
	b	.L50
.L69:
	ldr	r3, [fp]
	cmp	r3, #0
	addne	r6, r6, #1
	beq	.L43
.L44:
	ldrh	r3, [r5, #48]
	tst	r3, #16
	bne	.L47
.L51:
	add	r8, r8, #1
.L49:
	rsb	r2, r8, #200
	and	r2, r2, r9
	and	r3, r8, r9
	and	r1, r6, #255
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	strh	r10, [r4, #4]	@ movhi
	strh	r10, [r4, #12]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r7
.L50:
	ldrh	r3, [r5, #48]
	tst	r3, #128
	beq	.L69
.L43:
	ldrh	r3, [r5, #48]
	tst	r3, #64
	bne	.L45
	ldr	r3, [fp]
	cmp	r3, #0
	subne	r6, r6, #1
	bne	.L44
	ldrh	r3, [r5, #48]
	tst	r3, #16
	bne	.L47
.L48:
	ldrh	r3, [r5, #48]
	b	.L49
.L47:
	ldrh	r3, [r5, #48]
	tst	r3, #32
	bne	.L49
	ldr	r3, [fp]
	cmp	r3, #0
	subne	r8, r8, #1
	b	.L49
.L45:
	ldrh	r3, [r5, #48]
	tst	r3, #16
	bne	.L47
	ldr	r3, [fp]
	cmp	r3, #0
	beq	.L48
	b	.L51
.L71:
	.align	2
.L70:
	.word	shadowOAM
	.word	30402
	.word	83886592
	.word	10570
	.word	12684
	.word	14798
	.word	23254
	.word	16912
	.word	19026
	.word	21140
	.word	25368
	.word	setSpritePixel
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	enableInput
	.word	waitForVBlank
	.word	67109120
	.word	511
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
