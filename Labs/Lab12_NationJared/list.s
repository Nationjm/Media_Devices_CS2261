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
	.ascii	"node is null\000"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	createNode, %function
createNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #12
	mov	r5, sp
	ldr	r3, .L7
	stm	r5, {r0, r1}
	mov	r0, #16
	mov	lr, pc
	bx	r3
	subs	r4, r0, #0
	beq	.L6
	mov	r3, #0
	ldm	r5, {r0, r1}
	add	r2, r4, #8
	stm	r2, {r0, r1}
	str	r3, [r4, #4]
	str	r3, [r4]
.L1:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
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
	.size	createNode, .-createNode
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"list is null\000"
	.text
	.align	2
	.global	createList
	.syntax unified
	.arm
	.fpu softvfp
	.type	createList, %function
createList:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	push	{r4, lr}
	mov	r0, #8
	mov	lr, pc
	bx	r3
	subs	r4, r0, #0
	movne	r3, #0
	strne	r3, [r4]
	strne	r3, [r4, #4]
	beq	.L13
.L9:
	mov	r0, r4
	pop	{r4, lr}
	bx	lr
.L13:
	ldr	r0, .L14+4
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	b	.L9
.L15:
	.align	2
.L14:
	.word	malloc
	.word	.LC1
	.word	mgba_printf
	.size	createList, .-createList
	.align	2
	.global	pushFront
	.syntax unified
	.arm
	.fpu softvfp
	.type	pushFront, %function
pushFront:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #8
	mov	r3, sp
	stm	r3, {r1, r2}
	mov	r4, r0
	ldm	r3, {r0, r1}
	bl	createNode
	ldr	r3, [r4]
	cmp	r3, #0
	strne	r3, [r0, #4]
	streq	r0, [r4, #4]
	strne	r0, [r3]
	str	r0, [r4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
	.size	pushFront, .-pushFront
	.align	2
	.global	pushBack
	.syntax unified
	.arm
	.fpu softvfp
	.type	pushBack, %function
pushBack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #8
	mov	r3, sp
	mov	r4, r0
	stm	r3, {r1, r2}
	ldm	r3, {r0, r1}
	bl	createNode
	ldr	r3, [r4]
	cmp	r3, #0
	ldrne	r3, [r4, #4]
	streq	r0, [r4]
	strne	r0, [r3, #4]
	strne	r3, [r0]
	str	r0, [r4, #4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
	.size	pushBack, .-pushBack
	.align	2
	.global	popFront
	.syntax unified
	.arm
	.fpu softvfp
	.type	popFront, %function
popFront:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, [r1]
	cmp	r0, #0
	streq	r0, [r4]
	streq	r0, [r4, #4]
	beq	.L24
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movne	r2, #0
	add	r5, r0, #8
	ldm	r5, {r5, r6}
	str	r3, [r1]
	streq	r3, [r1, #4]
	strne	r2, [r3]
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	stm	r4, {r5, r6}
.L24:
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	free
	.size	popFront, .-popFront
	.align	2
	.global	popBack
	.syntax unified
	.arm
	.fpu softvfp
	.type	popBack, %function
popBack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	beq	.L33
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L33
	ldr	r3, [r0]
	cmp	r3, #0
	movne	r2, #0
	add	r5, r0, #8
	ldm	r5, {r5, r6}
	str	r3, [r1, #4]
	streq	r3, [r1]
	strne	r2, [r3, #4]
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	mov	r0, r4
	stm	r4, {r5, r6}
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4]
	str	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	free
	.size	popBack, .-popBack
	.align	2
	.global	size
	.syntax unified
	.arm
	.fpu softvfp
	.type	size, %function
size:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L47
	mov	r0, #0
.L46:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	add	r0, r0, #1
	bne	.L46
	bx	lr
.L47:
	mov	r0, r3
	bx	lr
	.size	size, .-size
	.align	2
	.global	deleteList
	.syntax unified
	.arm
	.fpu softvfp
	.type	deleteList, %function
deleteList:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #8
	beq	.L51
.L52:
	mov	r1, r4
	mov	r0, sp
	bl	popFront
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L52
.L51:
	mov	r0, r4
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	free
	.size	deleteList, .-deleteList
	.align	2
	.global	updateNodePositions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNodePositions, %function
updateNodePositions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r2, [r3]
	cmp	r2, #0
	bxeq	lr
.L62:
	ldr	ip, [r2]
	add	r0, r2, #8
	ldm	r0, {r0, r1}
	add	r3, r3, #8
	cmp	ip, #0
	stm	r3, {r0, r1}
	mov	r3, r2
	bxeq	lr
	mov	r2, ip
	b	.L62
	.size	updateNodePositions, .-updateNodePositions
	.ident	"GCC: (devkitARM release 53) 9.1.0"
