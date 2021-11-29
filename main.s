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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7296
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L4+12
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	ip, #0
	ldr	r0, .L4+28
	mov	r3, #256
	str	ip, [r0]
	ldr	r2, .L4+32
	mov	r0, #3
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	initGame
	.word	DMANow
	.word	GameFrontPal
	.word	19072
	.word	GameFrontTiles
	.word	100720640
	.word	GameFrontMap
	.word	state
	.word	83886592
	.word	spriteMarioPal
	.word	100728832
	.word	spriteMarioTiles
	.word	hideSprites
	.word	shadowOAM
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4864
	mov	r1, #0
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	add	r3, r3, #256
	ldrh	ip, [r3, #48]
	ldr	r0, .L8
	ldr	r2, .L8+4
	ldr	r3, .L8+8
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruct, %function
goToInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r5, #3
	mov	r3, #67108864
	mov	r2, #7296
	mov	r0, r5
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L12+8
	mov	r2, #100663296
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r4
	mov	r0, r5
	ldr	r1, .L12+16
	mov	r3, #1024
	ldr	r2, .L12+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+24
	ldr	r3, .L12+28
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	14560
	.word	instructionsMap
	.word	100720640
	.word	state
	.word	hideSprites
	.word	shadowOAM
	.size	goToInstruct, .-goToInstruct
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #7296
	mov	r6, #67108864
	mov	r5, #1
	ldr	r4, .L16
	strh	r3, [r6, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #7168
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+20
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r3, .L16+24
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+36
	mov	r3, #1024
	ldr	r2, .L16+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+44
	ldr	r3, .L16+48
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+52
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L16+56
	ldr	r3, .L16+60
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	skybggPal
	.word	skybggTiles
	.word	100720640
	.word	skybggMap
	.word	3716
	.word	4640
	.word	100679680
	.word	mainBGTiles
	.word	mainBGMap
	.word	100691968
	.word	state
	.word	stopSound
	.word	ThemeSong_length
	.word	ThemeSong_data
	.word	playSoundA
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r4, .L30+4
	ldr	r2, .L30+8
	ldr	r3, [r4]
	ldrh	r2, [r2]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r4]
	beq	.L19
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L19:
	tst	r2, #4
	beq	.L18
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L28:
	bl	goToGame
	ldr	r0, [r4]
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToInstruct
.L31:
	.align	2
.L30:
	.word	waitForVBlank
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	instruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
.L32:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToGame
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instruct, .-instruct
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #67108864
	ldr	r2, .L43
	ldr	r4, .L43+4
	str	r1, [r2]
	mov	r3, #256
	strh	r1, [r5, #16]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L43+12
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L43+16
	ldr	r2, .L43+20
	ldr	r1, .L43+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L43+28
	ldr	r1, .L43+32
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L43+36
	ldr	r3, .L43+40
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L43+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	hOff
	.word	DMANow
	.word	pausePal
	.word	3716
	.word	5088
	.word	100679680
	.word	pauseTiles
	.word	100691968
	.word	pauseMap
	.word	state
	.word	hideSprites
	.word	shadowOAM
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
	ldr	r2, .L57+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L55
.L46:
	tst	r3, #4
	beq	.L45
	ldr	r3, .L57+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L56
.L45:
	pop	{r4, lr}
	bx	lr
.L55:
	ldr	r3, .L57+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L56:
	pop	{r4, lr}
	b	goToStart
.L58:
	.align	2
.L57:
	.word	stopSound
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #67108864
	ldr	r2, .L61
	ldr	r4, .L61+4
	str	r1, [r2]
	mov	r3, #256
	strh	r1, [r5, #16]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+8
	mov	lr, pc
	bx	r4
	mov	r2, #7296
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L61+12
	mov	r2, #100663296
	ldr	r1, .L61+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L61+20
	ldr	r1, .L61+24
	mov	lr, pc
	bx	r4
	mov	r1, #4
	ldr	r2, .L61+28
	ldr	r3, .L61+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	hOff
	.word	DMANow
	.word	loserPal
	.word	6880
	.word	loserTiles
	.word	100720640
	.word	loserMap
	.word	state
	.word	stopSound
	.word	hideSprites
	.word	shadowOAM
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L72+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L64:
	ldr	r3, .L72+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L71
	pop	{r4, lr}
	bx	lr
.L71:
	pop	{r4, lr}
	b	goToLose
.L70:
	bl	goToPause
	b	.L64
.L73:
	.align	2
.L72:
	.word	updateGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	playerLives
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L81
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r3, .L81+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
.L74:
	pop	{r4, lr}
	bx	lr
.L80:
	pop	{r4, lr}
	b	goToStart
.L82:
	.align	2
.L81:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r6, .L95+4
	ldr	r7, .L95+8
	ldr	r5, .L95+12
	ldr	fp, .L95+16
	ldr	r10, .L95+20
	ldr	r9, .L95+24
	ldr	r8, .L95+28
	ldr	r4, .L95+32
.L84:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L85:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L85
.L87:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L86
.L86:
	ldr	r3, .L95+36
	mov	lr, pc
	bx	r3
	b	.L84
.L88:
	mov	lr, pc
	bx	r8
	b	.L84
.L89:
	mov	lr, pc
	bx	r9
	b	.L84
.L90:
	mov	lr, pc
	bx	r10
	b	.L84
.L91:
	mov	lr, pc
	bx	fp
	b	.L84
.L96:
	.align	2
.L95:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	instruct
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	state,4,4
	.comm	buffer2,41,4
	.comm	buffer1,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
