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
	.file	"digitalSound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r2, #0
	ldr	r1, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1274
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r1, r0
	ldr	r2, .L11+8
	mov	r0, #1
	ldr	r4, .L11+12
	mov	lr, pc
	bx	r4
	mov	r7, #0
	mov	r3, #1
	mvn	r1, #1520
	mov	r2, #128
	ldr	r4, .L11+16
	ldr	r8, .L11+20
	mov	r0, r5
	strh	r7, [r8, #2]	@ movhi
	strh	r1, [r8]	@ movhi
	strh	r2, [r8, #2]	@ movhi
	str	r5, [r4, #4]
	str	r3, [r4, #12]
	str	r3, [r4, #8]
	ldr	r2, .L11+24
	str	r6, [r4]
	mov	lr, pc
	bx	r2
	ldr	r5, .L11+28
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L11+32
	ldr	r3, .L11+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L11+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+44
	ldrh	r3, [r3]
	cmp	r3, #7
	ldrne	r3, .L11+48
	ldrne	r3, [r3]
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	strhne	r7, [r8, #2]	@ movhi
	strne	r7, [r4, #8]
	strne	r7, [r3, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	song
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.word	state
	.word	dma
	.size	playSong, .-playSong
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L14
	ldr	r2, .L14+4
	strh	r3, [r1, #2]	@ movhi
	ldr	r2, [r2]
	ldr	r1, .L14+8
	str	r3, [r2, #20]
	str	r3, [r1, #8]
	bx	lr
.L15:
	.align	2
.L14:
	.word	67109120
	.word	dma
	.word	song
	.size	stopSounds, .-stopSounds
	.comm	STATE,1,1
	.comm	soundEffect,24,4
	.comm	song,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
