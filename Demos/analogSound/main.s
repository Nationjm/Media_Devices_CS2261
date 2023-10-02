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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Song Mode\000"
	.align	2
.LC1:
	.ascii	"Press Start to Play/Pause Song.\000"
	.align	2
.LC2:
	.ascii	"D-Pad L/R: Adjust Duty\000"
	.align	2
.LC3:
	.ascii	"Count: \000"
	.align	2
.LC4:
	.ascii	"Duty: %d\000"
	.align	2
.LC5:
	.ascii	"%2d\000"
	.align	2
.LC6:
	.ascii	"CHANNEL1 Mode\000"
	.align	2
.LC7:
	.ascii	"A plays current note.\000"
	.align	2
.LC8:
	.ascii	"D-pad: Up Incr. SweepShift (SS)\000"
	.align	2
.LC9:
	.ascii	"D-pad: Down Incr. SweepTime (ST)\000"
	.align	2
.LC10:
	.ascii	"D-pad: Left Incr. EnvStepTime (EST)\000"
	.align	2
.LC11:
	.ascii	"D-pad: Right Incr. Duty (D)\000"
	.align	2
.LC12:
	.ascii	"L/R: Adjust Length (L)\000"
	.align	2
.LC13:
	.ascii	"B: Toggle Sweep Dir (S_DIR)\000"
	.align	2
.LC14:
	.ascii	"Start: Toggle Env Dir (E_DIR)\000"
	.align	2
.LC15:
	.ascii	"C1 Params (SS,ST,EST,D,L,S_DIR,E_DIR):\000"
	.align	2
.LC16:
	.ascii	"Next Note: \000"
	.align	2
.LC17:
	.ascii	"%d,%d,%d,%d,%d,%d,%d     \000"
	.align	2
.LC18:
	.ascii	"%d\000"
	.align	2
.LC19:
	.ascii	"CHANNEL3 Mode\000"
	.align	2
.LC20:
	.ascii	"Up/Down on D-Pad to start/stop waveform sound.\000"
	.align	2
.LC21:
	.ascii	"Channel4 (\"Drum\") Mode\000"
	.align	2
.LC22:
	.ascii	"A plays current drum params.\000"
	.align	2
.LC23:
	.ascii	"D-pad: Up/Down Adjust R\000"
	.align	2
.LC24:
	.ascii	"D-pad: Left/Right Adjust S\000"
	.align	2
.LC25:
	.ascii	"B: Toggle Bit Mode (B)\000"
	.align	2
.LC26:
	.ascii	"Start: Inc Envelope (E)\000"
	.align	2
.LC27:
	.ascii	"Drum Params (R,S,B,L,E): \000"
	.align	2
.LC28:
	.ascii	"%d,%2d,%d,%2d,%d\000"
	.align	2
.LC29:
	.ascii	"DEMO Mode\000"
	.align	2
.LC30:
	.ascii	"Start: toggle song\000"
	.align	2
.LC31:
	.ascii	"L/R: Play current C1 / C2\000"
	.align	2
.LC32:
	.ascii	"A: Play Current C4\000"
	.align	2
.LC33:
	.ascii	"D-RIGHT: Cycle through sound effects\000"
	.align	2
.LC34:
	.ascii	"Next Effect: %2d\000"
	.align	2
