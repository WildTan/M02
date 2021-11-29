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
	.file	"game.c"
	.text
	.align	2
	.global	initMario
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMario, %function
initMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #119
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #8
	mov	r1, #16
	ldr	r3, .L4
	ldr	ip, .L4+4
	str	r0, [r3]
	ldr	r0, .L4+8
	str	lr, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [ip]
	str	r2, [r0]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	winCounter
	.word	livesUpdate
	.size	initMario, .-initMario
	.align	2
	.global	initObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacles, %function
initObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #119
	mov	r8, #16
	ldr	r4, .L14
	ldr	r5, .L14+4
	ldr	r7, .L14+8
	add	r6, r4, #96
.L7:
	str	r9, [r4]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	ip, #32
	mov	r1, #1
	smull	r2, lr, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, lr, asr #3
	rsb	lr, r2, r2, lsl #5
	add	r2, r2, lr, lsl #2
	sub	r0, r0, r2
	add	r0, r0, #200
	stmib	r4, {r0, r8, ip}
	str	r1, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	add	r4, r4, ip
	cmp	r4, r6
	bne	.L7
	mov	r6, r3
	mov	r9, #225
	mov	r8, #2
	ldr	r4, .L14+12
	ldr	r7, .L14+16
.L10:
	ands	r10, r6, #1
	bne	.L8
	mov	lr, pc
	bx	r5
	mov	r2, #4
	smull	r3, r1, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl r2
	sub	r3, r0, r3
	str	r9, [r4, #4]
	str	r10, [r4, #16]
	str	r3, [r4]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
.L9:
	add	r6, r6, #1
	cmp	r6, #3
	add	r4, r4, #20
	bne	.L10
	mov	lr, pc
	bx	r5
	mov	r1, #4
	mov	ip, #225
	mov	r4, #0
	ldr	r3, .L14+16
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r2, .L14+20
	add	r3, r3, r3, lsl r1
	sub	r3, r0, r3
	stm	r2, {r3, ip}
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r4, [r2, #16]
	mov	lr, pc
	bx	r5
	mov	r1, #6
	mov	ip, #220
	ldr	r3, .L14+24
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr r1
	add	r3, r3, r3, lsl #1
	ldr	r2, .L14+28
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r4, [r2, #16]
	stm	r2, {r3, ip}
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L8:
	mov	lr, pc
	bx	r5
	mov	r2, #0
	smull	r3, r1, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #4
	sub	r3, r0, r3
	str	r9, [r4, #4]
	str	r8, [r4, #8]
	str	r8, [r4, #12]
	str	r3, [r4]
	str	r2, [r4, #16]
	b	.L9
.L15:
	.align	2
.L14:
	.word	goombs
	.word	rand
	.word	274877907
	.word	fballs
	.word	1616928865
	.word	coin
	.word	-1240768329
	.word	heart
	.size	initObstacles, .-initObstacles
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r2, #16
	mov	lr, #119
	mov	r0, #8
	mov	ip, #90
	mov	r1, #118
	ldr	r3, .L18
	str	r4, [r3]
	ldr	r3, .L18+4
	str	r4, [r3]
	ldr	r3, .L18+8
	str	r4, [r3]
	ldr	r3, .L18+12
	ldr	r5, .L18+16
	str	lr, [r3]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r0, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r0, .L18+20
	ldr	r3, .L18+24
	str	r4, [r5]
	str	r1, [r3]
	str	ip, [r0]
	bl	initObstacles
	mov	r2, #3
	ldr	r3, .L18+28
	str	r4, [r5]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	hOff
	.word	jumpTimer
	.word	livesUpdate
	.word	player
	.word	winCounter
	.word	vOff
	.word	ground
	.word	playerLives
	.size	initGame, .-initGame
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L46
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L41
	cmp	r3, #2
	beq	.L42
	cmp	r3, #3
	beq	.L43
	cmp	r3, #4
	beq	.L44
	cmp	r3, #5
	beq	.L45
	cmp	r3, #6
	moveq	r2, #5
	ldreq	r3, .L46+4
	streq	r2, [r3]
	b	.L22
.L42:
	mov	r2, #1
	ldr	r3, .L46+4
	str	r2, [r3]
.L22:
	mov	r3, #0
	ldr	r6, .L46+8
	ldrh	r2, [r6]
	ldr	r4, .L46+12
	tst	r2, #64
	str	r3, [r4, #28]
	ldr	r3, [r4]
	beq	.L27
	ldr	r1, .L46+16
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L27
	cmp	r3, #17
	movle	r3, #19
	strle	r3, [r4]
	mov	r3, #1
	ldr	r1, .L46+20
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L46+24
	ldr	r7, .L46+28
	str	r3, [r4, #28]
	str	r3, [r4, #24]
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #20]
	add	r2, r2, #1
	cmp	r2, #2
	movgt	r1, #0
	ldr	r3, [r4]
	str	r2, [r4, #20]
	ldrhle	r2, [r6]
	ldrhgt	r2, [r6]
	strgt	r1, [r4, #20]
	sub	r3, r3, #18
.L27:
	ldr	r1, .L46+32
	ldr	r1, [r1]
	cmp	r1, r3
	movle	r1, #0
	ldrgt	r1, [r4, #24]
	strle	r1, [r4, #24]
	addgt	r3, r3, r1
	strle	r1, [r4, #28]
	tst	r2, #16
	str	r3, [r4]
	beq	.L20
	ldr	r3, .L46+16
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L20
	ldr	r3, [r5]
	add	r3, r3, #3
	cmp	r3, #6
	movgt	r3, #6
	str	r3, [r5]
.L20:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	mov	r2, #0
	ldr	r3, .L46+4
	str	r2, [r3]
	b	.L22
.L44:
	mov	r2, #3
	ldr	r3, .L46+4
	str	r2, [r3]
	b	.L22
.L43:
	mov	r2, #2
	ldr	r3, .L46+4
	str	r2, [r3]
	b	.L22
.L45:
	mov	r2, #4
	ldr	r3, .L46+4
	str	r2, [r3]
	b	.L22
.L47:
	.align	2
.L46:
	.word	playerLives
	.word	livesUpdate
	.word	oldButtons
	.word	player
	.word	buttons
	.word	jumpingSound_length
	.word	jumpingSound_data
	.word	playSoundB
	.word	ground
	.size	updateMario, .-updateMario
	.align	2
	.global	updateGoombas
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoombas, %function
updateGoombas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	cmp	r3, #90
	moveq	r1, #0
	push	{r4, r5, lr}
	ldr	r2, [r0, #4]
	sub	r2, r2, #1
	mov	r4, r0
	str	r2, [r0, #4]
	streq	r1, [r0, #28]
	sub	sp, sp, #20
	beq	.L50
	cmp	r3, #119
	moveq	r1, #1
	streq	r1, [r0, #28]
	bne	.L59
.L52:
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	add	r1, r1, #1
	str	r3, [r4]
	str	r1, [r4, #20]
	b	.L53
.L59:
	ldr	r1, [r0, #28]
	cmp	r1, #1
	beq	.L52
.L50:
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r1, [r4, #20]
.L53:
	cmp	r1, #2
	movgt	r1, #0
	strgt	r1, [r4, #20]
	ldr	r1, .L62
	ldr	lr, [r4, #8]
	ldr	r0, [r1, #4]
	ldr	ip, [r4, #12]
	stm	sp, {r2, r3}
	ldr	r5, .L62+4
	ldr	r3, [r1, #8]
	ldr	r2, [r1, #12]
	sub	r0, r0, #3
	ldr	r1, [r1]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L60
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L61
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L61:
	str	r0, [r4, #16]
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
.L58:
	ldr	r2, .L62+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #150
	str	r0, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L60:
	ldr	r2, .L62+16
	ldr	r3, [r2]
	ldr	r1, .L62+8
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	b	.L58
.L63:
	.align	2
.L62:
	.word	player
	.word	collision
	.word	rand
	.word	-2004318071
	.word	playerLives
	.size	updateGoombas, .-updateGoombas
	.align	2
	.global	updateFBS
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFBS, %function
updateFBS:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldmib	r0, {r3, r5, lr}
	ldr	r2, .L73
	sub	sp, sp, #20
	sub	r3, r3, #1
	ldr	r1, [r2]
	str	r3, [r0, #4]
	ldr	ip, [r0]
	str	r3, [sp]
	mov	r4, r0
	ldr	r0, [r2, #4]
	stmib	sp, {ip, lr}
	str	r5, [sp, #12]
	sub	r1, r1, #7
	ldr	r3, [r2, #8]
	ldr	r5, .L73+4
	ldr	r2, [r2, #12]
	sub	r0, r0, #7
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L71
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L72
.L64:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L71:
	mov	r1, #237
	ldr	r2, .L73+8
	ldr	r3, [r2]
	str	r1, [r4, #4]
	sub	r3, r3, #1
	ldr	r1, .L73+12
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r2, .L73+16
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	str	r3, [r4]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L64
.L72:
	mov	r2, #0
	mov	r3, #237
	str	r2, [r4, #16]
	str	r3, [r4, #4]
	ldr	r3, .L73+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #1
	add	r2, r2, r2, lsl #3
	rsb	r3, r3, r2, lsl #2
	sub	r0, r0, r3
	str	r0, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	player
	.word	collision
	.word	playerLives
	.word	rand
	.word	-1518422781
	.word	1284476201
	.size	updateFBS, .-updateFBS
	.align	2
	.global	updateCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoin, %function
updateCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldmib	r0, {r3, r5, lr}
	ldr	r2, .L84
	sub	sp, sp, #20
	sub	r3, r3, #2
	ldr	r1, [r2]
	str	r3, [r0, #4]
	ldr	ip, [r0]
	str	r3, [sp]
	mov	r4, r0
	ldr	r0, [r2, #4]
	stmib	sp, {ip, lr}
	str	r5, [sp, #12]
	sub	r1, r1, #6
	ldr	r3, [r2, #8]
	ldr	r5, .L84+4
	ldr	r2, [r2, #12]
	sub	r0, r0, #6
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L82
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L83
.L75:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L82:
	mov	r1, #237
	ldr	r2, .L84+8
	ldr	r3, [r2]
	str	r1, [r4, #4]
	add	r3, r3, #1
	ldr	r1, .L84+12
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r2, .L84+16
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L75
.L83:
	mov	r2, #0
	mov	r3, #237
	str	r2, [r4, #16]
	str	r3, [r4, #4]
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	str	r3, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	player
	.word	collision
	.word	winCounter
	.word	rand
	.word	-1240768329
	.word	738919105
	.size	updateCoin, .-updateCoin
	.align	2
	.global	updateHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeart, %function
updateHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldmib	r0, {r3, r5, lr}
	ldr	r2, .L95
	sub	sp, sp, #20
	sub	r3, r3, #2
	ldr	r1, [r2]
	str	r3, [r0, #4]
	ldr	ip, [r0]
	str	r3, [sp]
	mov	r4, r0
	ldr	r0, [r2, #4]
	stmib	sp, {ip, lr}
	str	r5, [sp, #12]
	sub	r1, r1, #6
	ldr	r3, [r2, #8]
	ldr	r5, .L95+4
	ldr	r2, [r2, #12]
	sub	r0, r0, #6
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L93
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L94
.L86:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L93:
	mov	r1, #237
	ldr	r2, .L95+8
	ldr	r3, [r2]
	str	r1, [r4, #4]
	add	r3, r3, #1
	ldr	r1, .L95+12
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r2, .L95+16
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L86
.L94:
	mov	r2, #0
	mov	r3, #237
	str	r2, [r4, #16]
	str	r3, [r4, #4]
	ldr	r3, .L95+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L95+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #4
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	player
	.word	collision
	.word	playerLives
	.word	rand
	.word	-1240768329
	.word	-1370734243
	.size	updateHeart, .-updateHeart
	.align	2
	.global	spawnObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnObstacles, %function
spawnObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	lr, .L113
	ldr	r0, .L113+4
	ldr	r2, [lr]
.L100:
	cmp	r2, #9
	ble	.L98
	ldr	r1, [r0, r3, lsl #5]
	cmp	r1, #0
	lsl	r1, r3, #5
	beq	.L111
.L98:
	add	r3, r3, #1
	cmp	r3, #3
	bne	.L100
	add	r0, r2, #1
.L99:
	ldr	r5, .L113+8
	mov	r3, #0
	mov	r2, r5
	ldr	r4, .L113+12
	ldr	r1, [r4]
.L103:
	cmp	r1, #19
	ble	.L101
	ldr	ip, [r2, #16]
	cmp	ip, #0
	beq	.L112
.L101:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #20
	bne	.L103
	add	r1, r1, #1
.L102:
	ldr	r2, .L113+16
	ldr	r3, [r2]
	cmp	r3, #119
	ble	.L110
	ldr	ip, .L113+20
	ldr	r5, [ip, #16]
	cmp	r5, #0
	beq	.L106
.L110:
	add	r3, r3, #1
.L105:
	str	r0, [lr]
	str	r1, [r4]
	str	r3, [r2]
	pop	{r4, r5, lr}
	bx	lr
.L106:
	mov	r5, #1
	mov	r3, r5
	str	r5, [ip, #16]
	b	.L105
.L112:
	mov	r1, #1
	add	r3, r3, r3, lsl #2
	add	r3, r5, r3, lsl #2
	str	r1, [r3, #16]
	b	.L102
.L111:
	mov	r2, #1
	ldr	r3, .L113+24
	add	r1, r3, r1
	mov	r0, r2
	str	r2, [r1, #16]
	b	.L99
.L114:
	.align	2
.L113:
	.word	gameTimer1
	.word	goombs+16
	.word	fballs
	.word	gameTimer2
	.word	gameTimer3
	.word	heart
	.word	goombs
	.size	spawnObstacles, .-spawnObstacles
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L127
	ldr	r2, [r1]
	cmp	r2, #200
	movgt	r3, #0
	mov	r0, #67108864
	movgt	r2, r3
	addle	r2, r2, #1
	addle	r3, r2, r2, lsr #31
	asrle	r3, r3, #1
	lslle	r3, r3, #16
	lsrle	r3, r3, #16
	push	{r4, r5, r6, r7, r8, lr}
	str	r2, [r1]
	strh	r3, [r0, #16]	@ movhi
	bl	updateMario
	bl	spawnObstacles
	ldr	r1, .L127+4
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #20]
	ldr	r4, .L127+8
	ldr	r1, [r1]
	ldr	r7, .L127+12
	orr	r2, r2, #16384
	lsl	r3, r3, #1
	mov	r0, r7
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bl	updateCoin
	mov	r2, #72
	ldr	r3, [r7, #4]
	ldr	r1, [r7]
	ldr	r5, .L127+16
	orr	r3, r3, #16384
	mov	r0, r5
	strh	r1, [r4, #8]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	bl	updateHeart
	mov	lr, #74
	mov	ip, #49152
	mov	r0, #128
	mov	r1, #138
	ldr	r2, [r5, #4]
	ldr	r3, .L127+20
	orr	r2, r2, #16384
	ldr	r3, [r3]
	ldr	r8, [r5]
	strh	r2, [r4, #18]	@ movhi
	ldr	r2, .L127+24
	ldr	r5, .L127+28
	add	r3, r3, #160
	strh	r2, [r4, #24]	@ movhi
	lsl	r3, r3, #1
	sub	r2, r2, #97
	mov	r6, r4
	mov	r7, r4
	strh	r8, [r4, #16]	@ movhi
	strh	lr, [r4, #20]	@ movhi
	strh	ip, [r4, #26]	@ movhi
	strh	r0, [r4, #28]	@ movhi
	strh	r1, [r4, #32]	@ movhi
	strh	r2, [r4, #34]	@ movhi
	strh	r3, [r4, #36]	@ movhi
	add	r4, r5, #96
.L118:
	ldr	r3, [r5, #16]
	cmp	r3, #1
	beq	.L125
.L117:
	add	r5, r5, #32
	cmp	r5, r4
	add	r7, r7, #8
	bne	.L118
	mov	r7, #70
	ldr	r4, .L127+32
	add	r5, r4, #60
.L120:
	ldr	r3, [r4, #16]
	cmp	r3, #1
	beq	.L126
.L119:
	add	r4, r4, #20
	cmp	r4, r5
	add	r6, r6, #8
	bne	.L120
	ldr	r4, .L127+36
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L127+8
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L126:
	mov	r0, r4
	bl	updateFBS
	ldm	r4, {r2, r3}
	orr	r3, r3, #16384
	strh	r7, [r6, #92]	@ movhi
	strh	r3, [r6, #90]	@ movhi
	strh	r2, [r6, #88]	@ movhi
	b	.L119
.L125:
	mov	r0, r5
	bl	updateGoombas
	ldr	r3, [r5, #20]
	add	r3, r3, #32
	lsl	r3, r3, #1
	ldr	r2, [r5, #4]
	strh	r3, [r7, #44]	@ movhi
	ldr	r3, [r5]
	orr	r2, r2, #16384
	strh	r2, [r7, #42]	@ movhi
	strh	r3, [r7, #40]	@ movhi
	b	.L117
.L128:
	.align	2
.L127:
	.word	hOff
	.word	player
	.word	shadowOAM
	.word	coin
	.word	heart
	.word	livesUpdate
	.word	16524
	.word	goombs
	.word	fballs
	.word	DMANow
	.size	updateGame, .-updateGame
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	ground,4,4
	.comm	jumpTimer,4,4
	.comm	livesUpdate,4,4
	.comm	gameTimer3,4,4
	.comm	gameTimer2,4,4
	.comm	gameTimer1,4,4
	.comm	winCounter,4,4
	.comm	playerLives,4,4
	.comm	fballs,60,4
	.comm	goombs,96,4
	.comm	player,32,4
	.comm	coin,20,4
	.comm	heart,20,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
