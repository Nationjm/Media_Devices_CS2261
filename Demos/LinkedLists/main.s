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
	.global	drawCurrentLab
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurrentLab, %function
drawCurrentLab:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r3, .L4+8
	ldr	r1, [r2, #8]
	mov	r0, #3
	ldr	r2, [r3]
	ldr	r5, .L4+12
	mov	r3, #38400
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	mov	r1, #10
	ldrh	r3, [r2, #18]
	ldr	r4, .L4+16
	mov	r0, #102
	add	r2, r2, #12
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	currentNode
	.word	waitForVBlank
	.word	videoBuffer
	.word	DMANow
	.word	drawString3
	.size	drawCurrentLab, .-drawCurrentLab
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, r5, r6, lr}
	ldr	r1, .L8
	sub	sp, sp, #144
	ldr	r3, .L8+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, sp
	mov	ip, r0
	ldr	r4, .L8+8
	ldm	r4, {r0, r1, r2}
	stm	r3, {r0, r1, r2}
	ldr	r5, .L8+12
	mov	r0, ip
	ldr	r6, .L8+16
	ldm	r3, {r1, r2, r3}
	str	ip, [r5]
	mov	lr, pc
	bx	r6
	add	r3, r4, #12
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #12
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #24
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #24
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #36
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #36
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #48
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #48
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #60
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #60
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #72
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #72
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #84
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #84
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #96
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #96
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #108
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #108
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	add	r3, r4, #120
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #120
	stm	r3, {r0, r1, r2}
	add	r4, r4, #132
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	ldm	r4, {r0, r1, r2}
	add	r3, sp, #132
	stm	r3, {r0, r1, r2}
	ldr	r0, [r5]
	ldm	r3, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	ldr	r2, [r5]
	ldr	r3, .L8+20
	ldr	r2, [r2]
	str	r2, [r3]
	add	sp, sp, #144
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	drawCurrentLab
.L9:
	.align	2
.L8:
	.word	1027
	.word	createList
	.word	.LANCHOR0
	.word	labsList
	.word	pushBack
	.word	currentNode
	.size	initialize, .-initialize
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
	ldr	r4, .L29
	ldr	r7, .L29+4
	ldr	r3, .L29+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L29+12
	ldrh	r2, [r4]
	ldr	r1, [r7]
	ldr	r8, .L29+16
	ldr	r6, .L29+20
.L11:
	strh	r2, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	tst	r2, #32
	strh	r3, [r4]	@ movhi
	beq	.L12
	tst	r3, #32
	bne	.L12
	ldr	r3, [r1]
	cmp	r3, #0
	strne	r3, [r7]
	mov	lr, pc
	bx	r8
	ldrh	r2, [r5]
	ldrh	r3, [r4]
	ldr	r1, [r7]
.L12:
	tst	r2, #16
	beq	.L14
	tst	r3, #16
	bne	.L14
	ldr	r3, [r1, #4]
	cmp	r3, #0
	strne	r3, [r7]
	mov	lr, pc
	bx	r8
	ldrh	r3, [r4]
	ldr	r1, [r7]
.L14:
	mov	r2, r3
	b	.L11
.L30:
	.align	2
.L29:
	.word	buttons
	.word	currentNode
	.word	initialize
	.word	oldButtons
	.word	drawCurrentLab
	.word	67109120
	.size	main, .-main
	.comm	currentNode,4,4
	.comm	labsList,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC12:
	.word	lab00Bitmap
	.ascii	"Lab00\000"
	.short	32767
.LC13:
	.word	Lab01Bitmap
	.ascii	"Lab01\000"
	.short	31775
.LC14:
	.word	lab02Bitmap
	.ascii	"Lab02\000"
	.short	31744
.LC15:
	.word	lab03Bitmap
	.ascii	"Lab03\000"
	.short	31
.LC16:
	.word	lab04Bitmap
	.ascii	"Lab04\000"
	.short	992
.LC17:
	.word	lab05Bitmap
	.ascii	"Lab05\000"
	.short	32736
.LC18:
	.word	lab06Bitmap
	.ascii	"Lab06\000"
	.short	32767
.LC19:
	.word	lab07Bitmap
	.ascii	"Lab07\000"
	.short	32767
.LC20:
	.word	lab08Bitmap
	.ascii	"Lab08\000"
	.short	1023
.LC21:
	.word	lab09Bitmap
	.ascii	"Lab09\000"
	.short	1023
.LC22:
	.word	lab10Bitmap
	.ascii	"Lab10\000"
	.short	31
.LC23:
	.word	lab11Bitmap
	.ascii	"Lab11\000"
	.short	32767
	.ident	"GCC: (devkitARM release 53) 9.1.0"
