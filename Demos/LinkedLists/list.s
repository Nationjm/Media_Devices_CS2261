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
	.file	"list.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"list is null :(\000"
	.text
	.align	2
	.global	createList
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	createList, %function
createList:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L7
	push	{r4, lr}
	mov	r0, #8
	mov	lr, pc
	bx	r3
	subs	r4, r0, #0
	movne	r3, #0
	strne	r3, [r4]
	strne	r3, [r4, #4]
	beq	.L6
.L1:
	mov	r0, r4
	pop	{r4, lr}
	bx	lr
.L6:
	ldr	r0, .L7+4
	ldr	r3, .L7+8
	mov	lr, pc
	bx	r3
	b	.L1
.L8:
	.align	2
.L7:
	.word	malloc
	.word	.LC0
	.word	mgba_printf
	.size	createList, .-createList
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"node is null :(\000"
	.text
	.align	2
	.global	pushBack
	.syntax unified
	.arm
	.fpu softvfp
	.type	pushBack, %function
pushBack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #32
	mov	r6, r0
	add	r0, sp, #4
	stm	r0, {r1, r2, r3}
	ldm	r0, {r0, r1, r2}
	add	r5, sp, #20
	stm	r5, {r0, r1, r3}
	mov	r0, #20
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	subs	r4, r0, #0
	beq	.L15
	mov	ip, #0
	ldm	r5, {r0, r1, r2}
	add	r3, r4, #8
	stm	r3, {r0, r1, r2}
	str	ip, [r4, #4]
	str	ip, [r4]
.L11:
	ldr	r3, [r6]
	cmp	r3, #0
	ldrne	r3, [r6, #4]
	streq	r4, [r6]
	strne	r4, [r3, #4]
	strne	r3, [r4]
	str	r4, [r6, #4]
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	b	.L11
.L17:
	.align	2
.L16:
	.word	malloc
	.word	.LC1
	.word	mgba_printf
	.size	pushBack, .-pushBack
	.ident	"GCC: (devkitARM release 53) 9.1.0"
