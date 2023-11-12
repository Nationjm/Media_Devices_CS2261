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
	.file	"play.c"
	.text
	.align	2
	.global	initProgressBar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initProgressBar, %function
initProgressBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r3, #73
	ldr	r1, .L6
	ldr	ip, .L6+4
	ldr	r0, .L6+8
	str	r2, [r1]
	str	r2, [ip]
	str	r2, [r0]
	ldr	r1, .L6+12
.L2:
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	add	r2, r3, #288
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #85
	strh	r0, [r1, r2]	@ movhi
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	progress
	.word	minute
	.word	second
	.word	100712448
	.size	initProgressBar, .-initProgressBar
	.align	2
	.global	updateProgressBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateProgressBar, %function
updateProgressBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L19
	push	{r4, lr}
	ldr	lr, [r1, #16]
	mov	r2, #0
	mov	r3, lr
	ldr	ip, [r1, #20]
	ldr	r4, .L19+4
.L10:
	mov	r0, r2
	smull	r1, r2, r4, r3
	asr	r1, r3, #31
	rsb	r2, r1, r2, asr #2
	cmp	ip, r2
	add	r2, r0, #1
	ble	.L9
	cmp	r2, #13
	add	r3, r3, lr
	bne	.L10
	mov	r0, #0
.L9:
	cmp	ip, #0
	bne	.L11
	mov	r3, #73
	ldr	r1, .L19+8
	ldr	r0, .L19+12
	ldr	r2, .L19+16
	str	ip, [r1]
	str	ip, [r0]
	str	ip, [r2]
	ldr	r1, .L19+20
.L12:
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	add	r2, r3, #288
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #85
	strh	r0, [r1, r2]	@ movhi
	bne	.L12
.L8:
	pop	{r4, lr}
	bx	lr
.L11:
	ldr	r3, .L19+16
	ldr	r2, [r3]
	cmp	r2, r0
	bge	.L8
	cmp	r0, #0
	str	r0, [r3]
	ble	.L8
	mov	r3, #105
	ldr	r1, .L19+20
	add	r0, r0, r3
.L14:
	lsl	r2, r3, #1
	ldrh	ip, [r1, r2]
	add	r2, r3, #256
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, r0
	strh	ip, [r1, r2]	@ movhi
	bne	.L14
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	soundA
	.word	1321528399
	.word	second
	.word	minute
	.word	progress
	.word	100712448
	.size	updateProgressBar, .-updateProgressBar
	.align	2
	.global	checkProgress
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkProgress, %function
checkProgress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L26
	ldr	ip, [r1, #16]
	mov	r2, #0
	mov	r3, ip
	push	{r4, lr}
	ldr	r4, [r1, #20]
	ldr	lr, .L26+4
.L23:
	mov	r0, r2
	smull	r1, r2, lr, r3
	asr	r1, r3, #31
	rsb	r2, r1, r2, asr #2
	cmp	r2, r4
	add	r2, r0, #1
	bge	.L21
	cmp	r2, #13
	add	r3, r3, ip
	bne	.L23
	mov	r0, #0
.L21:
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	soundA
	.word	1321528399
	.size	checkProgress, .-checkProgress
	.align	2
	.global	drawIntensityBars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawIntensityBars, %function
drawIntensityBars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, r2
	push	{r4, lr}
	ldr	r0, .L48
	ldr	r1, .L48+4
.L29:
	ldr	ip, [r0, #4]!
	cmp	ip, #8
	ldrls	pc, [pc, ip, asl #2]
	b	.L31
.L33:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L32
.L32:
	add	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	add	lr, r3, #49152
	ldrh	r4, [lr, #128]
	add	ip, r2, #202
	lsl	ip, ip, #1
	strh	r4, [r1, ip]	@ movhi
	add	ip, r2, #234
	ldrh	lr, [lr, #192]
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #49408
.L46:
	add	ip, r2, #264
	ldrh	r3, [r3]
	add	ip, ip, #2
	lsl	ip, ip, #1
	strh	r3, [r1, ip]	@ movhi
.L31:
	add	r2, r2, #1
	cmp	r2, #10
	beq	.L47
.L42:
	cmp	r2, #4
	movgt	r3, #16
	movle	r3, #0
	b	.L29
.L34:
	add	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	add	r3, r3, #49152
	add	ip, r3, #320
	ldrh	lr, [ip]
	add	ip, r2, #202
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	ip, r3, #384
	ldrh	lr, [ip]
	add	ip, r2, #234
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #448
	b	.L46
.L35:
	add	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	add	ip, r3, #49664
	ldrh	lr, [ip]
	add	ip, r2, #202
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #49152
	add	ip, r3, #576
	ldrh	lr, [ip]
	add	ip, r2, #234
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #640
	b	.L46
.L36:
	ldr	ip, .L48+8
	add	r3, r3, #2
	add	r3, r3, r2
	ldrh	r4, [ip]
	lsl	r3, r3, #1
	add	ip, r2, #202
	add	r3, r3, #100663296
	lsl	ip, ip, #1
	strh	r4, [r1, ip]	@ movhi
	add	lr, r3, #49664
	add	lr, lr, #192
	ldrh	lr, [lr]
	add	ip, r2, #234
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #49920
	b	.L46
.L37:
	ldr	ip, .L48+8
	add	r3, r3, #2
	add	r3, r3, r2
	ldrh	lr, [ip]
	lsl	r3, r3, #1
	add	ip, r2, #202
	lsl	ip, ip, #1
	add	r3, r3, #100663296
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #49152
	add	ip, r3, #832
	ldrh	lr, [ip]
	add	ip, r2, #234
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #896
	b	.L46
.L38:
	ldr	ip, .L48+8
	add	r3, r2, r3
	ldrh	r4, [ip]
	add	lr, r2, #202
	add	ip, r2, #234
	add	r3, r3, #480
.L45:
	lsl	ip, ip, #1
	lsl	lr, lr, #1
	strh	r4, [r1, lr]	@ movhi
	add	r3, r3, #2
	strh	r4, [r1, ip]	@ movhi
	lsl	r3, r3, #1
	add	ip, r2, #264
	ldrh	r3, [r1, r3]
	add	ip, ip, #2
	add	r2, r2, #1
	lsl	ip, ip, #1
	cmp	r2, #10
	strh	r3, [r1, ip]	@ movhi
	bne	.L42
.L47:
	pop	{r4, lr}
	bx	lr
.L39:
	ldr	ip, .L48+8
	add	r3, r2, r3
	ldrh	r4, [ip]
	add	lr, r2, #202
	add	ip, r2, #234
	add	r3, r3, #512
	b	.L45
.L41:
	ldr	ip, .L48+8
	ldrh	lr, [ip]
	add	ip, r2, #202
	lsl	ip, ip, #1
	add	r3, r2, #264
	strh	lr, [r1, ip]	@ movhi
	add	r3, r3, #2
	add	ip, r2, #234
	lsl	r3, r3, #1
	lsl	ip, ip, #1
	strh	lr, [r1, ip]	@ movhi
	strh	lr, [r1, r3]	@ movhi
	b	.L31
.L40:
	ldr	ip, .L48+8
	add	r3, r2, r3
	ldrh	r4, [ip]
	add	lr, r2, #202
	add	ip, r2, #234
	add	r3, r3, #544
	b	.L45
.L49:
	.align	2
.L48:
	.word	intensity-4
	.word	100712448
	.word	100713492
	.size	drawIntensityBars, .-drawIntensityBars
	.global	__aeabi_idivmod
	.align	2
	.global	getShown
	.syntax unified
	.arm
	.fpu softvfp
	.type	getShown, %function
getShown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r1
	beq	.L51
	mov	r8, r0
	mov	r3, r1
	rsb	r2, r1, #1
.L52:
	add	r5, r2, r3
	ldrb	r4, [r3, #1]!	@ zero_extendqisi2
	cmp	r4, #0
	bne	.L52
	cmp	r5, #12
	ble	.L51
	ldr	r9, .L61
	mov	r1, #13
	ldr	r0, [r9]
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r10, .L61+8
	mov	r6, r0
	str	r0, [r9]
	add	r8, r8, r5
	b	.L54
.L60:
	ldr	r6, [r9]
.L54:
	add	r0, r8, r4
	mov	r1, r5
	mov	lr, pc
	bx	r10
	ldrb	r3, [r7, r1]	@ zero_extendqisi2
	strb	r3, [r6, r4]
	add	r4, r4, #1
	cmp	r4, #12
	bne	.L60
	ldr	r7, [r9]
.L51:
	mov	r0, r7
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	shown
	.word	realloc
	.word	__aeabi_idivmod
	.size	getShown, .-getShown
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Now Playing: \000"
	.align	2
.LC1:
	.ascii	"   \000"
	.text
	.align	2
	.global	getFullTitle
	.syntax unified
	.arm
	.fpu softvfp
	.type	getFullTitle, %function
getFullTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	beq	.L66
	mov	r3, r0
	rsb	ip, r0, #1
.L65:
	add	r1, ip, r3
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L65
	add	r1, r1, #17
.L64:
	ldr	r4, .L69
	ldr	r3, .L69+4
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r0, [r4]
	strb	r3, [r0]
	ldr	r6, [r4]
	ldr	r7, .L69+8
	mov	r0, r6
	mov	lr, pc
	bx	r7
	mov	r2, #14
	ldr	r1, .L69+12
	add	r0, r6, r0
	ldr	r6, .L69+16
	mov	lr, pc
	bx	r6
	mov	r1, r5
	ldr	r3, .L69+20
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r5, [r4]
	mov	r0, r5
	mov	lr, pc
	bx	r7
	mov	r2, #4
	add	r0, r5, r0
	ldr	r1, .L69+24
	mov	lr, pc
	bx	r6
	ldr	r0, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	mov	r1, #17
	b	.L64
.L70:
	.align	2
.L69:
	.word	title
	.word	realloc
	.word	strlen
	.word	.LC0
	.word	memcpy
	.word	strcat
	.word	.LC1
	.size	getFullTitle, .-getFullTitle
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
	ldr	r6, .L78
	add	r3, r0, r0, lsl #2
	add	r5, r6, r3, lsl #2
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #16]
	mov	r2, #1
	ldr	r7, .L78+4
	lsl	r4, r3, #2
	mov	lr, pc
	bx	r7
	mov	r1, #83886080
	ldrh	r3, [r5, #4]
	ldr	r2, .L78+8
	ldr	r0, [r6, r4]
	strh	r3, [r1, #58]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bl	getFullTitle
	mov	r2, #0
	mov	r3, #73
	ldr	r1, .L78+12
	ldr	r5, .L78+16
	str	r0, [r1]
	ldr	r4, .L78+20
	ldr	r1, .L78+24
	ldr	lr, .L78+28
	ldr	ip, .L78+32
	str	r2, [r1]
	str	r2, [r5]
	str	r2, [r4]
	str	r2, [lr]
	str	r2, [ip]
	ldr	r1, .L78+36
.L72:
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	add	r2, r3, #288
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #85
	strh	r0, [r1, r2]	@ movhi
	bne	.L72
	mov	r2, #0
	mov	ip, #49152
	mvn	r0, #59
	ldr	r3, .L78+40
	ldr	r1, .L78+44
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldr	r2, [r1]
	cmp	r2, #0
	strh	r0, [r3, #12]	@ movhi
	bne	.L77
	mov	r1, #195
	mov	r2, #196
	strh	r1, [r3, #10]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r2, [r3, #14]	@ movhi
	bx	lr
.L77:
	ldr	r3, .L78+48
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	songs
	.word	playSoundA
	.word	83886592
	.word	screenTitle
	.word	frame
	.word	titlePosition
	.word	progress
	.word	minute
	.word	second
	.word	100712448
	.word	67109120
	.word	paused
	.word	pauseSounds
	.size	playSong, .-playSong
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Party Rock Anthem\000"
	.align	2
.LC3:
	.ascii	"Northern Attitude feat. Hozier\000"
	.align	2
.LC4:
	.ascii	"Scared of the Dark\000"
	.text
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r3, .L84
	add	r2, r3, #40
.L81:
	str	r4, [r3, #4]!
	cmp	r3, r2
	bne	.L81
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L84+4
	ldr	r1, .L84+8
	ldr	r5, .L84+12
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r0, #5376
	mov	r1, #31
	mov	r5, #31744
	mov	lr, #33
	mov	ip, #1
	ldr	r2, .L84+16
	strh	r0, [r3]	@ movhi
	ldr	r2, [r2]
	ldr	r3, .L84+20
	ldr	r0, .L84+24
	str	r2, [r3, #8]
	ldr	r2, .L84+28
	ldr	r6, [r0]
	ldr	r2, [r2]
	ldr	r0, .L84+32
	strh	r1, [r3, #4]	@ movhi
	ldr	r0, [r0]
	str	r2, [r3, #32]
	ldr	r1, .L84+36
	ldr	r2, .L84+40
	str	r6, [r3, #12]
	ldr	r1, [r1]
	ldr	r6, .L84+44
	str	r0, [r3, #28]
	str	r2, [r3, #36]
	ldr	r0, .L84+48
	ldr	r2, .L84+52
	str	r6, [r3, #16]
	ldr	r0, [r0]
	ldr	r6, .L84+56
	str	r1, [r3, #48]
	str	r2, [r3, #20]
	ldr	r1, .L84+60
	ldr	r2, .L84+64
	str	r6, [r3]
	strh	r4, [r3, #44]	@ movhi
	strh	r5, [r3, #24]	@ movhi
	str	r0, [r3, #52]
	str	r1, [r3, #56]
	ldr	r0, .L84+68
	str	r2, [r3, #40]
	ldr	r2, .L84+72
	ldr	r3, .L84+76
	ldr	r1, .L84+80
	strh	lr, [r0, #24]	@ movhi
	str	r4, [r2]
	str	r4, [r3]
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	str	ip, [r1]
	b	playSong
.L85:
	.align	2
.L84:
	.word	intensity-4
	.word	100712448
	.word	screenMap
	.word	DMANow
	.word	examplesong_sampleRate
	.word	songs
	.word	examplesong_length
	.word	Noah_Kahan_Hozier_Northern_Attitude_length
	.word	Noah_Kahan_Hozier_Northern_Attitude_sampleRate
	.word	Scared_of_the_Dark_sampleRate
	.word	Noah_Kahan_Hozier_Northern_Attitude_data
	.word	examplesong_data
	.word	Scared_of_the_Dark_length
	.word	.LC3
	.word	.LC2
	.word	Scared_of_the_Dark_data
	.word	.LC4
	.word	shadowOAM
	.word	shuffle
	.word	currentSong
	.word	paused
	.size	init, .-init
	.align	2
	.global	prevSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	prevSong, %function
prevSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L93
	ldr	r2, .L94+4
	ldr	r3, [r2]
	ldr	r0, .L94+8
	add	r3, r3, #2
	smull	r1, r0, r3, r0
	sub	r0, r0, r3, asr #31
	add	r0, r0, r0, lsl #1
	sub	r0, r3, r0
	str	r0, [r2]
	b	playSong
.L93:
	push	{r4, lr}
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	mov	r2, r0
	ldr	r3, .L94+8
	smull	r1, r3, r0, r3
	sub	r0, r3, r0, asr #31
	add	r0, r0, r0, lsl #1
	sub	r0, r2, r0
	ldr	r2, .L94+4
	pop	{r4, lr}
	str	r0, [r2]
	b	playSong
.L95:
	.align	2
.L94:
	.word	shuffle
	.word	currentSong
	.word	1431655766
	.word	rand
	.size	prevSong, .-prevSong
	.align	2
	.global	nextSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	nextSong, %function
nextSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L104
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L103
	ldr	r2, .L104+4
	ldr	r3, [r2]
	ldr	r0, .L104+8
	add	r3, r3, #1
	smull	r1, r0, r3, r0
	sub	r0, r0, r3, asr #31
	add	r0, r0, r0, lsl #1
	sub	r0, r3, r0
	str	r0, [r2]
	b	playSong
.L103:
	push	{r4, lr}
	ldr	r3, .L104+12
	mov	lr, pc
	bx	r3
	mov	r2, r0
	ldr	r3, .L104+8
	smull	r1, r3, r0, r3
	sub	r0, r3, r0, asr #31
	add	r0, r0, r0, lsl #1
	sub	r0, r2, r0
	ldr	r2, .L104+4
	pop	{r4, lr}
	str	r0, [r2]
	b	playSong
.L105:
	.align	2
.L104:
	.word	shuffle
	.word	currentSong
	.word	1431655766
	.word	rand
	.size	nextSong, .-nextSong
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L172
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L107
	ldr	r2, .L172+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L165
.L107:
	tst	r3, #32
	bne	.L159
	ldr	r5, .L172+8
.L109:
	tst	r3, #16
	beq	.L111
	ldr	r2, .L172+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L166
.L111:
	tst	r3, #512
	beq	.L112
	ldr	r2, .L172+4
	ldrh	r2, [r2]
	tst	r2, #512
	beq	.L167
.L112:
	tst	r3, #256
	beq	.L114
	ldr	r3, .L172+4
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L168
.L114:
	bl	updateProgressBar
	ldr	r1, [r5, #8]
	ldr	r4, .L172+12
	cmp	r1, #0
	ldr	r3, .L172+16
	ldr	r2, [r4]
	bne	.L116
	smull	r0, r3, r2, r3
	asr	r0, r2, #31
	rsb	r3, r0, r3, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	cmp	r3, #4
	beq	.L169
.L117:
	ldr	r3, .L172+20
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	rsb	r0, r0, r3, asr #4
	rsb	r0, r0, r0, lsl #4
	sub	r2, r2, r0, lsl #1
	cmp	r2, #29
	beq	.L128
.L125:
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	cmp	r2, r3
	bge	.L170
.L126:
	ldr	r3, [r4]
	ldr	r1, .L172+20
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #4
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #1
	str	r3, [r4]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L159:
	ldr	r2, .L172+4
	ldrh	r2, [r2]
	tst	r2, #32
	ldr	r5, .L172+8
	bne	.L109
	ldr	r3, [r5, #20]
	cmp	r3, #99
	ble	.L171
.L110:
	ldr	r3, .L172+24
	ldr	r0, [r3]
	bl	playSong
	ldrh	r3, [r4]
	b	.L109
.L116:
	smull	r1, r3, r2, r3
	asr	r1, r2, #31
	rsb	r3, r1, r3, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	cmp	r3, #4
	bne	.L120
	ldr	r9, .L172+28
	ldr	r8, .L172+32
	ldr	r7, .L172+36
	add	r6, r9, #40
.L121:
	mov	lr, pc
	bx	r8
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	str	r0, [r9, #4]!
	cmp	r6, r9
	bne	.L121
	ldr	r3, [r4]
	ldr	r1, .L172+20
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #4
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #1
	cmp	r3, #29
	beq	.L128
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L126
	b	.L125
.L168:
	ldr	r3, .L172+40
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	movne	r2, #0
	str	r2, [r3]
	moveq	r2, #33
	ldreq	r3, .L172+44
	ldrne	r3, .L172+44
	ldrne	r2, .L172+48
	strh	r2, [r3, #32]	@ movhi
	b	.L114
.L165:
	ldr	r2, .L172+52
	ldr	r3, [r2]
	cmp	r3, #0
	moveq	r1, #1
	movne	r1, #0
	str	r1, [r2]
	bne	.L108
	ldr	r2, .L172+56
	ldr	r1, .L172+60
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	mov	lr, pc
	bx	r1
	ldrh	r3, [r4]
	b	.L107
.L167:
	ldr	r2, [r5, #12]
	cmp	r2, #0
	moveq	r2, #1
	movne	r2, #0
	moveq	r1, #33
	str	r2, [r5, #12]
	ldrne	r1, .L172+48
	ldreq	r2, .L172+44
	ldrne	r2, .L172+44
	strh	r1, [r2, #40]	@ movhi
	b	.L112
.L120:
	ldr	r3, .L172+20
	smull	r0, r3, r2, r3
	add	r3, r3, r2
	rsb	r1, r1, r3, asr #4
	rsb	r1, r1, r1, lsl #4
	sub	r2, r2, r1, lsl #1
	cmp	r2, #29
	bne	.L126
.L128:
	ldr	r3, .L172+64
	ldr	r3, [r3]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L123
	rsb	r0, r3, #1
.L124:
	add	r1, r0, r3
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L124
	ldr	r6, .L172+68
	ldr	r0, [r6]
	add	r0, r0, #1
	ldr	r3, .L172+72
	add	r0, r0, r1
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #8]
	cmp	r3, #0
	str	r1, [r6]
	bne	.L126
	b	.L125
.L169:
	ldr	r3, .L172+28
	add	ip, r3, #40
.L118:
	str	r1, [r3, #4]!
	cmp	ip, r3
	bne	.L118
	b	.L117
.L166:
	bl	nextSong
	ldrh	r3, [r4]
	b	.L111
.L108:
	mov	r0, #195
	mov	r1, #196
	ldr	r3, .L172+56
	ldr	r2, .L172+76
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	mov	lr, pc
	bx	r2
	ldrh	r3, [r4]
	b	.L107
.L171:
	bl	prevSong
	b	.L110
.L170:
	bl	nextSong
	b	.L126
.L123:
	.inst	0xe7f000f0
.L173:
	.align	2
.L172:
	.word	oldButtons
	.word	buttons
	.word	soundA
	.word	frame
	.word	1717986919
	.word	-2004318071
	.word	currentSong
	.word	intensity-4
	.word	rand
	.word	954437177
	.word	shuffle
	.word	shadowOAM
	.word	545
	.word	paused
	.word	67109120
	.word	pauseSounds
	.word	screenTitle
	.word	titlePosition
	.word	__aeabi_idivmod
	.word	unpauseSounds
	.size	update, .-update
	.align	2
	.global	getStrLen
	.syntax unified
	.arm
	.fpu softvfp
	.type	getStrLen, %function
getStrLen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldrb	r0, [r0]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	rsb	r1, r3, #1
.L176:
	add	r0, r1, r3
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L176
	bx	lr
	.size	getStrLen, .-getStrLen
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
	@ link register save eliminated.
	sub	r2, r2, #45
	add	r0, r0, r1, lsl #5
	cmp	r2, #77
	ldrls	pc, [pc, r2, asl #2]
	b	.L180
.L182:
	.word	.L219
	.word	.L180
	.word	.L180
	.word	.L218
	.word	.L217
	.word	.L216
	.word	.L215
	.word	.L214
	.word	.L213
	.word	.L212
	.word	.L211
	.word	.L210
	.word	.L209
	.word	.L208
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L207
	.word	.L206
	.word	.L205
	.word	.L204
	.word	.L203
	.word	.L202
	.word	.L201
	.word	.L200
	.word	.L199
	.word	.L198
	.word	.L197
	.word	.L196
	.word	.L195
	.word	.L194
	.word	.L193
	.word	.L192
	.word	.L191
	.word	.L190
	.word	.L189
	.word	.L188
	.word	.L187
	.word	.L186
	.word	.L185
	.word	.L184
	.word	.L183
	.word	.L181
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L180
	.word	.L207
	.word	.L206
	.word	.L205
	.word	.L204
	.word	.L203
	.word	.L202
	.word	.L201
	.word	.L200
	.word	.L199
	.word	.L198
	.word	.L197
	.word	.L196
	.word	.L195
	.word	.L194
	.word	.L193
	.word	.L192
	.word	.L191
	.word	.L190
	.word	.L189
	.word	.L188
	.word	.L187
	.word	.L186
	.word	.L185
	.word	.L184
	.word	.L183
	.word	.L181
.L180:
	ldr	r3, .L221
	ldr	r2, .L221+4
	ldrh	r1, [r3]
	lsl	r3, r0, #1
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L181:
	ldr	r2, .L221+8
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L183:
	ldr	r2, .L221+8
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L184:
	ldr	r2, .L221+12
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L185:
	ldr	r2, .L221+12
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L186:
	ldr	r2, .L221+16
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L187:
	ldr	r2, .L221+16
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L188:
	ldr	r2, .L221+20
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L189:
	ldr	r2, .L221+20
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L190:
	ldr	r2, .L221+24
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L191:
	ldr	r2, .L221+24
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L192:
	ldr	r2, .L221+28
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L193:
	ldr	r2, .L221+28
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L194:
	ldr	r2, .L221+32
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L195:
	ldr	r2, .L221+32
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L196:
	ldr	r2, .L221+36
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L197:
	ldr	r2, .L221+36
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L198:
	ldr	r2, .L221+40
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L199:
	ldr	r2, .L221+40
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L200:
	ldr	r2, .L221+44
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L201:
	ldr	r2, .L221+44
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L202:
	ldr	r2, .L221+48
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L203:
	ldr	r2, .L221+48
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L204:
	ldr	r2, .L221+52
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L205:
	ldr	r2, .L221+52
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L206:
	ldr	r2, .L221+56
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L207:
	ldr	r2, .L221+56
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L212:
	ldr	r2, .L221+60
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L213:
	ldr	r2, .L221+64
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L208:
	ldr	r2, .L221+68
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L209:
	ldr	r2, .L221+72
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L210:
	ldr	r2, .L221+72
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L211:
	ldr	r2, .L221+60
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L216:
	ldr	r2, .L221+76
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L217:
	ldr	r2, .L221+80
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L218:
	ldr	r2, .L221+80
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L219:
	ldr	r2, .L221+68
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L214:
	ldr	r2, .L221+64
	ldr	r3, .L221+4
	ldrh	r2, [r2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L215:
	ldr	r2, .L221+76
	ldr	r3, .L221+4
	ldrh	r2, [r2, #2]
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L222:
	.align	2
.L221:
	.word	100713444
	.word	100712448
	.word	100713380
	.word	100713376
	.word	100713372
	.word	100713368
	.word	100713364
	.word	100713360
	.word	100713320
	.word	100713316
	.word	100713312
	.word	100713308
	.word	100713304
	.word	100713300
	.word	100713296
	.word	100713436
	.word	100713432
	.word	100713384
	.word	100713440
	.word	100713428
	.word	100713424
	.size	drawChar, .-drawChar
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
	beq	.L223
	mov	r7, r1
	mvn	lr, r5
	add	r3, r5, #1
.L225:
	add	r1, lr, r3
	ldrb	ip, [r3], #1	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L225
	mov	r4, r5
	add	r5, r5, r1
	sub	r6, r0, r4
	b	.L226
.L232:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
.L226:
	mov	r1, r7
	add	r0, r6, r4
	bl	drawChar
	cmp	r4, r5
	bne	.L232
.L223:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	drawTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTime, %function
drawTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #12
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #58
	mov	r0, r1
	bl	drawChar
	ldr	r3, .L237
	ldr	r4, [r3]
	cmp	r4, #59
	bgt	.L233
	ldr	r7, .L237+4
	ldr	r3, [r7]
	cmp	r3, #59
	ble	.L236
.L233:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L236:
	ldr	r5, .L237+8
	smull	r3, r2, r5, r4
	asr	r6, r4, #31
	rsb	r6, r6, r2, asr #2
	add	r2, r6, #48
	mov	r1, #12
	mov	r0, #13
	and	r2, r2, #255
	bl	drawChar
	add	r2, r6, r6, lsl #2
	sub	r2, r4, r2, lsl #1
	add	r2, r2, #48
	mov	r1, #12
	mov	r0, #14
	and	r2, r2, #255
	bl	drawChar
	ldr	r4, [r7]
	smull	r3, r2, r5, r4
	asr	r5, r4, #31
	rsb	r5, r5, r2, asr #2
	add	r2, r5, #48
	mov	r1, #12
	mov	r0, #10
	and	r2, r2, #255
	bl	drawChar
	add	r2, r5, r5, lsl #2
	sub	r2, r4, r2, lsl #1
	add	r2, r2, #48
	mov	r1, #12
	mov	r0, #11
	pop	{r4, r5, r6, r7, r8, lr}
	and	r2, r2, #255
	b	drawChar
.L238:
	.align	2
.L237:
	.word	second
	.word	minute
	.word	1717986919
	.size	drawTime, .-drawTime
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L241
	ldr	r2, .L241+4
	push	{r4, lr}
	ldr	r1, [r2]
	ldr	r0, [r3]
	bl	getShown
	mov	r1, #10
	mov	r2, r0
	mov	r0, #9
	bl	drawString
	bl	drawIntensityBars
	pop	{r4, lr}
	b	drawTime
.L242:
	.align	2
.L241:
	.word	titlePosition
	.word	screenTitle
	.size	draw, .-draw
	.comm	title,4,4
	.comm	shown,4,4
	.comm	titlePosition,4,4
	.comm	screenTitle,4,4
	.comm	currentSong,4,4
	.comm	progress,4,4
	.comm	frame,4,4
	.comm	second,4,4
	.comm	minute,4,4
	.comm	shuffle,4,4
	.comm	paused,4,4
	.comm	intensity,40,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,60,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
