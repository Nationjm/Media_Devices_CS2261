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
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L7+8
	mov	r0, #1
	ldr	r4, .L7+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L7+16
	ldr	r3, .L7+20
	strh	r8, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L7+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+28
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+32
	ldr	r3, .L7+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r8, [r4, #24]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
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
	.size	playSong, .-playSong
	.align	2
	.global	stopSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSong, %function
stopSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L10
	ldr	r2, .L10+4
	strh	r3, [r1, #2]	@ movhi
	ldr	r2, [r2]
	ldr	r1, .L10+8
	str	r3, [r2, #20]
	str	r3, [r1, #8]
	bx	lr
.L11:
	.align	2
.L10:
	.word	67109120
	.word	dma
	.word	song
	.size	stopSong, .-stopSong
	.align	2
	.global	playSoundEffect
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundEffect, %function
playSoundEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L14+8
	mov	r5, r1
	mov	r6, r0
	mov	r1, r0
	ldr	r2, .L14+12
	mov	r0, #2
	ldr	r4, .L14+16
	mov	lr, pc
	bx	r4
	mov	r7, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L14+20
	ldr	r3, .L14+24
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L14+28
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L14+32
	adr	r3, .L14
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L14+36
	ldr	r3, .L14+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #24]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	3
.L14:
	.word	1443109011
	.word	1078844686
	.word	-1237319680
	.word	67109028
	.word	DMANow
	.word	soundEffect
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundEffect, .-playSoundEffect
	.align	2
	.global	stopSoundEffect
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSoundEffect, %function
stopSoundEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L17
	ldr	r2, .L17+4
	strh	r3, [r1, #6]	@ movhi
	ldr	r2, [r2]
	ldr	r1, .L17+8
	str	r3, [r2, #32]
	str	r3, [r1, #8]
	bx	lr
.L18:
	.align	2
.L17:
	.word	67109120
	.word	dma
	.word	soundEffect
	.size	stopSoundEffect, .-stopSoundEffect
	.comm	STATE,1,1
	.comm	soundEffect,28,4
	.comm	song,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