.LC35:
	.ascii	"Press Select to cycle modes.\000"
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
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r4, #67108864
	ldr	r2, .L174
	sub	sp, sp, #148
	str	r5, [sp, #56]
	ldr	r3, .L174+4
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r7, .L174+8
	ldr	lr, .L174+12
	ldr	ip, .L174+16
	ldr	r3, .L174+20
	strh	r7, [r4, #144]	@ movhi
	ldr	fp, .L174+24
	strh	lr, [r4, #146]	@ movhi
	strh	ip, [r4, #148]	@ movhi
	strh	r3, [r4, #150]	@ movhi
	strh	r7, [r4, #152]	@ movhi
	strh	lr, [r4, #154]	@ movhi
	strh	ip, [r4, #156]	@ movhi
	strh	r3, [r4, #158]	@ movhi
	ldrb	r3, [fp, #2]	@ zero_extendqisi2
	mov	r1, r5
	ldr	r6, .L174+28
	mov	r2, #37
	add	r0, sp, #104
	str	r3, [sp, #92]
	str	r5, [sp, #100]
	str	r5, [sp, #28]
	mov	lr, pc
	bx	r6
	mov	r3, #2
	mov	r10, r5
	str	r5, [sp, #24]
	str	r5, [sp, #64]
	str	r5, [sp, #48]
	str	r5, [sp, #60]
	str	r5, [sp, #44]
	str	r5, [sp, #40]
	str	r5, [sp, #88]
	str	r5, [sp, #84]
	str	r5, [sp, #80]
	str	r5, [sp, #52]
	str	r5, [sp, #76]
	str	r5, [sp, #72]
	str	r5, [sp, #68]
	str	r5, [sp, #36]
	str	r3, [sp, #32]
	ldr	r8, .L174+32
	ldr	r7, .L174+36
	ldr	r6, .L174+40
	ldr	r9, .L174+44
	ldr	r5, .L174+48
	b	.L50
.L32:
	cmp	r3, #4
	bne	.L30
	ldrh	r3, [r8]
	tst	r3, #16
	beq	.L34
	ldrh	r2, [r5, #48]
	tst	r2, #16
	beq	.L164
.L34:
	tst	r3, #1
	beq	.L35
	ldrh	r2, [r5, #48]
	tst	r2, #1
	beq	.L165
.L35:
	tst	r3, #512
	beq	.L36
	ldrh	r2, [r5, #48]
	tst	r2, #512
	beq	.L166
.L36:
	tst	r3, #256
	beq	.L30
	ldrh	r3, [r5, #48]
	tst	r3, #256
	beq	.L167
.L30:
	ldrh	r3, [r5, #48]
	strh	r3, [r8]	@ movhi
	ldr	r3, .L174+52
	mov	lr, pc
	bx	r3
	ldrb	r4, [r7]	@ zero_extendqisi2
	cmp	r4, #0
	bne	.L37
	ldrb	r3, [fp, #232]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L168
.L38:
	ldr	r4, .L174+56
	ldr	r2, [sp, #32]
	ldr	r1, .L174+60
	add	r0, sp, #100
	mov	lr, pc
	bx	r4
	ldr	r3, .L174+64
	mov	r1, #24
	mov	r0, #0
	add	r2, sp, #100
	str	r10, [sp]
	mov	lr, pc
	bx	r9
	ldr	r2, [sp, #24]
	ldr	r1, .L174+68
	add	r0, sp, #100
	mov	lr, pc
	bx	r4
	ldr	r3, .L174+64
	mov	r1, #40
	mov	r0, #48
	str	r10, [sp]
	add	r2, sp, #100
	mov	lr, pc
	bx	r9
	ldr	r3, [sp, #28]
	cmp	r3, #0
	ldrne	r3, [sp, #24]
	addne	r3, r3, #1
	ldrb	r4, [r7]	@ zero_extendqisi2
	strne	r3, [sp, #24]
.L37:
	cmp	r4, #1
	beq	.L169
.L40:
	cmp	r4, #2
	beq	.L170
	cmp	r4, #3
	beq	.L171
.L46:
	cmp	r4, #4
	bne	.L43
	ldrb	r3, [fp, #232]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L51
.L48:
	ldr	r3, [sp, #28]
	cmp	r3, #0
	ldrne	r3, [sp, #24]
	addne	r3, r3, #1
	strne	r3, [sp, #24]
	ldr	r2, [sp, #56]
	ldr	r1, .L174+72
	ldr	r3, .L174+56
	add	r0, sp, #100
	mov	lr, pc
	bx	r3
	mov	r1, #56
	mov	r0, #0
	str	r10, [sp]
	ldr	r3, .L174+64
	add	r2, sp, #100
	mov	lr, pc
	bx	r9
.L43:
	mov	r1, #150
	mov	r0, #0
	str	r10, [sp]
	ldr	r3, .L174+64
	ldr	r2, .L174+76
	mov	lr, pc
	bx	r9
.L50:
	ldrh	r2, [r8]
	tst	r2, #4
	ldrb	r3, [r7]	@ zero_extendqisi2
	beq	.L2
	ldrh	r1, [r5, #48]
	tst	r1, #4
	bne	.L2
	ldr	r0, .L174+80
	add	r3, r3, #1
	umull	r1, r0, r3, r0
	and	r1, r0, #508
	add	r1, r1, r0, lsr #2
	sub	r3, r3, r1
	cmp	r3, #2
	beq	.L3
	and	r3, r3, #255
	strb	r3, [r7]
.L2:
	cmp	r3, #3
	beq	.L4
.L5:
	tst	r3, #251
	bne	.L15
	ldrh	r2, [r8]
	tst	r2, #32
	beq	.L17
	ldrh	r1, [r5, #48]
	tst	r1, #32
	ldreq	r1, [sp, #32]
	subeq	r1, r1, #1
	andeq	r1, r1, #3
	streq	r1, [sp, #32]
.L17:
	tst	r2, #16
	beq	.L18
	ldrh	r1, [r5, #48]
	tst	r1, #16
	ldreq	r1, [sp, #32]
	addeq	r1, r1, #1
	andeq	r1, r1, #3
	streq	r1, [sp, #32]
.L18:
	tst	r2, #8
	beq	.L19
	ldrh	r2, [r5, #48]
	ands	r2, r2, #8
	bne	.L19
	ldr	r1, [sp, #28]
	cmp	r1, #0
	beq	.L20
	ldrb	r1, [fp, #2]	@ zero_extendqisi2
	str	r2, [sp, #36]
	str	r1, [sp, #92]
	str	r2, [sp, #28]
.L15:
	cmp	r3, #1
	beq	.L172
.L21:
	cmp	r3, #2
	bne	.L32
	ldrh	r3, [r8]
	tst	r3, #64
	beq	.L33
	ldrh	r2, [r5, #48]
	tst	r2, #64
	bne	.L33
	mov	r3, #67108864
	mov	r1, #128
	ldr	r2, .L174+84
	strh	r2, [r3, #116]	@ movhi
	ldr	r2, .L174+88
	strh	r1, [r3, #112]	@ movhi
	strh	r2, [r3, #114]	@ movhi
	b	.L30
.L19:
	ldr	r2, [sp, #28]
	cmp	r2, #0
	beq	.L15
.L20:
	ldr	r1, [sp, #92]
	rsb	r2, r1, r1, lsl #5
	add	r2, r1, r2, lsl #2
	ldr	r1, .L174+92
	lsl	r2, r2, #1
	umull	r0, r1, r2, r1
	mov	r2, r1
	ldr	r1, [sp, #24]
	cmp	r1, r2, lsr #6
	movcc	r2, #1
	strcc	r2, [sp, #28]
	bcc	.L15
	ldr	r3, [sp, #36]
	add	r4, fp, r3, lsl #2
	ldr	r1, [sp, #32]
	ldr	r2, .L174+96
	mov	r0, r4
	mov	lr, pc
	bx	r2
	ldr	r3, [sp, #36]
	add	r2, r3, #1
	ldr	r3, .L174+100
	umull	r1, r3, r2, r3
	lsr	r3, r3, #5
	rsb	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl #2
	sub	r3, r2, r3, lsl #1
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	str	r2, [sp, #92]
	mov	r2, #1
	str	r2, [sp, #28]
	mov	r2, #0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [sp, #36]
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #1
	str	r2, [sp, #24]
	bne	.L21
.L172:
	ldrh	r2, [r8]
	tst	r2, #64
	beq	.L22
	ldrh	r1, [r5, #48]
	tst	r1, #64
	ldreq	r1, [sp, #68]
	addeq	r1, r1, #1
	andeq	r1, r1, #7
	streq	r1, [sp, #68]
.L22:
	tst	r2, #128
	beq	.L23
	ldrh	r1, [r5, #48]
	tst	r1, #128
	ldreq	r1, [sp, #76]
	addeq	r1, r1, #1
	andeq	r1, r1, #7
	streq	r1, [sp, #76]
.L23:
	tst	r2, #32
	beq	.L24
	ldrh	r1, [r5, #48]
	tst	r1, #32
	ldreq	r1, [sp, #84]
	addeq	r1, r1, #1
	andeq	r1, r1, #7
	streq	r1, [sp, #84]
.L24:
	tst	r2, #16
	beq	.L25
	ldrh	r1, [r5, #48]
	tst	r1, #16
	ldreq	r1, [sp, #80]
	addeq	r1, r1, #1
	andeq	r1, r1, #3
	streq	r1, [sp, #80]
.L25:
	tst	r2, #512
	beq	.L26
	ldrh	r1, [r5, #48]
	tst	r1, #512
	ldreq	r1, [sp, #52]
	subeq	r1, r1, #1
	andeq	r1, r1, #63
	streq	r1, [sp, #52]
.L26:
	tst	r2, #256
	beq	.L27
	ldrh	r1, [r5, #48]
	tst	r1, #256
	ldreq	r1, [sp, #52]
	addeq	r1, r1, #1
	andeq	r1, r1, #63
	streq	r1, [sp, #52]
.L27:
	tst	r2, #2
	beq	.L28
	ldrh	r1, [r5, #48]
	tst	r1, #2
	ldreq	r1, [sp, #72]
	eoreq	r1, r1, #1
	streq	r1, [sp, #72]
.L28:
	tst	r2, #8
	beq	.L29
	ldrh	r1, [r5, #48]
	tst	r1, #8
	ldreq	r1, [sp, #88]
	eoreq	r1, r1, #1
	streq	r1, [sp, #88]
.L29:
	tst	r2, #1
	beq	.L30
	ldrh	r2, [r5, #48]
	tst	r2, #1
	bne	.L30
	ldr	r2, [sp, #36]
	lsl	r2, r2, #2
	ldrh	r0, [fp, r2]
	cmp	r0, #0
	bne	.L173
.L31:
	ldr	r2, [sp, #36]
	add	r1, r2, #1
	ldr	r2, .L174+100
	umull	r0, r2, r1, r2
	lsr	r2, r2, #5
	rsb	r0, r2, r2, lsl #3
	add	r2, r2, r0, lsl #2
	sub	r2, r1, r2, lsl #1
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	str	r2, [sp, #36]
	b	.L21
.L3:
	mov	r3, #3
	strb	r3, [r7]
.L4:
	tst	r2, #8
	beq	.L6
	ldrh	r3, [r5, #48]
	tst	r3, #8
	ldreq	r3, [sp, #64]
	addeq	r3, r3, #1
	andeq	r3, r3, #7
	streq	r3, [sp, #64]
.L6:
	tst	r2, #256
	beq	.L7
	ldrh	r3, [r5, #48]
	tst	r3, #256
	ldreq	r3, [sp, #48]
	addeq	r3, r3, #1
	andeq	r3, r3, #63
	streq	r3, [sp, #48]
.L7:
	tst	r2, #512
	beq	.L8
	ldrh	r3, [r5, #48]
	tst	r3, #512
	ldreq	r3, [sp, #48]
	subeq	r3, r3, #1
	andeq	r3, r3, #63
	streq	r3, [sp, #48]
.L8:
	tst	r2, #64
	beq	.L9
	ldrh	r3, [r5, #48]
	tst	r3, #64
	ldreq	r3, [sp, #40]
	addeq	r3, r3, #1
	andeq	r3, r3, #7
	streq	r3, [sp, #40]
.L9:
	tst	r2, #128
	beq	.L10
	ldrh	r3, [r5, #48]
	tst	r3, #128
	ldreq	r3, [sp, #40]
	subeq	r3, r3, #1
	andeq	r3, r3, #7
	streq	r3, [sp, #40]
.L10:
	tst	r2, #16
	beq	.L11
	ldrh	r3, [r5, #48]
	tst	r3, #16
	ldreq	r3, [sp, #44]
	addeq	r3, r3, #1
	andeq	r3, r3, #15
	streq	r3, [sp, #44]
.L11:
	tst	r2, #32
	beq	.L12
	ldrh	r3, [r5, #48]
	tst	r3, #32
	ldreq	r3, [sp, #44]
	subeq	r3, r3, #1
	andeq	r3, r3, #15
	streq	r3, [sp, #44]
.L12:
	tst	r2, #2
	beq	.L13
	ldrh	r3, [r5, #48]
	tst	r3, #2
	ldreq	r3, [sp, #60]
	eoreq	r3, r3, #1
	streq	r3, [sp, #60]
.L13:
	tst	r2, #1
	beq	.L162
	ldrh	r3, [r5, #48]
	tst	r3, #1
	beq	.L16
.L162:
	ldrb	r3, [r7]	@ zero_extendqisi2
	b	.L15
.L170:
	ldrb	r3, [fp, #232]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L43
	mov	r0, #0
	ldr	r3, .L174+104
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L174+64
	mov	r0, r1
	ldr	r2, .L174+108
	mov	lr, pc
	bx	r6
	ldr	r3, .L174+64
	mov	r1, #8
	mov	r0, #0
	ldr	r2, .L174+112
	mov	lr, pc
	bx	r6
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #3
	strb	r4, [fp, #232]
	beq	.L47
	cmp	r3, #4
	bne	.L43
.L51:
	mov	r0, #0
	ldr	r3, .L174+104
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L174+64
	mov	r0, r1
	ldr	r2, .L174+116
	mov	lr, pc
	bx	r6
	mov	r1, #8
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+120
	mov	lr, pc
	bx	r6
	mov	r1, #16
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+124
	mov	lr, pc
	bx	r6
	mov	r1, #24
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+128
	mov	lr, pc
	bx	r6
	ldr	r3, .L174+64
	mov	r1, #40
	mov	r0, #0
	ldr	r2, .L174+132
	mov	lr, pc
	bx	r6
	mov	r3, #4
	strb	r3, [fp, #232]
	b	.L48
.L169:
	ldrb	r3, [fp, #232]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L41
	mov	r0, #0
	ldr	r3, .L174+104
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L174+64
	mov	r0, r1
	ldr	r2, .L174+136
	mov	lr, pc
	bx	r6
	mov	r1, #8
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+140
	mov	lr, pc
	bx	r6
	mov	r1, #16
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+144
	mov	lr, pc
	bx	r6
	mov	r1, #24
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+148
	mov	lr, pc
	bx	r6
	mov	r1, #32
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+152
	mov	lr, pc
	bx	r6
	mov	r1, #40
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+156
	mov	lr, pc
	bx	r6
	mov	r1, #48
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+160
	mov	lr, pc
	bx	r6
	mov	r1, #56
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+164
	mov	lr, pc
	bx	r6
	mov	r1, #64
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+168
	mov	lr, pc
	bx	r6
	mov	r1, #80
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+172
	mov	lr, pc
	bx	r6
	mov	r1, #96
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+176
	mov	lr, pc
	bx	r6
	strb	r4, [fp, #232]
.L41:
	ldr	r3, [sp, #88]
	str	r3, [sp, #16]
	ldr	r3, [sp, #72]
	str	r3, [sp, #12]
	ldr	r3, [sp, #52]
	str	r3, [sp, #8]
	ldr	r3, [sp, #80]
	str	r3, [sp, #4]
	ldr	r3, [sp, #84]
	ldr	r4, .L174+56
	str	r3, [sp]
	ldr	r2, [sp, #68]
	ldr	r3, [sp, #76]
	ldr	r1, .L174+180
	add	r0, sp, #100
	mov	lr, pc
	bx	r4
	mov	r1, #88
	mov	r0, #0
	ldr	r3, .L174+64
	add	r2, sp, #100
	str	r10, [sp]
	mov	lr, pc
	bx	r9
	ldr	r3, [sp, #36]
	lsl	r3, r3, #2
	ldrh	r2, [fp, r3]
	ldr	r1, .L174+184
	add	r0, sp, #100
	mov	lr, pc
	bx	r4
	mov	r1, #96
	mov	r0, #72
	str	r10, [sp]
	ldr	r3, .L174+64
	add	r2, sp, #100
	mov	lr, pc
	bx	r9
	ldrb	r4, [r7]	@ zero_extendqisi2
	b	.L40
.L171:
	ldrb	r3, [fp, #232]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L47
.L45:
	ldr	r3, [sp, #64]
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	str	r3, [sp, #4]
	ldr	r3, [sp, #60]
	str	r3, [sp]
	add	r2, sp, #40
	ldm	r2, {r2, r3}
	ldr	r1, .L174+188
	ldr	ip, .L174+56
	add	r0, sp, #100
	mov	lr, pc
	bx	ip
	mov	r1, #74
	mov	r0, #156
	str	r10, [sp]
	ldr	r3, .L174+64
	add	r2, sp, #100
	mov	lr, pc
	bx	r9
	ldrb	r4, [r7]	@ zero_extendqisi2
	b	.L46
.L33:
	tst	r3, #128
	beq	.L30
	ldrh	r3, [r5, #48]
	ands	r3, r3, #128
	moveq	r2, #67108864
	strheq	r3, [r2, #114]	@ movhi
	b	.L30
.L47:
	mov	r0, #0
	ldr	r3, .L174+104
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L174+64
	mov	r0, r1
	ldr	r2, .L174+192
	mov	lr, pc
	bx	r6
	mov	r1, #8
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+196
	mov	lr, pc
	bx	r6
	mov	r1, #16
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+200
	mov	lr, pc
	bx	r6
	mov	r1, #24
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+204
	mov	lr, pc
	bx	r6
	mov	r1, #32
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+160
	mov	lr, pc
	bx	r6
	mov	r1, #40
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+208
	mov	lr, pc
	bx	r6
	mov	r1, #48
	mov	r0, #0
	ldr	r3, .L174+64
	ldr	r2, .L174+212
	mov	lr, pc
	bx	r6
	ldr	r3, .L174+64
	mov	r1, #74
	mov	r0, #0
	ldr	r2, .L174+216
	mov	lr, pc
	bx	r6
	mov	r3, #3
	strb	r3, [fp, #232]
	b	.L45
.L168:
	mov	r0, r4
	ldr	r3, .L174+104
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r0, r4
	ldr	r3, .L174+64
	ldr	r2, .L174+220
	mov	lr, pc
	bx	r6
	mov	r1, #8
	mov	r0, r4
	ldr	r3, .L174+64
	ldr	r2, .L174+224
	mov	lr, pc
	bx	r6
	mov	r1, #16
	mov	r0, r4
	ldr	r3, .L174+64
	ldr	r2, .L174+228
	mov	lr, pc
	bx	r6
	mov	r1, #40
	mov	r0, r4
	ldr	r3, .L174+64
	ldr	r2, .L174+232
	mov	lr, pc
	bx	r6
	strb	r4, [fp, #232]
	b	.L38
.L165:
	ldr	r3, [sp, #64]
	str	r3, [sp]
	add	r0, sp, #40
	ldr	r3, [sp, #48]
	ldr	r2, [sp, #60]
	ldm	r0, {r0, r1}
	ldr	ip, .L174+236
	mov	lr, pc
	bx	ip
	ldrh	r3, [r8]
	b	.L35
.L166:
	ldr	r2, [sp, #80]
	str	r2, [sp, #12]
	ldr	r2, [sp, #88]
	str	r2, [sp, #8]
	ldr	r2, [sp, #84]
	ldr	r3, [sp, #36]
	str	r2, [sp, #4]
	ldr	r2, [sp, #72]
	lsl	r3, r3, #2
	str	r2, [sp]
	ldrh	r0, [fp, r3]
	ldr	r2, [sp, #68]
	ldr	r3, [sp, #76]
	ldr	r1, [sp, #52]
	ldr	ip, .L174+240
	mov	lr, pc
	bx	ip
	ldrh	r3, [r8]
	b	.L36
.L164:
	ldr	r4, [sp, #56]
	lsl	r0, r4, #16
	ldr	r3, .L174+244
	lsr	r0, r0, #16
	mov	lr, pc
	bx	r3
	ldr	r3, .L174+248
	add	r2, r4, #1
	umull	r1, r3, r2, r3
	lsr	r3, r3, #2
	add	r1, r3, r3, lsl #3
	sub	r2, r2, r1, lsl #1
	ldrh	r3, [r8]
	str	r2, [sp, #56]
	b	.L34
.L16:
	ldr	r3, [sp, #64]
	str	r3, [sp]
	add	r0, sp, #40
	ldr	r3, [sp, #48]
	ldr	r2, [sp, #60]
	ldm	r0, {r0, r1}
	ldr	ip, .L174+236
	mov	lr, pc
	bx	ip
	ldrb	r3, [r7]	@ zero_extendqisi2
	b	.L5
.L167:
	add	r1, sp, #32
	ldm	r1, {r1, r3}
	add	r0, fp, r3, lsl #2
	ldr	r3, .L174+96
	mov	lr, pc
	bx	r3
	b	.L30
.L173:
	ldr	r3, [sp, #80]
	str	r3, [sp, #12]
	ldr	r3, [sp, #88]
	str	r3, [sp, #8]
	ldr	r3, [sp, #84]
	str	r3, [sp, #4]
	ldr	r3, [sp, #72]
	ldr	r2, [sp, #68]
	str	r3, [sp]
	ldr	r1, [sp, #52]
	ldr	r3, [sp, #76]
	ldr	ip, .L174+240
	mov	lr, pc
	bx	ip
	ldrb	r3, [r7]	@ zero_extendqisi2
	b	.L31
.L175:
	.align	2
.L174:
	.word	1027
	.word	initSound
	.word	21622
	.word	4146
	.word	-8962
	.word	-26438
	.word	.LANCHOR0
	.word	memset
	.word	oldButtons
	.word	.LANCHOR1
	.word	drawString
	.word	drawStringWithBGColor
	.word	67109120
	.word	waitForVBlank
	.word	sprintf
	.word	.LC4
	.word	31775
	.word	.LC5
	.word	.LC34
	.word	.LC35
	.word	-858993459
	.word	-31389
	.word	8427
	.word	274877907
	.word	playNoteWithDuration
	.word	-1925330167
	.word	fillScreen
	.word	.LC19
	.word	.LC20
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC28
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	playDrumSound
	.word	playChannel1
	.word	playAnalogSound
	.word	954437177
	.size	main, .-main
	.global	song
	.global	emptyRow
	.section	.rodata.str1.4
	.align	2
.LC36:
	.ascii	"                                        \000"
	.global	prevMode
	.global	mode
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	song, %object
	.size	song, 232
song:
	.short	1547
	.byte	125
	.space	1
	.short	1547
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	1547
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1714
	.byte	62
	.space	1
	.short	1714
	.byte	62
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1650
	.byte	62
	.space	1
	.short	1650
	.byte	62
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1714
	.byte	62
	.space	1
	.short	1714
	.byte	62
	.space	1
	.short	1673
	.byte	62
	.space	1
	.short	1673
	.byte	62
	.space	1
	.short	1673
	.byte	62
	.space	1
	.short	1673
	.byte	62
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1650
	.byte	62
	.space	1
	.short	1650
	.byte	62
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.short	1547
	.byte	125
	.space	1
	.short	1547
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1750
	.byte	62
	.space	1
	.short	1714
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1673
	.byte	125
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1650
	.byte	125
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	1602
	.byte	125
	.space	1
	.short	1547
	.byte	125
	.space	1
	.short	0
	.byte	125
	.space	1
	.type	prevMode, %object
	.size	prevMode, 1
prevMode:
	.byte	5
	.space	3
	.type	emptyRow, %object
	.size	emptyRow, 4
emptyRow:
	.word	.LC36
	.bss
	.set	.LANCHOR1,. + 0
	.type	mode, %object
	.size	mode, 1
mode:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
