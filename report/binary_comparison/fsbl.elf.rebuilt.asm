
C:\Users\33827\Desktop\Battery-health\work\build_933a316cbff345c6a8586e2430cdc15a\fsbl.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_vector_table>:
       0:	ea000031 	b	cc <_boot>
       4:	ea00000d 	b	40 <Undefined>
       8:	ea000013 	b	5c <SVCHandler>
       c:	ea000023 	b	a0 <PrefetchAbortHandler>
      10:	ea00001a 	b	80 <DataAbortHandler>
      14:	e320f000 	nop	{0}
      18:	ea000000 	b	20 <IRQHandler>
      1c:	ea000003 	b	30 <FIQHandler>

00000020 <IRQHandler>:
      20:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
      24:	eb00433d 	bl	10d20 <IRQInterrupt>
      28:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      2c:	e25ef004 	subs	pc, lr, #4

00000030 <FIQHandler>:
      30:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}

00000034 <FIQLoop>:
      34:	eb004334 	bl	10d0c <FIQInterrupt>
      38:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      3c:	e25ef004 	subs	pc, lr, #4

00000040 <Undefined>:
      40:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
      44:	e59f0074 	ldr	r0, [pc, #116]	; c0 <PrefetchAbortHandler+0x20>
      48:	e24e1004 	sub	r1, lr, #4
      4c:	e5801000 	str	r1, [r0]
      50:	eb004337 	bl	10d34 <UndefinedException>
      54:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      58:	e1b0f00e 	movs	pc, lr

0000005c <SVCHandler>:
      5c:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
      60:	e3100020 	tst	r0, #32
      64:	115e00b2 	ldrhne	r0, [lr, #-2]
      68:	13c00cff 	bicne	r0, r0, #65280	; 0xff00
      6c:	051e0004 	ldreq	r0, [lr, #-4]
      70:	03c004ff 	biceq	r0, r0, #-16777216	; 0xff000000
      74:	eb004333 	bl	10d48 <SWInterrupt>
      78:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      7c:	e1b0f00e 	movs	pc, lr

00000080 <DataAbortHandler>:
      80:	f57ff04f 	dsb	sy
      84:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
      88:	e59f0034 	ldr	r0, [pc, #52]	; c4 <PrefetchAbortHandler+0x24>
      8c:	e24e1008 	sub	r1, lr, #8
      90:	e5801000 	str	r1, [r0]
      94:	eb004330 	bl	10d5c <DataAbortInterrupt>
      98:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      9c:	e25ef008 	subs	pc, lr, #8

000000a0 <PrefetchAbortHandler>:
      a0:	f57ff04f 	dsb	sy
      a4:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
      a8:	e59f0018 	ldr	r0, [pc, #24]	; c8 <PrefetchAbortHandler+0x28>
      ac:	e24e1004 	sub	r1, lr, #4
      b0:	e5801000 	str	r1, [r0]
      b4:	eb00432d 	bl	10d70 <PrefetchAbortInterrupt>
      b8:	e8bd500f 	pop	{r0, r1, r2, r3, ip, lr}
      bc:	e25ef004 	subs	pc, lr, #4
      c0:	0001f4c8 	.word	0x0001f4c8
      c4:	0001f4d0 	.word	0x0001f4d0
      c8:	0001f4cc 	.word	0x0001f4cc

000000cc <_boot>:
      cc:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
      d0:	e201100f 	and	r1, r1, #15
      d4:	e3510000 	cmp	r1, #0
      d8:	0a000000 	beq	e0 <CheckEFUSE>
      dc:	ea00000d 	b	118 <OKToRun>

000000e0 <CheckEFUSE>:
      e0:	e59f02ec 	ldr	r0, [pc, #748]	; 3d4 <finished+0x14>
      e4:	e5901000 	ldr	r1, [r0]
      e8:	e2111080 	ands	r1, r1, #128	; 0x80
      ec:	0a000009 	beq	118 <OKToRun>
      f0:	e59f02e0 	ldr	r0, [pc, #736]	; 3d8 <finished+0x18>
      f4:	e59f12e0 	ldr	r1, [pc, #736]	; 3dc <finished+0x1c>
      f8:	e5801000 	str	r1, [r0]
      fc:	e59f02dc 	ldr	r0, [pc, #732]	; 3e0 <finished+0x20>
     100:	e5901000 	ldr	r1, [r0]
     104:	e3811022 	orr	r1, r1, #34	; 0x22
     108:	e5801000 	str	r1, [r0]
     10c:	e59f02d0 	ldr	r0, [pc, #720]	; 3e4 <finished+0x24>
     110:	e59f12d0 	ldr	r1, [pc, #720]	; 3e8 <finished+0x28>
     114:	e5801000 	str	r1, [r0]

00000118 <OKToRun>:
     118:	ee100f10 	mrc	15, 0, r0, cr0, cr0, {0}
     11c:	e200560f 	and	r5, r0, #15728640	; 0xf00000
     120:	e200600f 	and	r6, r0, #15
     124:	e1866825 	orr	r6, r6, r5, lsr #16
     128:	e59f02bc 	ldr	r0, [pc, #700]	; 3ec <finished+0x2c>
     12c:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
     130:	e59f72b8 	ldr	r7, [pc, #696]	; 3f0 <finished+0x30>
     134:	e59f62b8 	ldr	r6, [pc, #696]	; 3f4 <finished+0x34>
     138:	e5876000 	str	r6, [r7]
     13c:	e3a00000 	mov	r0, #0
     140:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
     144:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}
     148:	ee070fd5 	mcr	15, 0, r0, cr7, cr5, {6}
     14c:	eb00007c 	bl	344 <invalidate_dcache>
     150:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     154:	e3c00001 	bic	r0, r0, #1
     158:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     15c:	e10f0000 	mrs	r0, CPSR
     160:	e3e0101f 	mvn	r1, #31
     164:	e0012000 	and	r2, r1, r0
     168:	e3822012 	orr	r2, r2, #18
     16c:	e129f002 	msr	CPSR_fc, r2
     170:	e59fd280 	ldr	sp, [pc, #640]	; 3f8 <finished+0x38>
     174:	e3c22c02 	bic	r2, r2, #512	; 0x200
     178:	e16ff002 	msr	SPSR_fsxc, r2
     17c:	e10f0000 	mrs	r0, CPSR
     180:	e3e0101f 	mvn	r1, #31
     184:	e0012000 	and	r2, r1, r0
     188:	e3822013 	orr	r2, r2, #19
     18c:	e129f002 	msr	CPSR_fc, r2
     190:	e59fd264 	ldr	sp, [pc, #612]	; 3fc <finished+0x3c>
     194:	e3c22c02 	bic	r2, r2, #512	; 0x200
     198:	e16ff002 	msr	SPSR_fsxc, r2
     19c:	e10f0000 	mrs	r0, CPSR
     1a0:	e3e0101f 	mvn	r1, #31
     1a4:	e0012000 	and	r2, r1, r0
     1a8:	e3822017 	orr	r2, r2, #23
     1ac:	e129f002 	msr	CPSR_fc, r2
     1b0:	e59fd248 	ldr	sp, [pc, #584]	; 400 <_ABORT_STACK_SIZE>
     1b4:	e3c22c02 	bic	r2, r2, #512	; 0x200
     1b8:	e16ff002 	msr	SPSR_fsxc, r2
     1bc:	e10f0000 	mrs	r0, CPSR
     1c0:	e3e0101f 	mvn	r1, #31
     1c4:	e0012000 	and	r2, r1, r0
     1c8:	e3822011 	orr	r2, r2, #17
     1cc:	e129f002 	msr	CPSR_fc, r2
     1d0:	e59fd22c 	ldr	sp, [pc, #556]	; 404 <_ABORT_STACK_SIZE+0x4>
     1d4:	e3c22c02 	bic	r2, r2, #512	; 0x200
     1d8:	e16ff002 	msr	SPSR_fsxc, r2
     1dc:	e10f0000 	mrs	r0, CPSR
     1e0:	e3e0101f 	mvn	r1, #31
     1e4:	e0012000 	and	r2, r1, r0
     1e8:	e382201b 	orr	r2, r2, #27
     1ec:	e129f002 	msr	CPSR_fc, r2
     1f0:	e59fd210 	ldr	sp, [pc, #528]	; 408 <_ABORT_STACK_SIZE+0x8>
     1f4:	e3c22c02 	bic	r2, r2, #512	; 0x200
     1f8:	e16ff002 	msr	SPSR_fsxc, r2
     1fc:	e10f0000 	mrs	r0, CPSR
     200:	e3e0101f 	mvn	r1, #31
     204:	e0012000 	and	r2, r1, r0
     208:	e382201f 	orr	r2, r2, #31
     20c:	e129f002 	msr	CPSR_fc, r2
     210:	e59fd1f4 	ldr	sp, [pc, #500]	; 40c <_ABORT_STACK_SIZE+0xc>
     214:	e59f71f4 	ldr	r7, [pc, #500]	; 410 <_ABORT_STACK_SIZE+0x10>
     218:	e5970000 	ldr	r0, [r7]
     21c:	e3800001 	orr	r0, r0, #1
     220:	e5870000 	str	r0, [r7]
     224:	e59f01e8 	ldr	r0, [pc, #488]	; 414 <_ABORT_STACK_SIZE+0x14>
     228:	e380005b 	orr	r0, r0, #91	; 0x5b
     22c:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
     230:	e3e00000 	mvn	r0, #0
     234:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
     238:	e59f01d8 	ldr	r0, [pc, #472]	; 418 <_ABORT_STACK_SIZE+0x18>
     23c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     240:	f57ff04f 	dsb	sy
     244:	f57ff06f 	isb	sy
     248:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
     24c:	e3800040 	orr	r0, r0, #64	; 0x40
     250:	e3800001 	orr	r0, r0, #1
     254:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
     258:	e59f01bc 	ldr	r0, [pc, #444]	; 41c <_ABORT_STACK_SIZE+0x1c>
     25c:	e3a01000 	mov	r1, #0
     260:	e5801000 	str	r1, [r0]
     264:	e59f01b4 	ldr	r0, [pc, #436]	; 420 <_ABORT_STACK_SIZE+0x20>
     268:	e5901000 	ldr	r1, [r0]
     26c:	e59f21b0 	ldr	r2, [pc, #432]	; 424 <_ABORT_STACK_SIZE+0x24>
     270:	e1811002 	orr	r1, r1, r2
     274:	e5801000 	str	r1, [r0]
     278:	e59f01a8 	ldr	r0, [pc, #424]	; 428 <_ABORT_STACK_SIZE+0x28>
     27c:	e59f11a8 	ldr	r1, [pc, #424]	; 42c <_ABORT_STACK_SIZE+0x2c>
     280:	e5801000 	str	r1, [r0]
     284:	e59f01a4 	ldr	r0, [pc, #420]	; 430 <_ABORT_STACK_SIZE+0x30>
     288:	e59f11a4 	ldr	r1, [pc, #420]	; 434 <_ABORT_STACK_SIZE+0x34>
     28c:	e5801000 	str	r1, [r0]
     290:	e59f01a0 	ldr	r0, [pc, #416]	; 438 <_ABORT_STACK_SIZE+0x38>
     294:	e59f2158 	ldr	r2, [pc, #344]	; 3f4 <finished+0x34>
     298:	e5802000 	str	r2, [r0]
     29c:	e59f0198 	ldr	r0, [pc, #408]	; 43c <_ABORT_STACK_SIZE+0x3c>

000002a0 <Sync>:
     2a0:	e5901000 	ldr	r1, [r0]
     2a4:	e3510000 	cmp	r1, #0
     2a8:	1afffffc 	bne	2a0 <Sync>
     2ac:	e59f018c 	ldr	r0, [pc, #396]	; 440 <_ABORT_STACK_SIZE+0x40>
     2b0:	e5901000 	ldr	r1, [r0]
     2b4:	e59f0188 	ldr	r0, [pc, #392]	; 444 <_ABORT_STACK_SIZE+0x44>
     2b8:	e5801000 	str	r1, [r0]
     2bc:	e59f0114 	ldr	r0, [pc, #276]	; 3d8 <finished+0x18>
     2c0:	e59f1114 	ldr	r1, [pc, #276]	; 3dc <finished+0x1c>
     2c4:	e5801000 	str	r1, [r0]
     2c8:	e59f0178 	ldr	r0, [pc, #376]	; 448 <_ABORT_STACK_SIZE+0x48>
     2cc:	e59f1178 	ldr	r1, [pc, #376]	; 44c <_ABORT_STACK_SIZE+0x4c>
     2d0:	e5801000 	str	r1, [r0]
     2d4:	e59f0108 	ldr	r0, [pc, #264]	; 3e4 <finished+0x24>
     2d8:	e59f1108 	ldr	r1, [pc, #264]	; 3e8 <finished+0x28>
     2dc:	e5801000 	str	r1, [r0]
     2e0:	e59f0134 	ldr	r0, [pc, #308]	; 41c <_ABORT_STACK_SIZE+0x1c>
     2e4:	e5901000 	ldr	r1, [r0]
     2e8:	e3a02001 	mov	r2, #1
     2ec:	e1811002 	orr	r1, r1, r2
     2f0:	e5801000 	str	r1, [r0]
     2f4:	e1a00000 	nop			; (mov r0, r0)
     2f8:	ee111f50 	mrc	15, 0, r1, cr1, cr0, {2}
     2fc:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
     300:	ee011f50 	mcr	15, 0, r1, cr1, cr0, {2}
     304:	eef81a10 	vmrs	r1, fpexc
     308:	e3811101 	orr	r1, r1, #1073741824	; 0x40000000
     30c:	eee81a10 	vmsr	fpexc, r1
     310:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     314:	e3800b02 	orr	r0, r0, #2048	; 0x800
     318:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     31c:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
     320:	e3800004 	orr	r0, r0, #4
     324:	e3800002 	orr	r0, r0, #2
     328:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
     32c:	e10f0000 	mrs	r0, CPSR
     330:	e3c00c01 	bic	r0, r0, #256	; 0x100
     334:	e12ef000 	msr	CPSR_fsx, r0
     338:	ea003eec 	b	fef0 <_start>
     33c:	e0000000 	and	r0, r0, r0
     340:	eafffffe 	b	340 <Sync+0xa0>

00000344 <invalidate_dcache>:
     344:	ee300f30 	mrc	15, 1, r0, cr0, cr0, {1}
     348:	e2103407 	ands	r3, r0, #117440512	; 0x7000000
     34c:	e1a03ba3 	lsr	r3, r3, #23
     350:	0a00001a 	beq	3c0 <finished>
     354:	e3a0a000 	mov	sl, #0

00000358 <loop1>:
     358:	e08a20aa 	add	r2, sl, sl, lsr #1
     35c:	e1a01230 	lsr	r1, r0, r2
     360:	e2011007 	and	r1, r1, #7
     364:	e3510002 	cmp	r1, #2
     368:	ba000011 	blt	3b4 <skip>
     36c:	ee40af10 	mcr	15, 2, sl, cr0, cr0, {0}
     370:	f57ff06f 	isb	sy
     374:	ee301f10 	mrc	15, 1, r1, cr0, cr0, {0}
     378:	e2012007 	and	r2, r1, #7
     37c:	e2822004 	add	r2, r2, #4
     380:	e59f40c8 	ldr	r4, [pc, #200]	; 450 <_ABORT_STACK_SIZE+0x50>
     384:	e01441a1 	ands	r4, r4, r1, lsr #3
     388:	e16f5f14 	clz	r5, r4
     38c:	e59f70c0 	ldr	r7, [pc, #192]	; 454 <_ABORT_STACK_SIZE+0x54>
     390:	e01776a1 	ands	r7, r7, r1, lsr #13

00000394 <loop2>:
     394:	e1a09004 	mov	r9, r4

00000398 <loop3>:
     398:	e18ab519 	orr	fp, sl, r9, lsl r5
     39c:	e18bb217 	orr	fp, fp, r7, lsl r2
     3a0:	ee07bf56 	mcr	15, 0, fp, cr7, cr6, {2}
     3a4:	e2599001 	subs	r9, r9, #1
     3a8:	aafffffa 	bge	398 <loop3>
     3ac:	e2577001 	subs	r7, r7, #1
     3b0:	aafffff7 	bge	394 <loop2>

000003b4 <skip>:
     3b4:	e28aa002 	add	sl, sl, #2
     3b8:	e153000a 	cmp	r3, sl
     3bc:	caffffe5 	bgt	358 <loop1>

000003c0 <finished>:
     3c0:	e3a0a000 	mov	sl, #0
     3c4:	ee40af10 	mcr	15, 2, sl, cr0, cr0, {0}
     3c8:	f57ff04f 	dsb	sy
     3cc:	f57ff06f 	isb	sy
     3d0:	e12fff1e 	bx	lr
     3d4:	f800d010 	.word	0xf800d010
     3d8:	f8000008 	.word	0xf8000008
     3dc:	0000df0d 	.word	0x0000df0d
     3e0:	f8000244 	.word	0xf8000244
     3e4:	f8000004 	.word	0xf8000004
     3e8:	0000767b 	.word	0x0000767b
     3ec:	00000000 	.word	0x00000000
     3f0:	f8f0000c 	.word	0xf8f0000c
     3f4:	0000ffff 	.word	0x0000ffff
     3f8:	ffffc000 	.word	0xffffc000
     3fc:	ffffc800 	.word	0xffffc800
     400:	ffffcc00 	.word	0xffffcc00
     404:	ffffd000 	.word	0xffffd000
     408:	ffffd400 	.word	0xffffd400
     40c:	ffff6000 	.word	0xffff6000
     410:	f8f00000 	.word	0xf8f00000
     414:	00018000 	.word	0x00018000
     418:	00001005 	.word	0x00001005
     41c:	f8f02100 	.word	0xf8f02100
     420:	f8f02104 	.word	0xf8f02104
     424:	72360000 	.word	0x72360000
     428:	f8f02108 	.word	0xf8f02108
     42c:	00000111 	.word	0x00000111
     430:	f8f0210c 	.word	0xf8f0210c
     434:	00000121 	.word	0x00000121
     438:	f8f0277c 	.word	0xf8f0277c
     43c:	f8f02730 	.word	0xf8f02730
     440:	f8f0221c 	.word	0xf8f0221c
     444:	f8f02220 	.word	0xf8f02220
     448:	f8000a1c 	.word	0xf8000a1c
     44c:	00020202 	.word	0x00020202
     450:	000003ff 	.word	0x000003ff
     454:	00007fff 	.word	0x00007fff

00000458 <__do_global_dtors_aux>:
     458:	b510      	push	{r4, lr}
     45a:	f24d 0440 	movw	r4, #53312	; 0xd040
     45e:	f2c0 0401 	movt	r4, #1
     462:	7823      	ldrb	r3, [r4, #0]
     464:	b963      	cbnz	r3, 480 <__do_global_dtors_aux+0x28>
     466:	f240 0300 	movw	r3, #0
     46a:	f2c0 0300 	movt	r3, #0
     46e:	b12b      	cbz	r3, 47c <__do_global_dtors_aux+0x24>
     470:	f244 3050 	movw	r0, #17232	; 0x4350
     474:	f2c0 0001 	movt	r0, #1
     478:	f3af 8000 	nop.w
     47c:	2301      	movs	r3, #1
     47e:	7023      	strb	r3, [r4, #0]
     480:	bd10      	pop	{r4, pc}
     482:	bf00      	nop

00000484 <frame_dummy>:
     484:	b508      	push	{r3, lr}
     486:	f240 0300 	movw	r3, #0
     48a:	f2c0 0300 	movt	r3, #0
     48e:	b14b      	cbz	r3, 4a4 <frame_dummy+0x20>
     490:	f24d 0144 	movw	r1, #53316	; 0xd044
     494:	f2c0 0101 	movt	r1, #1
     498:	f244 3050 	movw	r0, #17232	; 0x4350
     49c:	f2c0 0001 	movt	r0, #1
     4a0:	f3af 8000 	nop.w
     4a4:	bd08      	pop	{r3, pc}
     4a6:	bf00      	nop

000004a8 <FsblHookBeforeBitstreamDload>:
     4a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4ac:	e28db000 	add	fp, sp, #0
     4b0:	e24dd00c 	sub	sp, sp, #12
     4b4:	e3a03000 	mov	r3, #0
     4b8:	e50b3008 	str	r3, [fp, #-8]
     4bc:	e51b3008 	ldr	r3, [fp, #-8]
     4c0:	e1a00003 	mov	r0, r3
     4c4:	e28bd000 	add	sp, fp, #0
     4c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     4cc:	e12fff1e 	bx	lr

000004d0 <FsblHookAfterBitstreamDload>:
     4d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4d4:	e28db000 	add	fp, sp, #0
     4d8:	e24dd00c 	sub	sp, sp, #12
     4dc:	e3a03000 	mov	r3, #0
     4e0:	e50b3008 	str	r3, [fp, #-8]
     4e4:	e51b3008 	ldr	r3, [fp, #-8]
     4e8:	e1a00003 	mov	r0, r3
     4ec:	e28bd000 	add	sp, fp, #0
     4f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     4f4:	e12fff1e 	bx	lr

000004f8 <FsblHookBeforeHandoff>:
     4f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4fc:	e28db000 	add	fp, sp, #0
     500:	e24dd00c 	sub	sp, sp, #12
     504:	e3a03000 	mov	r3, #0
     508:	e50b3008 	str	r3, [fp, #-8]
     50c:	e51b3008 	ldr	r3, [fp, #-8]
     510:	e1a00003 	mov	r0, r3
     514:	e28bd000 	add	sp, fp, #0
     518:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     51c:	e12fff1e 	bx	lr

00000520 <FsblHookFallback>:
     520:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     524:	e28db000 	add	fp, sp, #0
     528:	e320f000 	nop	{0}
     52c:	eafffffd 	b	528 <FsblHookFallback+0x8>

00000530 <Xil_In32>:
     530:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     534:	e28db000 	add	fp, sp, #0
     538:	e24dd00c 	sub	sp, sp, #12
     53c:	e50b0008 	str	r0, [fp, #-8]
     540:	e51b3008 	ldr	r3, [fp, #-8]
     544:	e5933000 	ldr	r3, [r3]
     548:	e1a00003 	mov	r0, r3
     54c:	e28bd000 	add	sp, fp, #0
     550:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     554:	e12fff1e 	bx	lr

00000558 <Xil_Out32>:
     558:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     55c:	e28db000 	add	fp, sp, #0
     560:	e24dd014 	sub	sp, sp, #20
     564:	e50b0010 	str	r0, [fp, #-16]
     568:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     56c:	e51b3010 	ldr	r3, [fp, #-16]
     570:	e50b3008 	str	r3, [fp, #-8]
     574:	e51b3008 	ldr	r3, [fp, #-8]
     578:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
     57c:	e5832000 	str	r2, [r3]
     580:	e320f000 	nop	{0}
     584:	e28bd000 	add	sp, fp, #0
     588:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     58c:	e12fff1e 	bx	lr

00000590 <LoadBootImage>:
     590:	e92d4800 	push	{fp, lr}
     594:	e28db004 	add	fp, sp, #4
     598:	e24dd050 	sub	sp, sp, #80	; 0x50
     59c:	e3a03000 	mov	r3, #0
     5a0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
     5a4:	e3a03000 	mov	r3, #0
     5a8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
     5ac:	e3a03000 	mov	r3, #0
     5b0:	e50b3008 	str	r3, [fp, #-8]
     5b4:	e3a03000 	mov	r3, #0
     5b8:	e50b3010 	str	r3, [fp, #-16]
     5bc:	e3a03000 	mov	r3, #0
     5c0:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
     5c4:	e30d3061 	movw	r3, #53345	; 0xd061
     5c8:	e3403001 	movt	r3, #1
     5cc:	e3a02000 	mov	r2, #0
     5d0:	e5c32000 	strb	r2, [r3]
     5d4:	e30d3062 	movw	r3, #53346	; 0xd062
     5d8:	e3403001 	movt	r3, #1
     5dc:	e3a02000 	mov	r2, #0
     5e0:	e5c32000 	strb	r2, [r3]
     5e4:	e3a00f96 	mov	r0, #600	; 0x258
     5e8:	e34f0800 	movt	r0, #63488	; 0xf800
     5ec:	ebffffcf 	bl	530 <Xil_In32>
     5f0:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
     5f4:	e30d33f8 	movw	r3, #54264	; 0xd3f8
     5f8:	e3403001 	movt	r3, #1
     5fc:	e5933000 	ldr	r3, [r3]
     600:	e3530000 	cmp	r3, #0
     604:	1a00000e 	bne	644 <LoadBootImage+0xb4>
     608:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     60c:	e203320f 	and	r3, r3, #-268435456	; 0xf0000000
     610:	e353020f 	cmp	r3, #-268435456	; 0xf0000000
     614:	1a000006 	bne	634 <LoadBootImage+0xa4>
     618:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
     61c:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
     620:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
     624:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
     628:	e3a00f96 	mov	r0, #600	; 0x258
     62c:	e34f0800 	movt	r0, #63488	; 0xf800
     630:	ebffffc8 	bl	558 <Xil_Out32>
     634:	e3e03007 	mvn	r3, #7
     638:	e5933000 	ldr	r3, [r3]
     63c:	e50b3008 	str	r3, [fp, #-8]
     640:	ea00000b 	b	674 <LoadBootImage+0xe4>
     644:	e30d3428 	movw	r3, #54312	; 0xd428
     648:	e3403001 	movt	r3, #1
     64c:	e5933000 	ldr	r3, [r3]
     650:	e5933004 	ldr	r3, [r3, #4]
     654:	e283302c 	add	r3, r3, #44	; 0x2c
     658:	e1a00003 	mov	r0, r3
     65c:	ebffffb3 	bl	530 <Xil_In32>
     660:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
     664:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
     668:	e7ec3053 	ubfx	r3, r3, #0, #13
     66c:	e1a03783 	lsl	r3, r3, #15
     670:	e50b3008 	str	r3, [fp, #-8]
     674:	e51b0008 	ldr	r0, [fp, #-8]
     678:	eb000173 	bl	c4c <GetPartitionHeaderInfo>
     67c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     680:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     684:	e3530000 	cmp	r3, #0
     688:	0a000002 	beq	698 <LoadBootImage+0x108>
     68c:	e30a000e 	movw	r0, #40974	; 0xa00e
     690:	eb000552 	bl	1be0 <OutputStatus>
     694:	eb0004dc 	bl	1a0c <FsblFallback>
     698:	e30d33f8 	movw	r3, #54264	; 0xd3f8
     69c:	e3403001 	movt	r3, #1
     6a0:	e5933000 	ldr	r3, [r3]
     6a4:	e3530000 	cmp	r3, #0
     6a8:	0a00000f 	beq	6ec <LoadBootImage+0x15c>
     6ac:	e30d33f8 	movw	r3, #54264	; 0xd3f8
     6b0:	e3403001 	movt	r3, #1
     6b4:	e5933000 	ldr	r3, [r3]
     6b8:	e3530001 	cmp	r3, #1
     6bc:	0a00000a 	beq	6ec <LoadBootImage+0x15c>
     6c0:	e30d0010 	movw	r0, #53264	; 0xd010
     6c4:	e34f0800 	movt	r0, #63488	; 0xf800
     6c8:	ebffff98 	bl	530 <Xil_In32>
     6cc:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
     6d0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     6d4:	e2033b01 	and	r3, r3, #1024	; 0x400
     6d8:	e3530000 	cmp	r3, #0
     6dc:	0a000002 	beq	6ec <LoadBootImage+0x15c>
     6e0:	e30a0011 	movw	r0, #40977	; 0xa011
     6e4:	eb00053d 	bl	1be0 <OutputStatus>
     6e8:	eb0004c7 	bl	1a0c <FsblFallback>
     6ec:	e3a03001 	mov	r3, #1
     6f0:	e50b300c 	str	r3, [fp, #-12]
     6f4:	ea00014a 	b	c24 <_SUPERVISOR_STACK_SIZE+0x424>
     6f8:	e51b300c 	ldr	r3, [fp, #-12]
     6fc:	e1a02303 	lsl	r2, r3, #6
     700:	e30d306c 	movw	r3, #53356	; 0xd06c
     704:	e3403001 	movt	r3, #1
     708:	e0823003 	add	r3, r2, r3
     70c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
     710:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
     714:	eb0001e7 	bl	eb8 <HeaderDump>
     718:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
     71c:	eb00022b 	bl	fd0 <ValidateHeader>
     720:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     724:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     728:	e3530000 	cmp	r3, #0
     72c:	0a000002 	beq	73c <LoadBootImage+0x1ac>
     730:	e30a000d 	movw	r0, #40973	; 0xa00d
     734:	eb000529 	bl	1be0 <OutputStatus>
     738:	eb0004b3 	bl	1a0c <FsblFallback>
     73c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     740:	e5933004 	ldr	r3, [r3, #4]
     744:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
     748:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     74c:	e5933000 	ldr	r3, [r3]
     750:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
     754:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     758:	e5933010 	ldr	r3, [r3, #16]
     75c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
     760:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     764:	e5933018 	ldr	r3, [r3, #24]
     768:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
     76c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     770:	e593300c 	ldr	r3, [r3, #12]
     774:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
     778:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     77c:	e5933020 	ldr	r3, [r3, #32]
     780:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
     784:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     788:	e5933014 	ldr	r3, [r3, #20]
     78c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     790:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     794:	e5933008 	ldr	r3, [r3, #8]
     798:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
     79c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
     7a0:	e2033803 	and	r3, r3, #196608	; 0x30000
     7a4:	e3530000 	cmp	r3, #0
     7a8:	0a000003 	beq	7bc <LoadBootImage+0x22c>
     7ac:	e51b300c 	ldr	r3, [fp, #-12]
     7b0:	e2833001 	add	r3, r3, #1
     7b4:	e50b300c 	str	r3, [fp, #-12]
     7b8:	ea000119 	b	c24 <_SUPERVISOR_STACK_SIZE+0x424>
     7bc:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
     7c0:	e2033020 	and	r3, r3, #32
     7c4:	e3530000 	cmp	r3, #0
     7c8:	0a000017 	beq	82c <_SUPERVISOR_STACK_SIZE+0x2c>
     7cc:	e30d305d 	movw	r3, #53341	; 0xd05d
     7d0:	e3403001 	movt	r3, #1
     7d4:	e3a02001 	mov	r2, #1
     7d8:	e5c32000 	strb	r2, [r3]
     7dc:	e30d305e 	movw	r3, #53342	; 0xd05e
     7e0:	e3403001 	movt	r3, #1
     7e4:	e3a02000 	mov	r2, #0
     7e8:	e5c32000 	strb	r2, [r3]
     7ec:	e30d3061 	movw	r3, #53345	; 0xd061
     7f0:	e3403001 	movt	r3, #1
     7f4:	e3a02001 	mov	r2, #1
     7f8:	e5c32000 	strb	r2, [r3]
     7fc:	e30d3062 	movw	r3, #53346	; 0xd062
     800:	e3403001 	movt	r3, #1
     804:	e5d33000 	ldrb	r3, [r3]
     808:	e3530001 	cmp	r3, #1
     80c:	1a000006 	bne	82c <_SUPERVISOR_STACK_SIZE+0x2c>
     810:	e3010eec 	movw	r0, #7916	; 0x1eec
     814:	e3400001 	movt	r0, #1
     818:	eb003af3 	bl	f3ec <xil_printf>
     81c:	e3010f20 	movw	r0, #7968	; 0x1f20
     820:	e3400001 	movt	r0, #1
     824:	eb003af0 	bl	f3ec <xil_printf>
     828:	ea000103 	b	c3c <_SUPERVISOR_STACK_SIZE+0x43c>
     82c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
     830:	e2033010 	and	r3, r3, #16
     834:	e3530000 	cmp	r3, #0
     838:	0a00000b 	beq	86c <_SUPERVISOR_STACK_SIZE+0x6c>
     83c:	e30d305e 	movw	r3, #53342	; 0xd05e
     840:	e3403001 	movt	r3, #1
     844:	e3a02001 	mov	r2, #1
     848:	e5c32000 	strb	r2, [r3]
     84c:	e30d305d 	movw	r3, #53341	; 0xd05d
     850:	e3403001 	movt	r3, #1
     854:	e3a02000 	mov	r2, #0
     858:	e5c32000 	strb	r2, [r3]
     85c:	e30d3062 	movw	r3, #53346	; 0xd062
     860:	e3403001 	movt	r3, #1
     864:	e3a02001 	mov	r2, #1
     868:	e5c32000 	strb	r2, [r3]
     86c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
     870:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
     874:	e1520003 	cmp	r2, r3
     878:	0a000004 	beq	890 <_SUPERVISOR_STACK_SIZE+0x90>
     87c:	e30d305c 	movw	r3, #53340	; 0xd05c
     880:	e3403001 	movt	r3, #1
     884:	e3a02001 	mov	r2, #1
     888:	e5c32000 	strb	r2, [r3]
     88c:	ea000003 	b	8a0 <_SUPERVISOR_STACK_SIZE+0xa0>
     890:	e30d305c 	movw	r3, #53340	; 0xd05c
     894:	e3403001 	movt	r3, #1
     898:	e3a02000 	mov	r2, #0
     89c:	e5c32000 	strb	r2, [r3]
     8a0:	e30d3428 	movw	r3, #54312	; 0xd428
     8a4:	e3403001 	movt	r3, #1
     8a8:	e5933000 	ldr	r3, [r3]
     8ac:	e5933004 	ldr	r3, [r3, #4]
     8b0:	e2833014 	add	r3, r3, #20
     8b4:	e1a00003 	mov	r0, r3
     8b8:	ebffff1c 	bl	530 <Xil_In32>
     8bc:	e1a03000 	mov	r3, r0
     8c0:	e2033004 	and	r3, r3, #4
     8c4:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
     8c8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
     8cc:	e3530000 	cmp	r3, #0
     8d0:	0a000007 	beq	8f4 <_SUPERVISOR_STACK_SIZE+0xf4>
     8d4:	e30d305c 	movw	r3, #53340	; 0xd05c
     8d8:	e3403001 	movt	r3, #1
     8dc:	e5d33000 	ldrb	r3, [r3]
     8e0:	e3530000 	cmp	r3, #0
     8e4:	1a000002 	bne	8f4 <_SUPERVISOR_STACK_SIZE+0xf4>
     8e8:	e30a0013 	movw	r0, #40979	; 0xa013
     8ec:	eb0004bb 	bl	1be0 <OutputStatus>
     8f0:	eb000445 	bl	1a0c <FsblFallback>
     8f4:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
     8f8:	e2033a07 	and	r3, r3, #28672	; 0x7000
     8fc:	e3530000 	cmp	r3, #0
     900:	0a000004 	beq	918 <_SUPERVISOR_STACK_SIZE+0x118>
     904:	e30d3060 	movw	r3, #53344	; 0xd060
     908:	e3403001 	movt	r3, #1
     90c:	e3a02001 	mov	r2, #1
     910:	e5c32000 	strb	r2, [r3]
     914:	ea000003 	b	928 <_SUPERVISOR_STACK_SIZE+0x128>
     918:	e30d3060 	movw	r3, #53344	; 0xd060
     91c:	e3403001 	movt	r3, #1
     920:	e3a02000 	mov	r2, #0
     924:	e5c32000 	strb	r2, [r3]
     928:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
     92c:	e2033902 	and	r3, r3, #32768	; 0x8000
     930:	e3530000 	cmp	r3, #0
     934:	0a000004 	beq	94c <_SUPERVISOR_STACK_SIZE+0x14c>
     938:	e30d305f 	movw	r3, #53343	; 0xd05f
     93c:	e3403001 	movt	r3, #1
     940:	e3a02001 	mov	r2, #1
     944:	e5c32000 	strb	r2, [r3]
     948:	ea000003 	b	95c <_SUPERVISOR_STACK_SIZE+0x15c>
     94c:	e30d305f 	movw	r3, #53343	; 0xd05f
     950:	e3403001 	movt	r3, #1
     954:	e3a02000 	mov	r2, #0
     958:	e5c32000 	strb	r2, [r3]
     95c:	e30d305e 	movw	r3, #53342	; 0xd05e
     960:	e3403001 	movt	r3, #1
     964:	e5d33000 	ldrb	r3, [r3]
     968:	e3530001 	cmp	r3, #1
     96c:	1a000012 	bne	9bc <_SUPERVISOR_STACK_SIZE+0x1bc>
     970:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
     974:	e3530601 	cmp	r3, #1048576	; 0x100000
     978:	2a00000f 	bcs	9bc <_SUPERVISOR_STACK_SIZE+0x1bc>
     97c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
     980:	e3530000 	cmp	r3, #0
     984:	1a000009 	bne	9b0 <_SUPERVISOR_STACK_SIZE+0x1b0>
     988:	e30d305f 	movw	r3, #53343	; 0xd05f
     98c:	e3403001 	movt	r3, #1
     990:	e5d33000 	ldrb	r3, [r3]
     994:	e3530001 	cmp	r3, #1
     998:	0a000004 	beq	9b0 <_SUPERVISOR_STACK_SIZE+0x1b0>
     99c:	e30d305c 	movw	r3, #53340	; 0xd05c
     9a0:	e3403001 	movt	r3, #1
     9a4:	e5d33000 	ldrb	r3, [r3]
     9a8:	e3530001 	cmp	r3, #1
     9ac:	1a0000a2 	bne	c3c <_SUPERVISOR_STACK_SIZE+0x43c>
     9b0:	e30a000f 	movw	r0, #40975	; 0xa00f
     9b4:	eb000489 	bl	1be0 <OutputStatus>
     9b8:	eb000413 	bl	1a0c <FsblFallback>
     9bc:	e30d305e 	movw	r3, #53342	; 0xd05e
     9c0:	e3403001 	movt	r3, #1
     9c4:	e5d33000 	ldrb	r3, [r3]
     9c8:	e3530000 	cmp	r3, #0
     9cc:	0a000005 	beq	9e8 <_SUPERVISOR_STACK_SIZE+0x1e8>
     9d0:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
     9d4:	e3730107 	cmn	r3, #-1073741823	; 0xc0000001
     9d8:	9a000002 	bls	9e8 <_SUPERVISOR_STACK_SIZE+0x1e8>
     9dc:	e30a000f 	movw	r0, #40975	; 0xa00f
     9e0:	eb00047e 	bl	1be0 <OutputStatus>
     9e4:	eb000408 	bl	1a0c <FsblFallback>
     9e8:	e30d305e 	movw	r3, #53342	; 0xd05e
     9ec:	e3403001 	movt	r3, #1
     9f0:	e5d33000 	ldrb	r3, [r3]
     9f4:	e3530000 	cmp	r3, #0
     9f8:	0a000007 	beq	a1c <_SUPERVISOR_STACK_SIZE+0x21c>
     9fc:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
     a00:	e3530000 	cmp	r3, #0
     a04:	1a000004 	bne	a1c <_SUPERVISOR_STACK_SIZE+0x21c>
     a08:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
     a0c:	e2833001 	add	r3, r3, #1
     a10:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
     a14:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
     a18:	e50b3010 	str	r3, [fp, #-16]
     a1c:	e30d305d 	movw	r3, #53341	; 0xd05d
     a20:	e3403001 	movt	r3, #1
     a24:	e5d33000 	ldrb	r3, [r3]
     a28:	e3530000 	cmp	r3, #0
     a2c:	0a000007 	beq	a50 <_SUPERVISOR_STACK_SIZE+0x250>
     a30:	ebfffe9c 	bl	4a8 <FsblHookBeforeBitstreamDload>
     a34:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     a38:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     a3c:	e3530000 	cmp	r3, #0
     a40:	0a000002 	beq	a50 <_SUPERVISOR_STACK_SIZE+0x250>
     a44:	e30a0402 	movw	r0, #41986	; 0xa402
     a48:	eb000464 	bl	1be0 <OutputStatus>
     a4c:	eb0003ee 	bl	1a0c <FsblFallback>
     a50:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
     a54:	e51b0008 	ldr	r0, [fp, #-8]
     a58:	eb0001b7 	bl	113c <PartitionMove>
     a5c:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     a60:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     a64:	e3530000 	cmp	r3, #0
     a68:	0a000002 	beq	a78 <_SUPERVISOR_STACK_SIZE+0x278>
     a6c:	e30a000b 	movw	r0, #40971	; 0xa00b
     a70:	eb00045a 	bl	1be0 <OutputStatus>
     a74:	eb0003e4 	bl	1a0c <FsblFallback>
     a78:	e30d305f 	movw	r3, #53343	; 0xd05f
     a7c:	e3403001 	movt	r3, #1
     a80:	e5d33000 	ldrb	r3, [r3]
     a84:	e3530000 	cmp	r3, #0
     a88:	1a000004 	bne	aa0 <_SUPERVISOR_STACK_SIZE+0x2a0>
     a8c:	e30d3060 	movw	r3, #53344	; 0xd060
     a90:	e3403001 	movt	r3, #1
     a94:	e5d33000 	ldrb	r3, [r3]
     a98:	e3530000 	cmp	r3, #0
     a9c:	0a000050 	beq	be4 <_SUPERVISOR_STACK_SIZE+0x3e4>
     aa0:	e30d305d 	movw	r3, #53341	; 0xd05d
     aa4:	e3403001 	movt	r3, #1
     aa8:	e5d33000 	ldrb	r3, [r3]
     aac:	e3530000 	cmp	r3, #0
     ab0:	0a000002 	beq	ac0 <_SUPERVISOR_STACK_SIZE+0x2c0>
     ab4:	e3a03601 	mov	r3, #1048576	; 0x100000
     ab8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     abc:	ea000001 	b	ac8 <_SUPERVISOR_STACK_SIZE+0x2c8>
     ac0:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
     ac4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
     ac8:	e30d3060 	movw	r3, #53344	; 0xd060
     acc:	e3403001 	movt	r3, #1
     ad0:	e5d33000 	ldrb	r3, [r3]
     ad4:	e3530000 	cmp	r3, #0
     ad8:	0a00000f 	beq	b1c <_SUPERVISOR_STACK_SIZE+0x31c>
     adc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
     ae0:	e1a01103 	lsl	r1, r3, #2
     ae4:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
     ae8:	e1a02103 	lsl	r2, r3, #2
     aec:	e51b3008 	ldr	r3, [fp, #-8]
     af0:	e0823003 	add	r3, r2, r3
     af4:	e1a02003 	mov	r2, r3
     af8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     afc:	eb00027e 	bl	14fc <ValidateParition>
     b00:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     b04:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     b08:	e3530000 	cmp	r3, #0
     b0c:	0a000002 	beq	b1c <_SUPERVISOR_STACK_SIZE+0x31c>
     b10:	e30a0010 	movw	r0, #40976	; 0xa010
     b14:	eb000431 	bl	1be0 <OutputStatus>
     b18:	eb0003bb 	bl	1a0c <FsblFallback>
     b1c:	e30d305f 	movw	r3, #53343	; 0xd05f
     b20:	e3403001 	movt	r3, #1
     b24:	e5d33000 	ldrb	r3, [r3]
     b28:	e3530001 	cmp	r3, #1
     b2c:	1a000002 	bne	b3c <_SUPERVISOR_STACK_SIZE+0x33c>
     b30:	e30a0011 	movw	r0, #40977	; 0xa011
     b34:	eb000429 	bl	1be0 <OutputStatus>
     b38:	eb0003b3 	bl	1a0c <FsblFallback>
     b3c:	e30d305c 	movw	r3, #53340	; 0xd05c
     b40:	e3403001 	movt	r3, #1
     b44:	e5d33000 	ldrb	r3, [r3]
     b48:	e3530000 	cmp	r3, #0
     b4c:	0a00000f 	beq	b90 <_SUPERVISOR_STACK_SIZE+0x390>
     b50:	e30d305e 	movw	r3, #53342	; 0xd05e
     b54:	e3403001 	movt	r3, #1
     b58:	e5d33000 	ldrb	r3, [r3]
     b5c:	e3530000 	cmp	r3, #0
     b60:	0a00000a 	beq	b90 <_SUPERVISOR_STACK_SIZE+0x390>
     b64:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
     b68:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
     b6c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     b70:	eb000248 	bl	1498 <DecryptPartition>
     b74:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     b78:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     b7c:	e3530000 	cmp	r3, #0
     b80:	0a000002 	beq	b90 <_SUPERVISOR_STACK_SIZE+0x390>
     b84:	e30a0003 	movw	r0, #40963	; 0xa003
     b88:	eb000414 	bl	1be0 <OutputStatus>
     b8c:	eb00039e 	bl	1a0c <FsblFallback>
     b90:	e30d305d 	movw	r3, #53341	; 0xd05d
     b94:	e3403001 	movt	r3, #1
     b98:	e5d33000 	ldrb	r3, [r3]
     b9c:	e3530000 	cmp	r3, #0
     ba0:	0a00000f 	beq	be4 <_SUPERVISOR_STACK_SIZE+0x3e4>
     ba4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     ba8:	e51b1040 	ldr	r1, [fp, #-64]	; 0xffffffc0
     bac:	e30d305c 	movw	r3, #53340	; 0xd05c
     bb0:	e3403001 	movt	r3, #1
     bb4:	e5d33000 	ldrb	r3, [r3]
     bb8:	e58d3000 	str	r3, [sp]
     bbc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
     bc0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
     bc4:	eb000b02 	bl	37d4 <PcapLoadPartition>
     bc8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     bcc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     bd0:	e3530000 	cmp	r3, #0
     bd4:	0a000002 	beq	be4 <_SUPERVISOR_STACK_SIZE+0x3e4>
     bd8:	e30a0004 	movw	r0, #40964	; 0xa004
     bdc:	eb0003ff 	bl	1be0 <OutputStatus>
     be0:	eb000389 	bl	1a0c <FsblFallback>
     be4:	e30d305d 	movw	r3, #53341	; 0xd05d
     be8:	e3403001 	movt	r3, #1
     bec:	e5d33000 	ldrb	r3, [r3]
     bf0:	e3530000 	cmp	r3, #0
     bf4:	0a000007 	beq	c18 <_SUPERVISOR_STACK_SIZE+0x418>
     bf8:	ebfffe34 	bl	4d0 <FsblHookAfterBitstreamDload>
     bfc:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
     c00:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
     c04:	e3530000 	cmp	r3, #0
     c08:	0a000002 	beq	c18 <_SUPERVISOR_STACK_SIZE+0x418>
     c0c:	e30a0403 	movw	r0, #41987	; 0xa403
     c10:	eb0003f2 	bl	1be0 <OutputStatus>
     c14:	eb00037c 	bl	1a0c <FsblFallback>
     c18:	e51b300c 	ldr	r3, [fp, #-12]
     c1c:	e2833001 	add	r3, r3, #1
     c20:	e50b300c 	str	r3, [fp, #-12]
     c24:	e30d33ec 	movw	r3, #54252	; 0xd3ec
     c28:	e3403001 	movt	r3, #1
     c2c:	e5933000 	ldr	r3, [r3]
     c30:	e51b200c 	ldr	r2, [fp, #-12]
     c34:	e1520003 	cmp	r2, r3
     c38:	3afffeae 	bcc	6f8 <LoadBootImage+0x168>
     c3c:	e51b3010 	ldr	r3, [fp, #-16]
     c40:	e1a00003 	mov	r0, r3
     c44:	e24bd004 	sub	sp, fp, #4
     c48:	e8bd8800 	pop	{fp, pc}

00000c4c <GetPartitionHeaderInfo>:
     c4c:	e92d4800 	push	{fp, lr}
     c50:	e28db004 	add	fp, sp, #4
     c54:	e24dd010 	sub	sp, sp, #16
     c58:	e50b0010 	str	r0, [fp, #-16]
     c5c:	e30d13f0 	movw	r1, #54256	; 0xd3f0
     c60:	e3401001 	movt	r1, #1
     c64:	e51b0010 	ldr	r0, [fp, #-16]
     c68:	eb000065 	bl	e04 <GetFsblLength>
     c6c:	e50b0008 	str	r0, [fp, #-8]
     c70:	e51b3008 	ldr	r3, [fp, #-8]
     c74:	e3530000 	cmp	r3, #0
     c78:	0a000001 	beq	c84 <GetPartitionHeaderInfo+0x38>
     c7c:	e3a03001 	mov	r3, #1
     c80:	ea00002e 	b	d40 <GetPartitionHeaderInfo+0xf4>
     c84:	e24b300c 	sub	r3, fp, #12
     c88:	e1a01003 	mov	r1, r3
     c8c:	e51b0010 	ldr	r0, [fp, #-16]
     c90:	eb00002d 	bl	d4c <GetPartitionHeaderStartAddr>
     c94:	e50b0008 	str	r0, [fp, #-8]
     c98:	e51b3008 	ldr	r3, [fp, #-8]
     c9c:	e3530000 	cmp	r3, #0
     ca0:	0a000001 	beq	cac <GetPartitionHeaderInfo+0x60>
     ca4:	e3a03001 	mov	r3, #1
     ca8:	ea000024 	b	d40 <GetPartitionHeaderInfo+0xf4>
     cac:	e51b200c 	ldr	r2, [fp, #-12]
     cb0:	e51b3010 	ldr	r3, [fp, #-16]
     cb4:	e0823003 	add	r3, r2, r3
     cb8:	e50b300c 	str	r3, [fp, #-12]
     cbc:	e51b300c 	ldr	r3, [fp, #-12]
     cc0:	e30d106c 	movw	r1, #53356	; 0xd06c
     cc4:	e3401001 	movt	r1, #1
     cc8:	e1a00003 	mov	r0, r3
     ccc:	eb000063 	bl	e60 <LoadPartitionsHeaderInfo>
     cd0:	e50b0008 	str	r0, [fp, #-8]
     cd4:	e51b3008 	ldr	r3, [fp, #-8]
     cd8:	e3530000 	cmp	r3, #0
     cdc:	0a000001 	beq	ce8 <GetPartitionHeaderInfo+0x9c>
     ce0:	e3a03001 	mov	r3, #1
     ce4:	ea000015 	b	d40 <GetPartitionHeaderInfo+0xf4>
     ce8:	e30d006c 	movw	r0, #53356	; 0xd06c
     cec:	e3400001 	movt	r0, #1
     cf0:	eb000078 	bl	ed8 <GetPartitionCount>
     cf4:	e1a02000 	mov	r2, r0
     cf8:	e30d33ec 	movw	r3, #54252	; 0xd3ec
     cfc:	e3403001 	movt	r3, #1
     d00:	e5832000 	str	r2, [r3]
     d04:	e30d33ec 	movw	r3, #54252	; 0xd3ec
     d08:	e3403001 	movt	r3, #1
     d0c:	e5933000 	ldr	r3, [r3]
     d10:	e353000d 	cmp	r3, #13
     d14:	9a000001 	bls	d20 <GetPartitionHeaderInfo+0xd4>
     d18:	e3a03001 	mov	r3, #1
     d1c:	ea000007 	b	d40 <GetPartitionHeaderInfo+0xf4>
     d20:	e30d33ec 	movw	r3, #54252	; 0xd3ec
     d24:	e3403001 	movt	r3, #1
     d28:	e5933000 	ldr	r3, [r3]
     d2c:	e3530001 	cmp	r3, #1
     d30:	8a000001 	bhi	d3c <GetPartitionHeaderInfo+0xf0>
     d34:	e3a03001 	mov	r3, #1
     d38:	ea000000 	b	d40 <GetPartitionHeaderInfo+0xf4>
     d3c:	e3a03000 	mov	r3, #0
     d40:	e1a00003 	mov	r0, r3
     d44:	e24bd004 	sub	sp, fp, #4
     d48:	e8bd8800 	pop	{fp, pc}

00000d4c <GetPartitionHeaderStartAddr>:
     d4c:	e92d4800 	push	{fp, lr}
     d50:	e28db004 	add	fp, sp, #4
     d54:	e24dd010 	sub	sp, sp, #16
     d58:	e50b0010 	str	r0, [fp, #-16]
     d5c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     d60:	e30d3068 	movw	r3, #53352	; 0xd068
     d64:	e3403001 	movt	r3, #1
     d68:	e5933000 	ldr	r3, [r3]
     d6c:	e51b2010 	ldr	r2, [fp, #-16]
     d70:	e282009c 	add	r0, r2, #156	; 0x9c
     d74:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     d78:	e3a02004 	mov	r2, #4
     d7c:	e12fff33 	blx	r3
     d80:	e50b0008 	str	r0, [fp, #-8]
     d84:	e51b3008 	ldr	r3, [fp, #-8]
     d88:	e3530000 	cmp	r3, #0
     d8c:	0a000001 	beq	d98 <GetPartitionHeaderStartAddr+0x4c>
     d90:	e3a03001 	mov	r3, #1
     d94:	ea000000 	b	d9c <GetPartitionHeaderStartAddr+0x50>
     d98:	e3a03000 	mov	r3, #0
     d9c:	e1a00003 	mov	r0, r3
     da0:	e24bd004 	sub	sp, fp, #4
     da4:	e8bd8800 	pop	{fp, pc}

00000da8 <GetImageHeaderStartAddr>:
     da8:	e92d4800 	push	{fp, lr}
     dac:	e28db004 	add	fp, sp, #4
     db0:	e24dd010 	sub	sp, sp, #16
     db4:	e50b0010 	str	r0, [fp, #-16]
     db8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     dbc:	e30d3068 	movw	r3, #53352	; 0xd068
     dc0:	e3403001 	movt	r3, #1
     dc4:	e5933000 	ldr	r3, [r3]
     dc8:	e51b2010 	ldr	r2, [fp, #-16]
     dcc:	e2820098 	add	r0, r2, #152	; 0x98
     dd0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     dd4:	e3a02004 	mov	r2, #4
     dd8:	e12fff33 	blx	r3
     ddc:	e50b0008 	str	r0, [fp, #-8]
     de0:	e51b3008 	ldr	r3, [fp, #-8]
     de4:	e3530000 	cmp	r3, #0
     de8:	0a000001 	beq	df4 <GetImageHeaderStartAddr+0x4c>
     dec:	e3a03001 	mov	r3, #1
     df0:	ea000000 	b	df8 <GetImageHeaderStartAddr+0x50>
     df4:	e3a03000 	mov	r3, #0
     df8:	e1a00003 	mov	r0, r3
     dfc:	e24bd004 	sub	sp, fp, #4
     e00:	e8bd8800 	pop	{fp, pc}

00000e04 <GetFsblLength>:
     e04:	e92d4800 	push	{fp, lr}
     e08:	e28db004 	add	fp, sp, #4
     e0c:	e24dd010 	sub	sp, sp, #16
     e10:	e50b0010 	str	r0, [fp, #-16]
     e14:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     e18:	e30d3068 	movw	r3, #53352	; 0xd068
     e1c:	e3403001 	movt	r3, #1
     e20:	e5933000 	ldr	r3, [r3]
     e24:	e51b2010 	ldr	r2, [fp, #-16]
     e28:	e2820040 	add	r0, r2, #64	; 0x40
     e2c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     e30:	e3a02004 	mov	r2, #4
     e34:	e12fff33 	blx	r3
     e38:	e50b0008 	str	r0, [fp, #-8]
     e3c:	e51b3008 	ldr	r3, [fp, #-8]
     e40:	e3530000 	cmp	r3, #0
     e44:	0a000001 	beq	e50 <GetFsblLength+0x4c>
     e48:	e3a03001 	mov	r3, #1
     e4c:	ea000000 	b	e54 <GetFsblLength+0x50>
     e50:	e3a03000 	mov	r3, #0
     e54:	e1a00003 	mov	r0, r3
     e58:	e24bd004 	sub	sp, fp, #4
     e5c:	e8bd8800 	pop	{fp, pc}

00000e60 <LoadPartitionsHeaderInfo>:
     e60:	e92d4800 	push	{fp, lr}
     e64:	e28db004 	add	fp, sp, #4
     e68:	e24dd010 	sub	sp, sp, #16
     e6c:	e50b0010 	str	r0, [fp, #-16]
     e70:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
     e74:	e30d3068 	movw	r3, #53352	; 0xd068
     e78:	e3403001 	movt	r3, #1
     e7c:	e5933000 	ldr	r3, [r3]
     e80:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
     e84:	e3a02d0e 	mov	r2, #896	; 0x380
     e88:	e51b0010 	ldr	r0, [fp, #-16]
     e8c:	e12fff33 	blx	r3
     e90:	e50b0008 	str	r0, [fp, #-8]
     e94:	e51b3008 	ldr	r3, [fp, #-8]
     e98:	e3530000 	cmp	r3, #0
     e9c:	0a000001 	beq	ea8 <LoadPartitionsHeaderInfo+0x48>
     ea0:	e3a03001 	mov	r3, #1
     ea4:	ea000000 	b	eac <LoadPartitionsHeaderInfo+0x4c>
     ea8:	e3a03000 	mov	r3, #0
     eac:	e1a00003 	mov	r0, r3
     eb0:	e24bd004 	sub	sp, fp, #4
     eb4:	e8bd8800 	pop	{fp, pc}

00000eb8 <HeaderDump>:
     eb8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ebc:	e28db000 	add	fp, sp, #0
     ec0:	e24dd00c 	sub	sp, sp, #12
     ec4:	e50b0008 	str	r0, [fp, #-8]
     ec8:	e320f000 	nop	{0}
     ecc:	e28bd000 	add	sp, fp, #0
     ed0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     ed4:	e12fff1e 	bx	lr

00000ed8 <GetPartitionCount>:
     ed8:	e92d4800 	push	{fp, lr}
     edc:	e28db004 	add	fp, sp, #4
     ee0:	e24dd010 	sub	sp, sp, #16
     ee4:	e50b0010 	str	r0, [fp, #-16]
     ee8:	e3a03000 	mov	r3, #0
     eec:	e50b3008 	str	r3, [fp, #-8]
     ef0:	e3a03000 	mov	r3, #0
     ef4:	e50b3008 	str	r3, [fp, #-8]
     ef8:	ea00000c 	b	f30 <GetPartitionCount+0x58>
     efc:	e51b3008 	ldr	r3, [fp, #-8]
     f00:	e1a03303 	lsl	r3, r3, #6
     f04:	e51b2010 	ldr	r2, [fp, #-16]
     f08:	e0823003 	add	r3, r2, r3
     f0c:	e50b300c 	str	r3, [fp, #-12]
     f10:	e51b000c 	ldr	r0, [fp, #-12]
     f14:	eb00000e 	bl	f54 <IsLastPartition>
     f18:	e1a03000 	mov	r3, r0
     f1c:	e3530001 	cmp	r3, #1
     f20:	1a000006 	bne	f40 <GetPartitionCount+0x68>
     f24:	e51b3008 	ldr	r3, [fp, #-8]
     f28:	e2833001 	add	r3, r3, #1
     f2c:	e50b3008 	str	r3, [fp, #-8]
     f30:	e51b3008 	ldr	r3, [fp, #-8]
     f34:	e353000d 	cmp	r3, #13
     f38:	9affffef 	bls	efc <GetPartitionCount+0x24>
     f3c:	ea000000 	b	f44 <GetPartitionCount+0x6c>
     f40:	e320f000 	nop	{0}
     f44:	e51b3008 	ldr	r3, [fp, #-8]
     f48:	e1a00003 	mov	r0, r3
     f4c:	e24bd004 	sub	sp, fp, #4
     f50:	e8bd8800 	pop	{fp, pc}

00000f54 <IsLastPartition>:
     f54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     f58:	e28db000 	add	fp, sp, #0
     f5c:	e24dd014 	sub	sp, sp, #20
     f60:	e50b0010 	str	r0, [fp, #-16]
     f64:	e51b3010 	ldr	r3, [fp, #-16]
     f68:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
     f6c:	e3730001 	cmn	r3, #1
     f70:	0a000001 	beq	f7c <IsLastPartition+0x28>
     f74:	e3a03001 	mov	r3, #1
     f78:	ea000010 	b	fc0 <IsLastPartition+0x6c>
     f7c:	e3a03000 	mov	r3, #0
     f80:	e50b3008 	str	r3, [fp, #-8]
     f84:	ea000009 	b	fb0 <IsLastPartition+0x5c>
     f88:	e51b3010 	ldr	r3, [fp, #-16]
     f8c:	e51b2008 	ldr	r2, [fp, #-8]
     f90:	e7933102 	ldr	r3, [r3, r2, lsl #2]
     f94:	e3530000 	cmp	r3, #0
     f98:	0a000001 	beq	fa4 <IsLastPartition+0x50>
     f9c:	e3a03001 	mov	r3, #1
     fa0:	ea000006 	b	fc0 <IsLastPartition+0x6c>
     fa4:	e51b3008 	ldr	r3, [fp, #-8]
     fa8:	e2833001 	add	r3, r3, #1
     fac:	e50b3008 	str	r3, [fp, #-8]
     fb0:	e51b3008 	ldr	r3, [fp, #-8]
     fb4:	e353000e 	cmp	r3, #14
     fb8:	dafffff2 	ble	f88 <IsLastPartition+0x34>
     fbc:	e3a03000 	mov	r3, #0
     fc0:	e1a00003 	mov	r0, r3
     fc4:	e28bd000 	add	sp, fp, #0
     fc8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     fcc:	e12fff1e 	bx	lr

00000fd0 <ValidateHeader>:
     fd0:	e92d4800 	push	{fp, lr}
     fd4:	e28db004 	add	fp, sp, #4
     fd8:	e24dd010 	sub	sp, sp, #16
     fdc:	e50b0010 	str	r0, [fp, #-16]
     fe0:	e51b3010 	ldr	r3, [fp, #-16]
     fe4:	e50b3008 	str	r3, [fp, #-8]
     fe8:	e51b0008 	ldr	r0, [fp, #-8]
     fec:	eb000015 	bl	1048 <IsEmptyHeader>
     ff0:	e1a03000 	mov	r3, r0
     ff4:	e3530000 	cmp	r3, #0
     ff8:	1a000001 	bne	1004 <_RSA_AC_SIZE+0x4>
     ffc:	e3a03001 	mov	r3, #1
    1000:	ea00000d 	b	103c <CRValMmuCac+0x37>
    1004:	e51b0008 	ldr	r0, [fp, #-8]
    1008:	eb000027 	bl	10ac <ValidatePartitionHeaderChecksum>
    100c:	e1a03000 	mov	r3, r0
    1010:	e3530000 	cmp	r3, #0
    1014:	0a000001 	beq	1020 <CRValMmuCac+0x1b>
    1018:	e3a03001 	mov	r3, #1
    101c:	ea000006 	b	103c <CRValMmuCac+0x37>
    1020:	e51b3010 	ldr	r3, [fp, #-16]
    1024:	e5933000 	ldr	r3, [r3]
    1028:	e3530101 	cmp	r3, #1073741824	; 0x40000000
    102c:	9a000001 	bls	1038 <CRValMmuCac+0x33>
    1030:	e3a03001 	mov	r3, #1
    1034:	ea000000 	b	103c <CRValMmuCac+0x37>
    1038:	e3a03000 	mov	r3, #0
    103c:	e1a00003 	mov	r0, r3
    1040:	e24bd004 	sub	sp, fp, #4
    1044:	e8bd8800 	pop	{fp, pc}

00001048 <IsEmptyHeader>:
    1048:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    104c:	e28db000 	add	fp, sp, #0
    1050:	e24dd014 	sub	sp, sp, #20
    1054:	e50b0010 	str	r0, [fp, #-16]
    1058:	e3a03000 	mov	r3, #0
    105c:	e50b3008 	str	r3, [fp, #-8]
    1060:	ea000009 	b	108c <IsEmptyHeader+0x44>
    1064:	e51b3010 	ldr	r3, [fp, #-16]
    1068:	e51b2008 	ldr	r2, [fp, #-8]
    106c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    1070:	e3530000 	cmp	r3, #0
    1074:	0a000001 	beq	1080 <IsEmptyHeader+0x38>
    1078:	e3a03001 	mov	r3, #1
    107c:	ea000006 	b	109c <IsEmptyHeader+0x54>
    1080:	e51b3008 	ldr	r3, [fp, #-8]
    1084:	e2833001 	add	r3, r3, #1
    1088:	e50b3008 	str	r3, [fp, #-8]
    108c:	e51b3008 	ldr	r3, [fp, #-8]
    1090:	e353000f 	cmp	r3, #15
    1094:	dafffff2 	ble	1064 <IsEmptyHeader+0x1c>
    1098:	e3a03000 	mov	r3, #0
    109c:	e1a00003 	mov	r0, r3
    10a0:	e28bd000 	add	sp, fp, #0
    10a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    10a8:	e12fff1e 	bx	lr

000010ac <ValidatePartitionHeaderChecksum>:
    10ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    10b0:	e28db000 	add	fp, sp, #0
    10b4:	e24dd014 	sub	sp, sp, #20
    10b8:	e50b0010 	str	r0, [fp, #-16]
    10bc:	e3a03000 	mov	r3, #0
    10c0:	e50b3008 	str	r3, [fp, #-8]
    10c4:	e3a03000 	mov	r3, #0
    10c8:	e50b300c 	str	r3, [fp, #-12]
    10cc:	ea000008 	b	10f4 <ValidatePartitionHeaderChecksum+0x48>
    10d0:	e51b3010 	ldr	r3, [fp, #-16]
    10d4:	e51b200c 	ldr	r2, [fp, #-12]
    10d8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    10dc:	e51b2008 	ldr	r2, [fp, #-8]
    10e0:	e0823003 	add	r3, r2, r3
    10e4:	e50b3008 	str	r3, [fp, #-8]
    10e8:	e51b300c 	ldr	r3, [fp, #-12]
    10ec:	e2833001 	add	r3, r3, #1
    10f0:	e50b300c 	str	r3, [fp, #-12]
    10f4:	e51b300c 	ldr	r3, [fp, #-12]
    10f8:	e353000e 	cmp	r3, #14
    10fc:	9afffff3 	bls	10d0 <ValidatePartitionHeaderChecksum+0x24>
    1100:	e51b3008 	ldr	r3, [fp, #-8]
    1104:	e1e03003 	mvn	r3, r3
    1108:	e50b3008 	str	r3, [fp, #-8]
    110c:	e51b3010 	ldr	r3, [fp, #-16]
    1110:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
    1114:	e51b2008 	ldr	r2, [fp, #-8]
    1118:	e1520003 	cmp	r2, r3
    111c:	0a000001 	beq	1128 <ValidatePartitionHeaderChecksum+0x7c>
    1120:	e3a03001 	mov	r3, #1
    1124:	ea000000 	b	112c <ValidatePartitionHeaderChecksum+0x80>
    1128:	e3a03000 	mov	r3, #0
    112c:	e1a00003 	mov	r0, r3
    1130:	e28bd000 	add	sp, fp, #0
    1134:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    1138:	e12fff1e 	bx	lr

0000113c <PartitionMove>:
    113c:	e92d4800 	push	{fp, lr}
    1140:	e28db004 	add	fp, sp, #4
    1144:	e24dd028 	sub	sp, sp, #40	; 0x28
    1148:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    114c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    1150:	e3a03000 	mov	r3, #0
    1154:	e54b3009 	strb	r3, [fp, #-9]
    1158:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    115c:	e50b3008 	str	r3, [fp, #-8]
    1160:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1164:	e5933014 	ldr	r3, [r3, #20]
    1168:	e1a03103 	lsl	r3, r3, #2
    116c:	e51b2008 	ldr	r2, [fp, #-8]
    1170:	e0823003 	add	r3, r2, r3
    1174:	e50b3008 	str	r3, [fp, #-8]
    1178:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    117c:	e593300c 	ldr	r3, [r3, #12]
    1180:	e50b3010 	str	r3, [fp, #-16]
    1184:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1188:	e5933000 	ldr	r3, [r3]
    118c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    1190:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1194:	e5933004 	ldr	r3, [r3, #4]
    1198:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    119c:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    11a0:	e3403001 	movt	r3, #1
    11a4:	e5d33000 	ldrb	r3, [r3]
    11a8:	e3530000 	cmp	r3, #0
    11ac:	0a000005 	beq	11c8 <PartitionMove+0x8c>
    11b0:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    11b4:	e3403001 	movt	r3, #1
    11b8:	e5933000 	ldr	r3, [r3]
    11bc:	e51b2008 	ldr	r2, [fp, #-8]
    11c0:	e0823003 	add	r3, r2, r3
    11c4:	e50b3008 	str	r3, [fp, #-8]
    11c8:	e30d305c 	movw	r3, #53340	; 0xd05c
    11cc:	e3403001 	movt	r3, #1
    11d0:	e5d33000 	ldrb	r3, [r3]
    11d4:	e3530000 	cmp	r3, #0
    11d8:	0a000001 	beq	11e4 <PartitionMove+0xa8>
    11dc:	e3a03001 	mov	r3, #1
    11e0:	e54b3009 	strb	r3, [fp, #-9]
    11e4:	e30d305f 	movw	r3, #53343	; 0xd05f
    11e8:	e3403001 	movt	r3, #1
    11ec:	e5d33000 	ldrb	r3, [r3]
    11f0:	e3530000 	cmp	r3, #0
    11f4:	1a000004 	bne	120c <PartitionMove+0xd0>
    11f8:	e30d3060 	movw	r3, #53344	; 0xd060
    11fc:	e3403001 	movt	r3, #1
    1200:	e5d33000 	ldrb	r3, [r3]
    1204:	e3530000 	cmp	r3, #0
    1208:	0a000005 	beq	1224 <PartitionMove+0xe8>
    120c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1210:	e5933008 	ldr	r3, [r3, #8]
    1214:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    1218:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    121c:	e5933008 	ldr	r3, [r3, #8]
    1220:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    1224:	e30d305e 	movw	r3, #53342	; 0xd05e
    1228:	e3403001 	movt	r3, #1
    122c:	e5d33000 	ldrb	r3, [r3]
    1230:	e3530000 	cmp	r3, #0
    1234:	0a000010 	beq	127c <PartitionMove+0x140>
    1238:	e30d305f 	movw	r3, #53343	; 0xd05f
    123c:	e3403001 	movt	r3, #1
    1240:	e5d33000 	ldrb	r3, [r3]
    1244:	e3530000 	cmp	r3, #0
    1248:	1a000004 	bne	1260 <PartitionMove+0x124>
    124c:	e30d3060 	movw	r3, #53344	; 0xd060
    1250:	e3403001 	movt	r3, #1
    1254:	e5d33000 	ldrb	r3, [r3]
    1258:	e3530000 	cmp	r3, #0
    125c:	0a000006 	beq	127c <PartitionMove+0x140>
    1260:	e30d305c 	movw	r3, #53340	; 0xd05c
    1264:	e3403001 	movt	r3, #1
    1268:	e5d33000 	ldrb	r3, [r3]
    126c:	e3530000 	cmp	r3, #0
    1270:	0a000001 	beq	127c <PartitionMove+0x140>
    1274:	e3a03000 	mov	r3, #0
    1278:	e54b3009 	strb	r3, [fp, #-9]
    127c:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    1280:	e3403001 	movt	r3, #1
    1284:	e5d33000 	ldrb	r3, [r3]
    1288:	e3530000 	cmp	r3, #0
    128c:	1a000016 	bne	12ec <PartitionMove+0x1b0>
    1290:	e30d305d 	movw	r3, #53341	; 0xd05d
    1294:	e3403001 	movt	r3, #1
    1298:	e5d33000 	ldrb	r3, [r3]
    129c:	e3530000 	cmp	r3, #0
    12a0:	0a000001 	beq	12ac <PartitionMove+0x170>
    12a4:	e3a03601 	mov	r3, #1048576	; 0x100000
    12a8:	e50b3010 	str	r3, [fp, #-16]
    12ac:	e30d3068 	movw	r3, #53352	; 0xd068
    12b0:	e3403001 	movt	r3, #1
    12b4:	e5933000 	ldr	r3, [r3]
    12b8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    12bc:	e1a02102 	lsl	r2, r2, #2
    12c0:	e51b1010 	ldr	r1, [fp, #-16]
    12c4:	e51b0008 	ldr	r0, [fp, #-8]
    12c8:	e12fff33 	blx	r3
    12cc:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    12d0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    12d4:	e3530000 	cmp	r3, #0
    12d8:	0a000001 	beq	12e4 <PartitionMove+0x1a8>
    12dc:	e3a03001 	mov	r3, #1
    12e0:	ea000069 	b	148c <PartitionMove+0x350>
    12e4:	e51b3010 	ldr	r3, [fp, #-16]
    12e8:	e50b3008 	str	r3, [fp, #-8]
    12ec:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    12f0:	e3403001 	movt	r3, #1
    12f4:	e5d33000 	ldrb	r3, [r3]
    12f8:	e3530000 	cmp	r3, #0
    12fc:	0a00000e 	beq	133c <PartitionMove+0x200>
    1300:	e30d305d 	movw	r3, #53341	; 0xd05d
    1304:	e3403001 	movt	r3, #1
    1308:	e5d33000 	ldrb	r3, [r3]
    130c:	e3530000 	cmp	r3, #0
    1310:	0a000009 	beq	133c <PartitionMove+0x200>
    1314:	e30d305f 	movw	r3, #53343	; 0xd05f
    1318:	e3403001 	movt	r3, #1
    131c:	e5d33000 	ldrb	r3, [r3]
    1320:	e3530000 	cmp	r3, #0
    1324:	1a00001b 	bne	1398 <PartitionMove+0x25c>
    1328:	e30d3060 	movw	r3, #53344	; 0xd060
    132c:	e3403001 	movt	r3, #1
    1330:	e5d33000 	ldrb	r3, [r3]
    1334:	e3530000 	cmp	r3, #0
    1338:	1a000016 	bne	1398 <PartitionMove+0x25c>
    133c:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    1340:	e3403001 	movt	r3, #1
    1344:	e5d33000 	ldrb	r3, [r3]
    1348:	e3530000 	cmp	r3, #0
    134c:	0a000004 	beq	1364 <PartitionMove+0x228>
    1350:	e30d305e 	movw	r3, #53342	; 0xd05e
    1354:	e3403001 	movt	r3, #1
    1358:	e5d33000 	ldrb	r3, [r3]
    135c:	e3530000 	cmp	r3, #0
    1360:	1a00000c 	bne	1398 <PartitionMove+0x25c>
    1364:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    1368:	e3403001 	movt	r3, #1
    136c:	e5d33000 	ldrb	r3, [r3]
    1370:	e3530000 	cmp	r3, #0
    1374:	1a00001f 	bne	13f8 <PartitionMove+0x2bc>
    1378:	e30d305e 	movw	r3, #53342	; 0xd05e
    137c:	e3403001 	movt	r3, #1
    1380:	e5d33000 	ldrb	r3, [r3]
    1384:	e3530000 	cmp	r3, #0
    1388:	0a00001a 	beq	13f8 <PartitionMove+0x2bc>
    138c:	e55b3009 	ldrb	r3, [fp, #-9]
    1390:	e3530000 	cmp	r3, #0
    1394:	0a000017 	beq	13f8 <PartitionMove+0x2bc>
    1398:	e30d305d 	movw	r3, #53341	; 0xd05d
    139c:	e3403001 	movt	r3, #1
    13a0:	e5d33000 	ldrb	r3, [r3]
    13a4:	e3530000 	cmp	r3, #0
    13a8:	0a000003 	beq	13bc <PartitionMove+0x280>
    13ac:	e3a03000 	mov	r3, #0
    13b0:	e54b3009 	strb	r3, [fp, #-9]
    13b4:	e3a03601 	mov	r3, #1048576	; 0x100000
    13b8:	e50b3010 	str	r3, [fp, #-16]
    13bc:	e51b0008 	ldr	r0, [fp, #-8]
    13c0:	e51b1010 	ldr	r1, [fp, #-16]
    13c4:	e55b3009 	ldrb	r3, [fp, #-9]
    13c8:	e58d3000 	str	r3, [sp]
    13cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    13d0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    13d4:	eb0008b4 	bl	36ac <PcapDataTransfer>
    13d8:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    13dc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    13e0:	e3530000 	cmp	r3, #0
    13e4:	0a000001 	beq	13f0 <PartitionMove+0x2b4>
    13e8:	e3a03001 	mov	r3, #1
    13ec:	ea000026 	b	148c <PartitionMove+0x350>
    13f0:	e51b3010 	ldr	r3, [fp, #-16]
    13f4:	e50b3008 	str	r3, [fp, #-8]
    13f8:	e30d305d 	movw	r3, #53341	; 0xd05d
    13fc:	e3403001 	movt	r3, #1
    1400:	e5d33000 	ldrb	r3, [r3]
    1404:	e3530000 	cmp	r3, #0
    1408:	0a00001e 	beq	1488 <PartitionMove+0x34c>
    140c:	e30d305f 	movw	r3, #53343	; 0xd05f
    1410:	e3403001 	movt	r3, #1
    1414:	e5d33000 	ldrb	r3, [r3]
    1418:	e3530000 	cmp	r3, #0
    141c:	1a000019 	bne	1488 <PartitionMove+0x34c>
    1420:	e30d3060 	movw	r3, #53344	; 0xd060
    1424:	e3403001 	movt	r3, #1
    1428:	e5d33000 	ldrb	r3, [r3]
    142c:	e3530000 	cmp	r3, #0
    1430:	1a000014 	bne	1488 <PartitionMove+0x34c>
    1434:	e51b0008 	ldr	r0, [fp, #-8]
    1438:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    143c:	e593300c 	ldr	r3, [r3, #12]
    1440:	e1a0c003 	mov	ip, r3
    1444:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1448:	e5932000 	ldr	r2, [r3]
    144c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    1450:	e5931004 	ldr	r1, [r3, #4]
    1454:	e30d305c 	movw	r3, #53340	; 0xd05c
    1458:	e3403001 	movt	r3, #1
    145c:	e5d33000 	ldrb	r3, [r3]
    1460:	e58d3000 	str	r3, [sp]
    1464:	e1a03001 	mov	r3, r1
    1468:	e1a0100c 	mov	r1, ip
    146c:	eb0008d8 	bl	37d4 <PcapLoadPartition>
    1470:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    1474:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    1478:	e3530000 	cmp	r3, #0
    147c:	0a000001 	beq	1488 <PartitionMove+0x34c>
    1480:	e3a03001 	mov	r3, #1
    1484:	ea000000 	b	148c <PartitionMove+0x350>
    1488:	e3a03000 	mov	r3, #0
    148c:	e1a00003 	mov	r0, r3
    1490:	e24bd004 	sub	sp, fp, #4
    1494:	e8bd8800 	pop	{fp, pc}

00001498 <DecryptPartition>:
    1498:	e92d4800 	push	{fp, lr}
    149c:	e28db004 	add	fp, sp, #4
    14a0:	e24dd020 	sub	sp, sp, #32
    14a4:	e50b0010 	str	r0, [fp, #-16]
    14a8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    14ac:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    14b0:	e3a03001 	mov	r3, #1
    14b4:	e54b3005 	strb	r3, [fp, #-5]
    14b8:	e51b0010 	ldr	r0, [fp, #-16]
    14bc:	e51b1010 	ldr	r1, [fp, #-16]
    14c0:	e55b3005 	ldrb	r3, [fp, #-5]
    14c4:	e58d3000 	str	r3, [sp]
    14c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    14cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    14d0:	eb000875 	bl	36ac <PcapDataTransfer>
    14d4:	e50b000c 	str	r0, [fp, #-12]
    14d8:	e51b300c 	ldr	r3, [fp, #-12]
    14dc:	e3530000 	cmp	r3, #0
    14e0:	0a000001 	beq	14ec <DecryptPartition+0x54>
    14e4:	e3a03001 	mov	r3, #1
    14e8:	ea000000 	b	14f0 <DecryptPartition+0x58>
    14ec:	e3a03000 	mov	r3, #0
    14f0:	e1a00003 	mov	r0, r3
    14f4:	e24bd004 	sub	sp, fp, #4
    14f8:	e8bd8800 	pop	{fp, pc}

000014fc <ValidateParition>:
    14fc:	e92d4800 	push	{fp, lr}
    1500:	e28db004 	add	fp, sp, #4
    1504:	e24dd038 	sub	sp, sp, #56	; 0x38
    1508:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    150c:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    1510:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    1514:	e24b301c 	sub	r3, fp, #28
    1518:	e1a01003 	mov	r1, r3
    151c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    1520:	eb00003b 	bl	1614 <GetPartitionChecksum>
    1524:	e50b000c 	str	r0, [fp, #-12]
    1528:	e51b300c 	ldr	r3, [fp, #-12]
    152c:	e3530000 	cmp	r3, #0
    1530:	0a000001 	beq	153c <ValidateParition+0x40>
    1534:	e3a03001 	mov	r3, #1
    1538:	ea000032 	b	1608 <ValidateParition+0x10c>
    153c:	e3a03000 	mov	r3, #0
    1540:	e50b3008 	str	r3, [fp, #-8]
    1544:	ea000002 	b	1554 <ValidateParition+0x58>
    1548:	e51b3008 	ldr	r3, [fp, #-8]
    154c:	e2833001 	add	r3, r3, #1
    1550:	e50b3008 	str	r3, [fp, #-8]
    1554:	e51b3008 	ldr	r3, [fp, #-8]
    1558:	e353000f 	cmp	r3, #15
    155c:	9afffff9 	bls	1548 <ValidateParition+0x4c>
    1560:	e24b302c 	sub	r3, fp, #44	; 0x2c
    1564:	e1a02003 	mov	r2, r3
    1568:	e51b1034 	ldr	r1, [fp, #-52]	; 0xffffffcc
    156c:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    1570:	eb00003d 	bl	166c <CalcPartitionChecksum>
    1574:	e50b000c 	str	r0, [fp, #-12]
    1578:	e51b300c 	ldr	r3, [fp, #-12]
    157c:	e3530000 	cmp	r3, #0
    1580:	0a000001 	beq	158c <ValidateParition+0x90>
    1584:	e3a03001 	mov	r3, #1
    1588:	ea00001e 	b	1608 <ValidateParition+0x10c>
    158c:	e3a03000 	mov	r3, #0
    1590:	e50b3008 	str	r3, [fp, #-8]
    1594:	ea000002 	b	15a4 <ValidateParition+0xa8>
    1598:	e51b3008 	ldr	r3, [fp, #-8]
    159c:	e2833001 	add	r3, r3, #1
    15a0:	e50b3008 	str	r3, [fp, #-8]
    15a4:	e51b3008 	ldr	r3, [fp, #-8]
    15a8:	e353000f 	cmp	r3, #15
    15ac:	9afffff9 	bls	1598 <ValidateParition+0x9c>
    15b0:	e3a03000 	mov	r3, #0
    15b4:	e50b3008 	str	r3, [fp, #-8]
    15b8:	ea00000e 	b	15f8 <ValidateParition+0xfc>
    15bc:	e24b201c 	sub	r2, fp, #28
    15c0:	e51b3008 	ldr	r3, [fp, #-8]
    15c4:	e0823003 	add	r3, r2, r3
    15c8:	e5d32000 	ldrb	r2, [r3]
    15cc:	e24b102c 	sub	r1, fp, #44	; 0x2c
    15d0:	e51b3008 	ldr	r3, [fp, #-8]
    15d4:	e0813003 	add	r3, r1, r3
    15d8:	e5d33000 	ldrb	r3, [r3]
    15dc:	e1520003 	cmp	r2, r3
    15e0:	0a000001 	beq	15ec <ValidateParition+0xf0>
    15e4:	e3a03001 	mov	r3, #1
    15e8:	ea000006 	b	1608 <ValidateParition+0x10c>
    15ec:	e51b3008 	ldr	r3, [fp, #-8]
    15f0:	e2833001 	add	r3, r3, #1
    15f4:	e50b3008 	str	r3, [fp, #-8]
    15f8:	e51b3008 	ldr	r3, [fp, #-8]
    15fc:	e353000f 	cmp	r3, #15
    1600:	9affffed 	bls	15bc <ValidateParition+0xc0>
    1604:	e3a03000 	mov	r3, #0
    1608:	e1a00003 	mov	r0, r3
    160c:	e24bd004 	sub	sp, fp, #4
    1610:	e8bd8800 	pop	{fp, pc}

00001614 <GetPartitionChecksum>:
    1614:	e92d4800 	push	{fp, lr}
    1618:	e28db004 	add	fp, sp, #4
    161c:	e24dd010 	sub	sp, sp, #16
    1620:	e50b0010 	str	r0, [fp, #-16]
    1624:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    1628:	e30d3068 	movw	r3, #53352	; 0xd068
    162c:	e3403001 	movt	r3, #1
    1630:	e5933000 	ldr	r3, [r3]
    1634:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    1638:	e3a02010 	mov	r2, #16
    163c:	e51b0010 	ldr	r0, [fp, #-16]
    1640:	e12fff33 	blx	r3
    1644:	e50b0008 	str	r0, [fp, #-8]
    1648:	e51b3008 	ldr	r3, [fp, #-8]
    164c:	e3530000 	cmp	r3, #0
    1650:	0a000001 	beq	165c <GetPartitionChecksum+0x48>
    1654:	e3a03001 	mov	r3, #1
    1658:	ea000000 	b	1660 <GetPartitionChecksum+0x4c>
    165c:	e3a03000 	mov	r3, #0
    1660:	e1a00003 	mov	r0, r3
    1664:	e24bd004 	sub	sp, fp, #4
    1668:	e8bd8800 	pop	{fp, pc}

0000166c <CalcPartitionChecksum>:
    166c:	e92d4800 	push	{fp, lr}
    1670:	e28db004 	add	fp, sp, #4
    1674:	e24dd010 	sub	sp, sp, #16
    1678:	e50b0008 	str	r0, [fp, #-8]
    167c:	e50b100c 	str	r1, [fp, #-12]
    1680:	e50b2010 	str	r2, [fp, #-16]
    1684:	e51b0008 	ldr	r0, [fp, #-8]
    1688:	e3a03000 	mov	r3, #0
    168c:	e51b2010 	ldr	r2, [fp, #-16]
    1690:	e51b100c 	ldr	r1, [fp, #-12]
    1694:	eb000780 	bl	349c <md5>
    1698:	e3a03000 	mov	r3, #0
    169c:	e1a00003 	mov	r0, r3
    16a0:	e24bd004 	sub	sp, fp, #4
    16a4:	e8bd8800 	pop	{fp, pc}

000016a8 <Xil_In32>:
    16a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    16ac:	e28db000 	add	fp, sp, #0
    16b0:	e24dd00c 	sub	sp, sp, #12
    16b4:	e50b0008 	str	r0, [fp, #-8]
    16b8:	e51b3008 	ldr	r3, [fp, #-8]
    16bc:	e5933000 	ldr	r3, [r3]
    16c0:	e1a00003 	mov	r0, r3
    16c4:	e28bd000 	add	sp, fp, #0
    16c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    16cc:	e12fff1e 	bx	lr

000016d0 <Xil_Out32>:
    16d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    16d4:	e28db000 	add	fp, sp, #0
    16d8:	e24dd014 	sub	sp, sp, #20
    16dc:	e50b0010 	str	r0, [fp, #-16]
    16e0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    16e4:	e51b3010 	ldr	r3, [fp, #-16]
    16e8:	e50b3008 	str	r3, [fp, #-8]
    16ec:	e51b3008 	ldr	r3, [fp, #-8]
    16f0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    16f4:	e5832000 	str	r2, [r3]
    16f8:	e320f000 	nop	{0}
    16fc:	e28bd000 	add	sp, fp, #0
    1700:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    1704:	e12fff1e 	bx	lr

00001708 <main>:
    1708:	e92d4800 	push	{fp, lr}
    170c:	e28db004 	add	fp, sp, #4
    1710:	e24dd010 	sub	sp, sp, #16
    1714:	e3a03000 	mov	r3, #0
    1718:	e50b300c 	str	r3, [fp, #-12]
    171c:	e3a03000 	mov	r3, #0
    1720:	e50b3010 	str	r3, [fp, #-16]
    1724:	e3a03000 	mov	r3, #0
    1728:	e50b3008 	str	r3, [fp, #-8]
    172c:	eb000e6d 	bl	50e8 <ps7_init>
    1730:	e1a03000 	mov	r3, r0
    1734:	e50b3008 	str	r3, [fp, #-8]
    1738:	e51b3008 	ldr	r3, [fp, #-8]
    173c:	e3530000 	cmp	r3, #0
    1740:	0a000002 	beq	1750 <main+0x48>
    1744:	e30a0012 	movw	r0, #40978	; 0xa012
    1748:	eb000124 	bl	1be0 <OutputStatus>
    174c:	ebfffb73 	bl	520 <FsblHookFallback>
    1750:	e30d1f0d 	movw	r1, #57101	; 0xdf0d
    1754:	e34d1f0d 	movt	r1, #57101	; 0xdf0d
    1758:	e3a00008 	mov	r0, #8
    175c:	e34f0800 	movt	r0, #63488	; 0xf800
    1760:	ebffffda 	bl	16d0 <Xil_Out32>
    1764:	eb003b9c 	bl	105dc <Xil_DCacheFlush>
    1768:	eb003bb2 	bl	10638 <Xil_DCacheDisable>
    176c:	eb000196 	bl	1dcc <RegisterHandlers>
    1770:	eb0002bc 	bl	2268 <DDRInitCheck>
    1774:	e50b0008 	str	r0, [fp, #-8]
    1778:	e51b3008 	ldr	r3, [fp, #-8]
    177c:	e3530001 	cmp	r3, #1
    1780:	1a000002 	bne	1790 <main+0x88>
    1784:	e30a0007 	movw	r0, #40967	; 0xa007
    1788:	eb000114 	bl	1be0 <OutputStatus>
    178c:	ebfffb63 	bl	520 <FsblHookFallback>
    1790:	eb00086d 	bl	394c <InitPcap>
    1794:	e1a03000 	mov	r3, r0
    1798:	e50b3008 	str	r3, [fp, #-8]
    179c:	e51b3008 	ldr	r3, [fp, #-8]
    17a0:	e3530001 	cmp	r3, #1
    17a4:	1a000002 	bne	17b4 <main+0xac>
    17a8:	e30a0002 	movw	r0, #40962	; 0xa002
    17ac:	eb00010b 	bl	1be0 <OutputStatus>
    17b0:	ebfffb5a 	bl	520 <FsblHookFallback>
    17b4:	eb000202 	bl	1fc4 <GetSiliconVersion>
    17b8:	e30d3428 	movw	r3, #54312	; 0xd428
    17bc:	e3403001 	movt	r3, #1
    17c0:	e5933000 	ldr	r3, [r3]
    17c4:	e1a00003 	mov	r0, r3
    17c8:	eb0020f6 	bl	9ba8 <XDcfg_GetControlRegister>
    17cc:	e1a02000 	mov	r2, r0
    17d0:	e30d3400 	movw	r3, #54272	; 0xd400
    17d4:	e3403001 	movt	r3, #1
    17d8:	e5832000 	str	r2, [r3]
    17dc:	eb000160 	bl	1d64 <MarkFSBLIn>
    17e0:	e3a00f97 	mov	r0, #604	; 0x25c
    17e4:	e34f0800 	movt	r0, #63488	; 0xf800
    17e8:	ebffffae 	bl	16a8 <Xil_In32>
    17ec:	e50b000c 	str	r0, [fp, #-12]
    17f0:	e51b300c 	ldr	r3, [fp, #-12]
    17f4:	e2033007 	and	r3, r3, #7
    17f8:	e50b300c 	str	r3, [fp, #-12]
    17fc:	e51b300c 	ldr	r3, [fp, #-12]
    1800:	e3530001 	cmp	r3, #1
    1804:	1a000006 	bne	1824 <main+0x11c>
    1808:	eb0009e6 	bl	3fa8 <InitQspi>
    180c:	e30d3068 	movw	r3, #53352	; 0xd068
    1810:	e3403001 	movt	r3, #1
    1814:	e3042568 	movw	r2, #17768	; 0x4568
    1818:	e3402000 	movt	r2, #0
    181c:	e5832000 	str	r2, [r3]
    1820:	ea00004b 	b	1954 <main+0x24c>
    1824:	e51b300c 	ldr	r3, [fp, #-12]
    1828:	e3530002 	cmp	r3, #2
    182c:	1a000006 	bne	184c <main+0x144>
    1830:	eb000748 	bl	3558 <InitNor>
    1834:	e30d3068 	movw	r3, #53352	; 0xd068
    1838:	e3403001 	movt	r3, #1
    183c:	e3032580 	movw	r2, #13696	; 0x3580
    1840:	e3402000 	movt	r2, #0
    1844:	e5832000 	str	r2, [r3]
    1848:	ea000041 	b	1954 <main+0x24c>
    184c:	e51b300c 	ldr	r3, [fp, #-12]
    1850:	e3530005 	cmp	r3, #5
    1854:	1a00000f 	bne	1898 <main+0x190>
    1858:	e3010f3c 	movw	r0, #7996	; 0x1f3c
    185c:	e3400001 	movt	r0, #1
    1860:	eb000c56 	bl	49c0 <InitSD>
    1864:	e50b0008 	str	r0, [fp, #-8]
    1868:	e51b3008 	ldr	r3, [fp, #-8]
    186c:	e3530000 	cmp	r3, #0
    1870:	0a000002 	beq	1880 <main+0x178>
    1874:	e30a0009 	movw	r0, #40969	; 0xa009
    1878:	eb0000d8 	bl	1be0 <OutputStatus>
    187c:	eb000062 	bl	1a0c <FsblFallback>
    1880:	e30d3068 	movw	r3, #53352	; 0xd068
    1884:	e3403001 	movt	r3, #1
    1888:	e3042a90 	movw	r2, #19088	; 0x4a90
    188c:	e3402000 	movt	r2, #0
    1890:	e5832000 	str	r2, [r3]
    1894:	ea00002e 	b	1954 <main+0x24c>
    1898:	e51b300c 	ldr	r3, [fp, #-12]
    189c:	e3530006 	cmp	r3, #6
    18a0:	1a00000f 	bne	18e4 <main+0x1dc>
    18a4:	e3010f3c 	movw	r0, #7996	; 0x1f3c
    18a8:	e3400001 	movt	r0, #1
    18ac:	eb000c43 	bl	49c0 <InitSD>
    18b0:	e50b0008 	str	r0, [fp, #-8]
    18b4:	e51b3008 	ldr	r3, [fp, #-8]
    18b8:	e3530000 	cmp	r3, #0
    18bc:	0a000002 	beq	18cc <main+0x1c4>
    18c0:	e30a0009 	movw	r0, #40969	; 0xa009
    18c4:	eb0000c5 	bl	1be0 <OutputStatus>
    18c8:	eb00004f 	bl	1a0c <FsblFallback>
    18cc:	e30d3068 	movw	r3, #53352	; 0xd068
    18d0:	e3403001 	movt	r3, #1
    18d4:	e3042a90 	movw	r2, #19088	; 0x4a90
    18d8:	e3402000 	movt	r2, #0
    18dc:	e5832000 	str	r2, [r3]
    18e0:	ea00001b 	b	1954 <main+0x24c>
    18e4:	e51b300c 	ldr	r3, [fp, #-12]
    18e8:	e3530000 	cmp	r3, #0
    18ec:	1a000015 	bne	1948 <main+0x240>
    18f0:	e307000c 	movw	r0, #28684	; 0x700c
    18f4:	e34f0800 	movt	r0, #63488	; 0xf800
    18f8:	ebffff6a 	bl	16a8 <Xil_In32>
    18fc:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    1900:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1904:	e2033004 	and	r3, r3, #4
    1908:	e3530000 	cmp	r3, #0
    190c:	0a000005 	beq	1928 <main+0x220>
    1910:	eb000d9c 	bl	4f88 <ps7_post_config>
    1914:	e30d1f0d 	movw	r1, #57101	; 0xdf0d
    1918:	e34d1f0d 	movt	r1, #57101	; 0xdf0d
    191c:	e3a00008 	mov	r0, #8
    1920:	e34f0800 	movt	r0, #63488	; 0xf800
    1924:	ebffff69 	bl	16d0 <Xil_Out32>
    1928:	eb00011a 	bl	1d98 <ClearFSBLIn>
    192c:	e307167b 	movw	r1, #30331	; 0x767b
    1930:	e347167b 	movt	r1, #30331	; 0x767b
    1934:	e3a00004 	mov	r0, #4
    1938:	e34f0800 	movt	r0, #63488	; 0xf800
    193c:	ebffff63 	bl	16d0 <Xil_Out32>
    1940:	eb004147 	bl	11e64 <FsblHandoffJtagExit>
    1944:	ea000002 	b	1954 <main+0x24c>
    1948:	e3a00a0a 	mov	r0, #40960	; 0xa000
    194c:	eb0000a3 	bl	1be0 <OutputStatus>
    1950:	eb00002d 	bl	1a0c <FsblFallback>
    1954:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    1958:	e3403001 	movt	r3, #1
    195c:	e5933000 	ldr	r3, [r3]
    1960:	e353033f 	cmp	r3, #-67108864	; 0xfc000000
    1964:	0a000013 	beq	19b8 <main+0x2b0>
    1968:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    196c:	e3403001 	movt	r3, #1
    1970:	e5933000 	ldr	r3, [r3]
    1974:	e35304e1 	cmp	r3, #-520093696	; 0xe1000000
    1978:	0a00000e 	beq	19b8 <main+0x2b0>
    197c:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    1980:	e3403001 	movt	r3, #1
    1984:	e5933000 	ldr	r3, [r3]
    1988:	e35304e2 	cmp	r3, #-503316480	; 0xe2000000
    198c:	0a000009 	beq	19b8 <main+0x2b0>
    1990:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    1994:	e3403001 	movt	r3, #1
    1998:	e5932000 	ldr	r2, [r3]
    199c:	e3a03000 	mov	r3, #0
    19a0:	e34e3010 	movt	r3, #57360	; 0xe010
    19a4:	e1520003 	cmp	r2, r3
    19a8:	0a000002 	beq	19b8 <main+0x2b0>
    19ac:	e30a0006 	movw	r0, #40966	; 0xa006
    19b0:	eb00008a 	bl	1be0 <OutputStatus>
    19b4:	eb000014 	bl	1a0c <FsblFallback>
    19b8:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    19bc:	e3403001 	movt	r3, #1
    19c0:	e5933000 	ldr	r3, [r3]
    19c4:	e35304e2 	cmp	r3, #-503316480	; 0xe2000000
    19c8:	1a000003 	bne	19dc <main+0x2d4>
    19cc:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    19d0:	e3403001 	movt	r3, #1
    19d4:	e3a02001 	mov	r2, #1
    19d8:	e5c32000 	strb	r2, [r3]
    19dc:	e30d3404 	movw	r3, #54276	; 0xd404
    19e0:	e3403001 	movt	r3, #1
    19e4:	e3a02001 	mov	r2, #1
    19e8:	e5c32000 	strb	r2, [r3]
    19ec:	ebfffae7 	bl	590 <LoadBootImage>
    19f0:	e50b0010 	str	r0, [fp, #-16]
    19f4:	e51b0010 	ldr	r0, [fp, #-16]
    19f8:	eb00004c 	bl	1b30 <FsblHandoff>
    19fc:	e51b3008 	ldr	r3, [fp, #-8]
    1a00:	e1a00003 	mov	r0, r3
    1a04:	e24bd004 	sub	sp, fp, #4
    1a08:	e8bd8800 	pop	{fp, pc}

00001a0c <FsblFallback>:
    1a0c:	e92d4800 	push	{fp, lr}
    1a10:	e28db004 	add	fp, sp, #4
    1a14:	e24dd010 	sub	sp, sp, #16
    1a18:	e3a00f97 	mov	r0, #604	; 0x25c
    1a1c:	e34f0800 	movt	r0, #63488	; 0xf800
    1a20:	ebffff20 	bl	16a8 <Xil_In32>
    1a24:	e50b0008 	str	r0, [fp, #-8]
    1a28:	e51b3008 	ldr	r3, [fp, #-8]
    1a2c:	e2033007 	and	r3, r3, #7
    1a30:	e50b3008 	str	r3, [fp, #-8]
    1a34:	e51b3008 	ldr	r3, [fp, #-8]
    1a38:	e3530001 	cmp	r3, #1
    1a3c:	0a000007 	beq	1a60 <FsblFallback+0x54>
    1a40:	e51b3008 	ldr	r3, [fp, #-8]
    1a44:	e3530004 	cmp	r3, #4
    1a48:	0a000004 	beq	1a60 <FsblFallback+0x54>
    1a4c:	e51b3008 	ldr	r3, [fp, #-8]
    1a50:	e3530002 	cmp	r3, #2
    1a54:	0a000001 	beq	1a60 <FsblFallback+0x54>
    1a58:	eb0000ce 	bl	1d98 <ClearFSBLIn>
    1a5c:	ebfffaaf 	bl	520 <FsblHookFallback>
    1a60:	eb000129 	bl	1f0c <Update_MultiBootRegister>
    1a64:	e3a00f96 	mov	r0, #600	; 0x258
    1a68:	e34f0800 	movt	r0, #63488	; 0xf800
    1a6c:	ebffff0d 	bl	16a8 <Xil_In32>
    1a70:	e50b000c 	str	r0, [fp, #-12]
    1a74:	e51b300c 	ldr	r3, [fp, #-12]
    1a78:	e383320f 	orr	r3, r3, #-268435456	; 0xf0000000
    1a7c:	e1a01003 	mov	r1, r3
    1a80:	e3a00f96 	mov	r0, #600	; 0x258
    1a84:	e34f0800 	movt	r0, #63488	; 0xf800
    1a88:	ebffff10 	bl	16d0 <Xil_Out32>
    1a8c:	f57ff04f 	dsb	sy
    1a90:	f57ff06f 	isb	sy
    1a94:	e30d3400 	movw	r3, #54272	; 0xd400
    1a98:	e3403001 	movt	r3, #1
    1a9c:	e5933000 	ldr	r3, [r3]
    1aa0:	e2033a01 	and	r3, r3, #4096	; 0x1000
    1aa4:	e3530000 	cmp	r3, #0
    1aa8:	0a000019 	beq	1b14 <FsblFallback+0x108>
    1aac:	e30d3404 	movw	r3, #54276	; 0xd404
    1ab0:	e3403001 	movt	r3, #1
    1ab4:	e5d33000 	ldrb	r3, [r3]
    1ab8:	e3530001 	cmp	r3, #1
    1abc:	1a000012 	bne	1b0c <FsblFallback+0x100>
    1ac0:	eb0007c1 	bl	39cc <FabricInit>
    1ac4:	e50b0010 	str	r0, [fp, #-16]
    1ac8:	e51b3010 	ldr	r3, [fp, #-16]
    1acc:	e3530000 	cmp	r3, #0
    1ad0:	0a000001 	beq	1adc <FsblFallback+0xd0>
    1ad4:	eb0000af 	bl	1d98 <ClearFSBLIn>
    1ad8:	ebfffa90 	bl	520 <FsblHookFallback>
    1adc:	eb000195 	bl	2138 <NextValidImageCheck>
    1ae0:	e50b0010 	str	r0, [fp, #-16]
    1ae4:	e51b3010 	ldr	r3, [fp, #-16]
    1ae8:	e3530000 	cmp	r3, #0
    1aec:	0a000001 	beq	1af8 <FsblFallback+0xec>
    1af0:	eb0000a8 	bl	1d98 <ClearFSBLIn>
    1af4:	ebfffa89 	bl	520 <FsblHookFallback>
    1af8:	ebfffaa4 	bl	590 <LoadBootImage>
    1afc:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    1b00:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    1b04:	eb000009 	bl	1b30 <FsblHandoff>
    1b08:	ea000001 	b	1b14 <FsblFallback+0x108>
    1b0c:	eb0000a1 	bl	1d98 <ClearFSBLIn>
    1b10:	ebfffa82 	bl	520 <FsblHookFallback>
    1b14:	e3a01001 	mov	r1, #1
    1b18:	e3a00c02 	mov	r0, #512	; 0x200
    1b1c:	e34f0800 	movt	r0, #63488	; 0xf800
    1b20:	ebfffeea 	bl	16d0 <Xil_Out32>
    1b24:	e320f000 	nop	{0}
    1b28:	e24bd004 	sub	sp, fp, #4
    1b2c:	e8bd8800 	pop	{fp, pc}

00001b30 <FsblHandoff>:
    1b30:	e92d4800 	push	{fp, lr}
    1b34:	e28db004 	add	fp, sp, #4
    1b38:	e24dd010 	sub	sp, sp, #16
    1b3c:	e50b0010 	str	r0, [fp, #-16]
    1b40:	e30d3061 	movw	r3, #53345	; 0xd061
    1b44:	e3403001 	movt	r3, #1
    1b48:	e5d33000 	ldrb	r3, [r3]
    1b4c:	e3530000 	cmp	r3, #0
    1b50:	0a000005 	beq	1b6c <FsblHandoff+0x3c>
    1b54:	eb000d0b 	bl	4f88 <ps7_post_config>
    1b58:	e30d1f0d 	movw	r1, #57101	; 0xdf0d
    1b5c:	e34d1f0d 	movt	r1, #57101	; 0xdf0d
    1b60:	e3a00008 	mov	r0, #8
    1b64:	e34f0800 	movt	r0, #63488	; 0xf800
    1b68:	ebfffed8 	bl	16d0 <Xil_Out32>
    1b6c:	ebfffa61 	bl	4f8 <FsblHookBeforeHandoff>
    1b70:	e50b0008 	str	r0, [fp, #-8]
    1b74:	e51b3008 	ldr	r3, [fp, #-8]
    1b78:	e3530000 	cmp	r3, #0
    1b7c:	0a000002 	beq	1b8c <FsblHandoff+0x5c>
    1b80:	e30a0401 	movw	r0, #41985	; 0xa401
    1b84:	eb000015 	bl	1be0 <OutputStatus>
    1b88:	ebffff9f 	bl	1a0c <FsblFallback>
    1b8c:	eb000081 	bl	1d98 <ClearFSBLIn>
    1b90:	e51b3010 	ldr	r3, [fp, #-16]
    1b94:	e3530000 	cmp	r3, #0
    1b98:	1a000006 	bne	1bb8 <FsblHandoff+0x88>
    1b9c:	e307167b 	movw	r1, #30331	; 0x767b
    1ba0:	e347167b 	movt	r1, #30331	; 0x767b
    1ba4:	e3a00004 	mov	r0, #4
    1ba8:	e34f0800 	movt	r0, #63488	; 0xf800
    1bac:	ebfffec7 	bl	16d0 <Xil_Out32>
    1bb0:	eb0040ab 	bl	11e64 <FsblHandoffJtagExit>
    1bb4:	ea000003 	b	1bc8 <FsblHandoff+0x98>
    1bb8:	e3a00001 	mov	r0, #1
    1bbc:	eb000007 	bl	1be0 <OutputStatus>
    1bc0:	e51b0010 	ldr	r0, [fp, #-16]
    1bc4:	eb0040af 	bl	11e88 <FsblHandoffExit>
    1bc8:	e30a0001 	movw	r0, #40961	; 0xa001
    1bcc:	eb000003 	bl	1be0 <OutputStatus>
    1bd0:	ebffff8d 	bl	1a0c <FsblFallback>
    1bd4:	e320f000 	nop	{0}
    1bd8:	e24bd004 	sub	sp, fp, #4
    1bdc:	e8bd8800 	pop	{fp, pc}

00001be0 <OutputStatus>:
    1be0:	e92d4800 	push	{fp, lr}
    1be4:	e28db004 	add	fp, sp, #4
    1be8:	e24dd010 	sub	sp, sp, #16
    1bec:	e50b0010 	str	r0, [fp, #-16]
    1bf0:	e3a03000 	mov	r3, #0
    1bf4:	e50b3008 	str	r3, [fp, #-8]
    1bf8:	e3a0002c 	mov	r0, #44	; 0x2c
    1bfc:	e34e0000 	movt	r0, #57344	; 0xe000
    1c00:	ebfffea8 	bl	16a8 <Xil_In32>
    1c04:	e50b0008 	str	r0, [fp, #-8]
    1c08:	ea000003 	b	1c1c <OutputStatus+0x3c>
    1c0c:	e3a0002c 	mov	r0, #44	; 0x2c
    1c10:	e34e0000 	movt	r0, #57344	; 0xe000
    1c14:	ebfffea3 	bl	16a8 <Xil_In32>
    1c18:	e50b0008 	str	r0, [fp, #-8]
    1c1c:	e51b3008 	ldr	r3, [fp, #-8]
    1c20:	e2033008 	and	r3, r3, #8
    1c24:	e3530000 	cmp	r3, #0
    1c28:	0afffff7 	beq	1c0c <OutputStatus+0x2c>
    1c2c:	e320f000 	nop	{0}
    1c30:	e320f000 	nop	{0}
    1c34:	e24bd004 	sub	sp, fp, #4
    1c38:	e8bd8800 	pop	{fp, pc}

00001c3c <ErrorLockdown>:
    1c3c:	e92d4800 	push	{fp, lr}
    1c40:	e28db004 	add	fp, sp, #4
    1c44:	e24dd008 	sub	sp, sp, #8
    1c48:	e50b0008 	str	r0, [fp, #-8]
    1c4c:	e51b0008 	ldr	r0, [fp, #-8]
    1c50:	ebffffe2 	bl	1be0 <OutputStatus>
    1c54:	ebffff6c 	bl	1a0c <FsblFallback>
    1c58:	e320f000 	nop	{0}
    1c5c:	e24bd004 	sub	sp, fp, #4
    1c60:	e8bd8800 	pop	{fp, pc}

00001c64 <memcpy_rom>:
    1c64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1c68:	e28db000 	add	fp, sp, #0
    1c6c:	e24dd01c 	sub	sp, sp, #28
    1c70:	e50b0010 	str	r0, [fp, #-16]
    1c74:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    1c78:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    1c7c:	e51b3010 	ldr	r3, [fp, #-16]
    1c80:	e50b3008 	str	r3, [fp, #-8]
    1c84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    1c88:	e50b300c 	str	r3, [fp, #-12]
    1c8c:	ea000007 	b	1cb0 <memcpy_rom+0x4c>
    1c90:	e51b200c 	ldr	r2, [fp, #-12]
    1c94:	e2823001 	add	r3, r2, #1
    1c98:	e50b300c 	str	r3, [fp, #-12]
    1c9c:	e51b3008 	ldr	r3, [fp, #-8]
    1ca0:	e2831001 	add	r1, r3, #1
    1ca4:	e50b1008 	str	r1, [fp, #-8]
    1ca8:	e5d22000 	ldrb	r2, [r2]
    1cac:	e5c32000 	strb	r2, [r3]
    1cb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    1cb4:	e2432001 	sub	r2, r3, #1
    1cb8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    1cbc:	e3530000 	cmp	r3, #0
    1cc0:	1afffff2 	bne	1c90 <memcpy_rom+0x2c>
    1cc4:	e51b3010 	ldr	r3, [fp, #-16]
    1cc8:	e1a00003 	mov	r0, r3
    1ccc:	e28bd000 	add	sp, fp, #0
    1cd0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    1cd4:	e12fff1e 	bx	lr

00001cd8 <strcpy_rom>:
    1cd8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1cdc:	e28db000 	add	fp, sp, #0
    1ce0:	e24dd014 	sub	sp, sp, #20
    1ce4:	e50b0010 	str	r0, [fp, #-16]
    1ce8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    1cec:	e3a03000 	mov	r3, #0
    1cf0:	e50b3008 	str	r3, [fp, #-8]
    1cf4:	ea00000a 	b	1d24 <strcpy_rom+0x4c>
    1cf8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    1cfc:	e51b3008 	ldr	r3, [fp, #-8]
    1d00:	e0822003 	add	r2, r2, r3
    1d04:	e51b1010 	ldr	r1, [fp, #-16]
    1d08:	e51b3008 	ldr	r3, [fp, #-8]
    1d0c:	e0813003 	add	r3, r1, r3
    1d10:	e5d22000 	ldrb	r2, [r2]
    1d14:	e5c32000 	strb	r2, [r3]
    1d18:	e51b3008 	ldr	r3, [fp, #-8]
    1d1c:	e2833001 	add	r3, r3, #1
    1d20:	e50b3008 	str	r3, [fp, #-8]
    1d24:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    1d28:	e51b3008 	ldr	r3, [fp, #-8]
    1d2c:	e0823003 	add	r3, r2, r3
    1d30:	e5d33000 	ldrb	r3, [r3]
    1d34:	e3530000 	cmp	r3, #0
    1d38:	1affffee 	bne	1cf8 <strcpy_rom+0x20>
    1d3c:	e51b2010 	ldr	r2, [fp, #-16]
    1d40:	e51b3008 	ldr	r3, [fp, #-8]
    1d44:	e0823003 	add	r3, r2, r3
    1d48:	e3a02000 	mov	r2, #0
    1d4c:	e5c32000 	strb	r2, [r3]
    1d50:	e51b3010 	ldr	r3, [fp, #-16]
    1d54:	e1a00003 	mov	r0, r3
    1d58:	e28bd000 	add	sp, fp, #0
    1d5c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    1d60:	e12fff1e 	bx	lr

00001d64 <MarkFSBLIn>:
    1d64:	e92d4800 	push	{fp, lr}
    1d68:	e28db004 	add	fp, sp, #4
    1d6c:	e3a00f96 	mov	r0, #600	; 0x258
    1d70:	e34f0800 	movt	r0, #63488	; 0xf800
    1d74:	ebfffe4b 	bl	16a8 <Xil_In32>
    1d78:	e1a03000 	mov	r3, r0
    1d7c:	e3833206 	orr	r3, r3, #1610612736	; 0x60000000
    1d80:	e1a01003 	mov	r1, r3
    1d84:	e3a00f96 	mov	r0, #600	; 0x258
    1d88:	e34f0800 	movt	r0, #63488	; 0xf800
    1d8c:	ebfffe4f 	bl	16d0 <Xil_Out32>
    1d90:	e320f000 	nop	{0}
    1d94:	e8bd8800 	pop	{fp, pc}

00001d98 <ClearFSBLIn>:
    1d98:	e92d4800 	push	{fp, lr}
    1d9c:	e28db004 	add	fp, sp, #4
    1da0:	e3a00f96 	mov	r0, #600	; 0x258
    1da4:	e34f0800 	movt	r0, #63488	; 0xf800
    1da8:	ebfffe3e 	bl	16a8 <Xil_In32>
    1dac:	e1a03000 	mov	r3, r0
    1db0:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
    1db4:	e1a01003 	mov	r1, r3
    1db8:	e3a00f96 	mov	r0, #600	; 0x258
    1dbc:	e34f0800 	movt	r0, #63488	; 0xf800
    1dc0:	ebfffe42 	bl	16d0 <Xil_Out32>
    1dc4:	e320f000 	nop	{0}
    1dc8:	e8bd8800 	pop	{fp, pc}

00001dcc <RegisterHandlers>:
    1dcc:	e92d4800 	push	{fp, lr}
    1dd0:	e28db004 	add	fp, sp, #4
    1dd4:	e24dd008 	sub	sp, sp, #8
    1dd8:	eb003827 	bl	fe7c <Xil_ExceptionInit>
    1ddc:	e3a02000 	mov	r2, #0
    1de0:	e3011e7c 	movw	r1, #7804	; 0x1e7c
    1de4:	e3401000 	movt	r1, #0
    1de8:	e3a00001 	mov	r0, #1
    1dec:	eb003823 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1df0:	e3a02000 	mov	r2, #0
    1df4:	e3011e94 	movw	r1, #7828	; 0x1e94
    1df8:	e3401000 	movt	r1, #0
    1dfc:	e3a00002 	mov	r0, #2
    1e00:	eb00381e 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1e04:	e3a02000 	mov	r2, #0
    1e08:	e3011eac 	movw	r1, #7852	; 0x1eac
    1e0c:	e3401000 	movt	r1, #0
    1e10:	e3a00003 	mov	r0, #3
    1e14:	eb003819 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1e18:	e3a02000 	mov	r2, #0
    1e1c:	e3011ec4 	movw	r1, #7876	; 0x1ec4
    1e20:	e3401000 	movt	r1, #0
    1e24:	e3a00004 	mov	r0, #4
    1e28:	eb003814 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1e2c:	e3a02000 	mov	r2, #0
    1e30:	e3011edc 	movw	r1, #7900	; 0x1edc
    1e34:	e3401000 	movt	r1, #0
    1e38:	e3a00005 	mov	r0, #5
    1e3c:	eb00380f 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1e40:	e3a02000 	mov	r2, #0
    1e44:	e3011ef4 	movw	r1, #7924	; 0x1ef4
    1e48:	e3401000 	movt	r1, #0
    1e4c:	e3a00006 	mov	r0, #6
    1e50:	eb00380a 	bl	fe80 <Xil_ExceptionRegisterHandler>
    1e54:	e3a03000 	mov	r3, #0
    1e58:	e50b3008 	str	r3, [fp, #-8]
    1e5c:	e10f3000 	mrs	r3, CPSR
    1e60:	e50b3008 	str	r3, [fp, #-8]
    1e64:	e51b3008 	ldr	r3, [fp, #-8]
    1e68:	e3c33080 	bic	r3, r3, #128	; 0x80
    1e6c:	e129f003 	msr	CPSR_fc, r3
    1e70:	e320f000 	nop	{0}
    1e74:	e24bd004 	sub	sp, fp, #4
    1e78:	e8bd8800 	pop	{fp, pc}

00001e7c <Undef_Handler>:
    1e7c:	e92d4800 	push	{fp, lr}
    1e80:	e28db004 	add	fp, sp, #4
    1e84:	e30a0301 	movw	r0, #41729	; 0xa301
    1e88:	ebffff6b 	bl	1c3c <ErrorLockdown>
    1e8c:	e320f000 	nop	{0}
    1e90:	e8bd8800 	pop	{fp, pc}

00001e94 <SVC_Handler>:
    1e94:	e92d4800 	push	{fp, lr}
    1e98:	e28db004 	add	fp, sp, #4
    1e9c:	e30a0302 	movw	r0, #41730	; 0xa302
    1ea0:	ebffff65 	bl	1c3c <ErrorLockdown>
    1ea4:	e320f000 	nop	{0}
    1ea8:	e8bd8800 	pop	{fp, pc}

00001eac <PreFetch_Abort_Handler>:
    1eac:	e92d4800 	push	{fp, lr}
    1eb0:	e28db004 	add	fp, sp, #4
    1eb4:	e30a0303 	movw	r0, #41731	; 0xa303
    1eb8:	ebffff5f 	bl	1c3c <ErrorLockdown>
    1ebc:	e320f000 	nop	{0}
    1ec0:	e8bd8800 	pop	{fp, pc}

00001ec4 <Data_Abort_Handler>:
    1ec4:	e92d4800 	push	{fp, lr}
    1ec8:	e28db004 	add	fp, sp, #4
    1ecc:	e30a0304 	movw	r0, #41732	; 0xa304
    1ed0:	ebffff59 	bl	1c3c <ErrorLockdown>
    1ed4:	e320f000 	nop	{0}
    1ed8:	e8bd8800 	pop	{fp, pc}

00001edc <IRQ_Handler>:
    1edc:	e92d4800 	push	{fp, lr}
    1ee0:	e28db004 	add	fp, sp, #4
    1ee4:	e30a0305 	movw	r0, #41733	; 0xa305
    1ee8:	ebffff53 	bl	1c3c <ErrorLockdown>
    1eec:	e320f000 	nop	{0}
    1ef0:	e8bd8800 	pop	{fp, pc}

00001ef4 <FIQ_Handler>:
    1ef4:	e92d4800 	push	{fp, lr}
    1ef8:	e28db004 	add	fp, sp, #4
    1efc:	e30a0306 	movw	r0, #41734	; 0xa306
    1f00:	ebffff4d 	bl	1c3c <ErrorLockdown>
    1f04:	e320f000 	nop	{0}
    1f08:	e8bd8800 	pop	{fp, pc}

00001f0c <Update_MultiBootRegister>:
    1f0c:	e92d4800 	push	{fp, lr}
    1f10:	e28db004 	add	fp, sp, #4
    1f14:	e24dd008 	sub	sp, sp, #8
    1f18:	e3a03000 	mov	r3, #0
    1f1c:	e50b3008 	str	r3, [fp, #-8]
    1f20:	e30d33f8 	movw	r3, #54264	; 0xd3f8
    1f24:	e3403001 	movt	r3, #1
    1f28:	e5933000 	ldr	r3, [r3]
    1f2c:	e3530000 	cmp	r3, #0
    1f30:	0a000012 	beq	1f80 <Update_MultiBootRegister+0x74>
    1f34:	e30d3428 	movw	r3, #54312	; 0xd428
    1f38:	e3403001 	movt	r3, #1
    1f3c:	e5933000 	ldr	r3, [r3]
    1f40:	e5933004 	ldr	r3, [r3, #4]
    1f44:	e283302c 	add	r3, r3, #44	; 0x2c
    1f48:	e1a00003 	mov	r0, r3
    1f4c:	ebfffdd5 	bl	16a8 <Xil_In32>
    1f50:	e50b0008 	str	r0, [fp, #-8]
    1f54:	e51b3008 	ldr	r3, [fp, #-8]
    1f58:	e2833001 	add	r3, r3, #1
    1f5c:	e50b3008 	str	r3, [fp, #-8]
    1f60:	e30d3428 	movw	r3, #54312	; 0xd428
    1f64:	e3403001 	movt	r3, #1
    1f68:	e5933000 	ldr	r3, [r3]
    1f6c:	e5933004 	ldr	r3, [r3, #4]
    1f70:	e283302c 	add	r3, r3, #44	; 0x2c
    1f74:	e51b1008 	ldr	r1, [fp, #-8]
    1f78:	e1a00003 	mov	r0, r3
    1f7c:	ebfffdd3 	bl	16d0 <Xil_Out32>
    1f80:	e320f000 	nop	{0}
    1f84:	e24bd004 	sub	sp, fp, #4
    1f88:	e8bd8800 	pop	{fp, pc}

00001f8c <GetResetReason>:
    1f8c:	e92d4800 	push	{fp, lr}
    1f90:	e28db004 	add	fp, sp, #4
    1f94:	e24dd008 	sub	sp, sp, #8
    1f98:	e3a00f96 	mov	r0, #600	; 0x258
    1f9c:	e34f0800 	movt	r0, #63488	; 0xf800
    1fa0:	ebfffdc0 	bl	16a8 <Xil_In32>
    1fa4:	e1a03000 	mov	r3, r0
    1fa8:	e1a03823 	lsr	r3, r3, #16
    1fac:	e6ef3073 	uxtb	r3, r3
    1fb0:	e50b3008 	str	r3, [fp, #-8]
    1fb4:	e51b3008 	ldr	r3, [fp, #-8]
    1fb8:	e1a00003 	mov	r0, r3
    1fbc:	e24bd004 	sub	sp, fp, #4
    1fc0:	e8bd8800 	pop	{fp, pc}

00001fc4 <GetSiliconVersion>:
    1fc4:	e92d4800 	push	{fp, lr}
    1fc8:	e28db004 	add	fp, sp, #4
    1fcc:	e30d3428 	movw	r3, #54312	; 0xd428
    1fd0:	e3403001 	movt	r3, #1
    1fd4:	e5933000 	ldr	r3, [r3]
    1fd8:	e5933004 	ldr	r3, [r3, #4]
    1fdc:	e2833080 	add	r3, r3, #128	; 0x80
    1fe0:	e1a00003 	mov	r0, r3
    1fe4:	ebfffdaf 	bl	16a8 <Xil_In32>
    1fe8:	e1a03000 	mov	r3, r0
    1fec:	e1a03e23 	lsr	r3, r3, #28
    1ff0:	e203200f 	and	r2, r3, #15
    1ff4:	e30d33f8 	movw	r3, #54264	; 0xd3f8
    1ff8:	e3403001 	movt	r3, #1
    1ffc:	e5832000 	str	r2, [r3]
    2000:	e320f000 	nop	{0}
    2004:	e8bd8800 	pop	{fp, pc}

00002008 <HeaderChecksum>:
    2008:	e92d4800 	push	{fp, lr}
    200c:	e28db004 	add	fp, sp, #4
    2010:	e24dd018 	sub	sp, sp, #24
    2014:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    2018:	e3a03000 	mov	r3, #0
    201c:	e50b3008 	str	r3, [fp, #-8]
    2020:	e3a03000 	mov	r3, #0
    2024:	e50b3010 	str	r3, [fp, #-16]
    2028:	e3a03000 	mov	r3, #0
    202c:	e50b300c 	str	r3, [fp, #-12]
    2030:	ea000011 	b	207c <HeaderChecksum+0x74>
    2034:	e30d3068 	movw	r3, #53352	; 0xd068
    2038:	e3403001 	movt	r3, #1
    203c:	e5933000 	ldr	r3, [r3]
    2040:	e51b200c 	ldr	r2, [fp, #-12]
    2044:	e1a01102 	lsl	r1, r2, #2
    2048:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    204c:	e0812002 	add	r2, r1, r2
    2050:	e2820020 	add	r0, r2, #32
    2054:	e24b1010 	sub	r1, fp, #16
    2058:	e3a02004 	mov	r2, #4
    205c:	e12fff33 	blx	r3
    2060:	e51b3010 	ldr	r3, [fp, #-16]
    2064:	e51b2008 	ldr	r2, [fp, #-8]
    2068:	e0823003 	add	r3, r2, r3
    206c:	e50b3008 	str	r3, [fp, #-8]
    2070:	e51b300c 	ldr	r3, [fp, #-12]
    2074:	e2833001 	add	r3, r3, #1
    2078:	e50b300c 	str	r3, [fp, #-12]
    207c:	e51b300c 	ldr	r3, [fp, #-12]
    2080:	e3530009 	cmp	r3, #9
    2084:	9affffea 	bls	2034 <HeaderChecksum+0x2c>
    2088:	e51b3008 	ldr	r3, [fp, #-8]
    208c:	e1e03003 	mvn	r3, r3
    2090:	e50b3008 	str	r3, [fp, #-8]
    2094:	e30d3068 	movw	r3, #53352	; 0xd068
    2098:	e3403001 	movt	r3, #1
    209c:	e5933000 	ldr	r3, [r3]
    20a0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    20a4:	e2820048 	add	r0, r2, #72	; 0x48
    20a8:	e24b1010 	sub	r1, fp, #16
    20ac:	e3a02004 	mov	r2, #4
    20b0:	e12fff33 	blx	r3
    20b4:	e51b3010 	ldr	r3, [fp, #-16]
    20b8:	e51b2008 	ldr	r2, [fp, #-8]
    20bc:	e1520003 	cmp	r2, r3
    20c0:	0a000001 	beq	20cc <HeaderChecksum+0xc4>
    20c4:	e3a03001 	mov	r3, #1
    20c8:	ea000000 	b	20d0 <HeaderChecksum+0xc8>
    20cc:	e3a03000 	mov	r3, #0
    20d0:	e1a00003 	mov	r0, r3
    20d4:	e24bd004 	sub	sp, fp, #4
    20d8:	e8bd8800 	pop	{fp, pc}

000020dc <ImageCheckID>:
    20dc:	e92d4800 	push	{fp, lr}
    20e0:	e28db004 	add	fp, sp, #4
    20e4:	e24dd010 	sub	sp, sp, #16
    20e8:	e50b0010 	str	r0, [fp, #-16]
    20ec:	e30d3068 	movw	r3, #53352	; 0xd068
    20f0:	e3403001 	movt	r3, #1
    20f4:	e5933000 	ldr	r3, [r3]
    20f8:	e51b2010 	ldr	r2, [fp, #-16]
    20fc:	e2820024 	add	r0, r2, #36	; 0x24
    2100:	e24b1008 	sub	r1, fp, #8
    2104:	e3a02004 	mov	r2, #4
    2108:	e12fff33 	blx	r3
    210c:	e51b2008 	ldr	r2, [fp, #-8]
    2110:	e3043e58 	movw	r3, #20056	; 0x4e58
    2114:	e345384c 	movt	r3, #22604	; 0x584c
    2118:	e1520003 	cmp	r2, r3
    211c:	0a000001 	beq	2128 <ImageCheckID+0x4c>
    2120:	e3a03001 	mov	r3, #1
    2124:	ea000000 	b	212c <ImageCheckID+0x50>
    2128:	e3a03000 	mov	r3, #0
    212c:	e1a00003 	mov	r0, r3
    2130:	e24bd004 	sub	sp, fp, #4
    2134:	e8bd8800 	pop	{fp, pc}

00002138 <NextValidImageCheck>:
    2138:	e92d4800 	push	{fp, lr}
    213c:	e28db004 	add	fp, sp, #4
    2140:	e24dd010 	sub	sp, sp, #16
    2144:	e3a03000 	mov	r3, #0
    2148:	e50b3010 	str	r3, [fp, #-16]
    214c:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    2150:	e3403001 	movt	r3, #1
    2154:	e5933000 	ldr	r3, [r3]
    2158:	e353033f 	cmp	r3, #-67108864	; 0xfc000000
    215c:	1a000003 	bne	2170 <NextValidImageCheck+0x38>
    2160:	e30d346c 	movw	r3, #54380	; 0xd46c
    2164:	e3403001 	movt	r3, #1
    2168:	e5933000 	ldr	r3, [r3]
    216c:	e50b3010 	str	r3, [fp, #-16]
    2170:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    2174:	e3403001 	movt	r3, #1
    2178:	e5933000 	ldr	r3, [r3]
    217c:	e35304e1 	cmp	r3, #-520093696	; 0xe1000000
    2180:	1a000001 	bne	218c <NextValidImageCheck+0x54>
    2184:	e3a03302 	mov	r3, #134217728	; 0x8000000
    2188:	e50b3010 	str	r3, [fp, #-16]
    218c:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    2190:	e3403001 	movt	r3, #1
    2194:	e5933000 	ldr	r3, [r3]
    2198:	e35304e2 	cmp	r3, #-503316480	; 0xe2000000
    219c:	1a000001 	bne	21a8 <NextValidImageCheck+0x70>
    21a0:	e3a03402 	mov	r3, #33554432	; 0x2000000
    21a4:	e50b3010 	str	r3, [fp, #-16]
    21a8:	e30d3428 	movw	r3, #54312	; 0xd428
    21ac:	e3403001 	movt	r3, #1
    21b0:	e5933000 	ldr	r3, [r3]
    21b4:	e5933004 	ldr	r3, [r3, #4]
    21b8:	e283302c 	add	r3, r3, #44	; 0x2c
    21bc:	e1a00003 	mov	r0, r3
    21c0:	ebfffd38 	bl	16a8 <Xil_In32>
    21c4:	e50b000c 	str	r0, [fp, #-12]
    21c8:	e51b300c 	ldr	r3, [fp, #-12]
    21cc:	e7ec3053 	ubfx	r3, r3, #0, #13
    21d0:	e1a03783 	lsl	r3, r3, #15
    21d4:	e50b3008 	str	r3, [fp, #-8]
    21d8:	ea00001a 	b	2248 <NextValidImageCheck+0x110>
    21dc:	e51b0008 	ldr	r0, [fp, #-8]
    21e0:	ebffffbd 	bl	20dc <ImageCheckID>
    21e4:	e1a03000 	mov	r3, r0
    21e8:	e3530000 	cmp	r3, #0
    21ec:	1a00000e 	bne	222c <NextValidImageCheck+0xf4>
    21f0:	e51b0008 	ldr	r0, [fp, #-8]
    21f4:	ebffff83 	bl	2008 <HeaderChecksum>
    21f8:	e1a03000 	mov	r3, r0
    21fc:	e3530000 	cmp	r3, #0
    2200:	1a000009 	bne	222c <NextValidImageCheck+0xf4>
    2204:	e30d3428 	movw	r3, #54312	; 0xd428
    2208:	e3403001 	movt	r3, #1
    220c:	e5933000 	ldr	r3, [r3]
    2210:	e5933004 	ldr	r3, [r3, #4]
    2214:	e283302c 	add	r3, r3, #44	; 0x2c
    2218:	e51b100c 	ldr	r1, [fp, #-12]
    221c:	e1a00003 	mov	r0, r3
    2220:	ebfffd2a 	bl	16d0 <Xil_Out32>
    2224:	e3a03000 	mov	r3, #0
    2228:	ea00000b 	b	225c <NextValidImageCheck+0x124>
    222c:	e51b300c 	ldr	r3, [fp, #-12]
    2230:	e2833001 	add	r3, r3, #1
    2234:	e50b300c 	str	r3, [fp, #-12]
    2238:	e51b300c 	ldr	r3, [fp, #-12]
    223c:	e7ec3053 	ubfx	r3, r3, #0, #13
    2240:	e1a03783 	lsl	r3, r3, #15
    2244:	e50b3008 	str	r3, [fp, #-8]
    2248:	e51b2008 	ldr	r2, [fp, #-8]
    224c:	e51b3010 	ldr	r3, [fp, #-16]
    2250:	e1520003 	cmp	r2, r3
    2254:	3affffe0 	bcc	21dc <NextValidImageCheck+0xa4>
    2258:	e3a03001 	mov	r3, #1
    225c:	e1a00003 	mov	r0, r3
    2260:	e24bd004 	sub	sp, fp, #4
    2264:	e8bd8800 	pop	{fp, pc}

00002268 <DDRInitCheck>:
    2268:	e92d4800 	push	{fp, lr}
    226c:	e28db004 	add	fp, sp, #4
    2270:	e24dd008 	sub	sp, sp, #8
    2274:	e30a1a55 	movw	r1, #43605	; 0xaa55
    2278:	e34a1a55 	movt	r1, #43605	; 0xaa55
    227c:	e3a00601 	mov	r0, #1048576	; 0x100000
    2280:	ebfffd12 	bl	16d0 <Xil_Out32>
    2284:	e3a00601 	mov	r0, #1048576	; 0x100000
    2288:	ebfffd06 	bl	16a8 <Xil_In32>
    228c:	e50b0008 	str	r0, [fp, #-8]
    2290:	e51b2008 	ldr	r2, [fp, #-8]
    2294:	e30a3a55 	movw	r3, #43605	; 0xaa55
    2298:	e34a3a55 	movt	r3, #43605	; 0xaa55
    229c:	e1520003 	cmp	r2, r3
    22a0:	0a000001 	beq	22ac <DDRInitCheck+0x44>
    22a4:	e3a03001 	mov	r3, #1
    22a8:	ea00000e 	b	22e8 <DDRInitCheck+0x80>
    22ac:	e30a1a55 	movw	r1, #43605	; 0xaa55
    22b0:	e34a1a55 	movt	r1, #43605	; 0xaa55
    22b4:	e3a00602 	mov	r0, #2097152	; 0x200000
    22b8:	ebfffd04 	bl	16d0 <Xil_Out32>
    22bc:	e3a00602 	mov	r0, #2097152	; 0x200000
    22c0:	ebfffcf8 	bl	16a8 <Xil_In32>
    22c4:	e50b0008 	str	r0, [fp, #-8]
    22c8:	e51b2008 	ldr	r2, [fp, #-8]
    22cc:	e30a3a55 	movw	r3, #43605	; 0xaa55
    22d0:	e34a3a55 	movt	r3, #43605	; 0xaa55
    22d4:	e1520003 	cmp	r2, r3
    22d8:	0a000001 	beq	22e4 <DDRInitCheck+0x7c>
    22dc:	e3a03001 	mov	r3, #1
    22e0:	ea000000 	b	22e8 <DDRInitCheck+0x80>
    22e4:	e3a03000 	mov	r3, #0
    22e8:	e1a00003 	mov	r0, r3
    22ec:	e24bd004 	sub	sp, fp, #4
    22f0:	e8bd8800 	pop	{fp, pc}

000022f4 <MD5Memset>:
    22f4:	e92d0810 	push	{r4, fp}
    22f8:	e28db004 	add	fp, sp, #4
    22fc:	e24dd010 	sub	sp, sp, #16
    2300:	e50b0008 	str	r0, [fp, #-8]
    2304:	e50b100c 	str	r1, [fp, #-12]
    2308:	e50b2010 	str	r2, [fp, #-16]
    230c:	e51b4008 	ldr	r4, [fp, #-8]
    2310:	ea000004 	b	2328 <MD5Memset+0x34>
    2314:	e1a03004 	mov	r3, r4
    2318:	e2834001 	add	r4, r3, #1
    231c:	e51b200c 	ldr	r2, [fp, #-12]
    2320:	e6ef2072 	uxtb	r2, r2
    2324:	e5c32000 	strb	r2, [r3]
    2328:	e51b3010 	ldr	r3, [fp, #-16]
    232c:	e2432001 	sub	r2, r3, #1
    2330:	e50b2010 	str	r2, [fp, #-16]
    2334:	e3530000 	cmp	r3, #0
    2338:	1afffff5 	bne	2314 <MD5Memset+0x20>
    233c:	e51b3008 	ldr	r3, [fp, #-8]
    2340:	e1a00003 	mov	r0, r3
    2344:	e24bd004 	sub	sp, fp, #4
    2348:	e8bd0810 	pop	{r4, fp}
    234c:	e12fff1e 	bx	lr

00002350 <MD5Memcpy>:
    2350:	e92d0830 	push	{r4, r5, fp}
    2354:	e28db008 	add	fp, sp, #8
    2358:	e24dd014 	sub	sp, sp, #20
    235c:	e50b0010 	str	r0, [fp, #-16]
    2360:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    2364:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    2368:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
    236c:	e51b4010 	ldr	r4, [fp, #-16]
    2370:	e51b5014 	ldr	r5, [fp, #-20]	; 0xffffffec
    2374:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    2378:	e3530000 	cmp	r3, #0
    237c:	1a00000c 	bne	23b4 <MD5Memcpy+0x64>
    2380:	ea000005 	b	239c <MD5Memcpy+0x4c>
    2384:	e1a02005 	mov	r2, r5
    2388:	e2825001 	add	r5, r2, #1
    238c:	e1a03004 	mov	r3, r4
    2390:	e2834001 	add	r4, r3, #1
    2394:	e5d22000 	ldrb	r2, [r2]
    2398:	e5c32000 	strb	r2, [r3]
    239c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    23a0:	e2432001 	sub	r2, r3, #1
    23a4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    23a8:	e3530000 	cmp	r3, #0
    23ac:	1afffff4 	bne	2384 <MD5Memcpy+0x34>
    23b0:	ea000015 	b	240c <MD5Memcpy+0xbc>
    23b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    23b8:	e1a03123 	lsr	r3, r3, #2
    23bc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    23c0:	ea00000c 	b	23f8 <MD5Memcpy+0xa8>
    23c4:	e5d53003 	ldrb	r3, [r5, #3]
    23c8:	e5c43000 	strb	r3, [r4]
    23cc:	e2843001 	add	r3, r4, #1
    23d0:	e5d52002 	ldrb	r2, [r5, #2]
    23d4:	e5c32000 	strb	r2, [r3]
    23d8:	e2843002 	add	r3, r4, #2
    23dc:	e5d52001 	ldrb	r2, [r5, #1]
    23e0:	e5c32000 	strb	r2, [r3]
    23e4:	e2843003 	add	r3, r4, #3
    23e8:	e5d52000 	ldrb	r2, [r5]
    23ec:	e5c32000 	strb	r2, [r3]
    23f0:	e2844004 	add	r4, r4, #4
    23f4:	e2855004 	add	r5, r5, #4
    23f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    23fc:	e2432001 	sub	r2, r3, #1
    2400:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    2404:	e3530000 	cmp	r3, #0
    2408:	1affffed 	bne	23c4 <MD5Memcpy+0x74>
    240c:	e51b3010 	ldr	r3, [fp, #-16]
    2410:	e1a00003 	mov	r0, r3
    2414:	e24bd008 	sub	sp, fp, #8
    2418:	e8bd0830 	pop	{r4, r5, fp}
    241c:	e12fff1e 	bx	lr

00002420 <MD5Transform>:
    2420:	e92d08f0 	push	{r4, r5, r6, r7, fp}
    2424:	e28db010 	add	fp, sp, #16
    2428:	e24dd00c 	sub	sp, sp, #12
    242c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    2430:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    2434:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    2438:	e5936000 	ldr	r6, [r3]
    243c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    2440:	e5935004 	ldr	r5, [r3, #4]
    2444:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    2448:	e5937008 	ldr	r7, [r3, #8]
    244c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    2450:	e593400c 	ldr	r4, [r3, #12]
    2454:	e0273004 	eor	r3, r7, r4
    2458:	e0033005 	and	r3, r3, r5
    245c:	e0242003 	eor	r2, r4, r3
    2460:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2464:	e5933000 	ldr	r3, [r3]
    2468:	e0823003 	add	r3, r2, r3
    246c:	e0863003 	add	r3, r6, r3
    2470:	e30a6478 	movw	r6, #42104	; 0xa478
    2474:	e34d676a 	movt	r6, #55146	; 0xd76a
    2478:	e0836006 	add	r6, r3, r6
    247c:	e1a06ce6 	ror	r6, r6, #25
    2480:	e0866005 	add	r6, r6, r5
    2484:	e0253007 	eor	r3, r5, r7
    2488:	e0033006 	and	r3, r3, r6
    248c:	e0272003 	eor	r2, r7, r3
    2490:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2494:	e2833004 	add	r3, r3, #4
    2498:	e5933000 	ldr	r3, [r3]
    249c:	e0823003 	add	r3, r2, r3
    24a0:	e0843003 	add	r3, r4, r3
    24a4:	e30b4756 	movw	r4, #46934	; 0xb756
    24a8:	e34e48c7 	movt	r4, #59591	; 0xe8c7
    24ac:	e0834004 	add	r4, r3, r4
    24b0:	e1a04a64 	ror	r4, r4, #20
    24b4:	e0844006 	add	r4, r4, r6
    24b8:	e0263005 	eor	r3, r6, r5
    24bc:	e0033004 	and	r3, r3, r4
    24c0:	e0252003 	eor	r2, r5, r3
    24c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    24c8:	e2833008 	add	r3, r3, #8
    24cc:	e5933000 	ldr	r3, [r3]
    24d0:	e0823003 	add	r3, r2, r3
    24d4:	e0873003 	add	r3, r7, r3
    24d8:	e30770db 	movw	r7, #28891	; 0x70db
    24dc:	e3427420 	movt	r7, #9248	; 0x2420
    24e0:	e0837007 	add	r7, r3, r7
    24e4:	e1a077e7 	ror	r7, r7, #15
    24e8:	e0877004 	add	r7, r7, r4
    24ec:	e0243006 	eor	r3, r4, r6
    24f0:	e0033007 	and	r3, r3, r7
    24f4:	e0262003 	eor	r2, r6, r3
    24f8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    24fc:	e283300c 	add	r3, r3, #12
    2500:	e5933000 	ldr	r3, [r3]
    2504:	e0823003 	add	r3, r2, r3
    2508:	e0853003 	add	r3, r5, r3
    250c:	e30c5eee 	movw	r5, #52974	; 0xceee
    2510:	e34c51bd 	movt	r5, #49597	; 0xc1bd
    2514:	e0835005 	add	r5, r3, r5
    2518:	e1a05565 	ror	r5, r5, #10
    251c:	e0855007 	add	r5, r5, r7
    2520:	e0273004 	eor	r3, r7, r4
    2524:	e0033005 	and	r3, r3, r5
    2528:	e0242003 	eor	r2, r4, r3
    252c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2530:	e2833010 	add	r3, r3, #16
    2534:	e5933000 	ldr	r3, [r3]
    2538:	e0823003 	add	r3, r2, r3
    253c:	e0863003 	add	r3, r6, r3
    2540:	e3006faf 	movw	r6, #4015	; 0xfaf
    2544:	e34f657c 	movt	r6, #62844	; 0xf57c
    2548:	e0836006 	add	r6, r3, r6
    254c:	e1a06ce6 	ror	r6, r6, #25
    2550:	e0866005 	add	r6, r6, r5
    2554:	e0253007 	eor	r3, r5, r7
    2558:	e0033006 	and	r3, r3, r6
    255c:	e0272003 	eor	r2, r7, r3
    2560:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2564:	e2833014 	add	r3, r3, #20
    2568:	e5933000 	ldr	r3, [r3]
    256c:	e0823003 	add	r3, r2, r3
    2570:	e0843003 	add	r3, r4, r3
    2574:	e30c462a 	movw	r4, #50730	; 0xc62a
    2578:	e3444787 	movt	r4, #18311	; 0x4787
    257c:	e0834004 	add	r4, r3, r4
    2580:	e1a04a64 	ror	r4, r4, #20
    2584:	e0844006 	add	r4, r4, r6
    2588:	e0263005 	eor	r3, r6, r5
    258c:	e0033004 	and	r3, r3, r4
    2590:	e0252003 	eor	r2, r5, r3
    2594:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2598:	e2833018 	add	r3, r3, #24
    259c:	e5933000 	ldr	r3, [r3]
    25a0:	e0823003 	add	r3, r2, r3
    25a4:	e0873003 	add	r3, r7, r3
    25a8:	e3047613 	movw	r7, #17939	; 0x4613
    25ac:	e34a7830 	movt	r7, #43056	; 0xa830
    25b0:	e0837007 	add	r7, r3, r7
    25b4:	e1a077e7 	ror	r7, r7, #15
    25b8:	e0877004 	add	r7, r7, r4
    25bc:	e0243006 	eor	r3, r4, r6
    25c0:	e0033007 	and	r3, r3, r7
    25c4:	e0262003 	eor	r2, r6, r3
    25c8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    25cc:	e283301c 	add	r3, r3, #28
    25d0:	e5933000 	ldr	r3, [r3]
    25d4:	e0823003 	add	r3, r2, r3
    25d8:	e0853003 	add	r3, r5, r3
    25dc:	e3095501 	movw	r5, #38145	; 0x9501
    25e0:	e34f5d46 	movt	r5, #64838	; 0xfd46
    25e4:	e0835005 	add	r5, r3, r5
    25e8:	e1a05565 	ror	r5, r5, #10
    25ec:	e0855007 	add	r5, r5, r7
    25f0:	e0273004 	eor	r3, r7, r4
    25f4:	e0033005 	and	r3, r3, r5
    25f8:	e0242003 	eor	r2, r4, r3
    25fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2600:	e2833020 	add	r3, r3, #32
    2604:	e5933000 	ldr	r3, [r3]
    2608:	e0823003 	add	r3, r2, r3
    260c:	e0863003 	add	r3, r6, r3
    2610:	e30968d8 	movw	r6, #39128	; 0x98d8
    2614:	e3466980 	movt	r6, #27008	; 0x6980
    2618:	e0836006 	add	r6, r3, r6
    261c:	e1a06ce6 	ror	r6, r6, #25
    2620:	e0866005 	add	r6, r6, r5
    2624:	e0253007 	eor	r3, r5, r7
    2628:	e0033006 	and	r3, r3, r6
    262c:	e0272003 	eor	r2, r7, r3
    2630:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2634:	e2833024 	add	r3, r3, #36	; 0x24
    2638:	e5933000 	ldr	r3, [r3]
    263c:	e0823003 	add	r3, r2, r3
    2640:	e0843003 	add	r3, r4, r3
    2644:	e30f47af 	movw	r4, #63407	; 0xf7af
    2648:	e3484b44 	movt	r4, #35652	; 0x8b44
    264c:	e0834004 	add	r4, r3, r4
    2650:	e1a04a64 	ror	r4, r4, #20
    2654:	e0844006 	add	r4, r4, r6
    2658:	e0263005 	eor	r3, r6, r5
    265c:	e0033004 	and	r3, r3, r4
    2660:	e0252003 	eor	r2, r5, r3
    2664:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2668:	e2833028 	add	r3, r3, #40	; 0x28
    266c:	e5933000 	ldr	r3, [r3]
    2670:	e0823003 	add	r3, r2, r3
    2674:	e0873003 	add	r3, r7, r3
    2678:	e2437b29 	sub	r7, r3, #41984	; 0xa400
    267c:	e247704f 	sub	r7, r7, #79	; 0x4f
    2680:	e1a077e7 	ror	r7, r7, #15
    2684:	e0877004 	add	r7, r7, r4
    2688:	e0243006 	eor	r3, r4, r6
    268c:	e0033007 	and	r3, r3, r7
    2690:	e0262003 	eor	r2, r6, r3
    2694:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2698:	e283302c 	add	r3, r3, #44	; 0x2c
    269c:	e5933000 	ldr	r3, [r3]
    26a0:	e0823003 	add	r3, r2, r3
    26a4:	e0853003 	add	r3, r5, r3
    26a8:	e30d57be 	movw	r5, #55230	; 0xd7be
    26ac:	e348595c 	movt	r5, #35164	; 0x895c
    26b0:	e0835005 	add	r5, r3, r5
    26b4:	e1a05565 	ror	r5, r5, #10
    26b8:	e0855007 	add	r5, r5, r7
    26bc:	e0273004 	eor	r3, r7, r4
    26c0:	e0033005 	and	r3, r3, r5
    26c4:	e0242003 	eor	r2, r4, r3
    26c8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    26cc:	e2833030 	add	r3, r3, #48	; 0x30
    26d0:	e5933000 	ldr	r3, [r3]
    26d4:	e0823003 	add	r3, r2, r3
    26d8:	e0863003 	add	r3, r6, r3
    26dc:	e3016122 	movw	r6, #4386	; 0x1122
    26e0:	e3466b90 	movt	r6, #27536	; 0x6b90
    26e4:	e0836006 	add	r6, r3, r6
    26e8:	e1a06ce6 	ror	r6, r6, #25
    26ec:	e0866005 	add	r6, r6, r5
    26f0:	e0253007 	eor	r3, r5, r7
    26f4:	e0033006 	and	r3, r3, r6
    26f8:	e0272003 	eor	r2, r7, r3
    26fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2700:	e2833034 	add	r3, r3, #52	; 0x34
    2704:	e5933000 	ldr	r3, [r3]
    2708:	e0823003 	add	r3, r2, r3
    270c:	e0843003 	add	r3, r4, r3
    2710:	e3074193 	movw	r4, #29075	; 0x7193
    2714:	e34f4d98 	movt	r4, #64920	; 0xfd98
    2718:	e0834004 	add	r4, r3, r4
    271c:	e1a04a64 	ror	r4, r4, #20
    2720:	e0844006 	add	r4, r4, r6
    2724:	e0263005 	eor	r3, r6, r5
    2728:	e0033004 	and	r3, r3, r4
    272c:	e0252003 	eor	r2, r5, r3
    2730:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2734:	e2833038 	add	r3, r3, #56	; 0x38
    2738:	e5933000 	ldr	r3, [r3]
    273c:	e0823003 	add	r3, r2, r3
    2740:	e0873003 	add	r3, r7, r3
    2744:	e304738e 	movw	r7, #17294	; 0x438e
    2748:	e34a7679 	movt	r7, #42617	; 0xa679
    274c:	e0837007 	add	r7, r3, r7
    2750:	e1a077e7 	ror	r7, r7, #15
    2754:	e0877004 	add	r7, r7, r4
    2758:	e0243006 	eor	r3, r4, r6
    275c:	e0033007 	and	r3, r3, r7
    2760:	e0262003 	eor	r2, r6, r3
    2764:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2768:	e283303c 	add	r3, r3, #60	; 0x3c
    276c:	e5933000 	ldr	r3, [r3]
    2770:	e0823003 	add	r3, r2, r3
    2774:	e0853003 	add	r3, r5, r3
    2778:	e3005821 	movw	r5, #2081	; 0x821
    277c:	e34459b4 	movt	r5, #18868	; 0x49b4
    2780:	e0835005 	add	r5, r3, r5
    2784:	e1a05565 	ror	r5, r5, #10
    2788:	e0855007 	add	r5, r5, r7
    278c:	e0253007 	eor	r3, r5, r7
    2790:	e0033004 	and	r3, r3, r4
    2794:	e0272003 	eor	r2, r7, r3
    2798:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    279c:	e2833004 	add	r3, r3, #4
    27a0:	e5933000 	ldr	r3, [r3]
    27a4:	e0823003 	add	r3, r2, r3
    27a8:	e0863003 	add	r3, r6, r3
    27ac:	e3026562 	movw	r6, #9570	; 0x2562
    27b0:	e34f661e 	movt	r6, #63006	; 0xf61e
    27b4:	e0836006 	add	r6, r3, r6
    27b8:	e1a06de6 	ror	r6, r6, #27
    27bc:	e0866005 	add	r6, r6, r5
    27c0:	e0263005 	eor	r3, r6, r5
    27c4:	e0033007 	and	r3, r3, r7
    27c8:	e0252003 	eor	r2, r5, r3
    27cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    27d0:	e2833018 	add	r3, r3, #24
    27d4:	e5933000 	ldr	r3, [r3]
    27d8:	e0823003 	add	r3, r2, r3
    27dc:	e0843003 	add	r3, r4, r3
    27e0:	e30b4340 	movw	r4, #45888	; 0xb340
    27e4:	e34c4040 	movt	r4, #49216	; 0xc040
    27e8:	e0834004 	add	r4, r3, r4
    27ec:	e1a04be4 	ror	r4, r4, #23
    27f0:	e0844006 	add	r4, r4, r6
    27f4:	e0243006 	eor	r3, r4, r6
    27f8:	e0033005 	and	r3, r3, r5
    27fc:	e0262003 	eor	r2, r6, r3
    2800:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2804:	e283302c 	add	r3, r3, #44	; 0x2c
    2808:	e5933000 	ldr	r3, [r3]
    280c:	e0823003 	add	r3, r2, r3
    2810:	e0873003 	add	r3, r7, r3
    2814:	e3057a51 	movw	r7, #23121	; 0x5a51
    2818:	e342765e 	movt	r7, #9822	; 0x265e
    281c:	e0837007 	add	r7, r3, r7
    2820:	e1a07967 	ror	r7, r7, #18
    2824:	e0877004 	add	r7, r7, r4
    2828:	e0273004 	eor	r3, r7, r4
    282c:	e0033006 	and	r3, r3, r6
    2830:	e0242003 	eor	r2, r4, r3
    2834:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2838:	e5933000 	ldr	r3, [r3]
    283c:	e0823003 	add	r3, r2, r3
    2840:	e0853003 	add	r3, r5, r3
    2844:	e30c57aa 	movw	r5, #51114	; 0xc7aa
    2848:	e34e59b6 	movt	r5, #59830	; 0xe9b6
    284c:	e0835005 	add	r5, r3, r5
    2850:	e1a05665 	ror	r5, r5, #12
    2854:	e0855007 	add	r5, r5, r7
    2858:	e0253007 	eor	r3, r5, r7
    285c:	e0033004 	and	r3, r3, r4
    2860:	e0272003 	eor	r2, r7, r3
    2864:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2868:	e2833014 	add	r3, r3, #20
    286c:	e5933000 	ldr	r3, [r3]
    2870:	e0823003 	add	r3, r2, r3
    2874:	e0863003 	add	r3, r6, r3
    2878:	e301605d 	movw	r6, #4189	; 0x105d
    287c:	e34d662f 	movt	r6, #54831	; 0xd62f
    2880:	e0836006 	add	r6, r3, r6
    2884:	e1a06de6 	ror	r6, r6, #27
    2888:	e0866005 	add	r6, r6, r5
    288c:	e0263005 	eor	r3, r6, r5
    2890:	e0033007 	and	r3, r3, r7
    2894:	e0252003 	eor	r2, r5, r3
    2898:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    289c:	e2833028 	add	r3, r3, #40	; 0x28
    28a0:	e5933000 	ldr	r3, [r3]
    28a4:	e0823003 	add	r3, r2, r3
    28a8:	e0843003 	add	r3, r4, r3
    28ac:	e3014453 	movw	r4, #5203	; 0x1453
    28b0:	e3404244 	movt	r4, #580	; 0x244
    28b4:	e0834004 	add	r4, r3, r4
    28b8:	e1a04be4 	ror	r4, r4, #23
    28bc:	e0844006 	add	r4, r4, r6
    28c0:	e0243006 	eor	r3, r4, r6
    28c4:	e0033005 	and	r3, r3, r5
    28c8:	e0262003 	eor	r2, r6, r3
    28cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    28d0:	e283303c 	add	r3, r3, #60	; 0x3c
    28d4:	e5933000 	ldr	r3, [r3]
    28d8:	e0823003 	add	r3, r2, r3
    28dc:	e0873003 	add	r3, r7, r3
    28e0:	e30e7681 	movw	r7, #59009	; 0xe681
    28e4:	e34d78a1 	movt	r7, #55457	; 0xd8a1
    28e8:	e0837007 	add	r7, r3, r7
    28ec:	e1a07967 	ror	r7, r7, #18
    28f0:	e0877004 	add	r7, r7, r4
    28f4:	e0273004 	eor	r3, r7, r4
    28f8:	e0033006 	and	r3, r3, r6
    28fc:	e0242003 	eor	r2, r4, r3
    2900:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2904:	e2833010 	add	r3, r3, #16
    2908:	e5933000 	ldr	r3, [r3]
    290c:	e0823003 	add	r3, r2, r3
    2910:	e0853003 	add	r3, r5, r3
    2914:	e30f5bc8 	movw	r5, #64456	; 0xfbc8
    2918:	e34e57d3 	movt	r5, #59347	; 0xe7d3
    291c:	e0835005 	add	r5, r3, r5
    2920:	e1a05665 	ror	r5, r5, #12
    2924:	e0855007 	add	r5, r5, r7
    2928:	e0253007 	eor	r3, r5, r7
    292c:	e0033004 	and	r3, r3, r4
    2930:	e0272003 	eor	r2, r7, r3
    2934:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2938:	e2833024 	add	r3, r3, #36	; 0x24
    293c:	e5933000 	ldr	r3, [r3]
    2940:	e0823003 	add	r3, r2, r3
    2944:	e0863003 	add	r3, r6, r3
    2948:	e30c6de6 	movw	r6, #52710	; 0xcde6
    294c:	e34261e1 	movt	r6, #8673	; 0x21e1
    2950:	e0836006 	add	r6, r3, r6
    2954:	e1a06de6 	ror	r6, r6, #27
    2958:	e0866005 	add	r6, r6, r5
    295c:	e0263005 	eor	r3, r6, r5
    2960:	e0033007 	and	r3, r3, r7
    2964:	e0252003 	eor	r2, r5, r3
    2968:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    296c:	e2833038 	add	r3, r3, #56	; 0x38
    2970:	e5933000 	ldr	r3, [r3]
    2974:	e0823003 	add	r3, r2, r3
    2978:	e0843003 	add	r3, r4, r3
    297c:	e30047d6 	movw	r4, #2006	; 0x7d6
    2980:	e34c4337 	movt	r4, #49975	; 0xc337
    2984:	e0834004 	add	r4, r3, r4
    2988:	e1a04be4 	ror	r4, r4, #23
    298c:	e0844006 	add	r4, r4, r6
    2990:	e0243006 	eor	r3, r4, r6
    2994:	e0033005 	and	r3, r3, r5
    2998:	e0262003 	eor	r2, r6, r3
    299c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    29a0:	e283300c 	add	r3, r3, #12
    29a4:	e5933000 	ldr	r3, [r3]
    29a8:	e0823003 	add	r3, r2, r3
    29ac:	e0873003 	add	r3, r7, r3
    29b0:	e3007d87 	movw	r7, #3463	; 0xd87
    29b4:	e34f74d5 	movt	r7, #62677	; 0xf4d5
    29b8:	e0837007 	add	r7, r3, r7
    29bc:	e1a07967 	ror	r7, r7, #18
    29c0:	e0877004 	add	r7, r7, r4
    29c4:	e0273004 	eor	r3, r7, r4
    29c8:	e0033006 	and	r3, r3, r6
    29cc:	e0242003 	eor	r2, r4, r3
    29d0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    29d4:	e2833020 	add	r3, r3, #32
    29d8:	e5933000 	ldr	r3, [r3]
    29dc:	e0823003 	add	r3, r2, r3
    29e0:	e0853003 	add	r3, r5, r3
    29e4:	e30154ed 	movw	r5, #5357	; 0x14ed
    29e8:	e344555a 	movt	r5, #17754	; 0x455a
    29ec:	e0835005 	add	r5, r3, r5
    29f0:	e1a05665 	ror	r5, r5, #12
    29f4:	e0855007 	add	r5, r5, r7
    29f8:	e0253007 	eor	r3, r5, r7
    29fc:	e0033004 	and	r3, r3, r4
    2a00:	e0272003 	eor	r2, r7, r3
    2a04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2a08:	e2833034 	add	r3, r3, #52	; 0x34
    2a0c:	e5933000 	ldr	r3, [r3]
    2a10:	e0823003 	add	r3, r2, r3
    2a14:	e0863003 	add	r3, r6, r3
    2a18:	e30e6905 	movw	r6, #59653	; 0xe905
    2a1c:	e34a69e3 	movt	r6, #43491	; 0xa9e3
    2a20:	e0836006 	add	r6, r3, r6
    2a24:	e1a06de6 	ror	r6, r6, #27
    2a28:	e0866005 	add	r6, r6, r5
    2a2c:	e0263005 	eor	r3, r6, r5
    2a30:	e0033007 	and	r3, r3, r7
    2a34:	e0252003 	eor	r2, r5, r3
    2a38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2a3c:	e2833008 	add	r3, r3, #8
    2a40:	e5933000 	ldr	r3, [r3]
    2a44:	e0823003 	add	r3, r2, r3
    2a48:	e0843003 	add	r3, r4, r3
    2a4c:	e30a43f8 	movw	r4, #41976	; 0xa3f8
    2a50:	e34f4cef 	movt	r4, #64751	; 0xfcef
    2a54:	e0834004 	add	r4, r3, r4
    2a58:	e1a04be4 	ror	r4, r4, #23
    2a5c:	e0844006 	add	r4, r4, r6
    2a60:	e0243006 	eor	r3, r4, r6
    2a64:	e0033005 	and	r3, r3, r5
    2a68:	e0262003 	eor	r2, r6, r3
    2a6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2a70:	e283301c 	add	r3, r3, #28
    2a74:	e5933000 	ldr	r3, [r3]
    2a78:	e0823003 	add	r3, r2, r3
    2a7c:	e0873003 	add	r3, r7, r3
    2a80:	e30072d9 	movw	r7, #729	; 0x2d9
    2a84:	e346776f 	movt	r7, #26479	; 0x676f
    2a88:	e0837007 	add	r7, r3, r7
    2a8c:	e1a07967 	ror	r7, r7, #18
    2a90:	e0877004 	add	r7, r7, r4
    2a94:	e0273004 	eor	r3, r7, r4
    2a98:	e0033006 	and	r3, r3, r6
    2a9c:	e0242003 	eor	r2, r4, r3
    2aa0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2aa4:	e2833030 	add	r3, r3, #48	; 0x30
    2aa8:	e5933000 	ldr	r3, [r3]
    2aac:	e0823003 	add	r3, r2, r3
    2ab0:	e0853003 	add	r3, r5, r3
    2ab4:	e3045c8a 	movw	r5, #19594	; 0x4c8a
    2ab8:	e3485d2a 	movt	r5, #36138	; 0x8d2a
    2abc:	e0835005 	add	r5, r3, r5
    2ac0:	e1a05665 	ror	r5, r5, #12
    2ac4:	e0855007 	add	r5, r5, r7
    2ac8:	e0253007 	eor	r3, r5, r7
    2acc:	e0242003 	eor	r2, r4, r3
    2ad0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2ad4:	e2833014 	add	r3, r3, #20
    2ad8:	e5933000 	ldr	r3, [r3]
    2adc:	e0823003 	add	r3, r2, r3
    2ae0:	e0863003 	add	r3, r6, r3
    2ae4:	e3036942 	movw	r6, #14658	; 0x3942
    2ae8:	e34f6ffa 	movt	r6, #65530	; 0xfffa
    2aec:	e0836006 	add	r6, r3, r6
    2af0:	e1a06e66 	ror	r6, r6, #28
    2af4:	e0866005 	add	r6, r6, r5
    2af8:	e0263005 	eor	r3, r6, r5
    2afc:	e0272003 	eor	r2, r7, r3
    2b00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2b04:	e2833020 	add	r3, r3, #32
    2b08:	e5933000 	ldr	r3, [r3]
    2b0c:	e0823003 	add	r3, r2, r3
    2b10:	e0843003 	add	r3, r4, r3
    2b14:	e30f4681 	movw	r4, #63105	; 0xf681
    2b18:	e3484771 	movt	r4, #34673	; 0x8771
    2b1c:	e0834004 	add	r4, r3, r4
    2b20:	e1a04ae4 	ror	r4, r4, #21
    2b24:	e0844006 	add	r4, r4, r6
    2b28:	e0243006 	eor	r3, r4, r6
    2b2c:	e0252003 	eor	r2, r5, r3
    2b30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2b34:	e283302c 	add	r3, r3, #44	; 0x2c
    2b38:	e5933000 	ldr	r3, [r3]
    2b3c:	e0823003 	add	r3, r2, r3
    2b40:	e0873003 	add	r3, r7, r3
    2b44:	e3067122 	movw	r7, #24866	; 0x6122
    2b48:	e3467d9d 	movt	r7, #28061	; 0x6d9d
    2b4c:	e0837007 	add	r7, r3, r7
    2b50:	e1a07867 	ror	r7, r7, #16
    2b54:	e0877004 	add	r7, r7, r4
    2b58:	e0273004 	eor	r3, r7, r4
    2b5c:	e0262003 	eor	r2, r6, r3
    2b60:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2b64:	e2833038 	add	r3, r3, #56	; 0x38
    2b68:	e5933000 	ldr	r3, [r3]
    2b6c:	e0823003 	add	r3, r2, r3
    2b70:	e0853003 	add	r3, r5, r3
    2b74:	e303580c 	movw	r5, #14348	; 0x380c
    2b78:	e34f5de5 	movt	r5, #64997	; 0xfde5
    2b7c:	e0835005 	add	r5, r3, r5
    2b80:	e1a054e5 	ror	r5, r5, #9
    2b84:	e0855007 	add	r5, r5, r7
    2b88:	e0253007 	eor	r3, r5, r7
    2b8c:	e0242003 	eor	r2, r4, r3
    2b90:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2b94:	e2833004 	add	r3, r3, #4
    2b98:	e5933000 	ldr	r3, [r3]
    2b9c:	e0823003 	add	r3, r2, r3
    2ba0:	e0863003 	add	r3, r6, r3
    2ba4:	e30e6a44 	movw	r6, #59972	; 0xea44
    2ba8:	e34a64be 	movt	r6, #42174	; 0xa4be
    2bac:	e0836006 	add	r6, r3, r6
    2bb0:	e1a06e66 	ror	r6, r6, #28
    2bb4:	e0866005 	add	r6, r6, r5
    2bb8:	e0263005 	eor	r3, r6, r5
    2bbc:	e0272003 	eor	r2, r7, r3
    2bc0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2bc4:	e2833010 	add	r3, r3, #16
    2bc8:	e5933000 	ldr	r3, [r3]
    2bcc:	e0823003 	add	r3, r2, r3
    2bd0:	e0843003 	add	r3, r4, r3
    2bd4:	e30c4fa9 	movw	r4, #53161	; 0xcfa9
    2bd8:	e3444bde 	movt	r4, #19422	; 0x4bde
    2bdc:	e0834004 	add	r4, r3, r4
    2be0:	e1a04ae4 	ror	r4, r4, #21
    2be4:	e0844006 	add	r4, r4, r6
    2be8:	e0243006 	eor	r3, r4, r6
    2bec:	e0252003 	eor	r2, r5, r3
    2bf0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2bf4:	e283301c 	add	r3, r3, #28
    2bf8:	e5933000 	ldr	r3, [r3]
    2bfc:	e0823003 	add	r3, r2, r3
    2c00:	e0873003 	add	r3, r7, r3
    2c04:	e3047b60 	movw	r7, #19296	; 0x4b60
    2c08:	e34f76bb 	movt	r7, #63163	; 0xf6bb
    2c0c:	e0837007 	add	r7, r3, r7
    2c10:	e1a07867 	ror	r7, r7, #16
    2c14:	e0877004 	add	r7, r7, r4
    2c18:	e0273004 	eor	r3, r7, r4
    2c1c:	e0262003 	eor	r2, r6, r3
    2c20:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2c24:	e2833028 	add	r3, r3, #40	; 0x28
    2c28:	e5933000 	ldr	r3, [r3]
    2c2c:	e0823003 	add	r3, r2, r3
    2c30:	e0853003 	add	r3, r5, r3
    2c34:	e30b5c70 	movw	r5, #48240	; 0xbc70
    2c38:	e34b5ebf 	movt	r5, #48831	; 0xbebf
    2c3c:	e0835005 	add	r5, r3, r5
    2c40:	e1a054e5 	ror	r5, r5, #9
    2c44:	e0855007 	add	r5, r5, r7
    2c48:	e0253007 	eor	r3, r5, r7
    2c4c:	e0242003 	eor	r2, r4, r3
    2c50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2c54:	e2833034 	add	r3, r3, #52	; 0x34
    2c58:	e5933000 	ldr	r3, [r3]
    2c5c:	e0823003 	add	r3, r2, r3
    2c60:	e0863003 	add	r3, r6, r3
    2c64:	e3076ec6 	movw	r6, #32454	; 0x7ec6
    2c68:	e342689b 	movt	r6, #10395	; 0x289b
    2c6c:	e0836006 	add	r6, r3, r6
    2c70:	e1a06e66 	ror	r6, r6, #28
    2c74:	e0866005 	add	r6, r6, r5
    2c78:	e0263005 	eor	r3, r6, r5
    2c7c:	e0272003 	eor	r2, r7, r3
    2c80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2c84:	e5933000 	ldr	r3, [r3]
    2c88:	e0823003 	add	r3, r2, r3
    2c8c:	e0843003 	add	r3, r4, r3
    2c90:	e30247fa 	movw	r4, #10234	; 0x27fa
    2c94:	e34e4aa1 	movt	r4, #60065	; 0xeaa1
    2c98:	e0834004 	add	r4, r3, r4
    2c9c:	e1a04ae4 	ror	r4, r4, #21
    2ca0:	e0844006 	add	r4, r4, r6
    2ca4:	e0243006 	eor	r3, r4, r6
    2ca8:	e0252003 	eor	r2, r5, r3
    2cac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2cb0:	e283300c 	add	r3, r3, #12
    2cb4:	e5933000 	ldr	r3, [r3]
    2cb8:	e0823003 	add	r3, r2, r3
    2cbc:	e0873003 	add	r3, r7, r3
    2cc0:	e3037085 	movw	r7, #12421	; 0x3085
    2cc4:	e34d74ef 	movt	r7, #54511	; 0xd4ef
    2cc8:	e0837007 	add	r7, r3, r7
    2ccc:	e1a07867 	ror	r7, r7, #16
    2cd0:	e0877004 	add	r7, r7, r4
    2cd4:	e0273004 	eor	r3, r7, r4
    2cd8:	e0262003 	eor	r2, r6, r3
    2cdc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2ce0:	e2833018 	add	r3, r3, #24
    2ce4:	e5933000 	ldr	r3, [r3]
    2ce8:	e0823003 	add	r3, r2, r3
    2cec:	e0853003 	add	r3, r5, r3
    2cf0:	e3015d05 	movw	r5, #7429	; 0x1d05
    2cf4:	e3405488 	movt	r5, #1160	; 0x488
    2cf8:	e0835005 	add	r5, r3, r5
    2cfc:	e1a054e5 	ror	r5, r5, #9
    2d00:	e0855007 	add	r5, r5, r7
    2d04:	e0253007 	eor	r3, r5, r7
    2d08:	e0242003 	eor	r2, r4, r3
    2d0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2d10:	e2833024 	add	r3, r3, #36	; 0x24
    2d14:	e5933000 	ldr	r3, [r3]
    2d18:	e0823003 	add	r3, r2, r3
    2d1c:	e0863003 	add	r3, r6, r3
    2d20:	e30d6039 	movw	r6, #53305	; 0xd039
    2d24:	e34d69d4 	movt	r6, #55764	; 0xd9d4
    2d28:	e0836006 	add	r6, r3, r6
    2d2c:	e1a06e66 	ror	r6, r6, #28
    2d30:	e0866005 	add	r6, r6, r5
    2d34:	e0263005 	eor	r3, r6, r5
    2d38:	e0272003 	eor	r2, r7, r3
    2d3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2d40:	e2833030 	add	r3, r3, #48	; 0x30
    2d44:	e5933000 	ldr	r3, [r3]
    2d48:	e0823003 	add	r3, r2, r3
    2d4c:	e0843003 	add	r3, r4, r3
    2d50:	e30949e5 	movw	r4, #39397	; 0x99e5
    2d54:	e34e46db 	movt	r4, #59099	; 0xe6db
    2d58:	e0834004 	add	r4, r3, r4
    2d5c:	e1a04ae4 	ror	r4, r4, #21
    2d60:	e0844006 	add	r4, r4, r6
    2d64:	e0243006 	eor	r3, r4, r6
    2d68:	e0252003 	eor	r2, r5, r3
    2d6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2d70:	e283303c 	add	r3, r3, #60	; 0x3c
    2d74:	e5933000 	ldr	r3, [r3]
    2d78:	e0823003 	add	r3, r2, r3
    2d7c:	e0873003 	add	r3, r7, r3
    2d80:	e3077cf8 	movw	r7, #31992	; 0x7cf8
    2d84:	e3417fa2 	movt	r7, #8098	; 0x1fa2
    2d88:	e0837007 	add	r7, r3, r7
    2d8c:	e1a07867 	ror	r7, r7, #16
    2d90:	e0877004 	add	r7, r7, r4
    2d94:	e0273004 	eor	r3, r7, r4
    2d98:	e0262003 	eor	r2, r6, r3
    2d9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2da0:	e2833008 	add	r3, r3, #8
    2da4:	e5933000 	ldr	r3, [r3]
    2da8:	e0823003 	add	r3, r2, r3
    2dac:	e0853003 	add	r3, r5, r3
    2db0:	e3055665 	movw	r5, #22117	; 0x5665
    2db4:	e34c54ac 	movt	r5, #50348	; 0xc4ac
    2db8:	e0835005 	add	r5, r3, r5
    2dbc:	e1a054e5 	ror	r5, r5, #9
    2dc0:	e0855007 	add	r5, r5, r7
    2dc4:	e1e03004 	mvn	r3, r4
    2dc8:	e1853003 	orr	r3, r5, r3
    2dcc:	e0272003 	eor	r2, r7, r3
    2dd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2dd4:	e5933000 	ldr	r3, [r3]
    2dd8:	e0823003 	add	r3, r2, r3
    2ddc:	e0863003 	add	r3, r6, r3
    2de0:	e3026244 	movw	r6, #8772	; 0x2244
    2de4:	e34f6429 	movt	r6, #62505	; 0xf429
    2de8:	e0836006 	add	r6, r3, r6
    2dec:	e1a06d66 	ror	r6, r6, #26
    2df0:	e0866005 	add	r6, r6, r5
    2df4:	e1e03007 	mvn	r3, r7
    2df8:	e1863003 	orr	r3, r6, r3
    2dfc:	e0252003 	eor	r2, r5, r3
    2e00:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2e04:	e283301c 	add	r3, r3, #28
    2e08:	e5933000 	ldr	r3, [r3]
    2e0c:	e0823003 	add	r3, r2, r3
    2e10:	e0843003 	add	r3, r4, r3
    2e14:	e30f4f97 	movw	r4, #65431	; 0xff97
    2e18:	e344432a 	movt	r4, #17194	; 0x432a
    2e1c:	e0834004 	add	r4, r3, r4
    2e20:	e1a04b64 	ror	r4, r4, #22
    2e24:	e0844006 	add	r4, r4, r6
    2e28:	e1e03005 	mvn	r3, r5
    2e2c:	e1843003 	orr	r3, r4, r3
    2e30:	e0262003 	eor	r2, r6, r3
    2e34:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2e38:	e2833038 	add	r3, r3, #56	; 0x38
    2e3c:	e5933000 	ldr	r3, [r3]
    2e40:	e0823003 	add	r3, r2, r3
    2e44:	e0873003 	add	r3, r7, r3
    2e48:	e30273a7 	movw	r7, #9127	; 0x23a7
    2e4c:	e34a7b94 	movt	r7, #43924	; 0xab94
    2e50:	e0837007 	add	r7, r3, r7
    2e54:	e1a078e7 	ror	r7, r7, #17
    2e58:	e0877004 	add	r7, r7, r4
    2e5c:	e1e03006 	mvn	r3, r6
    2e60:	e1873003 	orr	r3, r7, r3
    2e64:	e0242003 	eor	r2, r4, r3
    2e68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2e6c:	e2833014 	add	r3, r3, #20
    2e70:	e5933000 	ldr	r3, [r3]
    2e74:	e0823003 	add	r3, r2, r3
    2e78:	e0853003 	add	r3, r5, r3
    2e7c:	e30a5039 	movw	r5, #41017	; 0xa039
    2e80:	e34f5c93 	movt	r5, #64659	; 0xfc93
    2e84:	e0835005 	add	r5, r3, r5
    2e88:	e1a055e5 	ror	r5, r5, #11
    2e8c:	e0855007 	add	r5, r5, r7
    2e90:	e1e03004 	mvn	r3, r4
    2e94:	e1853003 	orr	r3, r5, r3
    2e98:	e0272003 	eor	r2, r7, r3
    2e9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2ea0:	e2833030 	add	r3, r3, #48	; 0x30
    2ea4:	e5933000 	ldr	r3, [r3]
    2ea8:	e0823003 	add	r3, r2, r3
    2eac:	e0863003 	add	r3, r6, r3
    2eb0:	e30569c3 	movw	r6, #22979	; 0x59c3
    2eb4:	e346655b 	movt	r6, #25947	; 0x655b
    2eb8:	e0836006 	add	r6, r3, r6
    2ebc:	e1a06d66 	ror	r6, r6, #26
    2ec0:	e0866005 	add	r6, r6, r5
    2ec4:	e1e03007 	mvn	r3, r7
    2ec8:	e1863003 	orr	r3, r6, r3
    2ecc:	e0252003 	eor	r2, r5, r3
    2ed0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2ed4:	e283300c 	add	r3, r3, #12
    2ed8:	e5933000 	ldr	r3, [r3]
    2edc:	e0823003 	add	r3, r2, r3
    2ee0:	e0843003 	add	r3, r4, r3
    2ee4:	e30c4c92 	movw	r4, #52370	; 0xcc92
    2ee8:	e3484f0c 	movt	r4, #36620	; 0x8f0c
    2eec:	e0834004 	add	r4, r3, r4
    2ef0:	e1a04b64 	ror	r4, r4, #22
    2ef4:	e0844006 	add	r4, r4, r6
    2ef8:	e1e03005 	mvn	r3, r5
    2efc:	e1843003 	orr	r3, r4, r3
    2f00:	e0262003 	eor	r2, r6, r3
    2f04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2f08:	e2833028 	add	r3, r3, #40	; 0x28
    2f0c:	e5933000 	ldr	r3, [r3]
    2f10:	e0823003 	add	r3, r2, r3
    2f14:	e0873003 	add	r3, r7, r3
    2f18:	e30f747d 	movw	r7, #62589	; 0xf47d
    2f1c:	e34f7fef 	movt	r7, #65519	; 0xffef
    2f20:	e0837007 	add	r7, r3, r7
    2f24:	e1a078e7 	ror	r7, r7, #17
    2f28:	e0877004 	add	r7, r7, r4
    2f2c:	e1e03006 	mvn	r3, r6
    2f30:	e1873003 	orr	r3, r7, r3
    2f34:	e0242003 	eor	r2, r4, r3
    2f38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2f3c:	e2833004 	add	r3, r3, #4
    2f40:	e5933000 	ldr	r3, [r3]
    2f44:	e0823003 	add	r3, r2, r3
    2f48:	e0853003 	add	r3, r5, r3
    2f4c:	e3055dd1 	movw	r5, #24017	; 0x5dd1
    2f50:	e3485584 	movt	r5, #34180	; 0x8584
    2f54:	e0835005 	add	r5, r3, r5
    2f58:	e1a055e5 	ror	r5, r5, #11
    2f5c:	e0855007 	add	r5, r5, r7
    2f60:	e1e03004 	mvn	r3, r4
    2f64:	e1853003 	orr	r3, r5, r3
    2f68:	e0272003 	eor	r2, r7, r3
    2f6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2f70:	e2833020 	add	r3, r3, #32
    2f74:	e5933000 	ldr	r3, [r3]
    2f78:	e0823003 	add	r3, r2, r3
    2f7c:	e0863003 	add	r3, r6, r3
    2f80:	e3076e4f 	movw	r6, #32335	; 0x7e4f
    2f84:	e3466fa8 	movt	r6, #28584	; 0x6fa8
    2f88:	e0836006 	add	r6, r3, r6
    2f8c:	e1a06d66 	ror	r6, r6, #26
    2f90:	e0866005 	add	r6, r6, r5
    2f94:	e1e03007 	mvn	r3, r7
    2f98:	e1863003 	orr	r3, r6, r3
    2f9c:	e0252003 	eor	r2, r5, r3
    2fa0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2fa4:	e283303c 	add	r3, r3, #60	; 0x3c
    2fa8:	e5933000 	ldr	r3, [r3]
    2fac:	e0823003 	add	r3, r2, r3
    2fb0:	e0843003 	add	r3, r4, r3
    2fb4:	e30e46e0 	movw	r4, #59104	; 0xe6e0
    2fb8:	e34f4e2c 	movt	r4, #65068	; 0xfe2c
    2fbc:	e0834004 	add	r4, r3, r4
    2fc0:	e1a04b64 	ror	r4, r4, #22
    2fc4:	e0844006 	add	r4, r4, r6
    2fc8:	e1e03005 	mvn	r3, r5
    2fcc:	e1843003 	orr	r3, r4, r3
    2fd0:	e0262003 	eor	r2, r6, r3
    2fd4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    2fd8:	e2833018 	add	r3, r3, #24
    2fdc:	e5933000 	ldr	r3, [r3]
    2fe0:	e0823003 	add	r3, r2, r3
    2fe4:	e0873003 	add	r3, r7, r3
    2fe8:	e3047314 	movw	r7, #17172	; 0x4314
    2fec:	e34a7301 	movt	r7, #41729	; 0xa301
    2ff0:	e0837007 	add	r7, r3, r7
    2ff4:	e1a078e7 	ror	r7, r7, #17
    2ff8:	e0877004 	add	r7, r7, r4
    2ffc:	e1e03006 	mvn	r3, r6
    3000:	e1873003 	orr	r3, r7, r3
    3004:	e0242003 	eor	r2, r4, r3
    3008:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    300c:	e2833034 	add	r3, r3, #52	; 0x34
    3010:	e5933000 	ldr	r3, [r3]
    3014:	e0823003 	add	r3, r2, r3
    3018:	e0853003 	add	r3, r5, r3
    301c:	e30151a1 	movw	r5, #4513	; 0x11a1
    3020:	e3445e08 	movt	r5, #19976	; 0x4e08
    3024:	e0835005 	add	r5, r3, r5
    3028:	e1a055e5 	ror	r5, r5, #11
    302c:	e0855007 	add	r5, r5, r7
    3030:	e1e03004 	mvn	r3, r4
    3034:	e1853003 	orr	r3, r5, r3
    3038:	e0272003 	eor	r2, r7, r3
    303c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3040:	e2833010 	add	r3, r3, #16
    3044:	e5933000 	ldr	r3, [r3]
    3048:	e0823003 	add	r3, r2, r3
    304c:	e0863003 	add	r3, r6, r3
    3050:	e3076e82 	movw	r6, #32386	; 0x7e82
    3054:	e34f6753 	movt	r6, #63315	; 0xf753
    3058:	e0836006 	add	r6, r3, r6
    305c:	e1a06d66 	ror	r6, r6, #26
    3060:	e0866005 	add	r6, r6, r5
    3064:	e1e03007 	mvn	r3, r7
    3068:	e1863003 	orr	r3, r6, r3
    306c:	e0252003 	eor	r2, r5, r3
    3070:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3074:	e283302c 	add	r3, r3, #44	; 0x2c
    3078:	e5933000 	ldr	r3, [r3]
    307c:	e0823003 	add	r3, r2, r3
    3080:	e0843003 	add	r3, r4, r3
    3084:	e30f4235 	movw	r4, #62005	; 0xf235
    3088:	e34b4d3a 	movt	r4, #48442	; 0xbd3a
    308c:	e0834004 	add	r4, r3, r4
    3090:	e1a04b64 	ror	r4, r4, #22
    3094:	e0844006 	add	r4, r4, r6
    3098:	e1e03005 	mvn	r3, r5
    309c:	e1843003 	orr	r3, r4, r3
    30a0:	e0262003 	eor	r2, r6, r3
    30a4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    30a8:	e2833008 	add	r3, r3, #8
    30ac:	e5933000 	ldr	r3, [r3]
    30b0:	e0823003 	add	r3, r2, r3
    30b4:	e0873003 	add	r3, r7, r3
    30b8:	e30d72bb 	movw	r7, #53947	; 0xd2bb
    30bc:	e3427ad7 	movt	r7, #10967	; 0x2ad7
    30c0:	e0837007 	add	r7, r3, r7
    30c4:	e1a078e7 	ror	r7, r7, #17
    30c8:	e0877004 	add	r7, r7, r4
    30cc:	e1e03006 	mvn	r3, r6
    30d0:	e1873003 	orr	r3, r7, r3
    30d4:	e0242003 	eor	r2, r4, r3
    30d8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    30dc:	e2833024 	add	r3, r3, #36	; 0x24
    30e0:	e5933000 	ldr	r3, [r3]
    30e4:	e0823003 	add	r3, r2, r3
    30e8:	e0853003 	add	r3, r5, r3
    30ec:	e30d5391 	movw	r5, #54161	; 0xd391
    30f0:	e34e5b86 	movt	r5, #60294	; 0xeb86
    30f4:	e0835005 	add	r5, r3, r5
    30f8:	e1a055e5 	ror	r5, r5, #11
    30fc:	e0855007 	add	r5, r5, r7
    3100:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3104:	e5933000 	ldr	r3, [r3]
    3108:	e0862003 	add	r2, r6, r3
    310c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3110:	e5832000 	str	r2, [r3]
    3114:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3118:	e2833004 	add	r3, r3, #4
    311c:	e5932000 	ldr	r2, [r3]
    3120:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3124:	e2833004 	add	r3, r3, #4
    3128:	e0852002 	add	r2, r5, r2
    312c:	e5832000 	str	r2, [r3]
    3130:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3134:	e2833008 	add	r3, r3, #8
    3138:	e5932000 	ldr	r2, [r3]
    313c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3140:	e2833008 	add	r3, r3, #8
    3144:	e0872002 	add	r2, r7, r2
    3148:	e5832000 	str	r2, [r3]
    314c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3150:	e283300c 	add	r3, r3, #12
    3154:	e5932000 	ldr	r2, [r3]
    3158:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    315c:	e283300c 	add	r3, r3, #12
    3160:	e0842002 	add	r2, r4, r2
    3164:	e5832000 	str	r2, [r3]
    3168:	e320f000 	nop	{0}
    316c:	e24bd010 	sub	sp, fp, #16
    3170:	e8bd08f0 	pop	{r4, r5, r6, r7, fp}
    3174:	e12fff1e 	bx	lr

00003178 <MD5Init>:
    3178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    317c:	e28db000 	add	fp, sp, #0
    3180:	e24dd00c 	sub	sp, sp, #12
    3184:	e50b0008 	str	r0, [fp, #-8]
    3188:	e51b2008 	ldr	r2, [fp, #-8]
    318c:	e3023301 	movw	r3, #8961	; 0x2301
    3190:	e3463745 	movt	r3, #26437	; 0x6745
    3194:	e5823000 	str	r3, [r2]
    3198:	e51b2008 	ldr	r2, [fp, #-8]
    319c:	e30a3b89 	movw	r3, #43913	; 0xab89
    31a0:	e34e3fcd 	movt	r3, #61389	; 0xefcd
    31a4:	e5823004 	str	r3, [r2, #4]
    31a8:	e51b2008 	ldr	r2, [fp, #-8]
    31ac:	e30d3cfe 	movw	r3, #56574	; 0xdcfe
    31b0:	e34938ba 	movt	r3, #39098	; 0x98ba
    31b4:	e5823008 	str	r3, [r2, #8]
    31b8:	e51b2008 	ldr	r2, [fp, #-8]
    31bc:	e3053476 	movw	r3, #21622	; 0x5476
    31c0:	e3413032 	movt	r3, #4146	; 0x1032
    31c4:	e582300c 	str	r3, [r2, #12]
    31c8:	e51b3008 	ldr	r3, [fp, #-8]
    31cc:	e3a02000 	mov	r2, #0
    31d0:	e5832010 	str	r2, [r3, #16]
    31d4:	e51b3008 	ldr	r3, [fp, #-8]
    31d8:	e3a02000 	mov	r2, #0
    31dc:	e5832014 	str	r2, [r3, #20]
    31e0:	e320f000 	nop	{0}
    31e4:	e28bd000 	add	sp, fp, #0
    31e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    31ec:	e12fff1e 	bx	lr

000031f0 <MD5Update>:
    31f0:	e92d4830 	push	{r4, r5, fp, lr}
    31f4:	e28db00c 	add	fp, sp, #12
    31f8:	e24dd010 	sub	sp, sp, #16
    31fc:	e50b0010 	str	r0, [fp, #-16]
    3200:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    3204:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    3208:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
    320c:	e51b3010 	ldr	r3, [fp, #-16]
    3210:	e5934010 	ldr	r4, [r3, #16]
    3214:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3218:	e1a03183 	lsl	r3, r3, #3
    321c:	e0842003 	add	r2, r4, r3
    3220:	e51b3010 	ldr	r3, [fp, #-16]
    3224:	e5832010 	str	r2, [r3, #16]
    3228:	e51b3010 	ldr	r3, [fp, #-16]
    322c:	e5933010 	ldr	r3, [r3, #16]
    3230:	e1540003 	cmp	r4, r3
    3234:	9a000004 	bls	324c <MD5Update+0x5c>
    3238:	e51b3010 	ldr	r3, [fp, #-16]
    323c:	e5933014 	ldr	r3, [r3, #20]
    3240:	e2832001 	add	r2, r3, #1
    3244:	e51b3010 	ldr	r3, [fp, #-16]
    3248:	e5832014 	str	r2, [r3, #20]
    324c:	e51b3010 	ldr	r3, [fp, #-16]
    3250:	e5932014 	ldr	r2, [r3, #20]
    3254:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3258:	e1a03ea3 	lsr	r3, r3, #29
    325c:	e0822003 	add	r2, r2, r3
    3260:	e51b3010 	ldr	r3, [fp, #-16]
    3264:	e5832014 	str	r2, [r3, #20]
    3268:	e1a031a4 	lsr	r3, r4, #3
    326c:	e203403f 	and	r4, r3, #63	; 0x3f
    3270:	e3540000 	cmp	r4, #0
    3274:	0a000030 	beq	333c <MD5Update+0x14c>
    3278:	e51b3010 	ldr	r3, [fp, #-16]
    327c:	e2833018 	add	r3, r3, #24
    3280:	e0835004 	add	r5, r3, r4
    3284:	e2644040 	rsb	r4, r4, #64	; 0x40
    3288:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    328c:	e1530004 	cmp	r3, r4
    3290:	2a000005 	bcs	32ac <MD5Update+0xbc>
    3294:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    3298:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    329c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    32a0:	e1a00005 	mov	r0, r5
    32a4:	ebfffc29 	bl	2350 <MD5Memcpy>
    32a8:	ea00002c 	b	3360 <MD5Update+0x170>
    32ac:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    32b0:	e1a02004 	mov	r2, r4
    32b4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    32b8:	e1a00005 	mov	r0, r5
    32bc:	ebfffc23 	bl	2350 <MD5Memcpy>
    32c0:	e51b2010 	ldr	r2, [fp, #-16]
    32c4:	e51b3010 	ldr	r3, [fp, #-16]
    32c8:	e2833018 	add	r3, r3, #24
    32cc:	e1a01003 	mov	r1, r3
    32d0:	e1a00002 	mov	r0, r2
    32d4:	ebfffc51 	bl	2420 <MD5Transform>
    32d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    32dc:	e0833004 	add	r3, r3, r4
    32e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    32e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    32e8:	e0433004 	sub	r3, r3, r4
    32ec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    32f0:	ea000011 	b	333c <MD5Update+0x14c>
    32f4:	e51b3010 	ldr	r3, [fp, #-16]
    32f8:	e2830018 	add	r0, r3, #24
    32fc:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    3300:	e3a02040 	mov	r2, #64	; 0x40
    3304:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    3308:	ebfffc10 	bl	2350 <MD5Memcpy>
    330c:	e51b2010 	ldr	r2, [fp, #-16]
    3310:	e51b3010 	ldr	r3, [fp, #-16]
    3314:	e2833018 	add	r3, r3, #24
    3318:	e1a01003 	mov	r1, r3
    331c:	e1a00002 	mov	r0, r2
    3320:	ebfffc3e 	bl	2420 <MD5Transform>
    3324:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3328:	e2833040 	add	r3, r3, #64	; 0x40
    332c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    3330:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3334:	e2433040 	sub	r3, r3, #64	; 0x40
    3338:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    333c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3340:	e353003f 	cmp	r3, #63	; 0x3f
    3344:	8affffea 	bhi	32f4 <MD5Update+0x104>
    3348:	e51b3010 	ldr	r3, [fp, #-16]
    334c:	e2830018 	add	r0, r3, #24
    3350:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    3354:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    3358:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    335c:	ebfffbfb 	bl	2350 <MD5Memcpy>
    3360:	e24bd00c 	sub	sp, fp, #12
    3364:	e8bd8830 	pop	{r4, r5, fp, pc}

00003368 <MD5Final>:
    3368:	e92d4800 	push	{fp, lr}
    336c:	e28db004 	add	fp, sp, #4
    3370:	e24dd018 	sub	sp, sp, #24
    3374:	e50b0010 	str	r0, [fp, #-16]
    3378:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    337c:	e1a03002 	mov	r3, r2
    3380:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    3384:	e51b3010 	ldr	r3, [fp, #-16]
    3388:	e5933010 	ldr	r3, [r3, #16]
    338c:	e1a031a3 	lsr	r3, r3, #3
    3390:	e203303f 	and	r3, r3, #63	; 0x3f
    3394:	e50b3008 	str	r3, [fp, #-8]
    3398:	e51b3010 	ldr	r3, [fp, #-16]
    339c:	e2832018 	add	r2, r3, #24
    33a0:	e51b3008 	ldr	r3, [fp, #-8]
    33a4:	e0823003 	add	r3, r2, r3
    33a8:	e50b300c 	str	r3, [fp, #-12]
    33ac:	e51b300c 	ldr	r3, [fp, #-12]
    33b0:	e2832001 	add	r2, r3, #1
    33b4:	e50b200c 	str	r2, [fp, #-12]
    33b8:	e3e0207f 	mvn	r2, #127	; 0x7f
    33bc:	e5c32000 	strb	r2, [r3]
    33c0:	e51b3008 	ldr	r3, [fp, #-8]
    33c4:	e263303f 	rsb	r3, r3, #63	; 0x3f
    33c8:	e50b3008 	str	r3, [fp, #-8]
    33cc:	e51b3008 	ldr	r3, [fp, #-8]
    33d0:	e3530007 	cmp	r3, #7
    33d4:	8a000010 	bhi	341c <MD5Final+0xb4>
    33d8:	e51b2008 	ldr	r2, [fp, #-8]
    33dc:	e3a01000 	mov	r1, #0
    33e0:	e51b000c 	ldr	r0, [fp, #-12]
    33e4:	ebfffbc2 	bl	22f4 <MD5Memset>
    33e8:	e51b2010 	ldr	r2, [fp, #-16]
    33ec:	e51b3010 	ldr	r3, [fp, #-16]
    33f0:	e2833018 	add	r3, r3, #24
    33f4:	e1a01003 	mov	r1, r3
    33f8:	e1a00002 	mov	r0, r2
    33fc:	ebfffc07 	bl	2420 <MD5Transform>
    3400:	e51b3010 	ldr	r3, [fp, #-16]
    3404:	e2833018 	add	r3, r3, #24
    3408:	e3a02038 	mov	r2, #56	; 0x38
    340c:	e3a01000 	mov	r1, #0
    3410:	e1a00003 	mov	r0, r3
    3414:	ebfffbb6 	bl	22f4 <MD5Memset>
    3418:	ea000005 	b	3434 <MD5Final+0xcc>
    341c:	e51b3008 	ldr	r3, [fp, #-8]
    3420:	e2433008 	sub	r3, r3, #8
    3424:	e1a02003 	mov	r2, r3
    3428:	e3a01000 	mov	r1, #0
    342c:	e51b000c 	ldr	r0, [fp, #-12]
    3430:	ebfffbaf 	bl	22f4 <MD5Memset>
    3434:	e51b3010 	ldr	r3, [fp, #-16]
    3438:	e2833018 	add	r3, r3, #24
    343c:	e2833038 	add	r3, r3, #56	; 0x38
    3440:	e51b2010 	ldr	r2, [fp, #-16]
    3444:	e5922010 	ldr	r2, [r2, #16]
    3448:	e5832000 	str	r2, [r3]
    344c:	e51b3010 	ldr	r3, [fp, #-16]
    3450:	e2833018 	add	r3, r3, #24
    3454:	e283303c 	add	r3, r3, #60	; 0x3c
    3458:	e51b2010 	ldr	r2, [fp, #-16]
    345c:	e5922014 	ldr	r2, [r2, #20]
    3460:	e5832000 	str	r2, [r3]
    3464:	e51b2010 	ldr	r2, [fp, #-16]
    3468:	e51b3010 	ldr	r3, [fp, #-16]
    346c:	e2833018 	add	r3, r3, #24
    3470:	e1a01003 	mov	r1, r3
    3474:	e1a00002 	mov	r0, r2
    3478:	ebfffbe8 	bl	2420 <MD5Transform>
    347c:	e51b1010 	ldr	r1, [fp, #-16]
    3480:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
    3484:	e3a02010 	mov	r2, #16
    3488:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    348c:	ebfffbaf 	bl	2350 <MD5Memcpy>
    3490:	e320f000 	nop	{0}
    3494:	e24bd004 	sub	sp, fp, #4
    3498:	e8bd8800 	pop	{fp, pc}

0000349c <md5>:
    349c:	e92d4800 	push	{fp, lr}
    34a0:	e28db004 	add	fp, sp, #4
    34a4:	e24dd068 	sub	sp, sp, #104	; 0x68
    34a8:	e50b0060 	str	r0, [fp, #-96]	; 0xffffffa0
    34ac:	e50b1064 	str	r1, [fp, #-100]	; 0xffffff9c
    34b0:	e50b2068 	str	r2, [fp, #-104]	; 0xffffff98
    34b4:	e54b3069 	strb	r3, [fp, #-105]	; 0xffffff97
    34b8:	e24b305c 	sub	r3, fp, #92	; 0x5c
    34bc:	e1a00003 	mov	r0, r3
    34c0:	ebffff2c 	bl	3178 <MD5Init>
    34c4:	e55b3069 	ldrb	r3, [fp, #-105]	; 0xffffff97
    34c8:	e24b005c 	sub	r0, fp, #92	; 0x5c
    34cc:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
    34d0:	e51b1060 	ldr	r1, [fp, #-96]	; 0xffffffa0
    34d4:	ebffff45 	bl	31f0 <MD5Update>
    34d8:	e55b2069 	ldrb	r2, [fp, #-105]	; 0xffffff97
    34dc:	e24b305c 	sub	r3, fp, #92	; 0x5c
    34e0:	e51b1068 	ldr	r1, [fp, #-104]	; 0xffffff98
    34e4:	e1a00003 	mov	r0, r3
    34e8:	ebffff9e 	bl	3368 <MD5Final>
    34ec:	e320f000 	nop	{0}
    34f0:	e24bd004 	sub	sp, fp, #4
    34f4:	e8bd8800 	pop	{fp, pc}

000034f8 <Xil_In32>:
    34f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34fc:	e28db000 	add	fp, sp, #0
    3500:	e24dd00c 	sub	sp, sp, #12
    3504:	e50b0008 	str	r0, [fp, #-8]
    3508:	e51b3008 	ldr	r3, [fp, #-8]
    350c:	e5933000 	ldr	r3, [r3]
    3510:	e1a00003 	mov	r0, r3
    3514:	e28bd000 	add	sp, fp, #0
    3518:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    351c:	e12fff1e 	bx	lr

00003520 <Xil_Out32>:
    3520:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3524:	e28db000 	add	fp, sp, #0
    3528:	e24dd014 	sub	sp, sp, #20
    352c:	e50b0010 	str	r0, [fp, #-16]
    3530:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    3534:	e51b3010 	ldr	r3, [fp, #-16]
    3538:	e50b3008 	str	r3, [fp, #-8]
    353c:	e51b3008 	ldr	r3, [fp, #-8]
    3540:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    3544:	e5832000 	str	r2, [r3]
    3548:	e320f000 	nop	{0}
    354c:	e28bd000 	add	sp, fp, #0
    3550:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3554:	e12fff1e 	bx	lr

00003558 <InitNor>:
    3558:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    355c:	e28db000 	add	fp, sp, #0
    3560:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    3564:	e3403001 	movt	r3, #1
    3568:	e3a024e2 	mov	r2, #-503316480	; 0xe2000000
    356c:	e5832000 	str	r2, [r3]
    3570:	e320f000 	nop	{0}
    3574:	e28bd000 	add	sp, fp, #0
    3578:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    357c:	e12fff1e 	bx	lr

00003580 <NorAccess>:
    3580:	e92d4800 	push	{fp, lr}
    3584:	e28db004 	add	fp, sp, #4
    3588:	e24dd028 	sub	sp, sp, #40	; 0x28
    358c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    3590:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    3594:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    3598:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    359c:	e2033003 	and	r3, r3, #3
    35a0:	e3530000 	cmp	r3, #0
    35a4:	0a000003 	beq	35b8 <NorAccess+0x38>
    35a8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    35ac:	e3c33003 	bic	r3, r3, #3
    35b0:	e2833004 	add	r3, r3, #4
    35b4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    35b8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    35bc:	e1a03123 	lsr	r3, r3, #2
    35c0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    35c4:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    35c8:	e3403001 	movt	r3, #1
    35cc:	e5932000 	ldr	r2, [r3]
    35d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    35d4:	e0823003 	add	r3, r2, r3
    35d8:	e50b300c 	str	r3, [fp, #-12]
    35dc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    35e0:	e50b3010 	str	r3, [fp, #-16]
    35e4:	e3a03000 	mov	r3, #0
    35e8:	e50b3008 	str	r3, [fp, #-8]
    35ec:	ea00000e 	b	362c <NorAccess+0xac>
    35f0:	e51b300c 	ldr	r3, [fp, #-12]
    35f4:	e2832004 	add	r2, r3, #4
    35f8:	e50b200c 	str	r2, [fp, #-12]
    35fc:	e1a00003 	mov	r0, r3
    3600:	ebffffbc 	bl	34f8 <Xil_In32>
    3604:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    3608:	e51b3010 	ldr	r3, [fp, #-16]
    360c:	e2832004 	add	r2, r3, #4
    3610:	e50b2010 	str	r2, [fp, #-16]
    3614:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    3618:	e1a00003 	mov	r0, r3
    361c:	ebffffbf 	bl	3520 <Xil_Out32>
    3620:	e51b3008 	ldr	r3, [fp, #-8]
    3624:	e2833001 	add	r3, r3, #1
    3628:	e50b3008 	str	r3, [fp, #-8]
    362c:	e51b2008 	ldr	r2, [fp, #-8]
    3630:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3634:	e1520003 	cmp	r2, r3
    3638:	3affffec 	bcc	35f0 <NorAccess+0x70>
    363c:	e3a03000 	mov	r3, #0
    3640:	e1a00003 	mov	r0, r3
    3644:	e24bd004 	sub	sp, fp, #4
    3648:	e8bd8800 	pop	{fp, pc}

0000364c <Xil_In32>:
    364c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3650:	e28db000 	add	fp, sp, #0
    3654:	e24dd00c 	sub	sp, sp, #12
    3658:	e50b0008 	str	r0, [fp, #-8]
    365c:	e51b3008 	ldr	r3, [fp, #-8]
    3660:	e5933000 	ldr	r3, [r3]
    3664:	e1a00003 	mov	r0, r3
    3668:	e28bd000 	add	sp, fp, #0
    366c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3670:	e12fff1e 	bx	lr

00003674 <Xil_Out32>:
    3674:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3678:	e28db000 	add	fp, sp, #0
    367c:	e24dd014 	sub	sp, sp, #20
    3680:	e50b0010 	str	r0, [fp, #-16]
    3684:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    3688:	e51b3010 	ldr	r3, [fp, #-16]
    368c:	e50b3008 	str	r3, [fp, #-8]
    3690:	e51b3008 	ldr	r3, [fp, #-8]
    3694:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    3698:	e5832000 	str	r2, [r3]
    369c:	e320f000 	nop	{0}
    36a0:	e28bd000 	add	sp, fp, #0
    36a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    36a8:	e12fff1e 	bx	lr

000036ac <PcapDataTransfer>:
    36ac:	e92d4800 	push	{fp, lr}
    36b0:	e28db004 	add	fp, sp, #4
    36b4:	e24dd028 	sub	sp, sp, #40	; 0x28
    36b8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    36bc:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    36c0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    36c4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    36c8:	e3a03005 	mov	r3, #5
    36cc:	e50b3008 	str	r3, [fp, #-8]
    36d0:	e59b3004 	ldr	r3, [fp, #4]
    36d4:	e3530000 	cmp	r3, #0
    36d8:	0a000001 	beq	36e4 <PcapDataTransfer+0x38>
    36dc:	e3a03004 	mov	r3, #4
    36e0:	e50b3008 	str	r3, [fp, #-8]
    36e4:	eb000190 	bl	3d2c <ClearPcapStatus>
    36e8:	e50b000c 	str	r0, [fp, #-12]
    36ec:	e51b300c 	ldr	r3, [fp, #-12]
    36f0:	e3530000 	cmp	r3, #0
    36f4:	0a000001 	beq	3700 <PcapDataTransfer+0x54>
    36f8:	e3a03001 	mov	r3, #1
    36fc:	ea000031 	b	37c8 <PcapDataTransfer+0x11c>
    3700:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3704:	e3833001 	orr	r3, r3, #1
    3708:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    370c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3710:	e3833001 	orr	r3, r3, #1
    3714:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    3718:	e30d3428 	movw	r3, #54312	; 0xd428
    371c:	e3403001 	movt	r3, #1
    3720:	e5930000 	ldr	r0, [r3]
    3724:	e51b3008 	ldr	r3, [fp, #-8]
    3728:	e58d3004 	str	r3, [sp, #4]
    372c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3730:	e58d3000 	str	r3, [sp]
    3734:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3738:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    373c:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    3740:	eb001a96 	bl	a1a0 <XDcfg_Transfer>
    3744:	e50b000c 	str	r0, [fp, #-12]
    3748:	e51b300c 	ldr	r3, [fp, #-12]
    374c:	e3530000 	cmp	r3, #0
    3750:	0a000001 	beq	375c <PcapDataTransfer+0xb0>
    3754:	e3a03001 	mov	r3, #1
    3758:	ea00001a 	b	37c8 <PcapDataTransfer+0x11c>
    375c:	eb0001ba 	bl	3e4c <PcapDumpRegisters>
    3760:	e3a01cca 	mov	r1, #51712	; 0xca00
    3764:	e3431b9a 	movt	r1, #15258	; 0x3b9a
    3768:	e3a00a02 	mov	r0, #8192	; 0x2000
    376c:	eb0001bc 	bl	3e64 <XDcfgPollDone>
    3770:	e1a03000 	mov	r3, r0
    3774:	e50b300c 	str	r3, [fp, #-12]
    3778:	e51b300c 	ldr	r3, [fp, #-12]
    377c:	e3530000 	cmp	r3, #0
    3780:	0a000001 	beq	378c <PcapDataTransfer+0xe0>
    3784:	e3a03001 	mov	r3, #1
    3788:	ea00000e 	b	37c8 <PcapDataTransfer+0x11c>
    378c:	e30d3428 	movw	r3, #54312	; 0xd428
    3790:	e3403001 	movt	r3, #1
    3794:	e5933000 	ldr	r3, [r3]
    3798:	e1a00003 	mov	r0, r3
    379c:	eb0017d3 	bl	96f0 <XDcfg_IntrGetStatus>
    37a0:	e50b0010 	str	r0, [fp, #-16]
    37a4:	e51b2010 	ldr	r2, [fp, #-16]
    37a8:	e30c3840 	movw	r3, #51264	; 0xc840
    37ac:	e3403074 	movt	r3, #116	; 0x74
    37b0:	e0033002 	and	r3, r3, r2
    37b4:	e3530000 	cmp	r3, #0
    37b8:	0a000001 	beq	37c4 <PcapDataTransfer+0x118>
    37bc:	e3a03001 	mov	r3, #1
    37c0:	ea000000 	b	37c8 <PcapDataTransfer+0x11c>
    37c4:	e3a03000 	mov	r3, #0
    37c8:	e1a00003 	mov	r0, r3
    37cc:	e24bd004 	sub	sp, fp, #4
    37d0:	e8bd8800 	pop	{fp, pc}

000037d4 <PcapLoadPartition>:
    37d4:	e92d4800 	push	{fp, lr}
    37d8:	e28db004 	add	fp, sp, #4
    37dc:	e24dd028 	sub	sp, sp, #40	; 0x28
    37e0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    37e4:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    37e8:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    37ec:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    37f0:	e3a03001 	mov	r3, #1
    37f4:	e50b3008 	str	r3, [fp, #-8]
    37f8:	e59b3004 	ldr	r3, [fp, #4]
    37fc:	e3530000 	cmp	r3, #0
    3800:	0a000001 	beq	380c <PcapLoadPartition+0x38>
    3804:	e3a03002 	mov	r3, #2
    3808:	e50b3008 	str	r3, [fp, #-8]
    380c:	eb000146 	bl	3d2c <ClearPcapStatus>
    3810:	e50b000c 	str	r0, [fp, #-12]
    3814:	e51b300c 	ldr	r3, [fp, #-12]
    3818:	e3530000 	cmp	r3, #0
    381c:	0a000001 	beq	3828 <PcapLoadPartition+0x54>
    3820:	e3a03001 	mov	r3, #1
    3824:	ea000045 	b	3940 <PcapLoadPartition+0x16c>
    3828:	e3e03000 	mvn	r3, #0
    382c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    3830:	eb000065 	bl	39cc <FabricInit>
    3834:	e50b000c 	str	r0, [fp, #-12]
    3838:	e51b300c 	ldr	r3, [fp, #-12]
    383c:	e3530000 	cmp	r3, #0
    3840:	0a000001 	beq	384c <PcapLoadPartition+0x78>
    3844:	e3a03001 	mov	r3, #1
    3848:	ea00003c 	b	3940 <PcapLoadPartition+0x16c>
    384c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3850:	e3833001 	orr	r3, r3, #1
    3854:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    3858:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    385c:	e3833001 	orr	r3, r3, #1
    3860:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    3864:	e30d3428 	movw	r3, #54312	; 0xd428
    3868:	e3403001 	movt	r3, #1
    386c:	e5930000 	ldr	r0, [r3]
    3870:	e51b3008 	ldr	r3, [fp, #-8]
    3874:	e58d3004 	str	r3, [sp, #4]
    3878:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    387c:	e58d3000 	str	r3, [sp]
    3880:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3884:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    3888:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    388c:	eb001a43 	bl	a1a0 <XDcfg_Transfer>
    3890:	e50b000c 	str	r0, [fp, #-12]
    3894:	e51b300c 	ldr	r3, [fp, #-12]
    3898:	e3530000 	cmp	r3, #0
    389c:	0a000001 	beq	38a8 <PcapLoadPartition+0xd4>
    38a0:	e3a03001 	mov	r3, #1
    38a4:	ea000025 	b	3940 <PcapLoadPartition+0x16c>
    38a8:	eb000167 	bl	3e4c <PcapDumpRegisters>
    38ac:	e3a01cca 	mov	r1, #51712	; 0xca00
    38b0:	e3431b9a 	movt	r1, #15258	; 0x3b9a
    38b4:	e3a00a02 	mov	r0, #8192	; 0x2000
    38b8:	eb000169 	bl	3e64 <XDcfgPollDone>
    38bc:	e1a03000 	mov	r3, r0
    38c0:	e50b300c 	str	r3, [fp, #-12]
    38c4:	e51b300c 	ldr	r3, [fp, #-12]
    38c8:	e3530000 	cmp	r3, #0
    38cc:	0a000001 	beq	38d8 <PcapLoadPartition+0x104>
    38d0:	e3a03001 	mov	r3, #1
    38d4:	ea000019 	b	3940 <PcapLoadPartition+0x16c>
    38d8:	e3a01cca 	mov	r1, #51712	; 0xca00
    38dc:	e3431b9a 	movt	r1, #15258	; 0x3b9a
    38e0:	e3a00004 	mov	r0, #4
    38e4:	eb00015e 	bl	3e64 <XDcfgPollDone>
    38e8:	e1a03000 	mov	r3, r0
    38ec:	e50b300c 	str	r3, [fp, #-12]
    38f0:	e51b300c 	ldr	r3, [fp, #-12]
    38f4:	e3530000 	cmp	r3, #0
    38f8:	0a000001 	beq	3904 <PcapLoadPartition+0x130>
    38fc:	e3a03001 	mov	r3, #1
    3900:	ea00000e 	b	3940 <PcapLoadPartition+0x16c>
    3904:	e30d3428 	movw	r3, #54312	; 0xd428
    3908:	e3403001 	movt	r3, #1
    390c:	e5933000 	ldr	r3, [r3]
    3910:	e1a00003 	mov	r0, r3
    3914:	eb001775 	bl	96f0 <XDcfg_IntrGetStatus>
    3918:	e50b0010 	str	r0, [fp, #-16]
    391c:	e51b2010 	ldr	r2, [fp, #-16]
    3920:	e30c3840 	movw	r3, #51264	; 0xc840
    3924:	e3403074 	movt	r3, #116	; 0x74
    3928:	e0033002 	and	r3, r3, r2
    392c:	e3530000 	cmp	r3, #0
    3930:	0a000001 	beq	393c <PcapLoadPartition+0x168>
    3934:	e3a03001 	mov	r3, #1
    3938:	ea000000 	b	3940 <PcapLoadPartition+0x16c>
    393c:	e3a03000 	mov	r3, #0
    3940:	e1a00003 	mov	r0, r3
    3944:	e24bd004 	sub	sp, fp, #4
    3948:	e8bd8800 	pop	{fp, pc}

0000394c <InitPcap>:
    394c:	e92d4800 	push	{fp, lr}
    3950:	e28db004 	add	fp, sp, #4
    3954:	e24dd008 	sub	sp, sp, #8
    3958:	e3a03000 	mov	r3, #0
    395c:	e50b3008 	str	r3, [fp, #-8]
    3960:	e30d3428 	movw	r3, #54312	; 0xd428
    3964:	e3403001 	movt	r3, #1
    3968:	e30d2408 	movw	r2, #54280	; 0xd408
    396c:	e3402001 	movt	r2, #1
    3970:	e5832000 	str	r2, [r3]
    3974:	e3a00a07 	mov	r0, #28672	; 0x7000
    3978:	e34f0800 	movt	r0, #63488	; 0xf800
    397c:	eb0016dd 	bl	94f8 <XDcfg_LookupConfig>
    3980:	e50b000c 	str	r0, [fp, #-12]
    3984:	e30d3428 	movw	r3, #54312	; 0xd428
    3988:	e3403001 	movt	r3, #1
    398c:	e5930000 	ldr	r0, [r3]
    3990:	e51b300c 	ldr	r3, [fp, #-12]
    3994:	e5933004 	ldr	r3, [r3, #4]
    3998:	e1a02003 	mov	r2, r3
    399c:	e51b100c 	ldr	r1, [fp, #-12]
    39a0:	eb0017d7 	bl	9904 <XDcfg_CfgInitialize>
    39a4:	e50b0008 	str	r0, [fp, #-8]
    39a8:	e51b3008 	ldr	r3, [fp, #-8]
    39ac:	e3530000 	cmp	r3, #0
    39b0:	0a000001 	beq	39bc <InitPcap+0x70>
    39b4:	e3a03001 	mov	r3, #1
    39b8:	ea000000 	b	39c0 <InitPcap+0x74>
    39bc:	e3a03000 	mov	r3, #0
    39c0:	e1a00003 	mov	r0, r3
    39c4:	e24bd004 	sub	sp, fp, #4
    39c8:	e8bd8800 	pop	{fp, pc}

000039cc <FabricInit>:
    39cc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    39d0:	e28db014 	add	fp, sp, #20
    39d4:	e24dd028 	sub	sp, sp, #40	; 0x28
    39d8:	e3a03000 	mov	r3, #0
    39dc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    39e0:	e3a02000 	mov	r2, #0
    39e4:	e3a03000 	mov	r3, #0
    39e8:	e14b23f4 	strd	r2, [fp, #-52]	; 0xffffffcc
    39ec:	e3a02000 	mov	r2, #0
    39f0:	e3a03000 	mov	r3, #0
    39f4:	e14b23fc 	strd	r2, [fp, #-60]	; 0xffffffc4
    39f8:	e3a0100a 	mov	r1, #10
    39fc:	e3a00c09 	mov	r0, #2304	; 0x900
    3a00:	e34f0800 	movt	r0, #63488	; 0xf800
    3a04:	ebffff1a 	bl	3674 <Xil_Out32>
    3a08:	e30d3428 	movw	r3, #54312	; 0xd428
    3a0c:	e3403001 	movt	r3, #1
    3a10:	e5933000 	ldr	r3, [r3]
    3a14:	e5933004 	ldr	r3, [r3, #4]
    3a18:	e1a00003 	mov	r0, r3
    3a1c:	ebffff0a 	bl	364c <Xil_In32>
    3a20:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    3a24:	e30d33f8 	movw	r3, #54264	; 0xd3f8
    3a28:	e3403001 	movt	r3, #1
    3a2c:	e5933000 	ldr	r3, [r3]
    3a30:	e3530001 	cmp	r3, #1
    3a34:	9a00000b 	bls	3a68 <FabricInit+0x9c>
    3a38:	e30d3428 	movw	r3, #54312	; 0xd428
    3a3c:	e3403001 	movt	r3, #1
    3a40:	e5933000 	ldr	r3, [r3]
    3a44:	e1a00003 	mov	r0, r3
    3a48:	eb001989 	bl	a074 <XDcfg_GetMiscControlRegister>
    3a4c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    3a50:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    3a54:	e2033c01 	and	r3, r3, #256	; 0x100
    3a58:	e3530000 	cmp	r3, #0
    3a5c:	1a000001 	bne	3a68 <FabricInit+0x9c>
    3a60:	e3a03001 	mov	r3, #1
    3a64:	ea0000ad 	b	3d20 <FabricInit+0x354>
    3a68:	e30d3428 	movw	r3, #54312	; 0xd428
    3a6c:	e3403001 	movt	r3, #1
    3a70:	e5933000 	ldr	r3, [r3]
    3a74:	e5932004 	ldr	r2, [r3, #4]
    3a78:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3a7c:	e3833101 	orr	r3, r3, #1073741824	; 0x40000000
    3a80:	e1a01003 	mov	r1, r3
    3a84:	e1a00002 	mov	r0, r2
    3a88:	ebfffef9 	bl	3674 <Xil_Out32>
    3a8c:	e30d3428 	movw	r3, #54312	; 0xd428
    3a90:	e3403001 	movt	r3, #1
    3a94:	e5933000 	ldr	r3, [r3]
    3a98:	e1a00003 	mov	r0, r3
    3a9c:	eb001841 	bl	9ba8 <XDcfg_GetControlRegister>
    3aa0:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    3aa4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3aa8:	e2033a01 	and	r3, r3, #4096	; 0x1000
    3aac:	e3530000 	cmp	r3, #0
    3ab0:	0a000001 	beq	3abc <FabricInit+0xf0>
    3ab4:	e3010388 	movw	r0, #5000	; 0x1388
    3ab8:	eb0006ad 	bl	5574 <usleep>
    3abc:	e30d3428 	movw	r3, #54312	; 0xd428
    3ac0:	e3403001 	movt	r3, #1
    3ac4:	e5933000 	ldr	r3, [r3]
    3ac8:	e5932004 	ldr	r2, [r3, #4]
    3acc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3ad0:	e3c33101 	bic	r3, r3, #1073741824	; 0x40000000
    3ad4:	e1a01003 	mov	r1, r3
    3ad8:	e1a00002 	mov	r0, r2
    3adc:	ebfffee4 	bl	3674 <Xil_Out32>
    3ae0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3ae4:	e2033a01 	and	r3, r3, #4096	; 0x1000
    3ae8:	e3530000 	cmp	r3, #0
    3aec:	0a000001 	beq	3af8 <FabricInit+0x12c>
    3af0:	e3010388 	movw	r0, #5000	; 0x1388
    3af4:	eb00069e 	bl	5574 <usleep>
    3af8:	e24b3034 	sub	r3, fp, #52	; 0x34
    3afc:	e1a00003 	mov	r0, r3
    3b00:	eb000671 	bl	54cc <XTime_GetTime>
    3b04:	e30d3428 	movw	r3, #54312	; 0xd428
    3b08:	e3403001 	movt	r3, #1
    3b0c:	e5933000 	ldr	r3, [r3]
    3b10:	e1a00003 	mov	r0, r3
    3b14:	eb0018da 	bl	9e84 <XDcfg_GetStatusRegister>
    3b18:	e1a03000 	mov	r3, r0
    3b1c:	e2033010 	and	r3, r3, #16
    3b20:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    3b24:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    3b28:	e3530000 	cmp	r3, #0
    3b2c:	0a000011 	beq	3b78 <FabricInit+0x1ac>
    3b30:	e24b303c 	sub	r3, fp, #60	; 0x3c
    3b34:	e1a00003 	mov	r0, r3
    3b38:	eb000663 	bl	54cc <XTime_GetTime>
    3b3c:	e14b23d4 	ldrd	r2, [fp, #-52]	; 0xffffffcc
    3b40:	e3091676 	movw	r1, #38518	; 0x9676
    3b44:	e3401098 	movt	r1, #152	; 0x98
    3b48:	e0926001 	adds	r6, r2, r1
    3b4c:	e2a37000 	adc	r7, r3, #0
    3b50:	e14b23dc 	ldrd	r2, [fp, #-60]	; 0xffffffc4
    3b54:	e1520006 	cmp	r2, r6
    3b58:	e0d33007 	sbcs	r3, r3, r7
    3b5c:	2a000001 	bcs	3b68 <FabricInit+0x19c>
    3b60:	e3a03001 	mov	r3, #1
    3b64:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    3b68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3b6c:	e3530000 	cmp	r3, #0
    3b70:	0affffe3 	beq	3b04 <FabricInit+0x138>
    3b74:	ea000000 	b	3b7c <FabricInit+0x1b0>
    3b78:	e320f000 	nop	{0}
    3b7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3b80:	e3530001 	cmp	r3, #1
    3b84:	1a00004b 	bne	3cb8 <FabricInit+0x2ec>
    3b88:	e3a03000 	mov	r3, #0
    3b8c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    3b90:	e30d3428 	movw	r3, #54312	; 0xd428
    3b94:	e3403001 	movt	r3, #1
    3b98:	e5933000 	ldr	r3, [r3]
    3b9c:	e5932004 	ldr	r2, [r3, #4]
    3ba0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3ba4:	e3833101 	orr	r3, r3, #1073741824	; 0x40000000
    3ba8:	e1a01003 	mov	r1, r3
    3bac:	e1a00002 	mov	r0, r2
    3bb0:	ebfffeaf 	bl	3674 <Xil_Out32>
    3bb4:	e30d3428 	movw	r3, #54312	; 0xd428
    3bb8:	e3403001 	movt	r3, #1
    3bbc:	e5933000 	ldr	r3, [r3]
    3bc0:	e1a00003 	mov	r0, r3
    3bc4:	eb0017f7 	bl	9ba8 <XDcfg_GetControlRegister>
    3bc8:	e50b0024 	str	r0, [fp, #-36]	; 0xffffffdc
    3bcc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3bd0:	e2033a01 	and	r3, r3, #4096	; 0x1000
    3bd4:	e3530000 	cmp	r3, #0
    3bd8:	0a000001 	beq	3be4 <FabricInit+0x218>
    3bdc:	e3010388 	movw	r0, #5000	; 0x1388
    3be0:	eb000663 	bl	5574 <usleep>
    3be4:	e30d3428 	movw	r3, #54312	; 0xd428
    3be8:	e3403001 	movt	r3, #1
    3bec:	e5933000 	ldr	r3, [r3]
    3bf0:	e5932004 	ldr	r2, [r3, #4]
    3bf4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3bf8:	e3c33101 	bic	r3, r3, #1073741824	; 0x40000000
    3bfc:	e1a01003 	mov	r1, r3
    3c00:	e1a00002 	mov	r0, r2
    3c04:	ebfffe9a 	bl	3674 <Xil_Out32>
    3c08:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    3c0c:	e2033a01 	and	r3, r3, #4096	; 0x1000
    3c10:	e3530000 	cmp	r3, #0
    3c14:	0a000001 	beq	3c20 <FabricInit+0x254>
    3c18:	e3010388 	movw	r0, #5000	; 0x1388
    3c1c:	eb000654 	bl	5574 <usleep>
    3c20:	e24b3034 	sub	r3, fp, #52	; 0x34
    3c24:	e1a00003 	mov	r0, r3
    3c28:	eb000627 	bl	54cc <XTime_GetTime>
    3c2c:	e30d3428 	movw	r3, #54312	; 0xd428
    3c30:	e3403001 	movt	r3, #1
    3c34:	e5933000 	ldr	r3, [r3]
    3c38:	e1a00003 	mov	r0, r3
    3c3c:	eb001890 	bl	9e84 <XDcfg_GetStatusRegister>
    3c40:	e1a03000 	mov	r3, r0
    3c44:	e2033010 	and	r3, r3, #16
    3c48:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    3c4c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    3c50:	e3530000 	cmp	r3, #0
    3c54:	0a000011 	beq	3ca0 <FabricInit+0x2d4>
    3c58:	e24b303c 	sub	r3, fp, #60	; 0x3c
    3c5c:	e1a00003 	mov	r0, r3
    3c60:	eb000619 	bl	54cc <XTime_GetTime>
    3c64:	e14b23d4 	ldrd	r2, [fp, #-52]	; 0xffffffcc
    3c68:	e3091676 	movw	r1, #38518	; 0x9676
    3c6c:	e3401098 	movt	r1, #152	; 0x98
    3c70:	e0924001 	adds	r4, r2, r1
    3c74:	e2a35000 	adc	r5, r3, #0
    3c78:	e14b23dc 	ldrd	r2, [fp, #-60]	; 0xffffffc4
    3c7c:	e1520004 	cmp	r2, r4
    3c80:	e0d33005 	sbcs	r3, r3, r5
    3c84:	2a000001 	bcs	3c90 <FabricInit+0x2c4>
    3c88:	e3a03001 	mov	r3, #1
    3c8c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    3c90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3c94:	e3530000 	cmp	r3, #0
    3c98:	0affffe3 	beq	3c2c <FabricInit+0x260>
    3c9c:	ea000000 	b	3ca4 <FabricInit+0x2d8>
    3ca0:	e320f000 	nop	{0}
    3ca4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    3ca8:	e3530001 	cmp	r3, #1
    3cac:	1a000001 	bne	3cb8 <FabricInit+0x2ec>
    3cb0:	e3a03001 	mov	r3, #1
    3cb4:	ea000019 	b	3d20 <FabricInit+0x354>
    3cb8:	e30d3428 	movw	r3, #54312	; 0xd428
    3cbc:	e3403001 	movt	r3, #1
    3cc0:	e5933000 	ldr	r3, [r3]
    3cc4:	e5932004 	ldr	r2, [r3, #4]
    3cc8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    3ccc:	e3833101 	orr	r3, r3, #1073741824	; 0x40000000
    3cd0:	e1a01003 	mov	r1, r3
    3cd4:	e1a00002 	mov	r0, r2
    3cd8:	ebfffe65 	bl	3674 <Xil_Out32>
    3cdc:	e320f000 	nop	{0}
    3ce0:	e30d3428 	movw	r3, #54312	; 0xd428
    3ce4:	e3403001 	movt	r3, #1
    3ce8:	e5933000 	ldr	r3, [r3]
    3cec:	e1a00003 	mov	r0, r3
    3cf0:	eb001863 	bl	9e84 <XDcfg_GetStatusRegister>
    3cf4:	e1a03000 	mov	r3, r0
    3cf8:	e2033010 	and	r3, r3, #16
    3cfc:	e3530000 	cmp	r3, #0
    3d00:	0afffff6 	beq	3ce0 <FabricInit+0x314>
    3d04:	e30d3428 	movw	r3, #54312	; 0xd428
    3d08:	e3403001 	movt	r3, #1
    3d0c:	e5933000 	ldr	r3, [r3]
    3d10:	e1a00003 	mov	r0, r3
    3d14:	eb00185a 	bl	9e84 <XDcfg_GetStatusRegister>
    3d18:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
    3d1c:	e3a03000 	mov	r3, #0
    3d20:	e1a00003 	mov	r0, r3
    3d24:	e24bd014 	sub	sp, fp, #20
    3d28:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

00003d2c <ClearPcapStatus>:
    3d2c:	e92d4800 	push	{fp, lr}
    3d30:	e28db004 	add	fp, sp, #4
    3d34:	e24dd008 	sub	sp, sp, #8
    3d38:	e30d3428 	movw	r3, #54312	; 0xd428
    3d3c:	e3403001 	movt	r3, #1
    3d40:	e5933000 	ldr	r3, [r3]
    3d44:	e3e01000 	mvn	r1, #0
    3d48:	e1a00003 	mov	r0, r3
    3d4c:	eb001686 	bl	976c <XDcfg_IntrClear>
    3d50:	e30d3428 	movw	r3, #54312	; 0xd428
    3d54:	e3403001 	movt	r3, #1
    3d58:	e5933000 	ldr	r3, [r3]
    3d5c:	e1a00003 	mov	r0, r3
    3d60:	eb001662 	bl	96f0 <XDcfg_IntrGetStatus>
    3d64:	e50b0008 	str	r0, [fp, #-8]
    3d68:	e51b2008 	ldr	r2, [fp, #-8]
    3d6c:	e30c3840 	movw	r3, #51264	; 0xc840
    3d70:	e3403074 	movt	r3, #116	; 0x74
    3d74:	e0033002 	and	r3, r3, r2
    3d78:	e3530000 	cmp	r3, #0
    3d7c:	0a000001 	beq	3d88 <ClearPcapStatus+0x5c>
    3d80:	e3a03001 	mov	r3, #1
    3d84:	ea00002d 	b	3e40 <ClearPcapStatus+0x114>
    3d88:	e30d3428 	movw	r3, #54312	; 0xd428
    3d8c:	e3403001 	movt	r3, #1
    3d90:	e5933000 	ldr	r3, [r3]
    3d94:	e1a00003 	mov	r0, r3
    3d98:	eb001839 	bl	9e84 <XDcfg_GetStatusRegister>
    3d9c:	e50b000c 	str	r0, [fp, #-12]
    3da0:	e51b300c 	ldr	r3, [fp, #-12]
    3da4:	e3530000 	cmp	r3, #0
    3da8:	aa000001 	bge	3db4 <ClearPcapStatus+0x88>
    3dac:	e3a03015 	mov	r3, #21
    3db0:	ea000022 	b	3e40 <ClearPcapStatus+0x114>
    3db4:	e51b300c 	ldr	r3, [fp, #-12]
    3db8:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
    3dbc:	e3530000 	cmp	r3, #0
    3dc0:	1a000011 	bne	3e0c <ClearPcapStatus+0xe0>
    3dc4:	e30d3428 	movw	r3, #54312	; 0xd428
    3dc8:	e3403001 	movt	r3, #1
    3dcc:	e5933000 	ldr	r3, [r3]
    3dd0:	e1a00003 	mov	r0, r3
    3dd4:	eb001645 	bl	96f0 <XDcfg_IntrGetStatus>
    3dd8:	e50b0008 	str	r0, [fp, #-8]
    3ddc:	e51b3008 	ldr	r3, [fp, #-8]
    3de0:	e2033a02 	and	r3, r3, #8192	; 0x2000
    3de4:	e3530000 	cmp	r3, #0
    3de8:	1a000001 	bne	3df4 <ClearPcapStatus+0xc8>
    3dec:	e3a03001 	mov	r3, #1
    3df0:	ea000012 	b	3e40 <ClearPcapStatus+0x114>
    3df4:	e30d3428 	movw	r3, #54312	; 0xd428
    3df8:	e3403001 	movt	r3, #1
    3dfc:	e5933000 	ldr	r3, [r3]
    3e00:	e3a01a02 	mov	r1, #8192	; 0x2000
    3e04:	e1a00003 	mov	r0, r3
    3e08:	eb001657 	bl	976c <XDcfg_IntrClear>
    3e0c:	e51b300c 	ldr	r3, [fp, #-12]
    3e10:	e2033203 	and	r3, r3, #805306368	; 0x30000000
    3e14:	e3530000 	cmp	r3, #0
    3e18:	0a000007 	beq	3e3c <ClearPcapStatus+0x110>
    3e1c:	e30d3428 	movw	r3, #54312	; 0xd428
    3e20:	e3403001 	movt	r3, #1
    3e24:	e5932000 	ldr	r2, [r3]
    3e28:	e51b300c 	ldr	r3, [fp, #-12]
    3e2c:	e3833203 	orr	r3, r3, #805306368	; 0x30000000
    3e30:	e1a01003 	mov	r1, r3
    3e34:	e1a00002 	mov	r0, r2
    3e38:	eb0017f3 	bl	9e0c <XDcfg_SetStatusRegister>
    3e3c:	e3a03000 	mov	r3, #0
    3e40:	e1a00003 	mov	r0, r3
    3e44:	e24bd004 	sub	sp, fp, #4
    3e48:	e8bd8800 	pop	{fp, pc}

00003e4c <PcapDumpRegisters>:
    3e4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3e50:	e28db000 	add	fp, sp, #0
    3e54:	e320f000 	nop	{0}
    3e58:	e28bd000 	add	sp, fp, #0
    3e5c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3e60:	e12fff1e 	bx	lr

00003e64 <XDcfgPollDone>:
    3e64:	e92d4800 	push	{fp, lr}
    3e68:	e28db004 	add	fp, sp, #4
    3e6c:	e24dd010 	sub	sp, sp, #16
    3e70:	e50b0010 	str	r0, [fp, #-16]
    3e74:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    3e78:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    3e7c:	e50b3008 	str	r3, [fp, #-8]
    3e80:	e3a03000 	mov	r3, #0
    3e84:	e50b300c 	str	r3, [fp, #-12]
    3e88:	e30d3428 	movw	r3, #54312	; 0xd428
    3e8c:	e3403001 	movt	r3, #1
    3e90:	e5933000 	ldr	r3, [r3]
    3e94:	e1a00003 	mov	r0, r3
    3e98:	eb001614 	bl	96f0 <XDcfg_IntrGetStatus>
    3e9c:	e50b000c 	str	r0, [fp, #-12]
    3ea0:	ea000016 	b	3f00 <XDcfgPollDone+0x9c>
    3ea4:	e30d3428 	movw	r3, #54312	; 0xd428
    3ea8:	e3403001 	movt	r3, #1
    3eac:	e5933000 	ldr	r3, [r3]
    3eb0:	e1a00003 	mov	r0, r3
    3eb4:	eb00160d 	bl	96f0 <XDcfg_IntrGetStatus>
    3eb8:	e50b000c 	str	r0, [fp, #-12]
    3ebc:	e51b3008 	ldr	r3, [fp, #-8]
    3ec0:	e2433001 	sub	r3, r3, #1
    3ec4:	e50b3008 	str	r3, [fp, #-8]
    3ec8:	e51b200c 	ldr	r2, [fp, #-12]
    3ecc:	e30c3840 	movw	r3, #51264	; 0xc840
    3ed0:	e3403074 	movt	r3, #116	; 0x74
    3ed4:	e0033002 	and	r3, r3, r2
    3ed8:	e3530000 	cmp	r3, #0
    3edc:	0a000002 	beq	3eec <XDcfgPollDone+0x88>
    3ee0:	ebffffd9 	bl	3e4c <PcapDumpRegisters>
    3ee4:	e3a03001 	mov	r3, #1
    3ee8:	ea000013 	b	3f3c <XDcfgPollDone+0xd8>
    3eec:	e51b3008 	ldr	r3, [fp, #-8]
    3ef0:	e3530000 	cmp	r3, #0
    3ef4:	1a000001 	bne	3f00 <XDcfgPollDone+0x9c>
    3ef8:	e3a03001 	mov	r3, #1
    3efc:	ea00000e 	b	3f3c <XDcfgPollDone+0xd8>
    3f00:	e51b200c 	ldr	r2, [fp, #-12]
    3f04:	e51b3010 	ldr	r3, [fp, #-16]
    3f08:	e0033002 	and	r3, r3, r2
    3f0c:	e51b2010 	ldr	r2, [fp, #-16]
    3f10:	e1520003 	cmp	r2, r3
    3f14:	1affffe2 	bne	3ea4 <XDcfgPollDone+0x40>
    3f18:	e30d3428 	movw	r3, #54312	; 0xd428
    3f1c:	e3403001 	movt	r3, #1
    3f20:	e5930000 	ldr	r0, [r3]
    3f24:	e51b200c 	ldr	r2, [fp, #-12]
    3f28:	e51b3010 	ldr	r3, [fp, #-16]
    3f2c:	e0033002 	and	r3, r3, r2
    3f30:	e1a01003 	mov	r1, r3
    3f34:	eb00160c 	bl	976c <XDcfg_IntrClear>
    3f38:	e3a03000 	mov	r3, #0
    3f3c:	e1a00003 	mov	r0, r3
    3f40:	e24bd004 	sub	sp, fp, #4
    3f44:	e8bd8800 	pop	{fp, pc}

00003f48 <Xil_In32>:
    3f48:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3f4c:	e28db000 	add	fp, sp, #0
    3f50:	e24dd00c 	sub	sp, sp, #12
    3f54:	e50b0008 	str	r0, [fp, #-8]
    3f58:	e51b3008 	ldr	r3, [fp, #-8]
    3f5c:	e5933000 	ldr	r3, [r3]
    3f60:	e1a00003 	mov	r0, r3
    3f64:	e28bd000 	add	sp, fp, #0
    3f68:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3f6c:	e12fff1e 	bx	lr

00003f70 <Xil_Out32>:
    3f70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3f74:	e28db000 	add	fp, sp, #0
    3f78:	e24dd014 	sub	sp, sp, #20
    3f7c:	e50b0010 	str	r0, [fp, #-16]
    3f80:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    3f84:	e51b3010 	ldr	r3, [fp, #-16]
    3f88:	e50b3008 	str	r3, [fp, #-8]
    3f8c:	e51b3008 	ldr	r3, [fp, #-8]
    3f90:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    3f94:	e5832000 	str	r2, [r3]
    3f98:	e320f000 	nop	{0}
    3f9c:	e28bd000 	add	sp, fp, #0
    3fa0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3fa4:	e12fff1e 	bx	lr

00003fa8 <InitQspi>:
    3fa8:	e92d4800 	push	{fp, lr}
    3fac:	e28db004 	add	fp, sp, #4
    3fb0:	e24dd010 	sub	sp, sp, #16
    3fb4:	e30d3468 	movw	r3, #54376	; 0xd468
    3fb8:	e3403001 	movt	r3, #1
    3fbc:	e30d242c 	movw	r2, #54316	; 0xd42c
    3fc0:	e3402001 	movt	r2, #1
    3fc4:	e5832000 	str	r2, [r3]
    3fc8:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    3fcc:	e3403001 	movt	r3, #1
    3fd0:	e3a0233f 	mov	r2, #-67108864	; 0xfc000000
    3fd4:	e5832000 	str	r2, [r3]
    3fd8:	e3a00a0d 	mov	r0, #53248	; 0xd000
    3fdc:	e34e0000 	movt	r0, #57344	; 0xe000
    3fe0:	eb001914 	bl	a438 <XQspiPs_LookupConfig>
    3fe4:	e50b0010 	str	r0, [fp, #-16]
    3fe8:	e51b3010 	ldr	r3, [fp, #-16]
    3fec:	e3530000 	cmp	r3, #0
    3ff0:	1a000001 	bne	3ffc <InitQspi+0x54>
    3ff4:	e3a03001 	mov	r3, #1
    3ff8:	ea00005e 	b	4178 <InitQspi+0x1d0>
    3ffc:	e30d3468 	movw	r3, #54376	; 0xd468
    4000:	e3403001 	movt	r3, #1
    4004:	e5930000 	ldr	r0, [r3]
    4008:	e51b3010 	ldr	r3, [fp, #-16]
    400c:	e5933004 	ldr	r3, [r3, #4]
    4010:	e1a02003 	mov	r2, r3
    4014:	e51b1010 	ldr	r1, [fp, #-16]
    4018:	eb001aa1 	bl	aaa4 <XQspiPs_CfgInitialize>
    401c:	e50b000c 	str	r0, [fp, #-12]
    4020:	e51b300c 	ldr	r3, [fp, #-12]
    4024:	e3530000 	cmp	r3, #0
    4028:	0a000001 	beq	4034 <InitQspi+0x8c>
    402c:	e3a03001 	mov	r3, #1
    4030:	ea000050 	b	4178 <InitQspi+0x1d0>
    4034:	e30d3468 	movw	r3, #54376	; 0xd468
    4038:	e3403001 	movt	r3, #1
    403c:	e5933000 	ldr	r3, [r3]
    4040:	e3a01e11 	mov	r1, #272	; 0x110
    4044:	e1a00003 	mov	r0, r3
    4048:	eb001913 	bl	a49c <XQspiPs_SetOptions>
    404c:	e30d3468 	movw	r3, #54376	; 0xd468
    4050:	e3403001 	movt	r3, #1
    4054:	e5933000 	ldr	r3, [r3]
    4058:	e3a01002 	mov	r1, #2
    405c:	e1a00003 	mov	r0, r3
    4060:	eb001974 	bl	a638 <XQspiPs_SetClkPrescaler>
    4064:	e30d3468 	movw	r3, #54376	; 0xd468
    4068:	e3403001 	movt	r3, #1
    406c:	e5933000 	ldr	r3, [r3]
    4070:	e1a00003 	mov	r0, r3
    4074:	eb001d25 	bl	b510 <XQspiPs_SetSlaveSelect>
    4078:	eb000041 	bl	4184 <FlashReadID>
    407c:	e1a03000 	mov	r3, r0
    4080:	e50b300c 	str	r3, [fp, #-12]
    4084:	e51b300c 	ldr	r3, [fp, #-12]
    4088:	e3530000 	cmp	r3, #0
    408c:	0a000001 	beq	4098 <InitQspi+0xf0>
    4090:	e3a03001 	mov	r3, #1
    4094:	ea000037 	b	4178 <InitQspi+0x1d0>
    4098:	e30d346c 	movw	r3, #54380	; 0xd46c
    409c:	e3403001 	movt	r3, #1
    40a0:	e5933000 	ldr	r3, [r3]
    40a4:	e3530401 	cmp	r3, #16777216	; 0x1000000
    40a8:	8a00001e 	bhi	4128 <InitQspi+0x180>
    40ac:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    40b0:	e3403001 	movt	r3, #1
    40b4:	e3a02001 	mov	r2, #1
    40b8:	e5c32000 	strb	r2, [r3]
    40bc:	e30d3468 	movw	r3, #54376	; 0xd468
    40c0:	e3403001 	movt	r3, #1
    40c4:	e5933000 	ldr	r3, [r3]
    40c8:	e3a01d06 	mov	r1, #384	; 0x180
    40cc:	e1a00003 	mov	r0, r3
    40d0:	eb0018f1 	bl	a49c <XQspiPs_SetOptions>
    40d4:	e300316b 	movw	r3, #363	; 0x16b
    40d8:	e3483000 	movt	r3, #32768	; 0x8000
    40dc:	e50b3008 	str	r3, [fp, #-8]
    40e0:	e320f000 	nop	{0}
    40e4:	e30d3468 	movw	r3, #54376	; 0xd468
    40e8:	e3403001 	movt	r3, #1
    40ec:	e5933000 	ldr	r3, [r3]
    40f0:	e5933004 	ldr	r3, [r3, #4]
    40f4:	e28330a0 	add	r3, r3, #160	; 0xa0
    40f8:	e51b1008 	ldr	r1, [fp, #-8]
    40fc:	e1a00003 	mov	r0, r3
    4100:	ebffff9a 	bl	3f70 <Xil_Out32>
    4104:	e30d3468 	movw	r3, #54376	; 0xd468
    4108:	e3403001 	movt	r3, #1
    410c:	e5933000 	ldr	r3, [r3]
    4110:	e5933004 	ldr	r3, [r3, #4]
    4114:	e2833014 	add	r3, r3, #20
    4118:	e3a01001 	mov	r1, #1
    411c:	e1a00003 	mov	r0, r3
    4120:	ebffff92 	bl	3f70 <Xil_Out32>
    4124:	ea000012 	b	4174 <InitQspi+0x1cc>
    4128:	e300316b 	movw	r3, #363	; 0x16b
    412c:	e50b3008 	str	r3, [fp, #-8]
    4130:	e320f000 	nop	{0}
    4134:	e30d3468 	movw	r3, #54376	; 0xd468
    4138:	e3403001 	movt	r3, #1
    413c:	e5933000 	ldr	r3, [r3]
    4140:	e5933004 	ldr	r3, [r3, #4]
    4144:	e28330a0 	add	r3, r3, #160	; 0xa0
    4148:	e51b1008 	ldr	r1, [fp, #-8]
    414c:	e1a00003 	mov	r0, r3
    4150:	ebffff86 	bl	3f70 <Xil_Out32>
    4154:	e30d3468 	movw	r3, #54376	; 0xd468
    4158:	e3403001 	movt	r3, #1
    415c:	e5933000 	ldr	r3, [r3]
    4160:	e5933004 	ldr	r3, [r3, #4]
    4164:	e2833014 	add	r3, r3, #20
    4168:	e3a01001 	mov	r1, #1
    416c:	e1a00003 	mov	r0, r3
    4170:	ebffff7e 	bl	3f70 <Xil_Out32>
    4174:	e3a03000 	mov	r3, #0
    4178:	e1a00003 	mov	r0, r3
    417c:	e24bd004 	sub	sp, fp, #4
    4180:	e8bd8800 	pop	{fp, pc}

00004184 <FlashReadID>:
    4184:	e92d4800 	push	{fp, lr}
    4188:	e28db004 	add	fp, sp, #4
    418c:	e24dd008 	sub	sp, sp, #8
    4190:	e30e347c 	movw	r3, #58492	; 0xe47c
    4194:	e3403001 	movt	r3, #1
    4198:	e3e02060 	mvn	r2, #96	; 0x60
    419c:	e5c32000 	strb	r2, [r3]
    41a0:	e30e347c 	movw	r3, #58492	; 0xe47c
    41a4:	e3403001 	movt	r3, #1
    41a8:	e3a02000 	mov	r2, #0
    41ac:	e5c32001 	strb	r2, [r3, #1]
    41b0:	e30e347c 	movw	r3, #58492	; 0xe47c
    41b4:	e3403001 	movt	r3, #1
    41b8:	e3a02000 	mov	r2, #0
    41bc:	e5c32002 	strb	r2, [r3, #2]
    41c0:	e30e347c 	movw	r3, #58492	; 0xe47c
    41c4:	e3403001 	movt	r3, #1
    41c8:	e3a02000 	mov	r2, #0
    41cc:	e5c32003 	strb	r2, [r3, #3]
    41d0:	e30d3468 	movw	r3, #54376	; 0xd468
    41d4:	e3403001 	movt	r3, #1
    41d8:	e5930000 	ldr	r0, [r3]
    41dc:	e3a03004 	mov	r3, #4
    41e0:	e30d2474 	movw	r2, #54388	; 0xd474
    41e4:	e3402001 	movt	r2, #1
    41e8:	e30e147c 	movw	r1, #58492	; 0xe47c
    41ec:	e3401001 	movt	r1, #1
    41f0:	eb001b3d 	bl	aeec <XQspiPs_PolledTransfer>
    41f4:	e1a03000 	mov	r3, r0
    41f8:	e50b3008 	str	r3, [fp, #-8]
    41fc:	e51b3008 	ldr	r3, [fp, #-8]
    4200:	e3530000 	cmp	r3, #0
    4204:	0a000001 	beq	4210 <FlashReadID+0x8c>
    4208:	e3a03001 	mov	r3, #1
    420c:	ea00009e 	b	448c <FlashReadID+0x308>
    4210:	e30d3474 	movw	r3, #54388	; 0xd474
    4214:	e3403001 	movt	r3, #1
    4218:	e5d33001 	ldrb	r3, [r3, #1]
    421c:	e3530020 	cmp	r3, #32
    4220:	1a000004 	bne	4238 <FlashReadID+0xb4>
    4224:	e30d3470 	movw	r3, #54384	; 0xd470
    4228:	e3403001 	movt	r3, #1
    422c:	e3a02020 	mov	r2, #32
    4230:	e5832000 	str	r2, [r3]
    4234:	ea000026 	b	42d4 <FlashReadID+0x150>
    4238:	e30d3474 	movw	r3, #54388	; 0xd474
    423c:	e3403001 	movt	r3, #1
    4240:	e5d33001 	ldrb	r3, [r3, #1]
    4244:	e3530001 	cmp	r3, #1
    4248:	1a000004 	bne	4260 <FlashReadID+0xdc>
    424c:	e30d3470 	movw	r3, #54384	; 0xd470
    4250:	e3403001 	movt	r3, #1
    4254:	e3a02001 	mov	r2, #1
    4258:	e5832000 	str	r2, [r3]
    425c:	ea00001c 	b	42d4 <FlashReadID+0x150>
    4260:	e30d3474 	movw	r3, #54388	; 0xd474
    4264:	e3403001 	movt	r3, #1
    4268:	e5d33001 	ldrb	r3, [r3, #1]
    426c:	e35300ef 	cmp	r3, #239	; 0xef
    4270:	1a000004 	bne	4288 <FlashReadID+0x104>
    4274:	e30d3470 	movw	r3, #54384	; 0xd470
    4278:	e3403001 	movt	r3, #1
    427c:	e3a020ef 	mov	r2, #239	; 0xef
    4280:	e5832000 	str	r2, [r3]
    4284:	ea000012 	b	42d4 <FlashReadID+0x150>
    4288:	e30d3474 	movw	r3, #54388	; 0xd474
    428c:	e3403001 	movt	r3, #1
    4290:	e5d33001 	ldrb	r3, [r3, #1]
    4294:	e35300c2 	cmp	r3, #194	; 0xc2
    4298:	1a000004 	bne	42b0 <FlashReadID+0x12c>
    429c:	e30d3470 	movw	r3, #54384	; 0xd470
    42a0:	e3403001 	movt	r3, #1
    42a4:	e3a020c2 	mov	r2, #194	; 0xc2
    42a8:	e5832000 	str	r2, [r3]
    42ac:	ea000008 	b	42d4 <FlashReadID+0x150>
    42b0:	e30d3474 	movw	r3, #54388	; 0xd474
    42b4:	e3403001 	movt	r3, #1
    42b8:	e5d33001 	ldrb	r3, [r3, #1]
    42bc:	e353009d 	cmp	r3, #157	; 0x9d
    42c0:	1a000003 	bne	42d4 <FlashReadID+0x150>
    42c4:	e30d3470 	movw	r3, #54384	; 0xd470
    42c8:	e3403001 	movt	r3, #1
    42cc:	e3a0209d 	mov	r2, #157	; 0x9d
    42d0:	e5832000 	str	r2, [r3]
    42d4:	e30d3474 	movw	r3, #54388	; 0xd474
    42d8:	e3403001 	movt	r3, #1
    42dc:	e5d33003 	ldrb	r3, [r3, #3]
    42e0:	e3530014 	cmp	r3, #20
    42e4:	1a000004 	bne	42fc <FlashReadID+0x178>
    42e8:	e30d346c 	movw	r3, #54380	; 0xd46c
    42ec:	e3403001 	movt	r3, #1
    42f0:	e3a02601 	mov	r2, #1048576	; 0x100000
    42f4:	e5832000 	str	r2, [r3]
    42f8:	ea000062 	b	4488 <FlashReadID+0x304>
    42fc:	e30d3474 	movw	r3, #54388	; 0xd474
    4300:	e3403001 	movt	r3, #1
    4304:	e5d33003 	ldrb	r3, [r3, #3]
    4308:	e3530015 	cmp	r3, #21
    430c:	1a000004 	bne	4324 <FlashReadID+0x1a0>
    4310:	e30d346c 	movw	r3, #54380	; 0xd46c
    4314:	e3403001 	movt	r3, #1
    4318:	e3a02602 	mov	r2, #2097152	; 0x200000
    431c:	e5832000 	str	r2, [r3]
    4320:	ea000058 	b	4488 <FlashReadID+0x304>
    4324:	e30d3474 	movw	r3, #54388	; 0xd474
    4328:	e3403001 	movt	r3, #1
    432c:	e5d33003 	ldrb	r3, [r3, #3]
    4330:	e3530016 	cmp	r3, #22
    4334:	1a000004 	bne	434c <FlashReadID+0x1c8>
    4338:	e30d346c 	movw	r3, #54380	; 0xd46c
    433c:	e3403001 	movt	r3, #1
    4340:	e3a02501 	mov	r2, #4194304	; 0x400000
    4344:	e5832000 	str	r2, [r3]
    4348:	ea00004e 	b	4488 <FlashReadID+0x304>
    434c:	e30d3474 	movw	r3, #54388	; 0xd474
    4350:	e3403001 	movt	r3, #1
    4354:	e5d33003 	ldrb	r3, [r3, #3]
    4358:	e3530017 	cmp	r3, #23
    435c:	1a000004 	bne	4374 <FlashReadID+0x1f0>
    4360:	e30d346c 	movw	r3, #54380	; 0xd46c
    4364:	e3403001 	movt	r3, #1
    4368:	e3a02502 	mov	r2, #8388608	; 0x800000
    436c:	e5832000 	str	r2, [r3]
    4370:	ea000044 	b	4488 <FlashReadID+0x304>
    4374:	e30d3474 	movw	r3, #54388	; 0xd474
    4378:	e3403001 	movt	r3, #1
    437c:	e5d33003 	ldrb	r3, [r3, #3]
    4380:	e3530018 	cmp	r3, #24
    4384:	1a000004 	bne	439c <FlashReadID+0x218>
    4388:	e30d346c 	movw	r3, #54380	; 0xd46c
    438c:	e3403001 	movt	r3, #1
    4390:	e3a02401 	mov	r2, #16777216	; 0x1000000
    4394:	e5832000 	str	r2, [r3]
    4398:	ea00003a 	b	4488 <FlashReadID+0x304>
    439c:	e30d3474 	movw	r3, #54388	; 0xd474
    43a0:	e3403001 	movt	r3, #1
    43a4:	e5d33003 	ldrb	r3, [r3, #3]
    43a8:	e3530019 	cmp	r3, #25
    43ac:	1a000004 	bne	43c4 <FlashReadID+0x240>
    43b0:	e30d346c 	movw	r3, #54380	; 0xd46c
    43b4:	e3403001 	movt	r3, #1
    43b8:	e3a02402 	mov	r2, #33554432	; 0x2000000
    43bc:	e5832000 	str	r2, [r3]
    43c0:	ea000030 	b	4488 <FlashReadID+0x304>
    43c4:	e30d3474 	movw	r3, #54388	; 0xd474
    43c8:	e3403001 	movt	r3, #1
    43cc:	e5d33003 	ldrb	r3, [r3, #3]
    43d0:	e3530020 	cmp	r3, #32
    43d4:	0a000009 	beq	4400 <FlashReadID+0x27c>
    43d8:	e30d3474 	movw	r3, #54388	; 0xd474
    43dc:	e3403001 	movt	r3, #1
    43e0:	e5d33003 	ldrb	r3, [r3, #3]
    43e4:	e353003a 	cmp	r3, #58	; 0x3a
    43e8:	0a000004 	beq	4400 <FlashReadID+0x27c>
    43ec:	e30d3474 	movw	r3, #54388	; 0xd474
    43f0:	e3403001 	movt	r3, #1
    43f4:	e5d33003 	ldrb	r3, [r3, #3]
    43f8:	e353001a 	cmp	r3, #26
    43fc:	1a000004 	bne	4414 <FlashReadID+0x290>
    4400:	e30d346c 	movw	r3, #54380	; 0xd46c
    4404:	e3403001 	movt	r3, #1
    4408:	e3a02301 	mov	r2, #67108864	; 0x4000000
    440c:	e5832000 	str	r2, [r3]
    4410:	ea00001c 	b	4488 <FlashReadID+0x304>
    4414:	e30d3474 	movw	r3, #54388	; 0xd474
    4418:	e3403001 	movt	r3, #1
    441c:	e5d33003 	ldrb	r3, [r3, #3]
    4420:	e3530021 	cmp	r3, #33	; 0x21
    4424:	0a000004 	beq	443c <FlashReadID+0x2b8>
    4428:	e30d3474 	movw	r3, #54388	; 0xd474
    442c:	e3403001 	movt	r3, #1
    4430:	e5d33003 	ldrb	r3, [r3, #3]
    4434:	e353001b 	cmp	r3, #27
    4438:	1a000004 	bne	4450 <FlashReadID+0x2cc>
    443c:	e30d346c 	movw	r3, #54380	; 0xd46c
    4440:	e3403001 	movt	r3, #1
    4444:	e3a02302 	mov	r2, #134217728	; 0x8000000
    4448:	e5832000 	str	r2, [r3]
    444c:	ea00000d 	b	4488 <FlashReadID+0x304>
    4450:	e30d3474 	movw	r3, #54388	; 0xd474
    4454:	e3403001 	movt	r3, #1
    4458:	e5d33003 	ldrb	r3, [r3, #3]
    445c:	e3530022 	cmp	r3, #34	; 0x22
    4460:	0a000004 	beq	4478 <FlashReadID+0x2f4>
    4464:	e30d3474 	movw	r3, #54388	; 0xd474
    4468:	e3403001 	movt	r3, #1
    446c:	e5d33003 	ldrb	r3, [r3, #3]
    4470:	e353001c 	cmp	r3, #28
    4474:	1a000003 	bne	4488 <FlashReadID+0x304>
    4478:	e30d346c 	movw	r3, #54380	; 0xd46c
    447c:	e3403001 	movt	r3, #1
    4480:	e3a02201 	mov	r2, #268435456	; 0x10000000
    4484:	e5832000 	str	r2, [r3]
    4488:	e3a03000 	mov	r3, #0
    448c:	e1a00003 	mov	r0, r3
    4490:	e24bd004 	sub	sp, fp, #4
    4494:	e8bd8800 	pop	{fp, pc}

00004498 <FlashRead>:
    4498:	e92d4800 	push	{fp, lr}
    449c:	e28db004 	add	fp, sp, #4
    44a0:	e24dd010 	sub	sp, sp, #16
    44a4:	e50b0010 	str	r0, [fp, #-16]
    44a8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    44ac:	e30d3468 	movw	r3, #54376	; 0xd468
    44b0:	e3403001 	movt	r3, #1
    44b4:	e5933000 	ldr	r3, [r3]
    44b8:	e5933004 	ldr	r3, [r3, #4]
    44bc:	e28330a0 	add	r3, r3, #160	; 0xa0
    44c0:	e1a00003 	mov	r0, r3
    44c4:	ebfffe9f 	bl	3f48 <Xil_In32>
    44c8:	e50b0008 	str	r0, [fp, #-8]
    44cc:	e51b3008 	ldr	r3, [fp, #-8]
    44d0:	e54b3009 	strb	r3, [fp, #-9]
    44d4:	e30e347c 	movw	r3, #58492	; 0xe47c
    44d8:	e3403001 	movt	r3, #1
    44dc:	e55b2009 	ldrb	r2, [fp, #-9]
    44e0:	e5c32000 	strb	r2, [r3]
    44e4:	e51b3010 	ldr	r3, [fp, #-16]
    44e8:	e1a03823 	lsr	r3, r3, #16
    44ec:	e6ef2073 	uxtb	r2, r3
    44f0:	e30e347c 	movw	r3, #58492	; 0xe47c
    44f4:	e3403001 	movt	r3, #1
    44f8:	e5c32001 	strb	r2, [r3, #1]
    44fc:	e51b3010 	ldr	r3, [fp, #-16]
    4500:	e1a03423 	lsr	r3, r3, #8
    4504:	e6ef2073 	uxtb	r2, r3
    4508:	e30e347c 	movw	r3, #58492	; 0xe47c
    450c:	e3403001 	movt	r3, #1
    4510:	e5c32002 	strb	r2, [r3, #2]
    4514:	e51b3010 	ldr	r3, [fp, #-16]
    4518:	e6ef2073 	uxtb	r2, r3
    451c:	e30e347c 	movw	r3, #58492	; 0xe47c
    4520:	e3403001 	movt	r3, #1
    4524:	e5c32003 	strb	r2, [r3, #3]
    4528:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    452c:	e2833001 	add	r3, r3, #1
    4530:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4534:	e30d3468 	movw	r3, #54376	; 0xd468
    4538:	e3403001 	movt	r3, #1
    453c:	e5930000 	ldr	r0, [r3]
    4540:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4544:	e2833004 	add	r3, r3, #4
    4548:	e30d2474 	movw	r2, #54388	; 0xd474
    454c:	e3402001 	movt	r2, #1
    4550:	e30e147c 	movw	r1, #58492	; 0xe47c
    4554:	e3401001 	movt	r1, #1
    4558:	eb001a63 	bl	aeec <XQspiPs_PolledTransfer>
    455c:	e320f000 	nop	{0}
    4560:	e24bd004 	sub	sp, fp, #4
    4564:	e8bd8800 	pop	{fp, pc}

00004568 <QspiAccess>:
    4568:	e92d4800 	push	{fp, lr}
    456c:	e28db004 	add	fp, sp, #4
    4570:	e24dd028 	sub	sp, sp, #40	; 0x28
    4574:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    4578:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    457c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    4580:	e3a03000 	mov	r3, #0
    4584:	e50b3010 	str	r3, [fp, #-16]
    4588:	e3a03000 	mov	r3, #0
    458c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4590:	e3a03001 	mov	r3, #1
    4594:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    4598:	e30d33fc 	movw	r3, #54268	; 0xd3fc
    459c:	e3403001 	movt	r3, #1
    45a0:	e5d33000 	ldrb	r3, [r3]
    45a4:	e3530001 	cmp	r3, #1
    45a8:	1a000011 	bne	45f4 <QspiAccess+0x8c>
    45ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    45b0:	e2033003 	and	r3, r3, #3
    45b4:	e3530000 	cmp	r3, #0
    45b8:	0a000003 	beq	45cc <QspiAccess+0x64>
    45bc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    45c0:	e3c33003 	bic	r3, r3, #3
    45c4:	e2833004 	add	r3, r3, #4
    45c8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    45cc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    45d0:	e30d33f4 	movw	r3, #54260	; 0xd3f4
    45d4:	e3403001 	movt	r3, #1
    45d8:	e5932000 	ldr	r2, [r3]
    45dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    45e0:	e0823003 	add	r3, r2, r3
    45e4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    45e8:	e1a01003 	mov	r1, r3
    45ec:	eb0033f3 	bl	115c0 <memcpy>
    45f0:	ea00004d 	b	472c <QspiAccess+0x1c4>
    45f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    45f8:	e50b3008 	str	r3, [fp, #-8]
    45fc:	ea00003f 	b	4700 <QspiAccess+0x198>
    4600:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    4604:	e3530a01 	cmp	r3, #4096	; 0x1000
    4608:	9a000002 	bls	4618 <QspiAccess+0xb0>
    460c:	e3a03a01 	mov	r3, #4096	; 0x1000
    4610:	e50b3010 	str	r3, [fp, #-16]
    4614:	ea000001 	b	4620 <QspiAccess+0xb8>
    4618:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    461c:	e50b3010 	str	r3, [fp, #-16]
    4620:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4624:	e3530401 	cmp	r3, #16777216	; 0x1000000
    4628:	3a000011 	bcc	4674 <QspiAccess+0x10c>
    462c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
    4630:	e3530001 	cmp	r3, #1
    4634:	1a00000e 	bne	4674 <QspiAccess+0x10c>
    4638:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    463c:	e1a03c23 	lsr	r3, r3, #24
    4640:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4644:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4648:	e6ef3073 	uxtb	r3, r3
    464c:	e1a00003 	mov	r0, r3
    4650:	eb00003a 	bl	4740 <SendBankSelect>
    4654:	e50b000c 	str	r0, [fp, #-12]
    4658:	e51b300c 	ldr	r3, [fp, #-12]
    465c:	e3530000 	cmp	r3, #0
    4660:	0a000001 	beq	466c <QspiAccess+0x104>
    4664:	e3a03001 	mov	r3, #1
    4668:	ea000030 	b	4730 <QspiAccess+0x1c8>
    466c:	e3a03000 	mov	r3, #0
    4670:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    4674:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    4678:	e51b3010 	ldr	r3, [fp, #-16]
    467c:	e0822003 	add	r2, r2, r3
    4680:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4684:	e0233002 	eor	r3, r3, r2
    4688:	e203340f 	and	r3, r3, #251658240	; 0xf000000
    468c:	e3530000 	cmp	r3, #0
    4690:	0a000007 	beq	46b4 <QspiAccess+0x14c>
    4694:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4698:	e203240f 	and	r2, r3, #251658240	; 0xf000000
    469c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    46a0:	e0423003 	sub	r3, r2, r3
    46a4:	e2833401 	add	r3, r3, #16777216	; 0x1000000
    46a8:	e50b3010 	str	r3, [fp, #-16]
    46ac:	e3a03001 	mov	r3, #1
    46b0:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    46b4:	e51b1010 	ldr	r1, [fp, #-16]
    46b8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    46bc:	ebffff75 	bl	4498 <FlashRead>
    46c0:	e51b2010 	ldr	r2, [fp, #-16]
    46c4:	e59f1070 	ldr	r1, [pc, #112]	; 473c <QspiAccess+0x1d4>
    46c8:	e51b0008 	ldr	r0, [fp, #-8]
    46cc:	eb0033bb 	bl	115c0 <memcpy>
    46d0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    46d4:	e51b3010 	ldr	r3, [fp, #-16]
    46d8:	e0423003 	sub	r3, r2, r3
    46dc:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    46e0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    46e4:	e51b3010 	ldr	r3, [fp, #-16]
    46e8:	e0823003 	add	r3, r2, r3
    46ec:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    46f0:	e51b2008 	ldr	r2, [fp, #-8]
    46f4:	e51b3010 	ldr	r3, [fp, #-16]
    46f8:	e0823003 	add	r3, r2, r3
    46fc:	e50b3008 	str	r3, [fp, #-8]
    4700:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    4704:	e3530000 	cmp	r3, #0
    4708:	1affffbc 	bne	4600 <QspiAccess+0x98>
    470c:	e3a00000 	mov	r0, #0
    4710:	eb00000a 	bl	4740 <SendBankSelect>
    4714:	e50b000c 	str	r0, [fp, #-12]
    4718:	e51b300c 	ldr	r3, [fp, #-12]
    471c:	e3530000 	cmp	r3, #0
    4720:	0a000001 	beq	472c <QspiAccess+0x1c4>
    4724:	e3a03001 	mov	r3, #1
    4728:	ea000000 	b	4730 <QspiAccess+0x1c8>
    472c:	e3a03000 	mov	r3, #0
    4730:	e1a00003 	mov	r0, r3
    4734:	e24bd004 	sub	sp, fp, #4
    4738:	e8bd8800 	pop	{fp, pc}
    473c:	0001d479 	.word	0x0001d479

00004740 <SendBankSelect>:
    4740:	e92d4800 	push	{fp, lr}
    4744:	e28db004 	add	fp, sp, #4
    4748:	e24dd010 	sub	sp, sp, #16
    474c:	e1a03000 	mov	r3, r0
    4750:	e54b300d 	strb	r3, [fp, #-13]
    4754:	e30d3470 	movw	r3, #54384	; 0xd470
    4758:	e3403001 	movt	r3, #1
    475c:	e5933000 	ldr	r3, [r3]
    4760:	e3530020 	cmp	r3, #32
    4764:	0a000004 	beq	477c <SendBankSelect+0x3c>
    4768:	e30d3470 	movw	r3, #54384	; 0xd470
    476c:	e3403001 	movt	r3, #1
    4770:	e5933000 	ldr	r3, [r3]
    4774:	e35300c2 	cmp	r3, #194	; 0xc2
    4778:	1a000029 	bne	4824 <SendBankSelect+0xe4>
    477c:	e30e347c 	movw	r3, #58492	; 0xe47c
    4780:	e3403001 	movt	r3, #1
    4784:	e3a02006 	mov	r2, #6
    4788:	e5c32000 	strb	r2, [r3]
    478c:	e30d3468 	movw	r3, #54376	; 0xd468
    4790:	e3403001 	movt	r3, #1
    4794:	e5930000 	ldr	r0, [r3]
    4798:	e3a03001 	mov	r3, #1
    479c:	e3a02000 	mov	r2, #0
    47a0:	e30e147c 	movw	r1, #58492	; 0xe47c
    47a4:	e3401001 	movt	r1, #1
    47a8:	eb0019cf 	bl	aeec <XQspiPs_PolledTransfer>
    47ac:	e1a03000 	mov	r3, r0
    47b0:	e50b3008 	str	r3, [fp, #-8]
    47b4:	e51b3008 	ldr	r3, [fp, #-8]
    47b8:	e3530000 	cmp	r3, #0
    47bc:	0a000001 	beq	47c8 <SendBankSelect+0x88>
    47c0:	e3a03001 	mov	r3, #1
    47c4:	ea00007a 	b	49b4 <SendBankSelect+0x274>
    47c8:	e30e347c 	movw	r3, #58492	; 0xe47c
    47cc:	e3403001 	movt	r3, #1
    47d0:	e3e0203a 	mvn	r2, #58	; 0x3a
    47d4:	e5c32000 	strb	r2, [r3]
    47d8:	e30e347c 	movw	r3, #58492	; 0xe47c
    47dc:	e3403001 	movt	r3, #1
    47e0:	e55b200d 	ldrb	r2, [fp, #-13]
    47e4:	e5c32001 	strb	r2, [r3, #1]
    47e8:	e30d3468 	movw	r3, #54376	; 0xd468
    47ec:	e3403001 	movt	r3, #1
    47f0:	e5930000 	ldr	r0, [r3]
    47f4:	e3a03002 	mov	r3, #2
    47f8:	e3a02000 	mov	r2, #0
    47fc:	e30e147c 	movw	r1, #58492	; 0xe47c
    4800:	e3401001 	movt	r1, #1
    4804:	eb0019b8 	bl	aeec <XQspiPs_PolledTransfer>
    4808:	e1a03000 	mov	r3, r0
    480c:	e50b3008 	str	r3, [fp, #-8]
    4810:	e51b3008 	ldr	r3, [fp, #-8]
    4814:	e3530000 	cmp	r3, #0
    4818:	0a000001 	beq	4824 <SendBankSelect+0xe4>
    481c:	e3a03001 	mov	r3, #1
    4820:	ea000063 	b	49b4 <SendBankSelect+0x274>
    4824:	e30d3470 	movw	r3, #54384	; 0xd470
    4828:	e3403001 	movt	r3, #1
    482c:	e5933000 	ldr	r3, [r3]
    4830:	e3530001 	cmp	r3, #1
    4834:	1a000016 	bne	4894 <SendBankSelect+0x154>
    4838:	e30e347c 	movw	r3, #58492	; 0xe47c
    483c:	e3403001 	movt	r3, #1
    4840:	e3a02017 	mov	r2, #23
    4844:	e5c32000 	strb	r2, [r3]
    4848:	e30e347c 	movw	r3, #58492	; 0xe47c
    484c:	e3403001 	movt	r3, #1
    4850:	e55b200d 	ldrb	r2, [fp, #-13]
    4854:	e5c32001 	strb	r2, [r3, #1]
    4858:	e30d3468 	movw	r3, #54376	; 0xd468
    485c:	e3403001 	movt	r3, #1
    4860:	e5930000 	ldr	r0, [r3]
    4864:	e3a03002 	mov	r3, #2
    4868:	e3a02000 	mov	r2, #0
    486c:	e30e147c 	movw	r1, #58492	; 0xe47c
    4870:	e3401001 	movt	r1, #1
    4874:	eb00199c 	bl	aeec <XQspiPs_PolledTransfer>
    4878:	e1a03000 	mov	r3, r0
    487c:	e50b3008 	str	r3, [fp, #-8]
    4880:	e51b3008 	ldr	r3, [fp, #-8]
    4884:	e3530000 	cmp	r3, #0
    4888:	0a000001 	beq	4894 <SendBankSelect+0x154>
    488c:	e3a03001 	mov	r3, #1
    4890:	ea000047 	b	49b4 <SendBankSelect+0x274>
    4894:	e30d3470 	movw	r3, #54384	; 0xd470
    4898:	e3403001 	movt	r3, #1
    489c:	e5933000 	ldr	r3, [r3]
    48a0:	e3530001 	cmp	r3, #1
    48a4:	1a000017 	bne	4908 <SendBankSelect+0x1c8>
    48a8:	e30e347c 	movw	r3, #58492	; 0xe47c
    48ac:	e3403001 	movt	r3, #1
    48b0:	e3a02016 	mov	r2, #22
    48b4:	e5c32000 	strb	r2, [r3]
    48b8:	e30e347c 	movw	r3, #58492	; 0xe47c
    48bc:	e3403001 	movt	r3, #1
    48c0:	e3a02000 	mov	r2, #0
    48c4:	e5c32001 	strb	r2, [r3, #1]
    48c8:	e30d3468 	movw	r3, #54376	; 0xd468
    48cc:	e3403001 	movt	r3, #1
    48d0:	e5930000 	ldr	r0, [r3]
    48d4:	e3a03002 	mov	r3, #2
    48d8:	e30d2474 	movw	r2, #54388	; 0xd474
    48dc:	e3402001 	movt	r2, #1
    48e0:	e30e147c 	movw	r1, #58492	; 0xe47c
    48e4:	e3401001 	movt	r1, #1
    48e8:	eb00197f 	bl	aeec <XQspiPs_PolledTransfer>
    48ec:	e1a03000 	mov	r3, r0
    48f0:	e50b3008 	str	r3, [fp, #-8]
    48f4:	e51b3008 	ldr	r3, [fp, #-8]
    48f8:	e3530000 	cmp	r3, #0
    48fc:	0a000001 	beq	4908 <SendBankSelect+0x1c8>
    4900:	e3a03001 	mov	r3, #1
    4904:	ea00002a 	b	49b4 <SendBankSelect+0x274>
    4908:	e30d3470 	movw	r3, #54384	; 0xd470
    490c:	e3403001 	movt	r3, #1
    4910:	e5933000 	ldr	r3, [r3]
    4914:	e3530020 	cmp	r3, #32
    4918:	0a000004 	beq	4930 <SendBankSelect+0x1f0>
    491c:	e30d3470 	movw	r3, #54384	; 0xd470
    4920:	e3403001 	movt	r3, #1
    4924:	e5933000 	ldr	r3, [r3]
    4928:	e35300c2 	cmp	r3, #194	; 0xc2
    492c:	1a000017 	bne	4990 <SendBankSelect+0x250>
    4930:	e30e347c 	movw	r3, #58492	; 0xe47c
    4934:	e3403001 	movt	r3, #1
    4938:	e3e02037 	mvn	r2, #55	; 0x37
    493c:	e5c32000 	strb	r2, [r3]
    4940:	e30e347c 	movw	r3, #58492	; 0xe47c
    4944:	e3403001 	movt	r3, #1
    4948:	e3a02000 	mov	r2, #0
    494c:	e5c32001 	strb	r2, [r3, #1]
    4950:	e30d3468 	movw	r3, #54376	; 0xd468
    4954:	e3403001 	movt	r3, #1
    4958:	e5930000 	ldr	r0, [r3]
    495c:	e3a03002 	mov	r3, #2
    4960:	e30d2474 	movw	r2, #54388	; 0xd474
    4964:	e3402001 	movt	r2, #1
    4968:	e30e147c 	movw	r1, #58492	; 0xe47c
    496c:	e3401001 	movt	r1, #1
    4970:	eb00195d 	bl	aeec <XQspiPs_PolledTransfer>
    4974:	e1a03000 	mov	r3, r0
    4978:	e50b3008 	str	r3, [fp, #-8]
    497c:	e51b3008 	ldr	r3, [fp, #-8]
    4980:	e3530000 	cmp	r3, #0
    4984:	0a000001 	beq	4990 <SendBankSelect+0x250>
    4988:	e3a03001 	mov	r3, #1
    498c:	ea000008 	b	49b4 <SendBankSelect+0x274>
    4990:	e30d3474 	movw	r3, #54388	; 0xd474
    4994:	e3403001 	movt	r3, #1
    4998:	e5d33001 	ldrb	r3, [r3, #1]
    499c:	e55b200d 	ldrb	r2, [fp, #-13]
    49a0:	e1520003 	cmp	r2, r3
    49a4:	0a000001 	beq	49b0 <SendBankSelect+0x270>
    49a8:	e3a03001 	mov	r3, #1
    49ac:	ea000000 	b	49b4 <SendBankSelect+0x274>
    49b0:	e3a03000 	mov	r3, #0
    49b4:	e1a00003 	mov	r0, r3
    49b8:	e24bd004 	sub	sp, fp, #4
    49bc:	e8bd8800 	pop	{fp, pc}

000049c0 <InitSD>:
    49c0:	e92d4800 	push	{fp, lr}
    49c4:	e28db004 	add	fp, sp, #4
    49c8:	e24dd010 	sub	sp, sp, #16
    49cc:	e50b0010 	str	r0, [fp, #-16]
    49d0:	e3013f48 	movw	r3, #8008	; 0x1f48
    49d4:	e3403001 	movt	r3, #1
    49d8:	e50b3008 	str	r3, [fp, #-8]
    49dc:	e3a02000 	mov	r2, #0
    49e0:	e51b1008 	ldr	r1, [fp, #-8]
    49e4:	e30e06e0 	movw	r0, #59104	; 0xe6e0
    49e8:	e3400001 	movt	r0, #1
    49ec:	eb0008a9 	bl	6c98 <f_mount>
    49f0:	e1a03000 	mov	r3, r0
    49f4:	e54b3009 	strb	r3, [fp, #-9]
    49f8:	e55b3009 	ldrb	r3, [fp, #-9]
    49fc:	e3530000 	cmp	r3, #0
    4a00:	0a000001 	beq	4a0c <InitSD+0x4c>
    4a04:	e3a03001 	mov	r3, #1
    4a08:	ea00001d 	b	4a84 <InitSD+0xc4>
    4a0c:	e51b1010 	ldr	r1, [fp, #-16]
    4a10:	e30e0920 	movw	r0, #59680	; 0xe920
    4a14:	e3400001 	movt	r0, #1
    4a18:	ebfff4ae 	bl	1cd8 <strcpy_rom>
    4a1c:	e30233d8 	movw	r3, #9176	; 0x23d8
    4a20:	e3403001 	movt	r3, #1
    4a24:	e30e2920 	movw	r2, #59680	; 0xe920
    4a28:	e3402001 	movt	r2, #1
    4a2c:	e5832000 	str	r2, [r3]
    4a30:	e30d23f4 	movw	r2, #54260	; 0xd3f4
    4a34:	e3402001 	movt	r2, #1
    4a38:	e3a03000 	mov	r3, #0
    4a3c:	e34e3010 	movt	r3, #57360	; 0xe010
    4a40:	e5823000 	str	r3, [r2]
    4a44:	e30233d8 	movw	r3, #9176	; 0x23d8
    4a48:	e3403001 	movt	r3, #1
    4a4c:	e5933000 	ldr	r3, [r3]
    4a50:	e3a02001 	mov	r2, #1
    4a54:	e1a01003 	mov	r1, r3
    4a58:	e30e04a0 	movw	r0, #58528	; 0xe4a0
    4a5c:	e3400001 	movt	r0, #1
    4a60:	eb0008af 	bl	6d24 <f_open>
    4a64:	e1a03000 	mov	r3, r0
    4a68:	e54b3009 	strb	r3, [fp, #-9]
    4a6c:	e55b3009 	ldrb	r3, [fp, #-9]
    4a70:	e3530000 	cmp	r3, #0
    4a74:	0a000001 	beq	4a80 <InitSD+0xc0>
    4a78:	e3a03001 	mov	r3, #1
    4a7c:	ea000000 	b	4a84 <InitSD+0xc4>
    4a80:	e3a03000 	mov	r3, #0
    4a84:	e1a00003 	mov	r0, r3
    4a88:	e24bd004 	sub	sp, fp, #4
    4a8c:	e8bd8800 	pop	{fp, pc}

00004a90 <SDAccess>:
    4a90:	e92d4800 	push	{fp, lr}
    4a94:	e28db004 	add	fp, sp, #4
    4a98:	e24dd018 	sub	sp, sp, #24
    4a9c:	e50b0010 	str	r0, [fp, #-16]
    4aa0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    4aa4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    4aa8:	e51b1010 	ldr	r1, [fp, #-16]
    4aac:	e30e04a0 	movw	r0, #58528	; 0xe4a0
    4ab0:	e3400001 	movt	r0, #1
    4ab4:	eb000b24 	bl	774c <f_lseek>
    4ab8:	e1a03000 	mov	r3, r0
    4abc:	e54b3005 	strb	r3, [fp, #-5]
    4ac0:	e55b3005 	ldrb	r3, [fp, #-5]
    4ac4:	e3530000 	cmp	r3, #0
    4ac8:	0a000001 	beq	4ad4 <SDAccess+0x44>
    4acc:	e3a03001 	mov	r3, #1
    4ad0:	ea000008 	b	4af8 <SDAccess+0x68>
    4ad4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    4ad8:	e24b300c 	sub	r3, fp, #12
    4adc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    4ae0:	e30e04a0 	movw	r0, #58528	; 0xe4a0
    4ae4:	e3400001 	movt	r0, #1
    4ae8:	eb000944 	bl	7000 <f_read>
    4aec:	e1a03000 	mov	r3, r0
    4af0:	e54b3005 	strb	r3, [fp, #-5]
    4af4:	e3a03000 	mov	r3, #0
    4af8:	e1a00003 	mov	r0, r3
    4afc:	e24bd004 	sub	sp, fp, #4
    4b00:	e8bd8800 	pop	{fp, pc}

00004b04 <ReleaseSD>:
    4b04:	e92d4800 	push	{fp, lr}
    4b08:	e28db004 	add	fp, sp, #4
    4b0c:	e30e04a0 	movw	r0, #58528	; 0xe4a0
    4b10:	e3400001 	movt	r0, #1
    4b14:	eb000afd 	bl	7710 <f_close>
    4b18:	e320f000 	nop	{0}
    4b1c:	e8bd8800 	pop	{fp, pc}

00004b20 <getPS7MessageInfo>:
    4b20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4b24:	e28db000 	add	fp, sp, #0
    4b28:	e24dd014 	sub	sp, sp, #20
    4b2c:	e50b0010 	str	r0, [fp, #-16]
    4b30:	e3013f4c 	movw	r3, #8012	; 0x1f4c
    4b34:	e3403001 	movt	r3, #1
    4b38:	e50b3008 	str	r3, [fp, #-8]
    4b3c:	e51b3010 	ldr	r3, [fp, #-16]
    4b40:	e3530005 	cmp	r3, #5
    4b44:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    4b48:	ea00001d 	b	4bc4 <getPS7MessageInfo+0xa4>
    4b4c:	00004b64 	.word	0x00004b64
    4b50:	00004b74 	.word	0x00004b74
    4b54:	00004b84 	.word	0x00004b84
    4b58:	00004b94 	.word	0x00004b94
    4b5c:	00004ba4 	.word	0x00004ba4
    4b60:	00004bb4 	.word	0x00004bb4
    4b64:	e3013f50 	movw	r3, #8016	; 0x1f50
    4b68:	e3403001 	movt	r3, #1
    4b6c:	e50b3008 	str	r3, [fp, #-8]
    4b70:	ea000017 	b	4bd4 <getPS7MessageInfo+0xb4>
    4b74:	e3013f70 	movw	r3, #8048	; 0x1f70
    4b78:	e3403001 	movt	r3, #1
    4b7c:	e50b3008 	str	r3, [fp, #-8]
    4b80:	ea000013 	b	4bd4 <getPS7MessageInfo+0xb4>
    4b84:	e3013f88 	movw	r3, #8072	; 0x1f88
    4b88:	e3403001 	movt	r3, #1
    4b8c:	e50b3008 	str	r3, [fp, #-8]
    4b90:	ea00000f 	b	4bd4 <getPS7MessageInfo+0xb4>
    4b94:	e3013fa4 	movw	r3, #8100	; 0x1fa4
    4b98:	e3403001 	movt	r3, #1
    4b9c:	e50b3008 	str	r3, [fp, #-8]
    4ba0:	ea00000b 	b	4bd4 <getPS7MessageInfo+0xb4>
    4ba4:	e3013fc4 	movw	r3, #8132	; 0x1fc4
    4ba8:	e3403001 	movt	r3, #1
    4bac:	e50b3008 	str	r3, [fp, #-8]
    4bb0:	ea000007 	b	4bd4 <getPS7MessageInfo+0xb4>
    4bb4:	e3013fe4 	movw	r3, #8164	; 0x1fe4
    4bb8:	e3403001 	movt	r3, #1
    4bbc:	e50b3008 	str	r3, [fp, #-8]
    4bc0:	ea000003 	b	4bd4 <getPS7MessageInfo+0xb4>
    4bc4:	e3023008 	movw	r3, #8200	; 0x2008
    4bc8:	e3403001 	movt	r3, #1
    4bcc:	e50b3008 	str	r3, [fp, #-8]
    4bd0:	e320f000 	nop	{0}
    4bd4:	e51b3008 	ldr	r3, [fp, #-8]
    4bd8:	e1a00003 	mov	r0, r3
    4bdc:	e28bd000 	add	sp, fp, #0
    4be0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    4be4:	e12fff1e 	bx	lr

00004be8 <ps7GetSiliconVersion>:
    4be8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4bec:	e28db000 	add	fp, sp, #0
    4bf0:	e24dd014 	sub	sp, sp, #20
    4bf4:	e3a0320f 	mov	r3, #-268435456	; 0xf0000000
    4bf8:	e50b3008 	str	r3, [fp, #-8]
    4bfc:	e3073080 	movw	r3, #28800	; 0x7080
    4c00:	e34f3800 	movt	r3, #63488	; 0xf800
    4c04:	e50b300c 	str	r3, [fp, #-12]
    4c08:	e51b300c 	ldr	r3, [fp, #-12]
    4c0c:	e5932000 	ldr	r2, [r3]
    4c10:	e51b3008 	ldr	r3, [fp, #-8]
    4c14:	e0033002 	and	r3, r3, r2
    4c18:	e1a03e23 	lsr	r3, r3, #28
    4c1c:	e50b3010 	str	r3, [fp, #-16]
    4c20:	e51b3010 	ldr	r3, [fp, #-16]
    4c24:	e1a00003 	mov	r0, r3
    4c28:	e28bd000 	add	sp, fp, #0
    4c2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    4c30:	e12fff1e 	bx	lr

00004c34 <mask_write>:
    4c34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4c38:	e28db000 	add	fp, sp, #0
    4c3c:	e24dd01c 	sub	sp, sp, #28
    4c40:	e50b0010 	str	r0, [fp, #-16]
    4c44:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    4c48:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    4c4c:	e51b3010 	ldr	r3, [fp, #-16]
    4c50:	e50b3008 	str	r3, [fp, #-8]
    4c54:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    4c58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4c5c:	e0022003 	and	r2, r2, r3
    4c60:	e51b3008 	ldr	r3, [fp, #-8]
    4c64:	e5931000 	ldr	r1, [r3]
    4c68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4c6c:	e1e03003 	mvn	r3, r3
    4c70:	e0033001 	and	r3, r3, r1
    4c74:	e1822003 	orr	r2, r2, r3
    4c78:	e51b3008 	ldr	r3, [fp, #-8]
    4c7c:	e5832000 	str	r2, [r3]
    4c80:	e320f000 	nop	{0}
    4c84:	e28bd000 	add	sp, fp, #0
    4c88:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    4c8c:	e12fff1e 	bx	lr

00004c90 <mask_poll>:
    4c90:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4c94:	e28db000 	add	fp, sp, #0
    4c98:	e24dd014 	sub	sp, sp, #20
    4c9c:	e50b0010 	str	r0, [fp, #-16]
    4ca0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    4ca4:	e51b3010 	ldr	r3, [fp, #-16]
    4ca8:	e50b300c 	str	r3, [fp, #-12]
    4cac:	e3a03000 	mov	r3, #0
    4cb0:	e50b3008 	str	r3, [fp, #-8]
    4cb4:	ea000009 	b	4ce0 <mask_poll+0x50>
    4cb8:	e51b2008 	ldr	r2, [fp, #-8]
    4cbc:	e3a03ce1 	mov	r3, #57600	; 0xe100
    4cc0:	e34035f5 	movt	r3, #1525	; 0x5f5
    4cc4:	e1520003 	cmp	r2, r3
    4cc8:	1a000001 	bne	4cd4 <mask_poll+0x44>
    4ccc:	e3e03000 	mvn	r3, #0
    4cd0:	ea000009 	b	4cfc <mask_poll+0x6c>
    4cd4:	e51b3008 	ldr	r3, [fp, #-8]
    4cd8:	e2833001 	add	r3, r3, #1
    4cdc:	e50b3008 	str	r3, [fp, #-8]
    4ce0:	e51b300c 	ldr	r3, [fp, #-12]
    4ce4:	e5932000 	ldr	r2, [r3]
    4ce8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4cec:	e0033002 	and	r3, r3, r2
    4cf0:	e3530000 	cmp	r3, #0
    4cf4:	0affffef 	beq	4cb8 <mask_poll+0x28>
    4cf8:	e3a03001 	mov	r3, #1
    4cfc:	e1a00003 	mov	r0, r3
    4d00:	e28bd000 	add	sp, fp, #0
    4d04:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    4d08:	e12fff1e 	bx	lr

00004d0c <mask_read>:
    4d0c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    4d10:	e28db000 	add	fp, sp, #0
    4d14:	e24dd014 	sub	sp, sp, #20
    4d18:	e50b0010 	str	r0, [fp, #-16]
    4d1c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    4d20:	e51b3010 	ldr	r3, [fp, #-16]
    4d24:	e50b3008 	str	r3, [fp, #-8]
    4d28:	e51b3008 	ldr	r3, [fp, #-8]
    4d2c:	e5933000 	ldr	r3, [r3]
    4d30:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    4d34:	e0033002 	and	r3, r3, r2
    4d38:	e50b300c 	str	r3, [fp, #-12]
    4d3c:	e51b300c 	ldr	r3, [fp, #-12]
    4d40:	e1a00003 	mov	r0, r3
    4d44:	e28bd000 	add	sp, fp, #0
    4d48:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    4d4c:	e12fff1e 	bx	lr

00004d50 <ps7_config>:
    4d50:	e92d4800 	push	{fp, lr}
    4d54:	e28db004 	add	fp, sp, #4
    4d58:	e24dd070 	sub	sp, sp, #112	; 0x70
    4d5c:	e50b0070 	str	r0, [fp, #-112]	; 0xffffff90
    4d60:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
    4d64:	e50b3008 	str	r3, [fp, #-8]
    4d68:	e3e03000 	mvn	r3, #0
    4d6c:	e50b3010 	str	r3, [fp, #-16]
    4d70:	e3a03000 	mov	r3, #0
    4d74:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4d78:	ea00007b 	b	4f6c <ps7_config+0x21c>
    4d7c:	e51b3008 	ldr	r3, [fp, #-8]
    4d80:	e5933000 	ldr	r3, [r3]
    4d84:	e203300f 	and	r3, r3, #15
    4d88:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    4d8c:	e51b3008 	ldr	r3, [fp, #-8]
    4d90:	e5933000 	ldr	r3, [r3]
    4d94:	e1a03223 	lsr	r3, r3, #4
    4d98:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    4d9c:	e3a03000 	mov	r3, #0
    4da0:	e50b300c 	str	r3, [fp, #-12]
    4da4:	ea00000d 	b	4de0 <ps7_config+0x90>
    4da8:	e51b300c 	ldr	r3, [fp, #-12]
    4dac:	e2833001 	add	r3, r3, #1
    4db0:	e1a03103 	lsl	r3, r3, #2
    4db4:	e51b2008 	ldr	r2, [fp, #-8]
    4db8:	e0823003 	add	r3, r2, r3
    4dbc:	e5932000 	ldr	r2, [r3]
    4dc0:	e51b300c 	ldr	r3, [fp, #-12]
    4dc4:	e1a03103 	lsl	r3, r3, #2
    4dc8:	e2433004 	sub	r3, r3, #4
    4dcc:	e083300b 	add	r3, r3, fp
    4dd0:	e5032068 	str	r2, [r3, #-104]	; 0xffffff98
    4dd4:	e51b300c 	ldr	r3, [fp, #-12]
    4dd8:	e2833001 	add	r3, r3, #1
    4ddc:	e50b300c 	str	r3, [fp, #-12]
    4de0:	e51b200c 	ldr	r2, [fp, #-12]
    4de4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4de8:	e1520003 	cmp	r2, r3
    4dec:	baffffed 	blt	4da8 <ps7_config+0x58>
    4df0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    4df4:	e2833001 	add	r3, r3, #1
    4df8:	e1a03103 	lsl	r3, r3, #2
    4dfc:	e51b2008 	ldr	r2, [fp, #-8]
    4e00:	e0823003 	add	r3, r2, r3
    4e04:	e50b3008 	str	r3, [fp, #-8]
    4e08:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    4e0c:	e3530005 	cmp	r3, #5
    4e10:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    4e14:	ea000051 	b	4f60 <ps7_config+0x210>
    4e18:	00004e30 	.word	0x00004e30
    4e1c:	00004e3c 	.word	0x00004e3c
    4e20:	00004e54 	.word	0x00004e54
    4e24:	00004e74 	.word	0x00004e74
    4e28:	00004ebc 	.word	0x00004ebc
    4e2c:	00004f24 	.word	0x00004f24
    4e30:	e3a03000 	mov	r3, #0
    4e34:	e50b3010 	str	r3, [fp, #-16]
    4e38:	ea00004b 	b	4f6c <ps7_config+0x21c>
    4e3c:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    4e40:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4e44:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4e48:	e3a02000 	mov	r2, #0
    4e4c:	e5832000 	str	r2, [r3]
    4e50:	ea000045 	b	4f6c <ps7_config+0x21c>
    4e54:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    4e58:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4e5c:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    4e60:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    4e64:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4e68:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    4e6c:	e5832000 	str	r2, [r3]
    4e70:	ea00003d 	b	4f6c <ps7_config+0x21c>
    4e74:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    4e78:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4e7c:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    4e80:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    4e84:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    4e88:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    4e8c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    4e90:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    4e94:	e0022003 	and	r2, r2, r3
    4e98:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4e9c:	e5931000 	ldr	r1, [r3]
    4ea0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    4ea4:	e1e03003 	mvn	r3, r3
    4ea8:	e0033001 	and	r3, r3, r1
    4eac:	e1822003 	orr	r2, r2, r3
    4eb0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4eb4:	e5832000 	str	r2, [r3]
    4eb8:	ea00002b 	b	4f6c <ps7_config+0x21c>
    4ebc:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    4ec0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4ec4:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    4ec8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    4ecc:	e3a03000 	mov	r3, #0
    4ed0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4ed4:	ea00000b 	b	4f08 <ps7_config+0x1b8>
    4ed8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    4edc:	e3a03ce1 	mov	r3, #57600	; 0xe100
    4ee0:	e34035f5 	movt	r3, #1525	; 0x5f5
    4ee4:	e1520003 	cmp	r2, r3
    4ee8:	1a000003 	bne	4efc <ps7_config+0x1ac>
    4eec:	e3a03002 	mov	r3, #2
    4ef0:	e50b3010 	str	r3, [fp, #-16]
    4ef4:	e320f000 	nop	{0}
    4ef8:	ea00001b 	b	4f6c <ps7_config+0x21c>
    4efc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    4f00:	e2833001 	add	r3, r3, #1
    4f04:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    4f08:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4f0c:	e5932000 	ldr	r2, [r3]
    4f10:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    4f14:	e0033002 	and	r3, r3, r2
    4f18:	e3530000 	cmp	r3, #0
    4f1c:	0affffed 	beq	4ed8 <ps7_config+0x188>
    4f20:	ea000011 	b	4f6c <ps7_config+0x21c>
    4f24:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    4f28:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    4f2c:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    4f30:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    4f34:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    4f38:	eb000114 	bl	5390 <get_number_of_cycles_for_delay>
    4f3c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    4f40:	eb00012c 	bl	53f8 <perf_reset_and_start_timer>
    4f44:	e320f000 	nop	{0}
    4f48:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    4f4c:	e5932000 	ldr	r2, [r3]
    4f50:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    4f54:	e1520003 	cmp	r2, r3
    4f58:	3afffffa 	bcc	4f48 <ps7_config+0x1f8>
    4f5c:	ea000002 	b	4f6c <ps7_config+0x21c>
    4f60:	e3a03001 	mov	r3, #1
    4f64:	e50b3010 	str	r3, [fp, #-16]
    4f68:	e320f000 	nop	{0}
    4f6c:	e51b3010 	ldr	r3, [fp, #-16]
    4f70:	e3530000 	cmp	r3, #0
    4f74:	baffff80 	blt	4d7c <ps7_config+0x2c>
    4f78:	e51b3010 	ldr	r3, [fp, #-16]
    4f7c:	e1a00003 	mov	r0, r3
    4f80:	e24bd004 	sub	sp, fp, #4
    4f84:	e8bd8800 	pop	{fp, pc}

00004f88 <ps7_post_config>:
    4f88:	e92d4800 	push	{fp, lr}
    4f8c:	e28db004 	add	fp, sp, #4
    4f90:	e24dd008 	sub	sp, sp, #8
    4f94:	ebffff13 	bl	4be8 <ps7GetSiliconVersion>
    4f98:	e50b0008 	str	r0, [fp, #-8]
    4f9c:	e3e03000 	mvn	r3, #0
    4fa0:	e50b300c 	str	r3, [fp, #-12]
    4fa4:	e51b3008 	ldr	r3, [fp, #-8]
    4fa8:	e3530000 	cmp	r3, #0
    4fac:	1a000008 	bne	4fd4 <ps7_post_config+0x4c>
    4fb0:	e3040244 	movw	r0, #16964	; 0x4244
    4fb4:	e3400001 	movt	r0, #1
    4fb8:	ebffff64 	bl	4d50 <ps7_config>
    4fbc:	e50b000c 	str	r0, [fp, #-12]
    4fc0:	e51b300c 	ldr	r3, [fp, #-12]
    4fc4:	e3530000 	cmp	r3, #0
    4fc8:	0a000016 	beq	5028 <ps7_post_config+0xa0>
    4fcc:	e51b300c 	ldr	r3, [fp, #-12]
    4fd0:	ea000015 	b	502c <ps7_post_config+0xa4>
    4fd4:	e51b3008 	ldr	r3, [fp, #-8]
    4fd8:	e3530001 	cmp	r3, #1
    4fdc:	1a000008 	bne	5004 <ps7_post_config+0x7c>
    4fe0:	e3030810 	movw	r0, #14352	; 0x3810
    4fe4:	e3400001 	movt	r0, #1
    4fe8:	ebffff58 	bl	4d50 <ps7_config>
    4fec:	e50b000c 	str	r0, [fp, #-12]
    4ff0:	e51b300c 	ldr	r3, [fp, #-12]
    4ff4:	e3530000 	cmp	r3, #0
    4ff8:	0a00000a 	beq	5028 <ps7_post_config+0xa0>
    4ffc:	e51b300c 	ldr	r3, [fp, #-12]
    5000:	ea000009 	b	502c <ps7_post_config+0xa4>
    5004:	e3020dbc 	movw	r0, #11708	; 0x2dbc
    5008:	e3400001 	movt	r0, #1
    500c:	ebffff4f 	bl	4d50 <ps7_config>
    5010:	e50b000c 	str	r0, [fp, #-12]
    5014:	e51b300c 	ldr	r3, [fp, #-12]
    5018:	e3530000 	cmp	r3, #0
    501c:	0a000001 	beq	5028 <ps7_post_config+0xa0>
    5020:	e51b300c 	ldr	r3, [fp, #-12]
    5024:	ea000000 	b	502c <ps7_post_config+0xa4>
    5028:	e3a03000 	mov	r3, #0
    502c:	e1a00003 	mov	r0, r3
    5030:	e24bd004 	sub	sp, fp, #4
    5034:	e8bd8800 	pop	{fp, pc}

00005038 <ps7_debug>:
    5038:	e92d4800 	push	{fp, lr}
    503c:	e28db004 	add	fp, sp, #4
    5040:	e24dd008 	sub	sp, sp, #8
    5044:	ebfffee7 	bl	4be8 <ps7GetSiliconVersion>
    5048:	e50b0008 	str	r0, [fp, #-8]
    504c:	e3e03000 	mvn	r3, #0
    5050:	e50b300c 	str	r3, [fp, #-12]
    5054:	e51b3008 	ldr	r3, [fp, #-8]
    5058:	e3530000 	cmp	r3, #0
    505c:	1a000008 	bne	5084 <ps7_debug+0x4c>
    5060:	e3040280 	movw	r0, #17024	; 0x4280
    5064:	e3400001 	movt	r0, #1
    5068:	ebffff38 	bl	4d50 <ps7_config>
    506c:	e50b000c 	str	r0, [fp, #-12]
    5070:	e51b300c 	ldr	r3, [fp, #-12]
    5074:	e3530000 	cmp	r3, #0
    5078:	0a000016 	beq	50d8 <ps7_debug+0xa0>
    507c:	e51b300c 	ldr	r3, [fp, #-12]
    5080:	ea000015 	b	50dc <ps7_debug+0xa4>
    5084:	e51b3008 	ldr	r3, [fp, #-8]
    5088:	e3530001 	cmp	r3, #1
    508c:	1a000008 	bne	50b4 <ps7_debug+0x7c>
    5090:	e303084c 	movw	r0, #14412	; 0x384c
    5094:	e3400001 	movt	r0, #1
    5098:	ebffff2c 	bl	4d50 <ps7_config>
    509c:	e50b000c 	str	r0, [fp, #-12]
    50a0:	e51b300c 	ldr	r3, [fp, #-12]
    50a4:	e3530000 	cmp	r3, #0
    50a8:	0a00000a 	beq	50d8 <ps7_debug+0xa0>
    50ac:	e51b300c 	ldr	r3, [fp, #-12]
    50b0:	ea000009 	b	50dc <ps7_debug+0xa4>
    50b4:	e3020df8 	movw	r0, #11768	; 0x2df8
    50b8:	e3400001 	movt	r0, #1
    50bc:	ebffff23 	bl	4d50 <ps7_config>
    50c0:	e50b000c 	str	r0, [fp, #-12]
    50c4:	e51b300c 	ldr	r3, [fp, #-12]
    50c8:	e3530000 	cmp	r3, #0
    50cc:	0a000001 	beq	50d8 <ps7_debug+0xa0>
    50d0:	e51b300c 	ldr	r3, [fp, #-12]
    50d4:	ea000000 	b	50dc <ps7_debug+0xa4>
    50d8:	e3a03000 	mov	r3, #0
    50dc:	e1a00003 	mov	r0, r3
    50e0:	e24bd004 	sub	sp, fp, #4
    50e4:	e8bd8800 	pop	{fp, pc}

000050e8 <ps7_init>:
    50e8:	e92d4800 	push	{fp, lr}
    50ec:	e28db004 	add	fp, sp, #4
    50f0:	e24dd008 	sub	sp, sp, #8
    50f4:	ebfffebb 	bl	4be8 <ps7GetSiliconVersion>
    50f8:	e50b0008 	str	r0, [fp, #-8]
    50fc:	e51b3008 	ldr	r3, [fp, #-8]
    5100:	e3530000 	cmp	r3, #0
    5104:	1a000019 	bne	5170 <ps7_init+0x88>
    5108:	e30432a8 	movw	r3, #17064	; 0x42a8
    510c:	e3403001 	movt	r3, #1
    5110:	e3032f9c 	movw	r2, #16284	; 0x3f9c
    5114:	e3402001 	movt	r2, #1
    5118:	e5832000 	str	r2, [r3]
    511c:	e30432ac 	movw	r3, #17068	; 0x42ac
    5120:	e3403001 	movt	r3, #1
    5124:	e3032874 	movw	r2, #14452	; 0x3874
    5128:	e3402001 	movt	r2, #1
    512c:	e5832000 	str	r2, [r3]
    5130:	e30432b0 	movw	r3, #17072	; 0x42b0
    5134:	e3403001 	movt	r3, #1
    5138:	e30329f4 	movw	r2, #14836	; 0x39f4
    513c:	e3402001 	movt	r2, #1
    5140:	e5832000 	str	r2, [r3]
    5144:	e30432b4 	movw	r3, #17076	; 0x42b4
    5148:	e3403001 	movt	r3, #1
    514c:	e3032a90 	movw	r2, #14992	; 0x3a90
    5150:	e3402001 	movt	r2, #1
    5154:	e5832000 	str	r2, [r3]
    5158:	e30432b8 	movw	r3, #17080	; 0x42b8
    515c:	e3403001 	movt	r3, #1
    5160:	e3042188 	movw	r2, #16776	; 0x4188
    5164:	e3402001 	movt	r2, #1
    5168:	e5832000 	str	r2, [r3]
    516c:	ea000035 	b	5248 <ps7_init+0x160>
    5170:	e51b3008 	ldr	r3, [fp, #-8]
    5174:	e3530001 	cmp	r3, #1
    5178:	1a000019 	bne	51e4 <ps7_init+0xfc>
    517c:	e30432a8 	movw	r3, #17064	; 0x42a8
    5180:	e3403001 	movt	r3, #1
    5184:	e3032568 	movw	r2, #13672	; 0x3568
    5188:	e3402001 	movt	r2, #1
    518c:	e5832000 	str	r2, [r3]
    5190:	e30432ac 	movw	r3, #17068	; 0x42ac
    5194:	e3403001 	movt	r3, #1
    5198:	e3022e20 	movw	r2, #11808	; 0x2e20
    519c:	e3402001 	movt	r2, #1
    51a0:	e5832000 	str	r2, [r3]
    51a4:	e30432b0 	movw	r3, #17072	; 0x42b0
    51a8:	e3403001 	movt	r3, #1
    51ac:	e3022fa0 	movw	r2, #12192	; 0x2fa0
    51b0:	e3402001 	movt	r2, #1
    51b4:	e5832000 	str	r2, [r3]
    51b8:	e30432b4 	movw	r3, #17076	; 0x42b4
    51bc:	e3403001 	movt	r3, #1
    51c0:	e303203c 	movw	r2, #12348	; 0x303c
    51c4:	e3402001 	movt	r2, #1
    51c8:	e5832000 	str	r2, [r3]
    51cc:	e30432b8 	movw	r3, #17080	; 0x42b8
    51d0:	e3403001 	movt	r3, #1
    51d4:	e3032754 	movw	r2, #14164	; 0x3754
    51d8:	e3402001 	movt	r2, #1
    51dc:	e5832000 	str	r2, [r3]
    51e0:	ea000018 	b	5248 <ps7_init+0x160>
    51e4:	e30432a8 	movw	r3, #17064	; 0x42a8
    51e8:	e3403001 	movt	r3, #1
    51ec:	e3022b14 	movw	r2, #11028	; 0x2b14
    51f0:	e3402001 	movt	r2, #1
    51f4:	e5832000 	str	r2, [r3]
    51f8:	e30432ac 	movw	r3, #17068	; 0x42ac
    51fc:	e3403001 	movt	r3, #1
    5200:	e30223dc 	movw	r2, #9180	; 0x23dc
    5204:	e3402001 	movt	r2, #1
    5208:	e5832000 	str	r2, [r3]
    520c:	e30432b0 	movw	r3, #17072	; 0x42b0
    5210:	e3403001 	movt	r3, #1
    5214:	e302255c 	movw	r2, #9564	; 0x255c
    5218:	e3402001 	movt	r2, #1
    521c:	e5832000 	str	r2, [r3]
    5220:	e30432b4 	movw	r3, #17076	; 0x42b4
    5224:	e3403001 	movt	r3, #1
    5228:	e30225f8 	movw	r2, #9720	; 0x25f8
    522c:	e3402001 	movt	r2, #1
    5230:	e5832000 	str	r2, [r3]
    5234:	e30432b8 	movw	r3, #17080	; 0x42b8
    5238:	e3403001 	movt	r3, #1
    523c:	e3022d00 	movw	r2, #11520	; 0x2d00
    5240:	e3402001 	movt	r2, #1
    5244:	e5832000 	str	r2, [r3]
    5248:	e30432a8 	movw	r3, #17064	; 0x42a8
    524c:	e3403001 	movt	r3, #1
    5250:	e5933000 	ldr	r3, [r3]
    5254:	e1a00003 	mov	r0, r3
    5258:	ebfffebc 	bl	4d50 <ps7_config>
    525c:	e50b000c 	str	r0, [fp, #-12]
    5260:	e51b300c 	ldr	r3, [fp, #-12]
    5264:	e3530000 	cmp	r3, #0
    5268:	0a000001 	beq	5274 <ps7_init+0x18c>
    526c:	e51b300c 	ldr	r3, [fp, #-12]
    5270:	ea00002c 	b	5328 <ps7_init+0x240>
    5274:	e30432ac 	movw	r3, #17068	; 0x42ac
    5278:	e3403001 	movt	r3, #1
    527c:	e5933000 	ldr	r3, [r3]
    5280:	e1a00003 	mov	r0, r3
    5284:	ebfffeb1 	bl	4d50 <ps7_config>
    5288:	e50b000c 	str	r0, [fp, #-12]
    528c:	e51b300c 	ldr	r3, [fp, #-12]
    5290:	e3530000 	cmp	r3, #0
    5294:	0a000001 	beq	52a0 <ps7_init+0x1b8>
    5298:	e51b300c 	ldr	r3, [fp, #-12]
    529c:	ea000021 	b	5328 <ps7_init+0x240>
    52a0:	e30432b0 	movw	r3, #17072	; 0x42b0
    52a4:	e3403001 	movt	r3, #1
    52a8:	e5933000 	ldr	r3, [r3]
    52ac:	e1a00003 	mov	r0, r3
    52b0:	ebfffea6 	bl	4d50 <ps7_config>
    52b4:	e50b000c 	str	r0, [fp, #-12]
    52b8:	e51b300c 	ldr	r3, [fp, #-12]
    52bc:	e3530000 	cmp	r3, #0
    52c0:	0a000001 	beq	52cc <ps7_init+0x1e4>
    52c4:	e51b300c 	ldr	r3, [fp, #-12]
    52c8:	ea000016 	b	5328 <ps7_init+0x240>
    52cc:	e30432b4 	movw	r3, #17076	; 0x42b4
    52d0:	e3403001 	movt	r3, #1
    52d4:	e5933000 	ldr	r3, [r3]
    52d8:	e1a00003 	mov	r0, r3
    52dc:	ebfffe9b 	bl	4d50 <ps7_config>
    52e0:	e50b000c 	str	r0, [fp, #-12]
    52e4:	e51b300c 	ldr	r3, [fp, #-12]
    52e8:	e3530000 	cmp	r3, #0
    52ec:	0a000001 	beq	52f8 <ps7_init+0x210>
    52f0:	e51b300c 	ldr	r3, [fp, #-12]
    52f4:	ea00000b 	b	5328 <ps7_init+0x240>
    52f8:	e30432b8 	movw	r3, #17080	; 0x42b8
    52fc:	e3403001 	movt	r3, #1
    5300:	e5933000 	ldr	r3, [r3]
    5304:	e1a00003 	mov	r0, r3
    5308:	ebfffe90 	bl	4d50 <ps7_config>
    530c:	e50b000c 	str	r0, [fp, #-12]
    5310:	e51b300c 	ldr	r3, [fp, #-12]
    5314:	e3530000 	cmp	r3, #0
    5318:	0a000001 	beq	5324 <ps7_init+0x23c>
    531c:	e51b300c 	ldr	r3, [fp, #-12]
    5320:	ea000000 	b	5328 <ps7_init+0x240>
    5324:	e3a03000 	mov	r3, #0
    5328:	e1a00003 	mov	r0, r3
    532c:	e24bd004 	sub	sp, fp, #4
    5330:	e8bd8800 	pop	{fp, pc}

00005334 <perf_start_clock>:
    5334:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    5338:	e28db000 	add	fp, sp, #0
    533c:	e3a03f82 	mov	r3, #520	; 0x208
    5340:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    5344:	e3a02009 	mov	r2, #9
    5348:	e5832000 	str	r2, [r3]
    534c:	e320f000 	nop	{0}
    5350:	e28bd000 	add	sp, fp, #0
    5354:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    5358:	e12fff1e 	bx	lr

0000535c <perf_reset_clock>:
    535c:	e92d4800 	push	{fp, lr}
    5360:	e28db004 	add	fp, sp, #4
    5364:	eb000019 	bl	53d0 <perf_disable_clock>
    5368:	e3a03c02 	mov	r3, #512	; 0x200
    536c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    5370:	e3a02000 	mov	r2, #0
    5374:	e5832000 	str	r2, [r3]
    5378:	e3a03f81 	mov	r3, #516	; 0x204
    537c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    5380:	e3a02000 	mov	r2, #0
    5384:	e5832000 	str	r2, [r3]
    5388:	e320f000 	nop	{0}
    538c:	e8bd8800 	pop	{fp, pc}

00005390 <get_number_of_cycles_for_delay>:
    5390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    5394:	e28db000 	add	fp, sp, #0
    5398:	e24dd00c 	sub	sp, sp, #12
    539c:	e50b0008 	str	r0, [fp, #-8]
    53a0:	e51b2008 	ldr	r2, [fp, #-8]
    53a4:	e30836bf 	movw	r3, #34495	; 0x86bf
    53a8:	e34237bc 	movt	r3, #10172	; 0x27bc
    53ac:	e0020293 	mul	r2, r3, r2
    53b0:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    53b4:	e3413062 	movt	r3, #4194	; 0x1062
    53b8:	e0832293 	umull	r2, r3, r3, r2
    53bc:	e1a033a3 	lsr	r3, r3, #7
    53c0:	e1a00003 	mov	r0, r3
    53c4:	e28bd000 	add	sp, fp, #0
    53c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    53cc:	e12fff1e 	bx	lr

000053d0 <perf_disable_clock>:
    53d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    53d4:	e28db000 	add	fp, sp, #0
    53d8:	e3a03f82 	mov	r3, #520	; 0x208
    53dc:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    53e0:	e3a02000 	mov	r2, #0
    53e4:	e5832000 	str	r2, [r3]
    53e8:	e320f000 	nop	{0}
    53ec:	e28bd000 	add	sp, fp, #0
    53f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    53f4:	e12fff1e 	bx	lr

000053f8 <perf_reset_and_start_timer>:
    53f8:	e92d4800 	push	{fp, lr}
    53fc:	e28db004 	add	fp, sp, #4
    5400:	ebffffd5 	bl	535c <perf_reset_clock>
    5404:	ebffffca 	bl	5334 <perf_start_clock>
    5408:	e320f000 	nop	{0}
    540c:	e8bd8800 	pop	{fp, pc}

00005410 <XGlobalTimer_ModifyInterval>:
    5410:	e30e3940 	movw	r3, #59712	; 0xe940
    5414:	e30f0710 	movw	r0, #63248	; 0xf710
    5418:	e3403001 	movt	r3, #1
    541c:	e92d4070 	push	{r4, r5, r6, lr}
    5420:	e3400001 	movt	r0, #1
    5424:	e5d3c000 	ldrb	ip, [r3]
    5428:	e1a06001 	mov	r6, r1
    542c:	e1a01002 	mov	r1, r2
    5430:	e5900000 	ldr	r0, [r0]
    5434:	e35c0000 	cmp	ip, #0
    5438:	e1a000a0 	lsr	r0, r0, #1
    543c:	1a000007 	bne	5460 <XGlobalTimer_ModifyInterval+0x50>
    5440:	e3a02000 	mov	r2, #0
    5444:	e34f28f0 	movt	r2, #63728	; 0xf8f0
    5448:	e582c208 	str	ip, [r2, #520]	; 0x208
    544c:	e582c200 	str	ip, [r2, #512]	; 0x200
    5450:	e582c204 	str	ip, [r2, #516]	; 0x204
    5454:	e3a0c001 	mov	ip, #1
    5458:	e582c208 	str	ip, [r2, #520]	; 0x208
    545c:	e5c3c000 	strb	ip, [r3]
    5460:	e3a03000 	mov	r3, #0
    5464:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    5468:	e5934204 	ldr	r4, [r3, #516]	; 0x204
    546c:	e5935200 	ldr	r5, [r3, #512]	; 0x200
    5470:	e593c204 	ldr	ip, [r3, #516]	; 0x204
    5474:	e154000c 	cmp	r4, ip
    5478:	1afffffa 	bne	5468 <XGlobalTimer_ModifyInterval+0x58>
    547c:	fa002e4f 	blx	10dc0 <__udivsi3>
    5480:	e0a45096 	umlal	r5, r4, r6, r0
    5484:	e3a03000 	mov	r3, #0
    5488:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    548c:	e5932204 	ldr	r2, [r3, #516]	; 0x204
    5490:	e5930200 	ldr	r0, [r3, #512]	; 0x200
    5494:	e5931204 	ldr	r1, [r3, #516]	; 0x204
    5498:	e1520001 	cmp	r2, r1
    549c:	1afffffa 	bne	548c <XGlobalTimer_ModifyInterval+0x7c>
    54a0:	e1500005 	cmp	r0, r5
    54a4:	e0d22004 	sbcs	r2, r2, r4
    54a8:	3afffff7 	bcc	548c <XGlobalTimer_ModifyInterval+0x7c>
    54ac:	e8bd8070 	pop	{r4, r5, r6, pc}

000054b0 <XilSleepTimer_Init>:
    54b0:	e3052410 	movw	r2, #21520	; 0x5410
    54b4:	e1a03000 	mov	r3, r0
    54b8:	e3402000 	movt	r2, #0
    54bc:	e3a00000 	mov	r0, #0
    54c0:	e583000c 	str	r0, [r3, #12]
    54c4:	e5832000 	str	r2, [r3]
    54c8:	e12fff1e 	bx	lr

000054cc <XTime_GetTime>:
    54cc:	e3a03000 	mov	r3, #0
    54d0:	e34f38f0 	movt	r3, #63728	; 0xf8f0
    54d4:	e5931204 	ldr	r1, [r3, #516]	; 0x204
    54d8:	e593c200 	ldr	ip, [r3, #512]	; 0x200
    54dc:	e5932204 	ldr	r2, [r3, #516]	; 0x204
    54e0:	e1520001 	cmp	r2, r1
    54e4:	1afffffa 	bne	54d4 <XTime_GetTime+0x8>
    54e8:	e580c000 	str	ip, [r0]
    54ec:	e5802004 	str	r2, [r0, #4]
    54f0:	e12fff1e 	bx	lr

000054f4 <XilTickTimer_Init>:
    54f4:	e3a02000 	mov	r2, #0
    54f8:	e1a03000 	mov	r3, r0
    54fc:	e5832004 	str	r2, [r3, #4]
    5500:	e1a00002 	mov	r0, r2
    5504:	e5832008 	str	r2, [r3, #8]
    5508:	e5832010 	str	r2, [r3, #16]
    550c:	e5832014 	str	r2, [r3, #20]
    5510:	e12fff1e 	bx	lr

00005514 <sleep>:
    5514:	e30e3944 	movw	r3, #59716	; 0xe944
    5518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    551c:	e3403001 	movt	r3, #1
    5520:	e593e000 	ldr	lr, [r3]
    5524:	e35e0000 	cmp	lr, #0
    5528:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    552c:	e1a01000 	mov	r1, r0
    5530:	e3a02001 	mov	r2, #1
    5534:	e1a00003 	mov	r0, r3
    5538:	e1a0300e 	mov	r3, lr
    553c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    5540:	e12fff13 	bx	r3

00005544 <msleep>:
    5544:	e30e3944 	movw	r3, #59716	; 0xe944
    5548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    554c:	e3403001 	movt	r3, #1
    5550:	e593e000 	ldr	lr, [r3]
    5554:	e35e0000 	cmp	lr, #0
    5558:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    555c:	e1a01000 	mov	r1, r0
    5560:	e3a02ffa 	mov	r2, #1000	; 0x3e8
    5564:	e1a00003 	mov	r0, r3
    5568:	e1a0300e 	mov	r3, lr
    556c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    5570:	e12fff13 	bx	r3

00005574 <usleep>:
    5574:	e30e3944 	movw	r3, #59716	; 0xe944
    5578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    557c:	e3403001 	movt	r3, #1
    5580:	e593e000 	ldr	lr, [r3]
    5584:	e35e0000 	cmp	lr, #0
    5588:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    558c:	e3042240 	movw	r2, #16960	; 0x4240
    5590:	e1a01000 	mov	r1, r0
    5594:	e340200f 	movt	r2, #15
    5598:	e1a00003 	mov	r0, r3
    559c:	e1a0300e 	mov	r3, lr
    55a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    55a4:	e12fff13 	bx	r3

000055a8 <XilTimer_Sleep>:
    55a8:	e30e3944 	movw	r3, #59716	; 0xe944
    55ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    55b0:	e3403001 	movt	r3, #1
    55b4:	e593e000 	ldr	lr, [r3]
    55b8:	e35e0000 	cmp	lr, #0
    55bc:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    55c0:	e1a02001 	mov	r2, r1
    55c4:	e1a01000 	mov	r1, r0
    55c8:	e1a00003 	mov	r0, r3
    55cc:	e1a0300e 	mov	r3, lr
    55d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    55d4:	e12fff13 	bx	r3

000055d8 <XTimer_SetHandler>:
    55d8:	e30e3944 	movw	r3, #59716	; 0xe944
    55dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    55e0:	e3403001 	movt	r3, #1
    55e4:	e593e004 	ldr	lr, [r3, #4]
    55e8:	e1c301f8 	strd	r0, [r3, #24]
    55ec:	e35e0000 	cmp	lr, #0
    55f0:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    55f4:	e1a00003 	mov	r0, r3
    55f8:	e1a01002 	mov	r1, r2
    55fc:	e1a0300e 	mov	r3, lr
    5600:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    5604:	e12fff13 	bx	r3

00005608 <XTimer_SetInterval>:
    5608:	e30e3944 	movw	r3, #59716	; 0xe944
    560c:	e1a01000 	mov	r1, r0
    5610:	e3403001 	movt	r3, #1
    5614:	e5932008 	ldr	r2, [r3, #8]
    5618:	e3520000 	cmp	r2, #0
    561c:	012fff1e 	bxeq	lr
    5620:	e1a00003 	mov	r0, r3
    5624:	e12fff12 	bx	r2

00005628 <XTimer_ClearTickInterrupt>:
    5628:	e30e0944 	movw	r0, #59716	; 0xe944
    562c:	e3400001 	movt	r0, #1
    5630:	e5903014 	ldr	r3, [r0, #20]
    5634:	e3530000 	cmp	r3, #0
    5638:	012fff1e 	bxeq	lr
    563c:	e12fff13 	bx	r3

00005640 <get_ldnumber>:
    5640:	e590c000 	ldr	ip, [r0]
    5644:	e35c0000 	cmp	ip, #0
    5648:	0a000019 	beq	56b4 <get_ldnumber+0x74>
    564c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    5650:	e1a0200c 	mov	r2, ip
    5654:	e1a0e000 	mov	lr, r0
    5658:	e4d23001 	ldrb	r3, [r2], #1
    565c:	e353003a 	cmp	r3, #58	; 0x3a
    5660:	13530020 	cmpne	r3, #32
    5664:	83a01001 	movhi	r1, #1
    5668:	93a01000 	movls	r1, #0
    566c:	8afffff9 	bhi	5658 <get_ldnumber+0x18>
    5670:	e353003a 	cmp	r3, #58	; 0x3a
    5674:	0a000001 	beq	5680 <get_ldnumber+0x40>
    5678:	e1a00001 	mov	r0, r1
    567c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    5680:	e5dc1000 	ldrb	r1, [ip]
    5684:	e2411030 	sub	r1, r1, #48	; 0x30
    5688:	e6ef3071 	uxtb	r3, r1
    568c:	e3530009 	cmp	r3, #9
    5690:	8a000005 	bhi	56ac <get_ldnumber+0x6c>
    5694:	e28cc002 	add	ip, ip, #2
    5698:	e152000c 	cmp	r2, ip
    569c:	1a000002 	bne	56ac <get_ldnumber+0x6c>
    56a0:	e1a00001 	mov	r0, r1
    56a4:	e58e2000 	str	r2, [lr]
    56a8:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    56ac:	e3e00000 	mvn	r0, #0
    56b0:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    56b4:	e3e00000 	mvn	r0, #0
    56b8:	e12fff1e 	bx	lr

000056bc <validate>:
    56bc:	e92d4070 	push	{r4, r5, r6, lr}
    56c0:	e2504000 	subs	r4, r0, #0
    56c4:	e1a05001 	mov	r5, r1
    56c8:	0a000009 	beq	56f4 <validate+0x38>
    56cc:	e5943000 	ldr	r3, [r4]
    56d0:	e3530000 	cmp	r3, #0
    56d4:	0a000006 	beq	56f4 <validate+0x38>
    56d8:	e5d32000 	ldrb	r2, [r3]
    56dc:	e3520000 	cmp	r2, #0
    56e0:	0a000003 	beq	56f4 <validate+0x38>
    56e4:	e1d410b4 	ldrh	r1, [r4, #4]
    56e8:	e1d320b6 	ldrh	r2, [r3, #6]
    56ec:	e1510002 	cmp	r1, r2
    56f0:	0a000003 	beq	5704 <validate+0x48>
    56f4:	e3a00009 	mov	r0, #9
    56f8:	e3a03000 	mov	r3, #0
    56fc:	e5853000 	str	r3, [r5]
    5700:	e8bd8070 	pop	{r4, r5, r6, pc}
    5704:	e5d30001 	ldrb	r0, [r3, #1]
    5708:	eb000e71 	bl	90d4 <disk_status>
    570c:	e2100001 	ands	r0, r0, #1
    5710:	1afffff7 	bne	56f4 <validate+0x38>
    5714:	e5943000 	ldr	r3, [r4]
    5718:	eafffff7 	b	56fc <validate+0x40>

0000571c <sync_window>:
    571c:	e5d03004 	ldrb	r3, [r0, #4]
    5720:	e3530000 	cmp	r3, #0
    5724:	1a000001 	bne	5730 <sync_window+0x14>
    5728:	e3a00000 	mov	r0, #0
    572c:	e12fff1e 	bx	lr
    5730:	e92d4070 	push	{r4, r5, r6, lr}
    5734:	e2805040 	add	r5, r0, #64	; 0x40
    5738:	e590201c 	ldr	r2, [r0, #28]
    573c:	e1a04000 	mov	r4, r0
    5740:	e3a03001 	mov	r3, #1
    5744:	e1a01005 	mov	r1, r5
    5748:	e5d00001 	ldrb	r0, [r0, #1]
    574c:	eb000f48 	bl	9474 <disk_write>
    5750:	e3500000 	cmp	r0, #0
    5754:	1a00000b 	bne	5788 <sync_window+0x6c>
    5758:	e594101c 	ldr	r1, [r4, #28]
    575c:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    5760:	e5942018 	ldr	r2, [r4, #24]
    5764:	e5c40004 	strb	r0, [r4, #4]
    5768:	e0413003 	sub	r3, r1, r3
    576c:	e1530002 	cmp	r3, r2
    5770:	2a000002 	bcs	5780 <sync_window+0x64>
    5774:	e5d43003 	ldrb	r3, [r4, #3]
    5778:	e3530002 	cmp	r3, #2
    577c:	0a000003 	beq	5790 <sync_window+0x74>
    5780:	e3a00000 	mov	r0, #0
    5784:	e8bd8070 	pop	{r4, r5, r6, pc}
    5788:	e3a00001 	mov	r0, #1
    578c:	e8bd8070 	pop	{r4, r5, r6, pc}
    5790:	e0812002 	add	r2, r1, r2
    5794:	e5d40001 	ldrb	r0, [r4, #1]
    5798:	e3a03001 	mov	r3, #1
    579c:	e1a01005 	mov	r1, r5
    57a0:	eb000f33 	bl	9474 <disk_write>
    57a4:	eafffff5 	b	5780 <sync_window+0x64>

000057a8 <dir_clear>:
    57a8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    57ac:	e1a05000 	mov	r5, r0
    57b0:	e1a04001 	mov	r4, r1
    57b4:	ebffffd8 	bl	571c <sync_window>
    57b8:	e2506000 	subs	r6, r0, #0
    57bc:	1a000020 	bne	5844 <dir_clear+0x9c>
    57c0:	e5953014 	ldr	r3, [r5, #20]
    57c4:	e2441002 	sub	r1, r4, #2
    57c8:	e2857040 	add	r7, r5, #64	; 0x40
    57cc:	e3a02c02 	mov	r2, #512	; 0x200
    57d0:	e1a00007 	mov	r0, r7
    57d4:	e2433002 	sub	r3, r3, #2
    57d8:	e1510003 	cmp	r1, r3
    57dc:	31d530ba 	ldrhcc	r3, [r5, #10]
    57e0:	3595602c 	ldrcc	r6, [r5, #44]	; 0x2c
    57e4:	30266391 	mlacc	r6, r1, r3, r6
    57e8:	e3a01000 	mov	r1, #0
    57ec:	e585601c 	str	r6, [r5, #28]
    57f0:	fa002ebc 	blx	112e8 <memset>
    57f4:	e1d530ba 	ldrh	r3, [r5, #10]
    57f8:	e3530000 	cmp	r3, #0
    57fc:	01a04003 	moveq	r4, r3
    5800:	0a00000c 	beq	5838 <dir_clear+0x90>
    5804:	e3a04000 	mov	r4, #0
    5808:	ea000002 	b	5818 <dir_clear+0x70>
    580c:	e2844001 	add	r4, r4, #1
    5810:	e1540003 	cmp	r4, r3
    5814:	2a000007 	bcs	5838 <dir_clear+0x90>
    5818:	e3a03001 	mov	r3, #1
    581c:	e5d50001 	ldrb	r0, [r5, #1]
    5820:	e0842006 	add	r2, r4, r6
    5824:	e1a01007 	mov	r1, r7
    5828:	eb000f11 	bl	9474 <disk_write>
    582c:	e3500000 	cmp	r0, #0
    5830:	e1d530ba 	ldrh	r3, [r5, #10]
    5834:	0afffff4 	beq	580c <dir_clear+0x64>
    5838:	e0540003 	subs	r0, r4, r3
    583c:	13a00001 	movne	r0, #1
    5840:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5844:	e3a00001 	mov	r0, #1
    5848:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000584c <get_fileinfo.part.0.constprop.0.isra.0>:
    584c:	e92d4030 	push	{r4, r5, lr}
    5850:	e2402001 	sub	r2, r0, #1
    5854:	e280400a 	add	r4, r0, #10
    5858:	e3a0e000 	mov	lr, #0
    585c:	e3a0502e 	mov	r5, #46	; 0x2e
    5860:	e1a0c002 	mov	ip, r2
    5864:	e5f23001 	ldrb	r3, [r2, #1]!
    5868:	e24cc007 	sub	ip, ip, #7
    586c:	e3530020 	cmp	r3, #32
    5870:	0a000008 	beq	5898 <get_fileinfo.part.0.constprop.0.isra.0+0x4c>
    5874:	e3530005 	cmp	r3, #5
    5878:	03a030e5 	moveq	r3, #229	; 0xe5
    587c:	e15c0000 	cmp	ip, r0
    5880:	0081c00e 	addeq	ip, r1, lr
    5884:	028ee001 	addeq	lr, lr, #1
    5888:	05cc5009 	strbeq	r5, [ip, #9]
    588c:	e081c00e 	add	ip, r1, lr
    5890:	e28ee001 	add	lr, lr, #1
    5894:	e5cc3009 	strb	r3, [ip, #9]
    5898:	e1540002 	cmp	r4, r2
    589c:	1affffef 	bne	5860 <get_fileinfo.part.0.constprop.0.isra.0+0x14>
    58a0:	e3a03000 	mov	r3, #0
    58a4:	e081e00e 	add	lr, r1, lr
    58a8:	e5ce3009 	strb	r3, [lr, #9]
    58ac:	e5d0300b 	ldrb	r3, [r0, #11]
    58b0:	e203303f 	and	r3, r3, #63	; 0x3f
    58b4:	e5c13008 	strb	r3, [r1, #8]
    58b8:	e590301c 	ldr	r3, [r0, #28]
    58bc:	e5813000 	str	r3, [r1]
    58c0:	e1d031b6 	ldrh	r3, [r0, #22]
    58c4:	e1c130b6 	strh	r3, [r1, #6]
    58c8:	e1d031b8 	ldrh	r3, [r0, #24]
    58cc:	e1c130b4 	strh	r3, [r1, #4]
    58d0:	e8bd8030 	pop	{r4, r5, pc}

000058d4 <sync_fs>:
    58d4:	e92d4070 	push	{r4, r5, r6, lr}
    58d8:	e1a04000 	mov	r4, r0
    58dc:	e5d03004 	ldrb	r3, [r0, #4]
    58e0:	e3530000 	cmp	r3, #0
    58e4:	1a000009 	bne	5910 <sync_fs+0x3c>
    58e8:	e5d45005 	ldrb	r5, [r4, #5]
    58ec:	e3550001 	cmp	r5, #1
    58f0:	0a00001e 	beq	5970 <sync_fs+0x9c>
    58f4:	e3a02000 	mov	r2, #0
    58f8:	e5d40001 	ldrb	r0, [r4, #1]
    58fc:	e1a01002 	mov	r1, r2
    5900:	eb000ea3 	bl	9394 <disk_ioctl>
    5904:	e2500000 	subs	r0, r0, #0
    5908:	13a00001 	movne	r0, #1
    590c:	e8bd8070 	pop	{r4, r5, r6, pc}
    5910:	e2805040 	add	r5, r0, #64	; 0x40
    5914:	e590201c 	ldr	r2, [r0, #28]
    5918:	e3a03001 	mov	r3, #1
    591c:	e5d00001 	ldrb	r0, [r0, #1]
    5920:	e1a01005 	mov	r1, r5
    5924:	eb000ed2 	bl	9474 <disk_write>
    5928:	e3500000 	cmp	r0, #0
    592c:	1a00002d 	bne	59e8 <sync_fs+0x114>
    5930:	e594101c 	ldr	r1, [r4, #28]
    5934:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    5938:	e5942018 	ldr	r2, [r4, #24]
    593c:	e5c40004 	strb	r0, [r4, #4]
    5940:	e0413003 	sub	r3, r1, r3
    5944:	e1530002 	cmp	r3, r2
    5948:	2affffe6 	bcs	58e8 <sync_fs+0x14>
    594c:	e5d43003 	ldrb	r3, [r4, #3]
    5950:	e3530002 	cmp	r3, #2
    5954:	1affffe3 	bne	58e8 <sync_fs+0x14>
    5958:	e0812002 	add	r2, r1, r2
    595c:	e5d40001 	ldrb	r0, [r4, #1]
    5960:	e3a03001 	mov	r3, #1
    5964:	e1a01005 	mov	r1, r5
    5968:	eb000ec1 	bl	9474 <disk_write>
    596c:	eaffffdd 	b	58e8 <sync_fs+0x14>
    5970:	e5d43000 	ldrb	r3, [r4]
    5974:	e3a01000 	mov	r1, #0
    5978:	e5c41005 	strb	r1, [r4, #5]
    597c:	e3530003 	cmp	r3, #3
    5980:	1affffdb 	bne	58f4 <sync_fs+0x20>
    5984:	e2846040 	add	r6, r4, #64	; 0x40
    5988:	e3a02c02 	mov	r2, #512	; 0x200
    598c:	e1a00006 	mov	r0, r6
    5990:	fa002e54 	blx	112e8 <memset>
    5994:	e5942010 	ldr	r2, [r4, #16]
    5998:	e3053252 	movw	r3, #21074	; 0x5252
    599c:	e594100c 	ldr	r1, [r4, #12]
    59a0:	e3070272 	movw	r0, #29298	; 0x7272
    59a4:	e3443161 	movt	r3, #16737	; 0x4161
    59a8:	e3460141 	movt	r0, #24897	; 0x6141
    59ac:	e5842228 	str	r2, [r4, #552]	; 0x228
    59b0:	e3a02000 	mov	r2, #0
    59b4:	e34a2a55 	movt	r2, #43605	; 0xaa55
    59b8:	e584122c 	str	r1, [r4, #556]	; 0x22c
    59bc:	e584223c 	str	r2, [r4, #572]	; 0x23c
    59c0:	e1a01006 	mov	r1, r6
    59c4:	e5942020 	ldr	r2, [r4, #32]
    59c8:	e5843040 	str	r3, [r4, #64]	; 0x40
    59cc:	e1a03005 	mov	r3, r5
    59d0:	e5840224 	str	r0, [r4, #548]	; 0x224
    59d4:	e2822001 	add	r2, r2, #1
    59d8:	e5d40001 	ldrb	r0, [r4, #1]
    59dc:	e584201c 	str	r2, [r4, #28]
    59e0:	eb000ea3 	bl	9474 <disk_write>
    59e4:	eaffffc2 	b	58f4 <sync_fs+0x20>
    59e8:	e3a00001 	mov	r0, #1
    59ec:	e8bd8070 	pop	{r4, r5, r6, pc}

000059f0 <move_window>:
    59f0:	e590201c 	ldr	r2, [r0, #28]
    59f4:	e1520001 	cmp	r2, r1
    59f8:	1a000001 	bne	5a04 <move_window+0x14>
    59fc:	e3a00000 	mov	r0, #0
    5a00:	e12fff1e 	bx	lr
    5a04:	e92d4070 	push	{r4, r5, r6, lr}
    5a08:	e1a04000 	mov	r4, r0
    5a0c:	e5d03004 	ldrb	r3, [r0, #4]
    5a10:	e1a05001 	mov	r5, r1
    5a14:	e2846040 	add	r6, r4, #64	; 0x40
    5a18:	e5d00001 	ldrb	r0, [r0, #1]
    5a1c:	e3530000 	cmp	r3, #0
    5a20:	1a000008 	bne	5a48 <move_window+0x58>
    5a24:	e1a02005 	mov	r2, r5
    5a28:	e3a03001 	mov	r3, #1
    5a2c:	e1a01006 	mov	r1, r6
    5a30:	eb000e36 	bl	9310 <disk_read>
    5a34:	e3500000 	cmp	r0, #0
    5a38:	13e05000 	mvnne	r5, #0
    5a3c:	13a00001 	movne	r0, #1
    5a40:	e584501c 	str	r5, [r4, #28]
    5a44:	e8bd8070 	pop	{r4, r5, r6, pc}
    5a48:	e3a03001 	mov	r3, #1
    5a4c:	e1a01006 	mov	r1, r6
    5a50:	eb000e87 	bl	9474 <disk_write>
    5a54:	e3500000 	cmp	r0, #0
    5a58:	1a000010 	bne	5aa0 <move_window+0xb0>
    5a5c:	e594101c 	ldr	r1, [r4, #28]
    5a60:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    5a64:	e5942018 	ldr	r2, [r4, #24]
    5a68:	e5c40004 	strb	r0, [r4, #4]
    5a6c:	e0413003 	sub	r3, r1, r3
    5a70:	e5d40001 	ldrb	r0, [r4, #1]
    5a74:	e1530002 	cmp	r3, r2
    5a78:	2affffe9 	bcs	5a24 <move_window+0x34>
    5a7c:	e5d43003 	ldrb	r3, [r4, #3]
    5a80:	e3530002 	cmp	r3, #2
    5a84:	1affffe6 	bne	5a24 <move_window+0x34>
    5a88:	e0812002 	add	r2, r1, r2
    5a8c:	e3a03001 	mov	r3, #1
    5a90:	e1a01006 	mov	r1, r6
    5a94:	eb000e76 	bl	9474 <disk_write>
    5a98:	e5d40001 	ldrb	r0, [r4, #1]
    5a9c:	eaffffe0 	b	5a24 <move_window+0x34>
    5aa0:	e3a00001 	mov	r0, #1
    5aa4:	e8bd8070 	pop	{r4, r5, r6, pc}

00005aa8 <put_fat.part.0>:
    5aa8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    5aac:	e1a04000 	mov	r4, r0
    5ab0:	e5d07000 	ldrb	r7, [r0]
    5ab4:	e1a05001 	mov	r5, r1
    5ab8:	e1a08002 	mov	r8, r2
    5abc:	e3570002 	cmp	r7, #2
    5ac0:	0a00002e 	beq	5b80 <put_fat.part.0+0xd8>
    5ac4:	e3570003 	cmp	r7, #3
    5ac8:	0a00001d 	beq	5b44 <put_fat.part.0+0x9c>
    5acc:	e3570001 	cmp	r7, #1
    5ad0:	13a06002 	movne	r6, #2
    5ad4:	1a000018 	bne	5b3c <put_fat.part.0+0x94>
    5ad8:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5adc:	e08590a5 	add	r9, r5, r5, lsr #1
    5ae0:	e08114a9 	add	r1, r1, r9, lsr #9
    5ae4:	ebffffc1 	bl	59f0 <move_window>
    5ae8:	e2506000 	subs	r6, r0, #0
    5aec:	1a000012 	bne	5b3c <put_fat.part.0+0x94>
    5af0:	e3150001 	tst	r5, #1
    5af4:	e289a001 	add	sl, r9, #1
    5af8:	e6ef1078 	uxtb	r1, r8
    5afc:	e1a024aa 	lsr	r2, sl, #9
    5b00:	e7e89059 	ubfx	r9, r9, #0, #9
    5b04:	e2845040 	add	r5, r4, #64	; 0x40
    5b08:	0a00002c 	beq	5bc0 <put_fat.part.0+0x118>
    5b0c:	e7d53009 	ldrb	r3, [r5, r9]
    5b10:	e1a00004 	mov	r0, r4
    5b14:	e203300f 	and	r3, r3, #15
    5b18:	e1833201 	orr	r3, r3, r1, lsl #4
    5b1c:	e7c53009 	strb	r3, [r5, r9]
    5b20:	e5941024 	ldr	r1, [r4, #36]	; 0x24
    5b24:	e5c47004 	strb	r7, [r4, #4]
    5b28:	e0821001 	add	r1, r2, r1
    5b2c:	ebffffaf 	bl	59f0 <move_window>
    5b30:	e3500000 	cmp	r0, #0
    5b34:	0a000033 	beq	5c08 <put_fat.part.0+0x160>
    5b38:	e1a06000 	mov	r6, r0
    5b3c:	e1a00006 	mov	r0, r6
    5b40:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    5b44:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5b48:	e08113a5 	add	r1, r1, r5, lsr #7
    5b4c:	ebffffa7 	bl	59f0 <move_window>
    5b50:	e2506000 	subs	r6, r0, #0
    5b54:	1afffff8 	bne	5b3c <put_fat.part.0+0x94>
    5b58:	e1a05105 	lsl	r5, r5, #2
    5b5c:	e2842040 	add	r2, r4, #64	; 0x40
    5b60:	e3a01001 	mov	r1, #1
    5b64:	e2055f7f 	and	r5, r5, #508	; 0x1fc
    5b68:	e1a00006 	mov	r0, r6
    5b6c:	e7923005 	ldr	r3, [r2, r5]
    5b70:	e7db3018 	bfi	r3, r8, #0, #28
    5b74:	e7823005 	str	r3, [r2, r5]
    5b78:	e5c41004 	strb	r1, [r4, #4]
    5b7c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    5b80:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5b84:	e0811425 	add	r1, r1, r5, lsr #8
    5b88:	ebffff98 	bl	59f0 <move_window>
    5b8c:	e2506000 	subs	r6, r0, #0
    5b90:	1affffe9 	bne	5b3c <put_fat.part.0+0x94>
    5b94:	e30021fe 	movw	r2, #510	; 0x1fe
    5b98:	e2843040 	add	r3, r4, #64	; 0x40
    5b9c:	e0022085 	and	r2, r2, r5, lsl #1
    5ba0:	e3a01001 	mov	r1, #1
    5ba4:	e1a00006 	mov	r0, r6
    5ba8:	e7c38002 	strb	r8, [r3, r2]
    5bac:	e0833002 	add	r3, r3, r2
    5bb0:	e7e72458 	ubfx	r2, r8, #8, #8
    5bb4:	e5c32001 	strb	r2, [r3, #1]
    5bb8:	e5c41004 	strb	r1, [r4, #4]
    5bbc:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    5bc0:	e7c51009 	strb	r1, [r5, r9]
    5bc4:	e1a00004 	mov	r0, r4
    5bc8:	e5941024 	ldr	r1, [r4, #36]	; 0x24
    5bcc:	e5c47004 	strb	r7, [r4, #4]
    5bd0:	e0821001 	add	r1, r2, r1
    5bd4:	ebffff85 	bl	59f0 <move_window>
    5bd8:	e3500000 	cmp	r0, #0
    5bdc:	1affffd5 	bne	5b38 <put_fat.part.0+0x90>
    5be0:	e7e8a05a 	ubfx	sl, sl, #0, #9
    5be4:	e7e32458 	ubfx	r2, r8, #8, #4
    5be8:	e7d5300a 	ldrb	r3, [r5, sl]
    5bec:	e085500a 	add	r5, r5, sl
    5bf0:	e3c3300f 	bic	r3, r3, #15
    5bf4:	e1833002 	orr	r3, r3, r2
    5bf8:	e3a02001 	mov	r2, #1
    5bfc:	e5c53000 	strb	r3, [r5]
    5c00:	e5c42004 	strb	r2, [r4, #4]
    5c04:	eaffffcc 	b	5b3c <put_fat.part.0+0x94>
    5c08:	e7e8a05a 	ubfx	sl, sl, #0, #9
    5c0c:	e7e73258 	ubfx	r3, r8, #4, #8
    5c10:	e085500a 	add	r5, r5, sl
    5c14:	eafffff7 	b	5bf8 <put_fat.part.0+0x150>

00005c18 <get_fat.isra.0>:
    5c18:	e3510001 	cmp	r1, #1
    5c1c:	9a000016 	bls	5c7c <get_fat.isra.0+0x64>
    5c20:	e5903014 	ldr	r3, [r0, #20]
    5c24:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    5c28:	e1a04001 	mov	r4, r1
    5c2c:	e1a06000 	mov	r6, r0
    5c30:	e1510003 	cmp	r1, r3
    5c34:	2a00000e 	bcs	5c74 <get_fat.isra.0+0x5c>
    5c38:	e5d03000 	ldrb	r3, [r0]
    5c3c:	e3530002 	cmp	r3, #2
    5c40:	0a00001a 	beq	5cb0 <get_fat.isra.0+0x98>
    5c44:	e3530003 	cmp	r3, #3
    5c48:	0a00000d 	beq	5c84 <get_fat.isra.0+0x6c>
    5c4c:	e3530001 	cmp	r3, #1
    5c50:	1a000007 	bne	5c74 <get_fat.isra.0+0x5c>
    5c54:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5c58:	e08450a4 	add	r5, r4, r4, lsr #1
    5c5c:	e08114a5 	add	r1, r1, r5, lsr #9
    5c60:	ebffff62 	bl	59f0 <move_window>
    5c64:	e3500000 	cmp	r0, #0
    5c68:	0a00001a 	beq	5cd8 <get_fat.isra.0+0xc0>
    5c6c:	e3e00000 	mvn	r0, #0
    5c70:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5c74:	e3a00001 	mov	r0, #1
    5c78:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5c7c:	e3a00001 	mov	r0, #1
    5c80:	e12fff1e 	bx	lr
    5c84:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5c88:	e08113a4 	add	r1, r1, r4, lsr #7
    5c8c:	ebffff57 	bl	59f0 <move_window>
    5c90:	e3500000 	cmp	r0, #0
    5c94:	1afffff4 	bne	5c6c <get_fat.isra.0+0x54>
    5c98:	e1a04104 	lsl	r4, r4, #2
    5c9c:	e2044f7f 	and	r4, r4, #508	; 0x1fc
    5ca0:	e0863004 	add	r3, r6, r4
    5ca4:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    5ca8:	e3c0020f 	bic	r0, r0, #-268435456	; 0xf0000000
    5cac:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5cb0:	e5901024 	ldr	r1, [r0, #36]	; 0x24
    5cb4:	e0811424 	add	r1, r1, r4, lsr #8
    5cb8:	ebffff4c 	bl	59f0 <move_window>
    5cbc:	e3500000 	cmp	r0, #0
    5cc0:	1affffe9 	bne	5c6c <get_fat.isra.0+0x54>
    5cc4:	e30031fe 	movw	r3, #510	; 0x1fe
    5cc8:	e0033084 	and	r3, r3, r4, lsl #1
    5ccc:	e0863003 	add	r3, r6, r3
    5cd0:	e1d304b0 	ldrh	r0, [r3, #64]	; 0x40
    5cd4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5cd8:	e5961024 	ldr	r1, [r6, #36]	; 0x24
    5cdc:	e2857001 	add	r7, r5, #1
    5ce0:	e7e85055 	ubfx	r5, r5, #0, #9
    5ce4:	e1a00006 	mov	r0, r6
    5ce8:	e0865005 	add	r5, r6, r5
    5cec:	e5d55040 	ldrb	r5, [r5, #64]	; 0x40
    5cf0:	e08114a7 	add	r1, r1, r7, lsr #9
    5cf4:	ebffff3d 	bl	59f0 <move_window>
    5cf8:	e3500000 	cmp	r0, #0
    5cfc:	1affffda 	bne	5c6c <get_fat.isra.0+0x54>
    5d00:	e7e87057 	ubfx	r7, r7, #0, #9
    5d04:	e3140001 	tst	r4, #1
    5d08:	e0867007 	add	r7, r6, r7
    5d0c:	e5d73040 	ldrb	r3, [r7, #64]	; 0x40
    5d10:	e1850403 	orr	r0, r5, r3, lsl #8
    5d14:	11a00220 	lsrne	r0, r0, #4
    5d18:	07eb0050 	ubfxeq	r0, r0, #0, #12
    5d1c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00005d20 <dir_sdi.constprop.0>:
    5d20:	e5901008 	ldr	r1, [r0, #8]
    5d24:	e3a03000 	mov	r3, #0
    5d28:	e92d4070 	push	{r4, r5, r6, lr}
    5d2c:	e1a04000 	mov	r4, r0
    5d30:	e5905000 	ldr	r5, [r0]
    5d34:	e1510003 	cmp	r1, r3
    5d38:	e5803010 	str	r3, [r0, #16]
    5d3c:	1a000012 	bne	5d8c <dir_sdi.constprop.0+0x6c>
    5d40:	e5d53000 	ldrb	r3, [r5]
    5d44:	e3530002 	cmp	r3, #2
    5d48:	8a00000b 	bhi	5d7c <dir_sdi.constprop.0+0x5c>
    5d4c:	e1d530b8 	ldrh	r3, [r5, #8]
    5d50:	e3530000 	cmp	r3, #0
    5d54:	15953028 	ldrne	r3, [r5, #40]	; 0x28
    5d58:	0a00001c 	beq	5dd0 <dir_sdi.constprop.0+0xb0>
    5d5c:	e3530000 	cmp	r3, #0
    5d60:	e5843018 	str	r3, [r4, #24]
    5d64:	e5841014 	str	r1, [r4, #20]
    5d68:	0a000018 	beq	5dd0 <dir_sdi.constprop.0+0xb0>
    5d6c:	e2855040 	add	r5, r5, #64	; 0x40
    5d70:	e3a00000 	mov	r0, #0
    5d74:	e584501c 	str	r5, [r4, #28]
    5d78:	e8bd8070 	pop	{r4, r5, r6, pc}
    5d7c:	e5953028 	ldr	r3, [r5, #40]	; 0x28
    5d80:	e3530000 	cmp	r3, #0
    5d84:	11a01003 	movne	r1, r3
    5d88:	0affffef 	beq	5d4c <dir_sdi.constprop.0+0x2c>
    5d8c:	e1d530ba 	ldrh	r3, [r5, #10]
    5d90:	e3530000 	cmp	r3, #0
    5d94:	1a00000f 	bne	5dd8 <dir_sdi.constprop.0+0xb8>
    5d98:	e1a00005 	mov	r0, r5
    5d9c:	ea000005 	b	5db8 <dir_sdi.constprop.0+0x98>
    5da0:	e3500001 	cmp	r0, #1
    5da4:	9a000009 	bls	5dd0 <dir_sdi.constprop.0+0xb0>
    5da8:	e5953014 	ldr	r3, [r5, #20]
    5dac:	e1500003 	cmp	r0, r3
    5db0:	2a000006 	bcs	5dd0 <dir_sdi.constprop.0+0xb0>
    5db4:	e5940000 	ldr	r0, [r4]
    5db8:	ebffff96 	bl	5c18 <get_fat.isra.0>
    5dbc:	e3700001 	cmn	r0, #1
    5dc0:	e1a01000 	mov	r1, r0
    5dc4:	1afffff5 	bne	5da0 <dir_sdi.constprop.0+0x80>
    5dc8:	e3a00001 	mov	r0, #1
    5dcc:	e8bd8070 	pop	{r4, r5, r6, pc}
    5dd0:	e3a00002 	mov	r0, #2
    5dd4:	e8bd8070 	pop	{r4, r5, r6, pc}
    5dd8:	e5952014 	ldr	r2, [r5, #20]
    5ddc:	e2410002 	sub	r0, r1, #2
    5de0:	e2422002 	sub	r2, r2, #2
    5de4:	e1500002 	cmp	r0, r2
    5de8:	23a03000 	movcs	r3, #0
    5dec:	25841014 	strcs	r1, [r4, #20]
    5df0:	25843018 	strcs	r3, [r4, #24]
    5df4:	2afffff5 	bcs	5dd0 <dir_sdi.constprop.0+0xb0>
    5df8:	e595202c 	ldr	r2, [r5, #44]	; 0x2c
    5dfc:	e0232390 	mla	r3, r0, r3, r2
    5e00:	eaffffd5 	b	5d5c <dir_sdi.constprop.0+0x3c>

00005e04 <remove_chain>:
    5e04:	e3510001 	cmp	r1, #1
    5e08:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    5e0c:	e5905000 	ldr	r5, [r0]
    5e10:	9a00000b 	bls	5e44 <remove_chain+0x40>
    5e14:	e5953014 	ldr	r3, [r5, #20]
    5e18:	e1a06001 	mov	r6, r1
    5e1c:	e1530001 	cmp	r3, r1
    5e20:	9a000007 	bls	5e44 <remove_chain+0x40>
    5e24:	e3520000 	cmp	r2, #0
    5e28:	e1a07000 	mov	r7, r0
    5e2c:	e1a01002 	mov	r1, r2
    5e30:	01a00005 	moveq	r0, r5
    5e34:	0a000013 	beq	5e88 <remove_chain+0x84>
    5e38:	e3520001 	cmp	r2, #1
    5e3c:	11530002 	cmpne	r3, r2
    5e40:	8a000022 	bhi	5ed0 <remove_chain+0xcc>
    5e44:	e3a00002 	mov	r0, #2
    5e48:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5e4c:	ebffff15 	bl	5aa8 <put_fat.part.0>
    5e50:	e3500000 	cmp	r0, #0
    5e54:	e1a06004 	mov	r6, r4
    5e58:	18bd81f0 	popne	{r4, r5, r6, r7, r8, pc}
    5e5c:	e1c521d0 	ldrd	r2, [r5, #16]
    5e60:	e2431002 	sub	r1, r3, #2
    5e64:	e2820001 	add	r0, r2, #1
    5e68:	e1520001 	cmp	r2, r1
    5e6c:	35d52005 	ldrbcc	r2, [r5, #5]
    5e70:	35850010 	strcc	r0, [r5, #16]
    5e74:	33822001 	orrcc	r2, r2, #1
    5e78:	35c52005 	strbcc	r2, [r5, #5]
    5e7c:	e1530004 	cmp	r3, r4
    5e80:	9a000010 	bls	5ec8 <remove_chain+0xc4>
    5e84:	e5970000 	ldr	r0, [r7]
    5e88:	e1a01006 	mov	r1, r6
    5e8c:	ebffff61 	bl	5c18 <get_fat.isra.0>
    5e90:	e1a04000 	mov	r4, r0
    5e94:	e3a02000 	mov	r2, #0
    5e98:	e3540000 	cmp	r4, #0
    5e9c:	e1a01006 	mov	r1, r6
    5ea0:	e1a00005 	mov	r0, r5
    5ea4:	0a000007 	beq	5ec8 <remove_chain+0xc4>
    5ea8:	e3540001 	cmp	r4, #1
    5eac:	0affffe4 	beq	5e44 <remove_chain+0x40>
    5eb0:	e3740001 	cmn	r4, #1
    5eb4:	0a00000b 	beq	5ee8 <remove_chain+0xe4>
    5eb8:	e5953014 	ldr	r3, [r5, #20]
    5ebc:	e1560003 	cmp	r6, r3
    5ec0:	3affffe1 	bcc	5e4c <remove_chain+0x48>
    5ec4:	eaffffde 	b	5e44 <remove_chain+0x40>
    5ec8:	e3a00000 	mov	r0, #0
    5ecc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5ed0:	e3e02000 	mvn	r2, #0
    5ed4:	e1a00005 	mov	r0, r5
    5ed8:	ebfffef2 	bl	5aa8 <put_fat.part.0>
    5edc:	e3500000 	cmp	r0, #0
    5ee0:	0affffe7 	beq	5e84 <remove_chain+0x80>
    5ee4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5ee8:	e3a00001 	mov	r0, #1
    5eec:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00005ef0 <create_chain>:
    5ef0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    5ef4:	e2517000 	subs	r7, r1, #0
    5ef8:	e5905000 	ldr	r5, [r0]
    5efc:	e1a06000 	mov	r6, r0
    5f00:	1a000025 	bne	5f9c <create_chain+0xac>
    5f04:	e595800c 	ldr	r8, [r5, #12]
    5f08:	e5952010 	ldr	r2, [r5, #16]
    5f0c:	e3580000 	cmp	r8, #0
    5f10:	1a00001a 	bne	5f80 <create_chain+0x90>
    5f14:	e3520000 	cmp	r2, #0
    5f18:	0a00001d 	beq	5f94 <create_chain+0xa4>
    5f1c:	e5953014 	ldr	r3, [r5, #20]
    5f20:	e3a08001 	mov	r8, #1
    5f24:	e1a04008 	mov	r4, r8
    5f28:	ea000005 	b	5f44 <create_chain+0x54>
    5f2c:	e3700001 	cmn	r0, #1
    5f30:	13500001 	cmpne	r0, #1
    5f34:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    5f38:	e1540008 	cmp	r4, r8
    5f3c:	0a000014 	beq	5f94 <create_chain+0xa4>
    5f40:	e5953014 	ldr	r3, [r5, #20]
    5f44:	e2844001 	add	r4, r4, #1
    5f48:	e1540003 	cmp	r4, r3
    5f4c:	3a000002 	bcc	5f5c <create_chain+0x6c>
    5f50:	e3580001 	cmp	r8, #1
    5f54:	e3a04002 	mov	r4, #2
    5f58:	0a00000d 	beq	5f94 <create_chain+0xa4>
    5f5c:	e5960000 	ldr	r0, [r6]
    5f60:	e1a01004 	mov	r1, r4
    5f64:	ebffff2b 	bl	5c18 <get_fat.isra.0>
    5f68:	e3500000 	cmp	r0, #0
    5f6c:	1affffee 	bne	5f2c <create_chain+0x3c>
    5f70:	e3540001 	cmp	r4, #1
    5f74:	8a00004f 	bhi	60b8 <_STACK_SIZE+0xb8>
    5f78:	e3a00001 	mov	r0, #1
    5f7c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5f80:	e5953014 	ldr	r3, [r5, #20]
    5f84:	e1530008 	cmp	r3, r8
    5f88:	9affffe1 	bls	5f14 <create_chain+0x24>
    5f8c:	e3520000 	cmp	r2, #0
    5f90:	1affffe3 	bne	5f24 <create_chain+0x34>
    5f94:	e3a00000 	mov	r0, #0
    5f98:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    5f9c:	e1a00005 	mov	r0, r5
    5fa0:	ebffff1c 	bl	5c18 <get_fat.isra.0>
    5fa4:	e3500001 	cmp	r0, #1
    5fa8:	9afffff2 	bls	5f78 <create_chain+0x88>
    5fac:	e3700001 	cmn	r0, #1
    5fb0:	0a000046 	beq	60d0 <_STACK_SIZE+0xd0>
    5fb4:	e5953014 	ldr	r3, [r5, #20]
    5fb8:	e1530000 	cmp	r3, r0
    5fbc:	88bd81f0 	pophi	{r4, r5, r6, r7, r8, pc}
    5fc0:	e5952010 	ldr	r2, [r5, #16]
    5fc4:	e3520000 	cmp	r2, #0
    5fc8:	0afffff1 	beq	5f94 <create_chain+0xa4>
    5fcc:	e2874001 	add	r4, r7, #1
    5fd0:	e5960000 	ldr	r0, [r6]
    5fd4:	e1530004 	cmp	r3, r4
    5fd8:	93a04002 	movls	r4, #2
    5fdc:	e1a01004 	mov	r1, r4
    5fe0:	ebffff0c 	bl	5c18 <get_fat.isra.0>
    5fe4:	e3700001 	cmn	r0, #1
    5fe8:	13500001 	cmpne	r0, #1
    5fec:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    5ff0:	e5953014 	ldr	r3, [r5, #20]
    5ff4:	e3500000 	cmp	r0, #0
    5ff8:	e1a02003 	mov	r2, r3
    5ffc:	1a000027 	bne	60a0 <_STACK_SIZE+0xa0>
    6000:	e3540000 	cmp	r4, #0
    6004:	0a00002d 	beq	60c0 <_STACK_SIZE+0xc0>
    6008:	e1520004 	cmp	r2, r4
    600c:	9affffd9 	bls	5f78 <create_chain+0x88>
    6010:	e3e02000 	mvn	r2, #0
    6014:	e1a01004 	mov	r1, r4
    6018:	e1a00005 	mov	r0, r5
    601c:	ebfffea1 	bl	5aa8 <put_fat.part.0>
    6020:	e16f3f10 	clz	r3, r0
    6024:	e3570000 	cmp	r7, #0
    6028:	e1a032a3 	lsr	r3, r3, #5
    602c:	03a03000 	moveq	r3, #0
    6030:	e3530000 	cmp	r3, #0
    6034:	1a00000f 	bne	6078 <_STACK_SIZE+0x78>
    6038:	e3500000 	cmp	r0, #0
    603c:	1a000021 	bne	60c8 <_STACK_SIZE+0xc8>
    6040:	e5953010 	ldr	r3, [r5, #16]
    6044:	e585400c 	str	r4, [r5, #12]
    6048:	e3530000 	cmp	r3, #0
    604c:	0a000007 	beq	6070 <_STACK_SIZE+0x70>
    6050:	e5952014 	ldr	r2, [r5, #20]
    6054:	e2422002 	sub	r2, r2, #2
    6058:	e1530002 	cmp	r3, r2
    605c:	95d52005 	ldrbls	r2, [r5, #5]
    6060:	92433001 	subls	r3, r3, #1
    6064:	95853010 	strls	r3, [r5, #16]
    6068:	93823001 	orrls	r3, r2, #1
    606c:	95c53005 	strbls	r3, [r5, #5]
    6070:	e1a00004 	mov	r0, r4
    6074:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    6078:	e3570001 	cmp	r7, #1
    607c:	0affffbd 	beq	5f78 <create_chain+0x88>
    6080:	e5953014 	ldr	r3, [r5, #20]
    6084:	e1570003 	cmp	r7, r3
    6088:	2affffba 	bcs	5f78 <create_chain+0x88>
    608c:	e1a02004 	mov	r2, r4
    6090:	e1a01007 	mov	r1, r7
    6094:	e1a00005 	mov	r0, r5
    6098:	ebfffe82 	bl	5aa8 <put_fat.part.0>
    609c:	eaffffe5 	b	6038 <_STACK_SIZE+0x38>
    60a0:	e595800c 	ldr	r8, [r5, #12]
    60a4:	e3580001 	cmp	r8, #1
    60a8:	9a000004 	bls	60c0 <_STACK_SIZE+0xc0>
    60ac:	e1530008 	cmp	r3, r8
    60b0:	91a08007 	movls	r8, r7
    60b4:	eaffff9a 	b	5f24 <create_chain+0x34>
    60b8:	e5952014 	ldr	r2, [r5, #20]
    60bc:	eaffffd1 	b	6008 <_STACK_SIZE+0x8>
    60c0:	e1a08007 	mov	r8, r7
    60c4:	eaffff96 	b	5f24 <create_chain+0x34>
    60c8:	e3500001 	cmp	r0, #1
    60cc:	1affffa9 	bne	5f78 <create_chain+0x88>
    60d0:	e3e00000 	mvn	r0, #0
    60d4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

000060d8 <dir_next>:
    60d8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    60dc:	e1a04000 	mov	r4, r0
    60e0:	e5905010 	ldr	r5, [r0, #16]
    60e4:	e5906000 	ldr	r6, [r0]
    60e8:	e2855020 	add	r5, r5, #32
    60ec:	e3550602 	cmp	r5, #2097152	; 0x200000
    60f0:	3a000003 	bcc	6104 <dir_next+0x2c>
    60f4:	e3a03000 	mov	r3, #0
    60f8:	e5843018 	str	r3, [r4, #24]
    60fc:	e3a00004 	mov	r0, #4
    6100:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6104:	e5903018 	ldr	r3, [r0, #24]
    6108:	e3530000 	cmp	r3, #0
    610c:	0afffffa 	beq	60fc <dir_next+0x24>
    6110:	e7e88055 	ubfx	r8, r5, #0, #9
    6114:	e3580000 	cmp	r8, #0
    6118:	1a00002c 	bne	61d0 <dir_next+0xf8>
    611c:	e1a07001 	mov	r7, r1
    6120:	e5901014 	ldr	r1, [r0, #20]
    6124:	e2833001 	add	r3, r3, #1
    6128:	e5803018 	str	r3, [r0, #24]
    612c:	e3510000 	cmp	r1, #0
    6130:	0a00002c 	beq	61e8 <dir_next+0x110>
    6134:	e1d630ba 	ldrh	r3, [r6, #10]
    6138:	e2433001 	sub	r3, r3, #1
    613c:	e01394a5 	ands	r9, r3, r5, lsr #9
    6140:	1a000022 	bne	61d0 <dir_next+0xf8>
    6144:	e1a00006 	mov	r0, r6
    6148:	ebfffeb2 	bl	5c18 <get_fat.isra.0>
    614c:	e3500001 	cmp	r0, #1
    6150:	e1a0a000 	mov	sl, r0
    6154:	9a000029 	bls	6200 <dir_next+0x128>
    6158:	e3700001 	cmn	r0, #1
    615c:	0a000025 	beq	61f8 <dir_next+0x120>
    6160:	e5963014 	ldr	r3, [r6, #20]
    6164:	e1530000 	cmp	r3, r0
    6168:	8a000010 	bhi	61b0 <dir_next+0xd8>
    616c:	e3570000 	cmp	r7, #0
    6170:	0affffdf 	beq	60f4 <dir_next+0x1c>
    6174:	e5941014 	ldr	r1, [r4, #20]
    6178:	e1a00004 	mov	r0, r4
    617c:	ebffff5b 	bl	5ef0 <create_chain>
    6180:	e250a000 	subs	sl, r0, #0
    6184:	0a00001f 	beq	6208 <dir_next+0x130>
    6188:	e35a0001 	cmp	sl, #1
    618c:	0a00001b 	beq	6200 <dir_next+0x128>
    6190:	e37a0001 	cmn	sl, #1
    6194:	0a000017 	beq	61f8 <dir_next+0x120>
    6198:	e1a0100a 	mov	r1, sl
    619c:	e1a00006 	mov	r0, r6
    61a0:	ebfffd80 	bl	57a8 <dir_clear>
    61a4:	e3500000 	cmp	r0, #0
    61a8:	1a000012 	bne	61f8 <dir_next+0x120>
    61ac:	e5963014 	ldr	r3, [r6, #20]
    61b0:	e2433002 	sub	r3, r3, #2
    61b4:	e584a014 	str	sl, [r4, #20]
    61b8:	e24aa002 	sub	sl, sl, #2
    61bc:	e15a0003 	cmp	sl, r3
    61c0:	31d620ba 	ldrhcc	r2, [r6, #10]
    61c4:	3596302c 	ldrcc	r3, [r6, #44]	; 0x2c
    61c8:	3029329a 	mlacc	r9, sl, r2, r3
    61cc:	e5849018 	str	r9, [r4, #24]
    61d0:	e2866040 	add	r6, r6, #64	; 0x40
    61d4:	e3a00000 	mov	r0, #0
    61d8:	e0866008 	add	r6, r6, r8
    61dc:	e5845010 	str	r5, [r4, #16]
    61e0:	e584601c 	str	r6, [r4, #28]
    61e4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    61e8:	e1d630b8 	ldrh	r3, [r6, #8]
    61ec:	e15302a5 	cmp	r3, r5, lsr #5
    61f0:	8afffff6 	bhi	61d0 <dir_next+0xf8>
    61f4:	eaffffbe 	b	60f4 <dir_next+0x1c>
    61f8:	e3a00001 	mov	r0, #1
    61fc:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6200:	e3a00002 	mov	r0, #2
    6204:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6208:	e3a00007 	mov	r0, #7
    620c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00006210 <follow_path>:
    6210:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    6214:	e1a08001 	mov	r8, r1
    6218:	e5d11000 	ldrb	r1, [r1]
    621c:	e24dd014 	sub	sp, sp, #20
    6220:	e1a05000 	mov	r5, r0
    6224:	e5903000 	ldr	r3, [r0]
    6228:	e351005c 	cmp	r1, #92	; 0x5c
    622c:	1351002f 	cmpne	r1, #47	; 0x2f
    6230:	1a000003 	bne	6244 <follow_path+0x34>
    6234:	e5f82001 	ldrb	r2, [r8, #1]!
    6238:	e352005c 	cmp	r2, #92	; 0x5c
    623c:	1352002f 	cmpne	r2, #47	; 0x2f
    6240:	0afffffb 	beq	6234 <follow_path+0x24>
    6244:	e3a01000 	mov	r1, #0
    6248:	e5851008 	str	r1, [r5, #8]
    624c:	e5d81000 	ldrb	r1, [r8]
    6250:	e351001f 	cmp	r1, #31
    6254:	9a0000c2 	bls	6564 <follow_path+0x354>
    6258:	e302a020 	movw	sl, #8224	; 0x2020
    625c:	e302c078 	movw	ip, #8312	; 0x2078
    6260:	e2857020 	add	r7, r5, #32
    6264:	e342a020 	movt	sl, #8224	; 0x2020
    6268:	e1a0b005 	mov	fp, r5
    626c:	e340c001 	movt	ip, #1
    6270:	e58d300c 	str	r3, [sp, #12]
    6274:	e58dc008 	str	ip, [sp, #8]
    6278:	e587a004 	str	sl, [r7, #4]
    627c:	e587a000 	str	sl, [r7]
    6280:	e587a007 	str	sl, [r7, #7]
    6284:	e5d84000 	ldrb	r4, [r8]
    6288:	e3540020 	cmp	r4, #32
    628c:	9a000035 	bls	6368 <follow_path+0x158>
    6290:	e3a05000 	mov	r5, #0
    6294:	e3a09008 	mov	r9, #8
    6298:	e3a06001 	mov	r6, #1
    629c:	e1a03005 	mov	r3, r5
    62a0:	e354005c 	cmp	r4, #92	; 0x5c
    62a4:	1354002f 	cmpne	r4, #47	; 0x2f
    62a8:	0a000045 	beq	63c4 <follow_path+0x1b4>
    62ac:	e354002e 	cmp	r4, #46	; 0x2e
    62b0:	11590005 	cmpne	r9, r5
    62b4:	8a000012 	bhi	6304 <follow_path+0xf4>
    62b8:	e254402e 	subs	r4, r4, #46	; 0x2e
    62bc:	13a04001 	movne	r4, #1
    62c0:	e359000b 	cmp	r9, #11
    62c4:	03844001 	orreq	r4, r4, #1
    62c8:	e3540000 	cmp	r4, #0
    62cc:	1a000025 	bne	6368 <follow_path+0x158>
    62d0:	e1a03006 	mov	r3, r6
    62d4:	e3a05008 	mov	r5, #8
    62d8:	e3a0900b 	mov	r9, #11
    62dc:	e7d84003 	ldrb	r4, [r8, r3]
    62e0:	e2836001 	add	r6, r3, #1
    62e4:	e3540020 	cmp	r4, #32
    62e8:	8affffec 	bhi	62a0 <follow_path+0x90>
    62ec:	e5db3020 	ldrb	r3, [fp, #32]
    62f0:	e0888006 	add	r8, r8, r6
    62f4:	e35300e5 	cmp	r3, #229	; 0xe5
    62f8:	0a00009f 	beq	657c <follow_path+0x36c>
    62fc:	e3a09004 	mov	r9, #4
    6300:	ea000046 	b	6420 <follow_path+0x210>
    6304:	e3540080 	cmp	r4, #128	; 0x80
    6308:	9a00001a 	bls	6378 <follow_path+0x168>
    630c:	e354009f 	cmp	r4, #159	; 0x9f
    6310:	9a00000c 	bls	6348 <follow_path+0x138>
    6314:	e35400df 	cmp	r4, #223	; 0xdf
    6318:	9a000001 	bls	6324 <follow_path+0x114>
    631c:	e35400fc 	cmp	r4, #252	; 0xfc
    6320:	9a000008 	bls	6348 <follow_path+0x138>
    6324:	e59d0008 	ldr	r0, [sp, #8]
    6328:	e1a01004 	mov	r1, r4
    632c:	fa002c17 	blx	11390 <strchr>
    6330:	e3500000 	cmp	r0, #0
    6334:	1a00000b 	bne	6368 <follow_path+0x158>
    6338:	e7c74005 	strb	r4, [r7, r5]
    633c:	e1a03006 	mov	r3, r6
    6340:	e2855001 	add	r5, r5, #1
    6344:	eaffffe4 	b	62dc <follow_path+0xcc>
    6348:	e7d82006 	ldrb	r2, [r8, r6]
    634c:	e352003f 	cmp	r2, #63	; 0x3f
    6350:	9a000004 	bls	6368 <follow_path+0x158>
    6354:	e352007e 	cmp	r2, #126	; 0x7e
    6358:	9a000010 	bls	63a0 <follow_path+0x190>
    635c:	e2221080 	eor	r1, r2, #128	; 0x80
    6360:	e351007c 	cmp	r1, #124	; 0x7c
    6364:	9a00000d 	bls	63a0 <follow_path+0x190>
    6368:	e3a04006 	mov	r4, #6
    636c:	e1a00004 	mov	r0, r4
    6370:	e28dd014 	add	sp, sp, #20
    6374:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6378:	e59d0008 	ldr	r0, [sp, #8]
    637c:	e1a01004 	mov	r1, r4
    6380:	fa002c02 	blx	11390 <strchr>
    6384:	e3500000 	cmp	r0, #0
    6388:	1afffff6 	bne	6368 <follow_path+0x158>
    638c:	e2443061 	sub	r3, r4, #97	; 0x61
    6390:	e3530019 	cmp	r3, #25
    6394:	92444020 	subls	r4, r4, #32
    6398:	96ef4074 	uxtbls	r4, r4
    639c:	eaffffe5 	b	6338 <follow_path+0x128>
    63a0:	e2491001 	sub	r1, r9, #1
    63a4:	e1510005 	cmp	r1, r5
    63a8:	9affffee 	bls	6368 <follow_path+0x158>
    63ac:	e2851001 	add	r1, r5, #1
    63b0:	e7c74005 	strb	r4, [r7, r5]
    63b4:	e2833002 	add	r3, r3, #2
    63b8:	e2855002 	add	r5, r5, #2
    63bc:	e7c72001 	strb	r2, [r7, r1]
    63c0:	eaffffc5 	b	62dc <follow_path+0xcc>
    63c4:	e7d83006 	ldrb	r3, [r8, r6]
    63c8:	e353005c 	cmp	r3, #92	; 0x5c
    63cc:	1353002f 	cmpne	r3, #47	; 0x2f
    63d0:	e0883006 	add	r3, r8, r6
    63d4:	1a00006b 	bne	6588 <follow_path+0x378>
    63d8:	e2863001 	add	r3, r6, #1
    63dc:	e0883003 	add	r3, r8, r3
    63e0:	e1a08003 	mov	r8, r3
    63e4:	e4d32001 	ldrb	r2, [r3], #1
    63e8:	e352005c 	cmp	r2, #92	; 0x5c
    63ec:	1352002f 	cmpne	r2, #47	; 0x2f
    63f0:	0afffffa 	beq	63e0 <follow_path+0x1d0>
    63f4:	e3550000 	cmp	r5, #0
    63f8:	0affffda 	beq	6368 <follow_path+0x158>
    63fc:	e5db3020 	ldrb	r3, [fp, #32]
    6400:	e35300e5 	cmp	r3, #229	; 0xe5
    6404:	03a03005 	moveq	r3, #5
    6408:	05cb3020 	strbeq	r3, [fp, #32]
    640c:	e5d89000 	ldrb	r9, [r8]
    6410:	e3590020 	cmp	r9, #32
    6414:	83a09000 	movhi	r9, #0
    6418:	93a09001 	movls	r9, #1
    641c:	e1a09109 	lsl	r9, r9, #2
    6420:	e1a0000b 	mov	r0, fp
    6424:	e5cb902b 	strb	r9, [fp, #43]	; 0x2b
    6428:	e59b6000 	ldr	r6, [fp]
    642c:	ebfffe3b 	bl	5d20 <dir_sdi.constprop.0>
    6430:	e2504000 	subs	r4, r0, #0
    6434:	1a00000a 	bne	6464 <follow_path+0x254>
    6438:	e2863040 	add	r3, r6, #64	; 0x40
    643c:	e58d3004 	str	r3, [sp, #4]
    6440:	e596301c 	ldr	r3, [r6, #28]
    6444:	e1a00006 	mov	r0, r6
    6448:	e59b4018 	ldr	r4, [fp, #24]
    644c:	e1540003 	cmp	r4, r3
    6450:	0a000014 	beq	64a8 <follow_path+0x298>
    6454:	ebfffcb0 	bl	571c <sync_window>
    6458:	e2505000 	subs	r5, r0, #0
    645c:	0a000009 	beq	6488 <follow_path+0x278>
    6460:	e1a04005 	mov	r4, r5
    6464:	e3540004 	cmp	r4, #4
    6468:	1affffbf 	bne	636c <follow_path+0x15c>
    646c:	e3590000 	cmp	r9, #0
    6470:	13a04004 	movne	r4, #4
    6474:	1affffbc 	bne	636c <follow_path+0x15c>
    6478:	e3a04005 	mov	r4, #5
    647c:	e1a00004 	mov	r0, r4
    6480:	e28dd014 	add	sp, sp, #20
    6484:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6488:	e5d60001 	ldrb	r0, [r6, #1]
    648c:	e3a03001 	mov	r3, #1
    6490:	e59d1004 	ldr	r1, [sp, #4]
    6494:	e1a02004 	mov	r2, r4
    6498:	eb000b9c 	bl	9310 <disk_read>
    649c:	e3500000 	cmp	r0, #0
    64a0:	1a000029 	bne	654c <follow_path+0x33c>
    64a4:	e586401c 	str	r4, [r6, #28]
    64a8:	e59b301c 	ldr	r3, [fp, #28]
    64ac:	e3a0200b 	mov	r2, #11
    64b0:	e1a01007 	mov	r1, r7
    64b4:	e5d3c000 	ldrb	ip, [r3]
    64b8:	e1a00003 	mov	r0, r3
    64bc:	e35c0000 	cmp	ip, #0
    64c0:	0affffe9 	beq	646c <follow_path+0x25c>
    64c4:	e5d3400b 	ldrb	r4, [r3, #11]
    64c8:	e204c03f 	and	ip, r4, #63	; 0x3f
    64cc:	e5cbc006 	strb	ip, [fp, #6]
    64d0:	e5d3300b 	ldrb	r3, [r3, #11]
    64d4:	e2135008 	ands	r5, r3, #8
    64d8:	1a000002 	bne	64e8 <follow_path+0x2d8>
    64dc:	fa002b2c 	blx	11194 <memcmp>
    64e0:	e3500000 	cmp	r0, #0
    64e4:	0a000005 	beq	6500 <follow_path+0x2f0>
    64e8:	e3a01000 	mov	r1, #0
    64ec:	e1a0000b 	mov	r0, fp
    64f0:	ebfffef8 	bl	60d8 <dir_next>
    64f4:	e2505000 	subs	r5, r0, #0
    64f8:	0affffd0 	beq	6440 <follow_path+0x230>
    64fc:	eaffffd7 	b	6460 <follow_path+0x250>
    6500:	e3590000 	cmp	r9, #0
    6504:	e1a03005 	mov	r3, r5
    6508:	e1a05004 	mov	r5, r4
    650c:	e1a04003 	mov	r4, r3
    6510:	1affff95 	bne	636c <follow_path+0x15c>
    6514:	e3150010 	tst	r5, #16
    6518:	0affffd6 	beq	6478 <follow_path+0x268>
    651c:	e59d300c 	ldr	r3, [sp, #12]
    6520:	e59b1010 	ldr	r1, [fp, #16]
    6524:	e5d30000 	ldrb	r0, [r3]
    6528:	e2833040 	add	r3, r3, #64	; 0x40
    652c:	e7e81051 	ubfx	r1, r1, #0, #9
    6530:	e0833001 	add	r3, r3, r1
    6534:	e3500003 	cmp	r0, #3
    6538:	e1d311ba 	ldrh	r1, [r3, #26]
    653c:	01d331b4 	ldrheq	r3, [r3, #20]
    6540:	01811803 	orreq	r1, r1, r3, lsl #16
    6544:	e58b1008 	str	r1, [fp, #8]
    6548:	eaffff4a 	b	6278 <follow_path+0x68>
    654c:	e3e03000 	mvn	r3, #0
    6550:	e3a04001 	mov	r4, #1
    6554:	e1a00004 	mov	r0, r4
    6558:	e586301c 	str	r3, [r6, #28]
    655c:	e28dd014 	add	sp, sp, #20
    6560:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6564:	e3e0307f 	mvn	r3, #127	; 0x7f
    6568:	e1a00005 	mov	r0, r5
    656c:	e5c5302b 	strb	r3, [r5, #43]	; 0x2b
    6570:	e28dd014 	add	sp, sp, #20
    6574:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    6578:	eafffde8 	b	5d20 <dir_sdi.constprop.0>
    657c:	e3a03005 	mov	r3, #5
    6580:	e5cb3020 	strb	r3, [fp, #32]
    6584:	eaffff5c 	b	62fc <follow_path+0xec>
    6588:	e1a08003 	mov	r8, r3
    658c:	eaffff98 	b	63f4 <follow_path+0x1e4>

00006590 <dir_read.constprop.0>:
    6590:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    6594:	e1a04000 	mov	r4, r0
    6598:	e5947018 	ldr	r7, [r4, #24]
    659c:	e3a03004 	mov	r3, #4
    65a0:	e5905000 	ldr	r5, [r0]
    65a4:	e3570000 	cmp	r7, #0
    65a8:	e2856040 	add	r6, r5, #64	; 0x40
    65ac:	e1a00005 	mov	r0, r5
    65b0:	0a00002b 	beq	6664 <dir_read.constprop.0+0xd4>
    65b4:	e595301c 	ldr	r3, [r5, #28]
    65b8:	e1570003 	cmp	r7, r3
    65bc:	0a00000e 	beq	65fc <dir_read.constprop.0+0x6c>
    65c0:	ebfffc55 	bl	571c <sync_window>
    65c4:	e2503000 	subs	r3, r0, #0
    65c8:	0a000003 	beq	65dc <dir_read.constprop.0+0x4c>
    65cc:	e3a02000 	mov	r2, #0
    65d0:	e5842018 	str	r2, [r4, #24]
    65d4:	e1a00003 	mov	r0, r3
    65d8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    65dc:	e5d50001 	ldrb	r0, [r5, #1]
    65e0:	e3a03001 	mov	r3, #1
    65e4:	e1a02007 	mov	r2, r7
    65e8:	e1a01006 	mov	r1, r6
    65ec:	eb000b47 	bl	9310 <disk_read>
    65f0:	e3500000 	cmp	r0, #0
    65f4:	1a000021 	bne	6680 <dir_read.constprop.0+0xf0>
    65f8:	e585701c 	str	r7, [r5, #28]
    65fc:	e594201c 	ldr	r2, [r4, #28]
    6600:	e3a01000 	mov	r1, #0
    6604:	e1a00004 	mov	r0, r4
    6608:	e5d23000 	ldrb	r3, [r2]
    660c:	e1530001 	cmp	r3, r1
    6610:	0a00001e 	beq	6690 <dir_read.constprop.0+0x100>
    6614:	e5d2200b 	ldrb	r2, [r2, #11]
    6618:	e35300e5 	cmp	r3, #229	; 0xe5
    661c:	1353002e 	cmpne	r3, #46	; 0x2e
    6620:	13a03001 	movne	r3, #1
    6624:	03a03000 	moveq	r3, #0
    6628:	e202203f 	and	r2, r2, #63	; 0x3f
    662c:	e352000f 	cmp	r2, #15
    6630:	03a03000 	moveq	r3, #0
    6634:	12033001 	andne	r3, r3, #1
    6638:	e3c2c020 	bic	ip, r2, #32
    663c:	e1530001 	cmp	r3, r1
    6640:	e5c42006 	strb	r2, [r4, #6]
    6644:	1a00000a 	bne	6674 <dir_read.constprop.0+0xe4>
    6648:	ebfffea2 	bl	60d8 <dir_next>
    664c:	e2503000 	subs	r3, r0, #0
    6650:	1affffdd 	bne	65cc <dir_read.constprop.0+0x3c>
    6654:	e5947018 	ldr	r7, [r4, #24]
    6658:	e1a00005 	mov	r0, r5
    665c:	e3570000 	cmp	r7, #0
    6660:	1affffd3 	bne	65b4 <dir_read.constprop.0+0x24>
    6664:	e3530000 	cmp	r3, #0
    6668:	1a000008 	bne	6690 <dir_read.constprop.0+0x100>
    666c:	e3a03000 	mov	r3, #0
    6670:	eaffffd7 	b	65d4 <dir_read.constprop.0+0x44>
    6674:	e35c0008 	cmp	ip, #8
    6678:	0afffff2 	beq	6648 <dir_read.constprop.0+0xb8>
    667c:	eafffffa 	b	666c <dir_read.constprop.0+0xdc>
    6680:	e3e02000 	mvn	r2, #0
    6684:	e3a03001 	mov	r3, #1
    6688:	e585201c 	str	r2, [r5, #28]
    668c:	eaffffce 	b	65cc <dir_read.constprop.0+0x3c>
    6690:	e3a03004 	mov	r3, #4
    6694:	eaffffcc 	b	65cc <dir_read.constprop.0+0x3c>

00006698 <check_fs>:
    6698:	e3710001 	cmn	r1, #1
    669c:	e92d4070 	push	{r4, r5, r6, lr}
    66a0:	e3a03000 	mov	r3, #0
    66a4:	e3e06000 	mvn	r6, #0
    66a8:	e1a04000 	mov	r4, r0
    66ac:	e5c03004 	strb	r3, [r0, #4]
    66b0:	e580601c 	str	r6, [r0, #28]
    66b4:	1a00004c 	bne	67ec <check_fs+0x154>
    66b8:	e5d42040 	ldrb	r2, [r4, #64]	; 0x40
    66bc:	e300323e 	movw	r3, #574	; 0x23e
    66c0:	e19450b3 	ldrh	r5, [r4, r3]
    66c4:	e2823018 	add	r3, r2, #24
    66c8:	e6ef3073 	uxtb	r3, r3
    66cc:	e35200eb 	cmp	r2, #235	; 0xeb
    66d0:	13530001 	cmpne	r3, #1
    66d4:	8a000028 	bhi	677c <check_fs+0xe4>
    66d8:	e30a3a55 	movw	r3, #43605	; 0xaa55
    66dc:	e1550003 	cmp	r5, r3
    66e0:	0a00002a 	beq	6790 <check_fs+0xf8>
    66e4:	e1d434bb 	ldrh	r3, [r4, #75]	; 0x4b
    66e8:	e2432001 	sub	r2, r3, #1
    66ec:	e1120003 	tst	r2, r3
    66f0:	1a00001f 	bne	6774 <check_fs+0xdc>
    66f4:	e5d4204d 	ldrb	r2, [r4, #77]	; 0x4d
    66f8:	e2433c02 	sub	r3, r3, #512	; 0x200
    66fc:	e16f3f13 	clz	r3, r3
    6700:	e1a032a3 	lsr	r3, r3, #5
    6704:	e3520000 	cmp	r2, #0
    6708:	03a03000 	moveq	r3, #0
    670c:	e3530000 	cmp	r3, #0
    6710:	0a000017 	beq	6774 <check_fs+0xdc>
    6714:	e2423001 	sub	r3, r2, #1
    6718:	e1130002 	tst	r3, r2
    671c:	1a000014 	bne	6774 <check_fs+0xdc>
    6720:	e1d434be 	ldrh	r3, [r4, #78]	; 0x4e
    6724:	e3530000 	cmp	r3, #0
    6728:	0a000013 	beq	677c <check_fs+0xe4>
    672c:	e5d43050 	ldrb	r3, [r4, #80]	; 0x50
    6730:	e2433001 	sub	r3, r3, #1
    6734:	e3530001 	cmp	r3, #1
    6738:	8a00000f 	bhi	677c <check_fs+0xe4>
    673c:	e1d435b1 	ldrh	r3, [r4, #81]	; 0x51
    6740:	e3530000 	cmp	r3, #0
    6744:	0a00000c 	beq	677c <check_fs+0xe4>
    6748:	e1d435b3 	ldrh	r3, [r4, #83]	; 0x53
    674c:	e353007f 	cmp	r3, #127	; 0x7f
    6750:	8a000002 	bhi	6760 <check_fs+0xc8>
    6754:	e5943060 	ldr	r3, [r4, #96]	; 0x60
    6758:	e3530801 	cmp	r3, #65536	; 0x10000
    675c:	3a000006 	bcc	677c <check_fs+0xe4>
    6760:	e1d435b6 	ldrh	r3, [r4, #86]	; 0x56
    6764:	e3530000 	cmp	r3, #0
    6768:	0a000003 	beq	677c <check_fs+0xe4>
    676c:	e3a00000 	mov	r0, #0
    6770:	e8bd8070 	pop	{r4, r5, r6, pc}
    6774:	e3a00003 	mov	r0, #3
    6778:	e8bd8070 	pop	{r4, r5, r6, pc}
    677c:	e30a0a55 	movw	r0, #43605	; 0xaa55
    6780:	e1550000 	cmp	r5, r0
    6784:	03a00002 	moveq	r0, #2
    6788:	13a00003 	movne	r0, #3
    678c:	e8bd8070 	pop	{r4, r5, r6, pc}
    6790:	e302108c 	movw	r1, #8332	; 0x208c
    6794:	e3a02008 	mov	r2, #8
    6798:	e3401001 	movt	r1, #1
    679c:	e2840092 	add	r0, r4, #146	; 0x92
    67a0:	fa002a7b 	blx	11194 <memcmp>
    67a4:	e3500000 	cmp	r0, #0
    67a8:	08bd8070 	popeq	{r4, r5, r6, pc}
    67ac:	e1d434bb 	ldrh	r3, [r4, #75]	; 0x4b
    67b0:	e2432001 	sub	r2, r3, #1
    67b4:	e1120003 	tst	r2, r3
    67b8:	1a000009 	bne	67e4 <check_fs+0x14c>
    67bc:	e5d4204d 	ldrb	r2, [r4, #77]	; 0x4d
    67c0:	e2521000 	subs	r1, r2, #0
    67c4:	13a01001 	movne	r1, #1
    67c8:	e3530c02 	cmp	r3, #512	; 0x200
    67cc:	13a01000 	movne	r1, #0
    67d0:	e3510000 	cmp	r1, #0
    67d4:	0a000002 	beq	67e4 <check_fs+0x14c>
    67d8:	e2423001 	sub	r3, r2, #1
    67dc:	e1130002 	tst	r3, r2
    67e0:	0affffce 	beq	6720 <check_fs+0x88>
    67e4:	e3a00002 	mov	r0, #2
    67e8:	e8bd8070 	pop	{r4, r5, r6, pc}
    67ec:	e1a05001 	mov	r5, r1
    67f0:	e1a02001 	mov	r2, r1
    67f4:	e5d00001 	ldrb	r0, [r0, #1]
    67f8:	e3a03001 	mov	r3, #1
    67fc:	e2841040 	add	r1, r4, #64	; 0x40
    6800:	eb000ac2 	bl	9310 <disk_read>
    6804:	e3500000 	cmp	r0, #0
    6808:	0584501c 	streq	r5, [r4, #28]
    680c:	0affffa9 	beq	66b8 <check_fs+0x20>
    6810:	e3a00004 	mov	r0, #4
    6814:	e584601c 	str	r6, [r4, #28]
    6818:	e8bd8070 	pop	{r4, r5, r6, pc}

0000681c <mount_volume>:
    681c:	e3a03000 	mov	r3, #0
    6820:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    6824:	e24dd01c 	sub	sp, sp, #28
    6828:	e5813000 	str	r3, [r1]
    682c:	e1a05001 	mov	r5, r1
    6830:	e1a07002 	mov	r7, r2
    6834:	ebfffb81 	bl	5640 <get_ldnumber>
    6838:	e3500000 	cmp	r0, #0
    683c:	b3a0000b 	movlt	r0, #11
    6840:	ba000012 	blt	6890 <mount_volume+0x74>
    6844:	e30e6964 	movw	r6, #59748	; 0xe964
    6848:	e3406001 	movt	r6, #1
    684c:	e7964100 	ldr	r4, [r6, r0, lsl #2]
    6850:	e3540000 	cmp	r4, #0
    6854:	0a00009a 	beq	6ac4 <mount_volume+0x2a8>
    6858:	e5854000 	str	r4, [r5]
    685c:	e20770fe 	and	r7, r7, #254	; 0xfe
    6860:	e5d43000 	ldrb	r3, [r4]
    6864:	e5d40001 	ldrb	r0, [r4, #1]
    6868:	e3530000 	cmp	r3, #0
    686c:	0a00000a 	beq	689c <mount_volume+0x80>
    6870:	eb000a17 	bl	90d4 <disk_status>
    6874:	e3100001 	tst	r0, #1
    6878:	1a000006 	bne	6898 <mount_volume+0x7c>
    687c:	e3570000 	cmp	r7, #0
    6880:	0a000001 	beq	688c <mount_volume+0x70>
    6884:	e3100004 	tst	r0, #4
    6888:	1a00008a 	bne	6ab8 <mount_volume+0x29c>
    688c:	e3a00000 	mov	r0, #0
    6890:	e28dd01c 	add	sp, sp, #28
    6894:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6898:	e5d40001 	ldrb	r0, [r4, #1]
    689c:	e3a03000 	mov	r3, #0
    68a0:	e5c43000 	strb	r3, [r4]
    68a4:	eb000a64 	bl	923c <disk_initialize>
    68a8:	e3100001 	tst	r0, #1
    68ac:	13a00003 	movne	r0, #3
    68b0:	1afffff6 	bne	6890 <mount_volume+0x74>
    68b4:	e3570000 	cmp	r7, #0
    68b8:	0a000001 	beq	68c4 <mount_volume+0xa8>
    68bc:	e3100004 	tst	r0, #4
    68c0:	1a00007c 	bne	6ab8 <mount_volume+0x29c>
    68c4:	e3a01000 	mov	r1, #0
    68c8:	e1a00004 	mov	r0, r4
    68cc:	ebffff71 	bl	6698 <check_fs>
    68d0:	e3500002 	cmp	r0, #2
    68d4:	0a000059 	beq	6a40 <mount_volume+0x224>
    68d8:	e3500004 	cmp	r0, #4
    68dc:	0a000070 	beq	6aa4 <mount_volume+0x288>
    68e0:	e3500001 	cmp	r0, #1
    68e4:	8a000070 	bhi	6aac <mount_volume+0x290>
    68e8:	e1d434bb 	ldrh	r3, [r4, #75]	; 0x4b
    68ec:	e594901c 	ldr	r9, [r4, #28]
    68f0:	e3530c02 	cmp	r3, #512	; 0x200
    68f4:	1a00006c 	bne	6aac <mount_volume+0x290>
    68f8:	e1d485b6 	ldrh	r8, [r4, #86]	; 0x56
    68fc:	e5d43050 	ldrb	r3, [r4, #80]	; 0x50
    6900:	e3580000 	cmp	r8, #0
    6904:	05948064 	ldreq	r8, [r4, #100]	; 0x64
    6908:	e2432001 	sub	r2, r3, #1
    690c:	e3520001 	cmp	r2, #1
    6910:	e5c43003 	strb	r3, [r4, #3]
    6914:	e5848018 	str	r8, [r4, #24]
    6918:	8a000063 	bhi	6aac <mount_volume+0x290>
    691c:	e5d4504d 	ldrb	r5, [r4, #77]	; 0x4d
    6920:	e3550000 	cmp	r5, #0
    6924:	e1c450ba 	strh	r5, [r4, #10]
    6928:	0a00005f 	beq	6aac <mount_volume+0x290>
    692c:	e2452001 	sub	r2, r5, #1
    6930:	e1120005 	tst	r2, r5
    6934:	1a00005c 	bne	6aac <mount_volume+0x290>
    6938:	e1d4a5b1 	ldrh	sl, [r4, #81]	; 0x51
    693c:	e31a000f 	tst	sl, #15
    6940:	e1c4a0b8 	strh	sl, [r4, #8]
    6944:	1a000058 	bne	6aac <mount_volume+0x290>
    6948:	e1d425b3 	ldrh	r2, [r4, #83]	; 0x53
    694c:	e1d4b4be 	ldrh	fp, [r4, #78]	; 0x4e
    6950:	e3520000 	cmp	r2, #0
    6954:	05942060 	ldreq	r2, [r4, #96]	; 0x60
    6958:	e35b0000 	cmp	fp, #0
    695c:	0a000052 	beq	6aac <mount_volume+0x290>
    6960:	e0070398 	mul	r7, r8, r3
    6964:	e08b322a 	add	r3, fp, sl, lsr #4
    6968:	e0833007 	add	r3, r3, r7
    696c:	e1520003 	cmp	r2, r3
    6970:	3a00004d 	bcc	6aac <mount_volume+0x290>
    6974:	e0422003 	sub	r2, r2, r3
    6978:	e1a01005 	mov	r1, r5
    697c:	e1a00002 	mov	r0, r2
    6980:	e58d3004 	str	r3, [sp, #4]
    6984:	e58d2000 	str	r2, [sp]
    6988:	fa00290c 	blx	10dc0 <__udivsi3>
    698c:	e59d2000 	ldr	r2, [sp]
    6990:	e59d3004 	ldr	r3, [sp, #4]
    6994:	e1520005 	cmp	r2, r5
    6998:	33a02000 	movcc	r2, #0
    699c:	23a02001 	movcs	r2, #1
    69a0:	e37002bf 	cmn	r0, #-268435445	; 0xf000000b
    69a4:	83a02000 	movhi	r2, #0
    69a8:	e3520000 	cmp	r2, #0
    69ac:	0a00003e 	beq	6aac <mount_volume+0x290>
    69b0:	e30f2ff5 	movw	r2, #65525	; 0xfff5
    69b4:	e08bb009 	add	fp, fp, r9
    69b8:	e1500002 	cmp	r0, r2
    69bc:	e0893003 	add	r3, r9, r3
    69c0:	e2802002 	add	r2, r0, #2
    69c4:	8a00004c 	bhi	6afc <mount_volume+0x2e0>
    69c8:	e3001ff5 	movw	r1, #4085	; 0xff5
    69cc:	e1500001 	cmp	r0, r1
    69d0:	9a00003d 	bls	6acc <mount_volume+0x2b0>
    69d4:	e35a0000 	cmp	sl, #0
    69d8:	e584302c 	str	r3, [r4, #44]	; 0x2c
    69dc:	e5842014 	str	r2, [r4, #20]
    69e0:	1087300b 	addne	r3, r7, fp
    69e4:	11a02082 	lslne	r2, r2, #1
    69e8:	13a01002 	movne	r1, #2
    69ec:	e5849020 	str	r9, [r4, #32]
    69f0:	e584b024 	str	fp, [r4, #36]	; 0x24
    69f4:	0a00002c 	beq	6aac <mount_volume+0x290>
    69f8:	e5843028 	str	r3, [r4, #40]	; 0x28
    69fc:	e2823f7f 	add	r3, r2, #508	; 0x1fc
    6a00:	e2833003 	add	r3, r3, #3
    6a04:	e15804a3 	cmp	r8, r3, lsr #9
    6a08:	3a000027 	bcc	6aac <mount_volume+0x290>
    6a0c:	e6ef2071 	uxtb	r2, r1
    6a10:	e3e03000 	mvn	r3, #0
    6a14:	e3e0007f 	mvn	r0, #127	; 0x7f
    6a18:	e5843010 	str	r3, [r4, #16]
    6a1c:	e584300c 	str	r3, [r4, #12]
    6a20:	e5c40005 	strb	r0, [r4, #5]
    6a24:	e1d638bc 	ldrh	r3, [r6, #140]	; 0x8c
    6a28:	e5c42000 	strb	r2, [r4]
    6a2c:	e2833001 	add	r3, r3, #1
    6a30:	e6ff3073 	uxth	r3, r3
    6a34:	e1c638bc 	strh	r3, [r6, #140]	; 0x8c
    6a38:	e1c430b6 	strh	r3, [r4, #6]
    6a3c:	eaffff92 	b	688c <mount_volume+0x70>
    6a40:	e5943216 	ldr	r3, [r4, #534]	; 0x216
    6a44:	e28d5008 	add	r5, sp, #8
    6a48:	e5941226 	ldr	r1, [r4, #550]	; 0x226
    6a4c:	e28d7018 	add	r7, sp, #24
    6a50:	e5942206 	ldr	r2, [r4, #518]	; 0x206
    6a54:	e58d300c 	str	r3, [sp, #12]
    6a58:	e5943236 	ldr	r3, [r4, #566]	; 0x236
    6a5c:	e58d1010 	str	r1, [sp, #16]
    6a60:	e58d2008 	str	r2, [sp, #8]
    6a64:	e58d3014 	str	r3, [sp, #20]
    6a68:	ea000001 	b	6a74 <mount_volume+0x258>
    6a6c:	e1550007 	cmp	r5, r7
    6a70:	0a000009 	beq	6a9c <mount_volume+0x280>
    6a74:	e4951004 	ldr	r1, [r5], #4
    6a78:	e3a00003 	mov	r0, #3
    6a7c:	e3510000 	cmp	r1, #0
    6a80:	0afffff9 	beq	6a6c <mount_volume+0x250>
    6a84:	e1a00004 	mov	r0, r4
    6a88:	ebffff02 	bl	6698 <check_fs>
    6a8c:	e3500001 	cmp	r0, #1
    6a90:	9affff94 	bls	68e8 <mount_volume+0xcc>
    6a94:	e1550007 	cmp	r5, r7
    6a98:	1afffff5 	bne	6a74 <mount_volume+0x258>
    6a9c:	e3500004 	cmp	r0, #4
    6aa0:	1a000001 	bne	6aac <mount_volume+0x290>
    6aa4:	e3a00001 	mov	r0, #1
    6aa8:	eaffff78 	b	6890 <mount_volume+0x74>
    6aac:	e3a0000d 	mov	r0, #13
    6ab0:	e28dd01c 	add	sp, sp, #28
    6ab4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6ab8:	e3a0000a 	mov	r0, #10
    6abc:	e28dd01c 	add	sp, sp, #28
    6ac0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6ac4:	e3a0000c 	mov	r0, #12
    6ac8:	eaffff70 	b	6890 <mount_volume+0x74>
    6acc:	e35a0000 	cmp	sl, #0
    6ad0:	e5849020 	str	r9, [r4, #32]
    6ad4:	e584302c 	str	r3, [r4, #44]	; 0x2c
    6ad8:	e5842014 	str	r2, [r4, #20]
    6adc:	e584b024 	str	fp, [r4, #36]	; 0x24
    6ae0:	0afffff1 	beq	6aac <mount_volume+0x290>
    6ae4:	e0821082 	add	r1, r2, r2, lsl #1
    6ae8:	e2022001 	and	r2, r2, #1
    6aec:	e087300b 	add	r3, r7, fp
    6af0:	e08220a1 	add	r2, r2, r1, lsr #1
    6af4:	e3a01001 	mov	r1, #1
    6af8:	eaffffbe 	b	69f8 <mount_volume+0x1dc>
    6afc:	e584302c 	str	r3, [r4, #44]	; 0x2c
    6b00:	e1d436ba 	ldrh	r3, [r4, #106]	; 0x6a
    6b04:	e584b024 	str	fp, [r4, #36]	; 0x24
    6b08:	e5842014 	str	r2, [r4, #20]
    6b0c:	e19a3003 	orrs	r3, sl, r3
    6b10:	e5849020 	str	r9, [r4, #32]
    6b14:	1affffe4 	bne	6aac <mount_volume+0x290>
    6b18:	e30031ff 	movw	r3, #511	; 0x1ff
    6b1c:	e0833102 	add	r3, r3, r2, lsl #2
    6b20:	e15804a3 	cmp	r8, r3, lsr #9
    6b24:	e594306c 	ldr	r3, [r4, #108]	; 0x6c
    6b28:	e5843028 	str	r3, [r4, #40]	; 0x28
    6b2c:	3affffde 	bcc	6aac <mount_volume+0x290>
    6b30:	e3e03000 	mvn	r3, #0
    6b34:	e3e0207f 	mvn	r2, #127	; 0x7f
    6b38:	e5843010 	str	r3, [r4, #16]
    6b3c:	e584300c 	str	r3, [r4, #12]
    6b40:	e1d437b0 	ldrh	r3, [r4, #112]	; 0x70
    6b44:	e5c42005 	strb	r2, [r4, #5]
    6b48:	e3530001 	cmp	r3, #1
    6b4c:	0a000001 	beq	6b58 <mount_volume+0x33c>
    6b50:	e3a02003 	mov	r2, #3
    6b54:	eaffffb2 	b	6a24 <mount_volume+0x208>
    6b58:	e2891001 	add	r1, r9, #1
    6b5c:	e1a00004 	mov	r0, r4
    6b60:	ebfffba2 	bl	59f0 <move_window>
    6b64:	e3500000 	cmp	r0, #0
    6b68:	1afffff8 	bne	6b50 <mount_volume+0x334>
    6b6c:	e5942040 	ldr	r2, [r4, #64]	; 0x40
    6b70:	e3053252 	movw	r3, #21074	; 0x5252
    6b74:	e3443161 	movt	r3, #16737	; 0x4161
    6b78:	e5c40005 	strb	r0, [r4, #5]
    6b7c:	e1520003 	cmp	r2, r3
    6b80:	1afffff2 	bne	6b50 <mount_volume+0x334>
    6b84:	e5942224 	ldr	r2, [r4, #548]	; 0x224
    6b88:	e3073272 	movw	r3, #29298	; 0x7272
    6b8c:	e3463141 	movt	r3, #24897	; 0x6141
    6b90:	e1520003 	cmp	r2, r3
    6b94:	1affffed 	bne	6b50 <mount_volume+0x334>
    6b98:	e594223c 	ldr	r2, [r4, #572]	; 0x23c
    6b9c:	e3a03000 	mov	r3, #0
    6ba0:	e34a3a55 	movt	r3, #43605	; 0xaa55
    6ba4:	e1520003 	cmp	r2, r3
    6ba8:	05942228 	ldreq	r2, [r4, #552]	; 0x228
    6bac:	0594322c 	ldreq	r3, [r4, #556]	; 0x22c
    6bb0:	05842010 	streq	r2, [r4, #16]
    6bb4:	0584300c 	streq	r3, [r4, #12]
    6bb8:	eaffffe4 	b	6b50 <mount_volume+0x334>

00006bbc <dir_register>:
    6bbc:	e92d4070 	push	{r4, r5, r6, lr}
    6bc0:	e1a05000 	mov	r5, r0
    6bc4:	e5906000 	ldr	r6, [r0]
    6bc8:	ebfffc54 	bl	5d20 <dir_sdi.constprop.0>
    6bcc:	e2504000 	subs	r4, r0, #0
    6bd0:	0a000008 	beq	6bf8 <dir_register+0x3c>
    6bd4:	e3540004 	cmp	r4, #4
    6bd8:	0a00002b 	beq	6c8c <dir_register+0xd0>
    6bdc:	e1a00004 	mov	r0, r4
    6be0:	e8bd8070 	pop	{r4, r5, r6, pc}
    6be4:	e3a01001 	mov	r1, #1
    6be8:	e1a00005 	mov	r0, r5
    6bec:	ebfffd39 	bl	60d8 <dir_next>
    6bf0:	e2504000 	subs	r4, r0, #0
    6bf4:	1a000022 	bne	6c84 <dir_register+0xc8>
    6bf8:	e5951018 	ldr	r1, [r5, #24]
    6bfc:	e1a00006 	mov	r0, r6
    6c00:	ebfffb7a 	bl	59f0 <move_window>
    6c04:	e2504000 	subs	r4, r0, #0
    6c08:	1a00001d 	bne	6c84 <dir_register+0xc8>
    6c0c:	e595301c 	ldr	r3, [r5, #28]
    6c10:	e5d33000 	ldrb	r3, [r3]
    6c14:	e3530000 	cmp	r3, #0
    6c18:	135300e5 	cmpne	r3, #229	; 0xe5
    6c1c:	1afffff0 	bne	6be4 <dir_register+0x28>
    6c20:	e5951018 	ldr	r1, [r5, #24]
    6c24:	e1a00006 	mov	r0, r6
    6c28:	ebfffb70 	bl	59f0 <move_window>
    6c2c:	e2504000 	subs	r4, r0, #0
    6c30:	1affffe9 	bne	6bdc <dir_register+0x20>
    6c34:	e595001c 	ldr	r0, [r5, #28]
    6c38:	e3a02020 	mov	r2, #32
    6c3c:	e1a01004 	mov	r1, r4
    6c40:	fa0029a8 	blx	112e8 <memset>
    6c44:	e595301c 	ldr	r3, [r5, #28]
    6c48:	e5952020 	ldr	r2, [r5, #32]
    6c4c:	e2833007 	add	r3, r3, #7
    6c50:	e5032007 	str	r2, [r3, #-7]
    6c54:	e5952024 	ldr	r2, [r5, #36]	; 0x24
    6c58:	e5032003 	str	r2, [r3, #-3]
    6c5c:	e2852028 	add	r2, r5, #40	; 0x28
    6c60:	e285502b 	add	r5, r5, #43	; 0x2b
    6c64:	e4d21001 	ldrb	r1, [r2], #1
    6c68:	e1550002 	cmp	r5, r2
    6c6c:	e5e31001 	strb	r1, [r3, #1]!
    6c70:	1afffffb 	bne	6c64 <dir_register+0xa8>
    6c74:	e3a03001 	mov	r3, #1
    6c78:	e1a00004 	mov	r0, r4
    6c7c:	e5c63004 	strb	r3, [r6, #4]
    6c80:	e8bd8070 	pop	{r4, r5, r6, pc}
    6c84:	e3540004 	cmp	r4, #4
    6c88:	1affffd3 	bne	6bdc <dir_register+0x20>
    6c8c:	e3a04007 	mov	r4, #7
    6c90:	e1a00004 	mov	r0, r4
    6c94:	e8bd8070 	pop	{r4, r5, r6, pc}

00006c98 <f_mount>:
    6c98:	e92d4010 	push	{r4, lr}
    6c9c:	e24dd010 	sub	sp, sp, #16
    6ca0:	e58d0004 	str	r0, [sp, #4]
    6ca4:	e28d000c 	add	r0, sp, #12
    6ca8:	e1a04002 	mov	r4, r2
    6cac:	e58d1000 	str	r1, [sp]
    6cb0:	e58d100c 	str	r1, [sp, #12]
    6cb4:	ebfffa61 	bl	5640 <get_ldnumber>
    6cb8:	e3500000 	cmp	r0, #0
    6cbc:	b3a0000b 	movlt	r0, #11
    6cc0:	ba00000f 	blt	6d04 <f_mount+0x6c>
    6cc4:	e30e3964 	movw	r3, #59748	; 0xe964
    6cc8:	e3403001 	movt	r3, #1
    6ccc:	e7932100 	ldr	r2, [r3, r0, lsl #2]
    6cd0:	e3520000 	cmp	r2, #0
    6cd4:	13a01000 	movne	r1, #0
    6cd8:	15c21000 	strbne	r1, [r2]
    6cdc:	e59d2004 	ldr	r2, [sp, #4]
    6ce0:	17831100 	strne	r1, [r3, r0, lsl #2]
    6ce4:	e3520000 	cmp	r2, #0
    6ce8:	13a01000 	movne	r1, #0
    6cec:	15c20001 	strbne	r0, [r2, #1]
    6cf0:	15c21000 	strbne	r1, [r2]
    6cf4:	17832100 	strne	r2, [r3, r0, lsl #2]
    6cf8:	e3540000 	cmp	r4, #0
    6cfc:	01a00004 	moveq	r0, r4
    6d00:	1a000001 	bne	6d0c <f_mount+0x74>
    6d04:	e28dd010 	add	sp, sp, #16
    6d08:	e8bd8010 	pop	{r4, pc}
    6d0c:	e3a02000 	mov	r2, #0
    6d10:	e28d1004 	add	r1, sp, #4
    6d14:	e1a0000d 	mov	r0, sp
    6d18:	ebfffebf 	bl	681c <mount_volume>
    6d1c:	e28dd010 	add	sp, sp, #16
    6d20:	e8bd8010 	pop	{r4, pc}

00006d24 <f_open>:
    6d24:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    6d28:	e24dd038 	sub	sp, sp, #56	; 0x38
    6d2c:	e1a04000 	mov	r4, r0
    6d30:	e58d1004 	str	r1, [sp, #4]
    6d34:	e1a05002 	mov	r5, r2
    6d38:	e3a01000 	mov	r1, #0
    6d3c:	e3a0202c 	mov	r2, #44	; 0x2c
    6d40:	e28d000c 	add	r0, sp, #12
    6d44:	fa002967 	blx	112e8 <memset>
    6d48:	e3540000 	cmp	r4, #0
    6d4c:	03a06009 	moveq	r6, #9
    6d50:	0a000008 	beq	6d78 <f_open+0x54>
    6d54:	e205703f 	and	r7, r5, #63	; 0x3f
    6d58:	e28d1008 	add	r1, sp, #8
    6d5c:	e1a02007 	mov	r2, r7
    6d60:	e28d0004 	add	r0, sp, #4
    6d64:	ebfffeac 	bl	681c <mount_volume>
    6d68:	e2506000 	subs	r6, r0, #0
    6d6c:	0a000004 	beq	6d84 <f_open+0x60>
    6d70:	e3a03000 	mov	r3, #0
    6d74:	e5843000 	str	r3, [r4]
    6d78:	e1a00006 	mov	r0, r6
    6d7c:	e28dd038 	add	sp, sp, #56	; 0x38
    6d80:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6d84:	e59d8008 	ldr	r8, [sp, #8]
    6d88:	e28d000c 	add	r0, sp, #12
    6d8c:	e59d1004 	ldr	r1, [sp, #4]
    6d90:	e5848000 	str	r8, [r4]
    6d94:	e58d800c 	str	r8, [sp, #12]
    6d98:	ebfffd1c 	bl	6210 <follow_path>
    6d9c:	e3500000 	cmp	r0, #0
    6da0:	1a00000b 	bne	6dd4 <f_open+0xb0>
    6da4:	e1dd33d7 	ldrsb	r3, [sp, #55]	; 0x37
    6da8:	e3530000 	cmp	r3, #0
    6dac:	ba000050 	blt	6ef4 <f_open+0x1d0>
    6db0:	e315001c 	tst	r5, #28
    6db4:	0a00000c 	beq	6dec <f_open+0xc8>
    6db8:	e3150004 	tst	r5, #4
    6dbc:	1a00004e 	bne	6efc <f_open+0x1d8>
    6dc0:	e5dd3012 	ldrb	r3, [sp, #18]
    6dc4:	e3130011 	tst	r3, #17
    6dc8:	0a00006e 	beq	6f88 <f_open+0x264>
    6dcc:	e3a06007 	mov	r6, #7
    6dd0:	eaffffe6 	b	6d70 <f_open+0x4c>
    6dd4:	e315001c 	tst	r5, #28
    6dd8:	0a000001 	beq	6de4 <f_open+0xc0>
    6ddc:	e3500004 	cmp	r0, #4
    6de0:	0a000049 	beq	6f0c <f_open+0x1e8>
    6de4:	e1a06000 	mov	r6, r0
    6de8:	eaffffe0 	b	6d70 <f_open+0x4c>
    6dec:	e5dd3012 	ldrb	r3, [sp, #18]
    6df0:	e3130010 	tst	r3, #16
    6df4:	1a000042 	bne	6f04 <f_open+0x1e0>
    6df8:	e3150002 	tst	r5, #2
    6dfc:	0a000001 	beq	6e08 <f_open+0xe4>
    6e00:	e3130001 	tst	r3, #1
    6e04:	1afffff0 	bne	6dcc <f_open+0xa8>
    6e08:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
    6e0c:	e598301c 	ldr	r3, [r8, #28]
    6e10:	e3a01000 	mov	r1, #0
    6e14:	e5849024 	str	r9, [r4, #36]	; 0x24
    6e18:	e284a040 	add	sl, r4, #64	; 0x40
    6e1c:	e3a02c02 	mov	r2, #512	; 0x200
    6e20:	e1a0000a 	mov	r0, sl
    6e24:	e5843020 	str	r3, [r4, #32]
    6e28:	e5d83000 	ldrb	r3, [r8]
    6e2c:	e1d951ba 	ldrh	r5, [r9, #26]
    6e30:	e3530003 	cmp	r3, #3
    6e34:	01d931b4 	ldrheq	r3, [r9, #20]
    6e38:	01855803 	orreq	r5, r5, r3, lsl #16
    6e3c:	e1d830b6 	ldrh	r3, [r8, #6]
    6e40:	e5845008 	str	r5, [r4, #8]
    6e44:	e599901c 	ldr	r9, [r9, #28]
    6e48:	e1c430b4 	strh	r3, [r4, #4]
    6e4c:	e5c47010 	strb	r7, [r4, #16]
    6e50:	e584900c 	str	r9, [r4, #12]
    6e54:	e5c41011 	strb	r1, [r4, #17]
    6e58:	e584101c 	str	r1, [r4, #28]
    6e5c:	e5841014 	str	r1, [r4, #20]
    6e60:	fa002920 	blx	112e8 <memset>
    6e64:	e2593000 	subs	r3, r9, #0
    6e68:	13a03001 	movne	r3, #1
    6e6c:	e01332a7 	ands	r3, r3, r7, lsr #5
    6e70:	0affffc0 	beq	6d78 <f_open+0x54>
    6e74:	e1d870ba 	ldrh	r7, [r8, #10]
    6e78:	e5849014 	str	r9, [r4, #20]
    6e7c:	e1a07487 	lsl	r7, r7, #9
    6e80:	e1570009 	cmp	r7, r9
    6e84:	2a000051 	bcs	6fd0 <f_open+0x2ac>
    6e88:	e1a01005 	mov	r1, r5
    6e8c:	e5940000 	ldr	r0, [r4]
    6e90:	ebfffb60 	bl	5c18 <get_fat.isra.0>
    6e94:	e3500001 	cmp	r0, #1
    6e98:	e1a05000 	mov	r5, r0
    6e9c:	e0499007 	sub	r9, r9, r7
    6ea0:	9a000036 	bls	6f80 <f_open+0x25c>
    6ea4:	e3700001 	cmn	r0, #1
    6ea8:	11570009 	cmpne	r7, r9
    6eac:	3afffff5 	bcc	6e88 <f_open+0x164>
    6eb0:	e3700001 	cmn	r0, #1
    6eb4:	e5840018 	str	r0, [r4, #24]
    6eb8:	0a00004e 	beq	6ff8 <f_open+0x2d4>
    6ebc:	e7e83059 	ubfx	r3, r9, #0, #9
    6ec0:	e3530000 	cmp	r3, #0
    6ec4:	0affffab 	beq	6d78 <f_open+0x54>
    6ec8:	e5983014 	ldr	r3, [r8, #20]
    6ecc:	e2455002 	sub	r5, r5, #2
    6ed0:	e2433002 	sub	r3, r3, #2
    6ed4:	e1550003 	cmp	r5, r3
    6ed8:	2a000003 	bcs	6eec <f_open+0x1c8>
    6edc:	e1d830ba 	ldrh	r3, [r8, #10]
    6ee0:	e598202c 	ldr	r2, [r8, #44]	; 0x2c
    6ee4:	e0332395 	mlas	r3, r5, r3, r2
    6ee8:	1a00003a 	bne	6fd8 <f_open+0x2b4>
    6eec:	e3a06002 	mov	r6, #2
    6ef0:	eaffff9e 	b	6d70 <f_open+0x4c>
    6ef4:	e3a06006 	mov	r6, #6
    6ef8:	eaffff9c 	b	6d70 <f_open+0x4c>
    6efc:	e3a06008 	mov	r6, #8
    6f00:	eaffff9a 	b	6d70 <f_open+0x4c>
    6f04:	e3a06004 	mov	r6, #4
    6f08:	eaffff98 	b	6d70 <f_open+0x4c>
    6f0c:	e28d000c 	add	r0, sp, #12
    6f10:	ebffff29 	bl	6bbc <dir_register>
    6f14:	e3500000 	cmp	r0, #0
    6f18:	1affffb1 	bne	6de4 <f_open+0xc0>
    6f1c:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
    6f20:	e3877008 	orr	r7, r7, #8
    6f24:	eb00094f 	bl	9468 <get_fattime>
    6f28:	e589000e 	str	r0, [r9, #14]
    6f2c:	e5890016 	str	r0, [r9, #22]
    6f30:	e5d83000 	ldrb	r3, [r8]
    6f34:	e1d951ba 	ldrh	r5, [r9, #26]
    6f38:	e3530003 	cmp	r3, #3
    6f3c:	01d931b4 	ldrheq	r3, [r9, #20]
    6f40:	01855803 	orreq	r5, r5, r3, lsl #16
    6f44:	e3a03020 	mov	r3, #32
    6f48:	e5c9300b 	strb	r3, [r9, #11]
    6f4c:	e3a03000 	mov	r3, #0
    6f50:	e1c931ba 	strh	r3, [r9, #26]
    6f54:	e5d82000 	ldrb	r2, [r8]
    6f58:	e3520003 	cmp	r2, #3
    6f5c:	e3a02000 	mov	r2, #0
    6f60:	01c931b4 	strheq	r3, [r9, #20]
    6f64:	e3550000 	cmp	r5, #0
    6f68:	e3a03001 	mov	r3, #1
    6f6c:	e589201c 	str	r2, [r9, #28]
    6f70:	e5c83004 	strb	r3, [r8, #4]
    6f74:	1a000007 	bne	6f98 <f_open+0x274>
    6f78:	e3877040 	orr	r7, r7, #64	; 0x40
    6f7c:	eaffffa2 	b	6e0c <f_open+0xe8>
    6f80:	e5840018 	str	r0, [r4, #24]
    6f84:	eaffffd8 	b	6eec <f_open+0x1c8>
    6f88:	e3150008 	tst	r5, #8
    6f8c:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
    6f90:	0affff9d 	beq	6e0c <f_open+0xe8>
    6f94:	eaffffe2 	b	6f24 <f_open+0x200>
    6f98:	e28d000c 	add	r0, sp, #12
    6f9c:	e1a01005 	mov	r1, r5
    6fa0:	e598a01c 	ldr	sl, [r8, #28]
    6fa4:	ebfffb96 	bl	5e04 <remove_chain>
    6fa8:	e3500000 	cmp	r0, #0
    6fac:	1affff8c 	bne	6de4 <f_open+0xc0>
    6fb0:	e1a0100a 	mov	r1, sl
    6fb4:	e1a00008 	mov	r0, r8
    6fb8:	ebfffa8c 	bl	59f0 <move_window>
    6fbc:	e3500000 	cmp	r0, #0
    6fc0:	e2455001 	sub	r5, r5, #1
    6fc4:	e588500c 	str	r5, [r8, #12]
    6fc8:	1affff85 	bne	6de4 <f_open+0xc0>
    6fcc:	eaffffe9 	b	6f78 <f_open+0x254>
    6fd0:	e5845018 	str	r5, [r4, #24]
    6fd4:	eaffffb8 	b	6ebc <f_open+0x198>
    6fd8:	e08324a9 	add	r2, r3, r9, lsr #9
    6fdc:	e1a0100a 	mov	r1, sl
    6fe0:	e3a03001 	mov	r3, #1
    6fe4:	e584201c 	str	r2, [r4, #28]
    6fe8:	e5d80001 	ldrb	r0, [r8, #1]
    6fec:	eb0008c7 	bl	9310 <disk_read>
    6ff0:	e3500000 	cmp	r0, #0
    6ff4:	0affff5f 	beq	6d78 <f_open+0x54>
    6ff8:	e3a06001 	mov	r6, #1
    6ffc:	eaffff5b 	b	6d70 <f_open+0x4c>

00007000 <f_read>:
    7000:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7004:	e1a09003 	mov	r9, r3
    7008:	e24dd014 	sub	sp, sp, #20
    700c:	e3a03000 	mov	r3, #0
    7010:	e1a08001 	mov	r8, r1
    7014:	e28d100c 	add	r1, sp, #12
    7018:	e5893000 	str	r3, [r9]
    701c:	e1a05000 	mov	r5, r0
    7020:	e1a04002 	mov	r4, r2
    7024:	ebfff9a4 	bl	56bc <validate>
    7028:	e3500000 	cmp	r0, #0
    702c:	1a000057 	bne	7190 <f_read+0x190>
    7030:	e5d50011 	ldrb	r0, [r5, #17]
    7034:	e3500000 	cmp	r0, #0
    7038:	1a000054 	bne	7190 <f_read+0x190>
    703c:	e5d5b010 	ldrb	fp, [r5, #16]
    7040:	e21bb001 	ands	fp, fp, #1
    7044:	03a00007 	moveq	r0, #7
    7048:	0a000050 	beq	7190 <f_read+0x190>
    704c:	e5951014 	ldr	r1, [r5, #20]
    7050:	e595700c 	ldr	r7, [r5, #12]
    7054:	e0477001 	sub	r7, r7, r1
    7058:	e1570004 	cmp	r7, r4
    705c:	21a07004 	movcs	r7, r4
    7060:	e3570000 	cmp	r7, #0
    7064:	0a000049 	beq	7190 <f_read+0x190>
    7068:	e58d0000 	str	r0, [sp]
    706c:	e7e83051 	ubfx	r3, r1, #0, #9
    7070:	e3530000 	cmp	r3, #0
    7074:	12851040 	addne	r1, r5, #64	; 0x40
    7078:	1a000024 	bne	7110 <f_read+0x110>
    707c:	e59d400c 	ldr	r4, [sp, #12]
    7080:	e1d420ba 	ldrh	r2, [r4, #10]
    7084:	e2422001 	sub	r2, r2, #1
    7088:	e01224a1 	ands	r2, r2, r1, lsr #9
    708c:	0a000041 	beq	7198 <f_read+0x198>
    7090:	e5950018 	ldr	r0, [r5, #24]
    7094:	e5943014 	ldr	r3, [r4, #20]
    7098:	e2400002 	sub	r0, r0, #2
    709c:	e2433002 	sub	r3, r3, #2
    70a0:	e1500003 	cmp	r0, r3
    70a4:	2a000044 	bcs	71bc <f_read+0x1bc>
    70a8:	e1d410ba 	ldrh	r1, [r4, #10]
    70ac:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
    70b0:	e0303091 	mlas	r0, r1, r0, r3
    70b4:	0a000040 	beq	71bc <f_read+0x1bc>
    70b8:	e3570c02 	cmp	r7, #512	; 0x200
    70bc:	e082a000 	add	sl, r2, r0
    70c0:	2a000042 	bcs	71d0 <f_read+0x1d0>
    70c4:	e595201c 	ldr	r2, [r5, #28]
    70c8:	e152000a 	cmp	r2, sl
    70cc:	02851040 	addeq	r1, r5, #64	; 0x40
    70d0:	0a00000b 	beq	7104 <f_read+0x104>
    70d4:	e1d531d0 	ldrsb	r3, [r5, #16]
    70d8:	e2851040 	add	r1, r5, #64	; 0x40
    70dc:	e5d40001 	ldrb	r0, [r4, #1]
    70e0:	e3530000 	cmp	r3, #0
    70e4:	ba000062 	blt	7274 <f_read+0x274>
    70e8:	e3a03001 	mov	r3, #1
    70ec:	e1a0200a 	mov	r2, sl
    70f0:	e58d1004 	str	r1, [sp, #4]
    70f4:	eb000885 	bl	9310 <disk_read>
    70f8:	e3500000 	cmp	r0, #0
    70fc:	e59d1004 	ldr	r1, [sp, #4]
    7100:	1a00004d 	bne	723c <f_read+0x23c>
    7104:	e5953014 	ldr	r3, [r5, #20]
    7108:	e585a01c 	str	sl, [r5, #28]
    710c:	e7e83053 	ubfx	r3, r3, #0, #9
    7110:	e081c003 	add	ip, r1, r3
    7114:	e2633c02 	rsb	r3, r3, #512	; 0x200
    7118:	e1530007 	cmp	r3, r7
    711c:	31a04003 	movcc	r4, r3
    7120:	21a04007 	movcs	r4, r7
    7124:	e3540003 	cmp	r4, #3
    7128:	9a00004e 	bls	7268 <f_read+0x268>
    712c:	e2442004 	sub	r2, r4, #4
    7130:	e24c3004 	sub	r3, ip, #4
    7134:	e3c20003 	bic	r0, r2, #3
    7138:	e1a0e122 	lsr	lr, r2, #2
    713c:	e08c0000 	add	r0, ip, r0
    7140:	e1a02008 	mov	r2, r8
    7144:	e5b31004 	ldr	r1, [r3, #4]!
    7148:	e1530000 	cmp	r3, r0
    714c:	e4821004 	str	r1, [r2], #4
    7150:	1afffffb 	bne	7144 <f_read+0x144>
    7154:	e2142003 	ands	r2, r4, #3
    7158:	1a00002c 	bne	7210 <f_read+0x210>
    715c:	e1a01004 	mov	r1, r4
    7160:	e1a00008 	mov	r0, r8
    7164:	eb0023f7 	bl	10148 <Xil_DCacheFlushRange>
    7168:	e5993000 	ldr	r3, [r9]
    716c:	e0577004 	subs	r7, r7, r4
    7170:	e0888004 	add	r8, r8, r4
    7174:	e0833004 	add	r3, r3, r4
    7178:	e5893000 	str	r3, [r9]
    717c:	e5953014 	ldr	r3, [r5, #20]
    7180:	e0841003 	add	r1, r4, r3
    7184:	e5851014 	str	r1, [r5, #20]
    7188:	1affffb7 	bne	706c <f_read+0x6c>
    718c:	e59d0000 	ldr	r0, [sp]
    7190:	e28dd014 	add	sp, sp, #20
    7194:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7198:	e3510000 	cmp	r1, #0
    719c:	1a00002b 	bne	7250 <f_read+0x250>
    71a0:	e5950008 	ldr	r0, [r5, #8]
    71a4:	e3500001 	cmp	r0, #1
    71a8:	9a000003 	bls	71bc <f_read+0x1bc>
    71ac:	e3700001 	cmn	r0, #1
    71b0:	0a000021 	beq	723c <f_read+0x23c>
    71b4:	e5850018 	str	r0, [r5, #24]
    71b8:	eaffffb5 	b	7094 <f_read+0x94>
    71bc:	e3a03002 	mov	r3, #2
    71c0:	e1a00003 	mov	r0, r3
    71c4:	e5c53011 	strb	r3, [r5, #17]
    71c8:	e28dd014 	add	sp, sp, #20
    71cc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    71d0:	e1a064a7 	lsr	r6, r7, #9
    71d4:	e0820006 	add	r0, r2, r6
    71d8:	e1500001 	cmp	r0, r1
    71dc:	e5d40001 	ldrb	r0, [r4, #1]
    71e0:	80416002 	subhi	r6, r1, r2
    71e4:	e1a0200a 	mov	r2, sl
    71e8:	e1a03006 	mov	r3, r6
    71ec:	e1a01008 	mov	r1, r8
    71f0:	eb000846 	bl	9310 <disk_read>
    71f4:	e3500000 	cmp	r0, #0
    71f8:	1a00000f 	bne	723c <f_read+0x23c>
    71fc:	e1d521d0 	ldrsb	r2, [r5, #16]
    7200:	e3520000 	cmp	r2, #0
    7204:	ba000025 	blt	72a0 <f_read+0x2a0>
    7208:	e1a04486 	lsl	r4, r6, #9
    720c:	eaffffd5 	b	7168 <f_read+0x168>
    7210:	e28e3001 	add	r3, lr, #1
    7214:	e1a03103 	lsl	r3, r3, #2
    7218:	e08cc003 	add	ip, ip, r3
    721c:	e0883003 	add	r3, r8, r3
    7220:	e2433001 	sub	r3, r3, #1
    7224:	e08c2002 	add	r2, ip, r2
    7228:	e4dc1001 	ldrb	r1, [ip], #1
    722c:	e152000c 	cmp	r2, ip
    7230:	e5e31001 	strb	r1, [r3, #1]!
    7234:	1afffffb 	bne	7228 <f_read+0x228>
    7238:	eaffffc7 	b	715c <f_read+0x15c>
    723c:	e3a03001 	mov	r3, #1
    7240:	e1a0000b 	mov	r0, fp
    7244:	e5c53011 	strb	r3, [r5, #17]
    7248:	e28dd014 	add	sp, sp, #20
    724c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7250:	e5951018 	ldr	r1, [r5, #24]
    7254:	e5950000 	ldr	r0, [r5]
    7258:	e58d2004 	str	r2, [sp, #4]
    725c:	ebfffa6d 	bl	5c18 <get_fat.isra.0>
    7260:	e59d2004 	ldr	r2, [sp, #4]
    7264:	eaffffce 	b	71a4 <f_read+0x1a4>
    7268:	e1a02004 	mov	r2, r4
    726c:	e1a03008 	mov	r3, r8
    7270:	eaffffea 	b	7220 <f_read+0x220>
    7274:	e3a03001 	mov	r3, #1
    7278:	e58d1004 	str	r1, [sp, #4]
    727c:	eb00087c 	bl	9474 <disk_write>
    7280:	e3500000 	cmp	r0, #0
    7284:	1affffec 	bne	723c <f_read+0x23c>
    7288:	e5d53010 	ldrb	r3, [r5, #16]
    728c:	e59d1004 	ldr	r1, [sp, #4]
    7290:	e203307f 	and	r3, r3, #127	; 0x7f
    7294:	e5c53010 	strb	r3, [r5, #16]
    7298:	e5d40001 	ldrb	r0, [r4, #1]
    729c:	eaffff91 	b	70e8 <f_read+0xe8>
    72a0:	e595201c 	ldr	r2, [r5, #28]
    72a4:	e042200a 	sub	r2, r2, sl
    72a8:	e1520006 	cmp	r2, r6
    72ac:	2affffd5 	bcs	7208 <f_read+0x208>
    72b0:	e0882482 	add	r2, r8, r2, lsl #9
    72b4:	e285103c 	add	r1, r5, #60	; 0x3c
    72b8:	e282cc02 	add	ip, r2, #512	; 0x200
    72bc:	e5b13004 	ldr	r3, [r1, #4]!
    72c0:	e4823004 	str	r3, [r2], #4
    72c4:	e15c0002 	cmp	ip, r2
    72c8:	1afffffb 	bne	72bc <f_read+0x2bc>
    72cc:	eaffffcd 	b	7208 <f_read+0x208>

000072d0 <f_write>:
    72d0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    72d4:	e1a08003 	mov	r8, r3
    72d8:	e24dd014 	sub	sp, sp, #20
    72dc:	e3a03000 	mov	r3, #0
    72e0:	e1a07001 	mov	r7, r1
    72e4:	e28d100c 	add	r1, sp, #12
    72e8:	e5883000 	str	r3, [r8]
    72ec:	e1a04000 	mov	r4, r0
    72f0:	e1a05002 	mov	r5, r2
    72f4:	ebfff8f0 	bl	56bc <validate>
    72f8:	e2506000 	subs	r6, r0, #0
    72fc:	1a000060 	bne	7484 <f_write+0x1b4>
    7300:	e5d46011 	ldrb	r6, [r4, #17]
    7304:	e3560000 	cmp	r6, #0
    7308:	1a00005d 	bne	7484 <f_write+0x1b4>
    730c:	e5d43010 	ldrb	r3, [r4, #16]
    7310:	e3130002 	tst	r3, #2
    7314:	03a06007 	moveq	r6, #7
    7318:	0a000059 	beq	7484 <f_write+0x1b4>
    731c:	e5940014 	ldr	r0, [r4, #20]
    7320:	e1700005 	cmn	r0, r5
    7324:	21e05000 	mvncs	r5, r0
    7328:	e3550000 	cmp	r5, #0
    732c:	0a000052 	beq	747c <f_write+0x1ac>
    7330:	e3e0907f 	mvn	r9, #127	; 0x7f
    7334:	e7e8e050 	ubfx	lr, r0, #0, #9
    7338:	e35e0000 	cmp	lr, #0
    733c:	1284b040 	addne	fp, r4, #64	; 0x40
    7340:	1a00002b 	bne	73f4 <f_write+0x124>
    7344:	e59db00c 	ldr	fp, [sp, #12]
    7348:	e1dba0ba 	ldrh	sl, [fp, #10]
    734c:	e24aa001 	sub	sl, sl, #1
    7350:	e01aa4a0 	ands	sl, sl, r0, lsr #9
    7354:	1a00000c 	bne	738c <f_write+0xbc>
    7358:	e3500000 	cmp	r0, #0
    735c:	1a000086 	bne	757c <f_write+0x2ac>
    7360:	e5940008 	ldr	r0, [r4, #8]
    7364:	e3500000 	cmp	r0, #0
    7368:	0a000061 	beq	74f4 <f_write+0x224>
    736c:	e3500001 	cmp	r0, #1
    7370:	0a000046 	beq	7490 <f_write+0x1c0>
    7374:	e3700001 	cmn	r0, #1
    7378:	0a000079 	beq	7564 <f_write+0x294>
    737c:	e5943008 	ldr	r3, [r4, #8]
    7380:	e5840018 	str	r0, [r4, #24]
    7384:	e3530000 	cmp	r3, #0
    7388:	05840008 	streq	r0, [r4, #8]
    738c:	e1d431d0 	ldrsb	r3, [r4, #16]
    7390:	e3530000 	cmp	r3, #0
    7394:	ba000068 	blt	753c <f_write+0x26c>
    7398:	e5942018 	ldr	r2, [r4, #24]
    739c:	e59b3014 	ldr	r3, [fp, #20]
    73a0:	e2422002 	sub	r2, r2, #2
    73a4:	e2433002 	sub	r3, r3, #2
    73a8:	e1520003 	cmp	r2, r3
    73ac:	2a000037 	bcs	7490 <f_write+0x1c0>
    73b0:	e1db10ba 	ldrh	r1, [fp, #10]
    73b4:	e59b302c 	ldr	r3, [fp, #44]	; 0x2c
    73b8:	e0323291 	mlas	r2, r1, r2, r3
    73bc:	0a000033 	beq	7490 <f_write+0x1c0>
    73c0:	e3550c02 	cmp	r5, #512	; 0x200
    73c4:	e08a2002 	add	r2, sl, r2
    73c8:	2a000036 	bcs	74a8 <f_write+0x1d8>
    73cc:	e594301c 	ldr	r3, [r4, #28]
    73d0:	e5940014 	ldr	r0, [r4, #20]
    73d4:	e1530002 	cmp	r3, r2
    73d8:	0a000002 	beq	73e8 <f_write+0x118>
    73dc:	e594300c 	ldr	r3, [r4, #12]
    73e0:	e1530000 	cmp	r3, r0
    73e4:	8a00006b 	bhi	7598 <f_write+0x2c8>
    73e8:	e284b040 	add	fp, r4, #64	; 0x40
    73ec:	e7e8e050 	ubfx	lr, r0, #0, #9
    73f0:	e584201c 	str	r2, [r4, #28]
    73f4:	e08bb00e 	add	fp, fp, lr
    73f8:	e26eec02 	rsb	lr, lr, #512	; 0x200
    73fc:	e15e0005 	cmp	lr, r5
    7400:	21a0e005 	movcs	lr, r5
    7404:	e35e0003 	cmp	lr, #3
    7408:	9a00005f 	bls	758c <f_write+0x2bc>
    740c:	e24e1004 	sub	r1, lr, #4
    7410:	e247c004 	sub	ip, r7, #4
    7414:	e3c1a003 	bic	sl, r1, #3
    7418:	e1a01121 	lsr	r1, r1, #2
    741c:	e087a00a 	add	sl, r7, sl
    7420:	e1a0300b 	mov	r3, fp
    7424:	e5bc2004 	ldr	r2, [ip, #4]!
    7428:	e15a000c 	cmp	sl, ip
    742c:	e4832004 	str	r2, [r3], #4
    7430:	1afffffb 	bne	7424 <f_write+0x154>
    7434:	e21e2003 	ands	r2, lr, #3
    7438:	1a000033 	bne	750c <f_write+0x23c>
    743c:	e5d43010 	ldrb	r3, [r4, #16]
    7440:	e1893003 	orr	r3, r9, r3
    7444:	e5c43010 	strb	r3, [r4, #16]
    7448:	e594300c 	ldr	r3, [r4, #12]
    744c:	e080000e 	add	r0, r0, lr
    7450:	e5982000 	ldr	r2, [r8]
    7454:	e087700e 	add	r7, r7, lr
    7458:	e1530000 	cmp	r3, r0
    745c:	31a03000 	movcc	r3, r0
    7460:	e055500e 	subs	r5, r5, lr
    7464:	e082200e 	add	r2, r2, lr
    7468:	e5882000 	str	r2, [r8]
    746c:	e584300c 	str	r3, [r4, #12]
    7470:	e5840014 	str	r0, [r4, #20]
    7474:	1affffae 	bne	7334 <f_write+0x64>
    7478:	e5d43010 	ldrb	r3, [r4, #16]
    747c:	e3833040 	orr	r3, r3, #64	; 0x40
    7480:	e5c43010 	strb	r3, [r4, #16]
    7484:	e1a00006 	mov	r0, r6
    7488:	e28dd014 	add	sp, sp, #20
    748c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7490:	e3a03002 	mov	r3, #2
    7494:	e1a06003 	mov	r6, r3
    7498:	e5c43011 	strb	r3, [r4, #17]
    749c:	e1a00006 	mov	r0, r6
    74a0:	e28dd014 	add	sp, sp, #20
    74a4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    74a8:	e1a034a5 	lsr	r3, r5, #9
    74ac:	e08a0003 	add	r0, sl, r3
    74b0:	e1500001 	cmp	r0, r1
    74b4:	e5db0001 	ldrb	r0, [fp, #1]
    74b8:	8041300a 	subhi	r3, r1, sl
    74bc:	e1a01007 	mov	r1, r7
    74c0:	e1cd20f0 	strd	r2, [sp]
    74c4:	eb0007ea 	bl	9474 <disk_write>
    74c8:	e3500000 	cmp	r0, #0
    74cc:	1a000024 	bne	7564 <f_write+0x294>
    74d0:	e594101c 	ldr	r1, [r4, #28]
    74d4:	e59d2000 	ldr	r2, [sp]
    74d8:	e59d3004 	ldr	r3, [sp, #4]
    74dc:	e0412002 	sub	r2, r1, r2
    74e0:	e1520003 	cmp	r2, r3
    74e4:	3a000036 	bcc	75c4 <f_write+0x2f4>
    74e8:	e5940014 	ldr	r0, [r4, #20]
    74ec:	e1a0e483 	lsl	lr, r3, #9
    74f0:	eaffffd4 	b	7448 <f_write+0x178>
    74f4:	e1a0100a 	mov	r1, sl
    74f8:	e1a00004 	mov	r0, r4
    74fc:	ebfffa7b 	bl	5ef0 <create_chain>
    7500:	e3500000 	cmp	r0, #0
    7504:	1affff98 	bne	736c <f_write+0x9c>
    7508:	eaffffda 	b	7478 <f_write+0x1a8>
    750c:	e2813001 	add	r3, r1, #1
    7510:	e1a03103 	lsl	r3, r3, #2
    7514:	e08bb003 	add	fp, fp, r3
    7518:	e0873003 	add	r3, r7, r3
    751c:	e24bb001 	sub	fp, fp, #1
    7520:	e0832002 	add	r2, r3, r2
    7524:	e4d31001 	ldrb	r1, [r3], #1
    7528:	e1520003 	cmp	r2, r3
    752c:	e5eb1001 	strb	r1, [fp, #1]!
    7530:	1afffffb 	bne	7524 <f_write+0x254>
    7534:	e5940014 	ldr	r0, [r4, #20]
    7538:	eaffffbf 	b	743c <f_write+0x16c>
    753c:	e594201c 	ldr	r2, [r4, #28]
    7540:	e3a03001 	mov	r3, #1
    7544:	e5db0001 	ldrb	r0, [fp, #1]
    7548:	e2841040 	add	r1, r4, #64	; 0x40
    754c:	eb0007c8 	bl	9474 <disk_write>
    7550:	e3500000 	cmp	r0, #0
    7554:	05d43010 	ldrbeq	r3, [r4, #16]
    7558:	0203307f 	andeq	r3, r3, #127	; 0x7f
    755c:	05c43010 	strbeq	r3, [r4, #16]
    7560:	0affff8c 	beq	7398 <f_write+0xc8>
    7564:	e3a03001 	mov	r3, #1
    7568:	e1a06003 	mov	r6, r3
    756c:	e5c43011 	strb	r3, [r4, #17]
    7570:	e1a00006 	mov	r0, r6
    7574:	e28dd014 	add	sp, sp, #20
    7578:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    757c:	e5941018 	ldr	r1, [r4, #24]
    7580:	e1a00004 	mov	r0, r4
    7584:	ebfffa59 	bl	5ef0 <create_chain>
    7588:	eaffffdc 	b	7500 <f_write+0x230>
    758c:	e1a0200e 	mov	r2, lr
    7590:	e1a03007 	mov	r3, r7
    7594:	eaffffe0 	b	751c <f_write+0x24c>
    7598:	e5db0001 	ldrb	r0, [fp, #1]
    759c:	e284b040 	add	fp, r4, #64	; 0x40
    75a0:	e3a03001 	mov	r3, #1
    75a4:	e1a0100b 	mov	r1, fp
    75a8:	e58d2000 	str	r2, [sp]
    75ac:	eb000757 	bl	9310 <disk_read>
    75b0:	e3500000 	cmp	r0, #0
    75b4:	1affffea 	bne	7564 <f_write+0x294>
    75b8:	e5940014 	ldr	r0, [r4, #20]
    75bc:	e59d2000 	ldr	r2, [sp]
    75c0:	eaffff89 	b	73ec <f_write+0x11c>
    75c4:	e0872482 	add	r2, r7, r2, lsl #9
    75c8:	e2841040 	add	r1, r4, #64	; 0x40
    75cc:	e284cd09 	add	ip, r4, #576	; 0x240
    75d0:	e2422004 	sub	r2, r2, #4
    75d4:	e5b20004 	ldr	r0, [r2, #4]!
    75d8:	e4810004 	str	r0, [r1], #4
    75dc:	e151000c 	cmp	r1, ip
    75e0:	1afffffb 	bne	75d4 <f_write+0x304>
    75e4:	e5d42010 	ldrb	r2, [r4, #16]
    75e8:	e202207f 	and	r2, r2, #127	; 0x7f
    75ec:	e5c42010 	strb	r2, [r4, #16]
    75f0:	eaffffbc 	b	74e8 <f_write+0x218>

000075f4 <f_sync>:
    75f4:	e92d4070 	push	{r4, r5, r6, lr}
    75f8:	e2504000 	subs	r4, r0, #0
    75fc:	0a000009 	beq	7628 <f_sync+0x34>
    7600:	e5943000 	ldr	r3, [r4]
    7604:	e3530000 	cmp	r3, #0
    7608:	0a000006 	beq	7628 <f_sync+0x34>
    760c:	e5d32000 	ldrb	r2, [r3]
    7610:	e3520000 	cmp	r2, #0
    7614:	0a000003 	beq	7628 <f_sync+0x34>
    7618:	e1d410b4 	ldrh	r1, [r4, #4]
    761c:	e1d320b6 	ldrh	r2, [r3, #6]
    7620:	e1510002 	cmp	r1, r2
    7624:	0a000001 	beq	7630 <f_sync+0x3c>
    7628:	e3a00009 	mov	r0, #9
    762c:	e8bd8070 	pop	{r4, r5, r6, pc}
    7630:	e5d30001 	ldrb	r0, [r3, #1]
    7634:	eb0006a6 	bl	90d4 <disk_status>
    7638:	e3100001 	tst	r0, #1
    763c:	1afffff9 	bne	7628 <f_sync+0x34>
    7640:	e5d43010 	ldrb	r3, [r4, #16]
    7644:	e2130040 	ands	r0, r3, #64	; 0x40
    7648:	08bd8070 	popeq	{r4, r5, r6, pc}
    764c:	e3130080 	tst	r3, #128	; 0x80
    7650:	e5945000 	ldr	r5, [r4]
    7654:	1a000021 	bne	76e0 <SLCRlockKey+0x65>
    7658:	e5941020 	ldr	r1, [r4, #32]
    765c:	e1a00005 	mov	r0, r5
    7660:	ebfff8e2 	bl	59f0 <move_window>
    7664:	e3500000 	cmp	r0, #0
    7668:	18bd8070 	popne	{r4, r5, r6, pc}
    766c:	e5946024 	ldr	r6, [r4, #36]	; 0x24
    7670:	e5d6300b 	ldrb	r3, [r6, #11]
    7674:	e3833020 	orr	r3, r3, #32
    7678:	e5c6300b 	strb	r3, [r6, #11]
    767c:	e5943008 	ldr	r3, [r4, #8]
    7680:	e5942000 	ldr	r2, [r4]
    7684:	e7e71453 	ubfx	r1, r3, #8, #8
    7688:	e5c6301a 	strb	r3, [r6, #26]
    768c:	e5c6101b 	strb	r1, [r6, #27]
    7690:	e5d22000 	ldrb	r2, [r2]
    7694:	e3520003 	cmp	r2, #3
    7698:	01a03823 	lsreq	r3, r3, #16
    769c:	01a02423 	lsreq	r2, r3, #8
    76a0:	05c63014 	strbeq	r3, [r6, #20]
    76a4:	05c62015 	strbeq	r2, [r6, #21]
    76a8:	e594300c 	ldr	r3, [r4, #12]
    76ac:	e586301c 	str	r3, [r6, #28]
    76b0:	eb00076c 	bl	9468 <get_fattime>
    76b4:	e3a03000 	mov	r3, #0
    76b8:	e5860016 	str	r0, [r6, #22]
    76bc:	e1c631b2 	strh	r3, [r6, #18]
    76c0:	e3a03001 	mov	r3, #1
    76c4:	e5c53004 	strb	r3, [r5, #4]
    76c8:	e1a00005 	mov	r0, r5
    76cc:	ebfff880 	bl	58d4 <sync_fs>
    76d0:	e5d43010 	ldrb	r3, [r4, #16]
    76d4:	e3c33040 	bic	r3, r3, #64	; 0x40
    76d8:	e5c43010 	strb	r3, [r4, #16]
    76dc:	e8bd8070 	pop	{r4, r5, r6, pc}
    76e0:	e594201c 	ldr	r2, [r4, #28]
    76e4:	e3a03001 	mov	r3, #1
    76e8:	e5d50001 	ldrb	r0, [r5, #1]
    76ec:	e2841040 	add	r1, r4, #64	; 0x40
    76f0:	eb00075f 	bl	9474 <disk_write>
    76f4:	e3500000 	cmp	r0, #0
    76f8:	05d43010 	ldrbeq	r3, [r4, #16]
    76fc:	0203307f 	andeq	r3, r3, #127	; 0x7f
    7700:	05c43010 	strbeq	r3, [r4, #16]
    7704:	0affffd3 	beq	7658 <f_sync+0x64>
    7708:	e3a00001 	mov	r0, #1
    770c:	e8bd8070 	pop	{r4, r5, r6, pc}

00007710 <f_close>:
    7710:	e92d4010 	push	{r4, lr}
    7714:	e24dd008 	sub	sp, sp, #8
    7718:	e1a04000 	mov	r4, r0
    771c:	ebffffb4 	bl	75f4 <f_sync>
    7720:	e3500000 	cmp	r0, #0
    7724:	0a000001 	beq	7730 <f_close+0x20>
    7728:	e28dd008 	add	sp, sp, #8
    772c:	e8bd8010 	pop	{r4, pc}
    7730:	e28d1004 	add	r1, sp, #4
    7734:	e1a00004 	mov	r0, r4
    7738:	ebfff7df 	bl	56bc <validate>
    773c:	e3500000 	cmp	r0, #0
    7740:	05840000 	streq	r0, [r4]
    7744:	e28dd008 	add	sp, sp, #8
    7748:	e8bd8010 	pop	{r4, pc}

0000774c <f_lseek>:
    774c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7750:	e24dd008 	sub	sp, sp, #8
    7754:	e1a06001 	mov	r6, r1
    7758:	e28d1004 	add	r1, sp, #4
    775c:	e1a04000 	mov	r4, r0
    7760:	ebfff7d5 	bl	56bc <validate>
    7764:	e2507000 	subs	r7, r0, #0
    7768:	1a000038 	bne	7850 <f_lseek+0x104>
    776c:	e5d47011 	ldrb	r7, [r4, #17]
    7770:	e3570000 	cmp	r7, #0
    7774:	1a000035 	bne	7850 <f_lseek+0x104>
    7778:	e594300c 	ldr	r3, [r4, #12]
    777c:	e5940014 	ldr	r0, [r4, #20]
    7780:	e1530006 	cmp	r3, r6
    7784:	2a000035 	bcs	7860 <f_lseek+0x114>
    7788:	e5d42010 	ldrb	r2, [r4, #16]
    778c:	e3120002 	tst	r2, #2
    7790:	15847014 	strne	r7, [r4, #20]
    7794:	0a000030 	beq	785c <f_lseek+0x110>
    7798:	e59d8004 	ldr	r8, [sp, #4]
    779c:	e3500000 	cmp	r0, #0
    77a0:	e1d890ba 	ldrh	r9, [r8, #10]
    77a4:	e1a09489 	lsl	r9, r9, #9
    77a8:	0a000033 	beq	787c <f_lseek+0x130>
    77ac:	e2405001 	sub	r5, r0, #1
    77b0:	e1a01009 	mov	r1, r9
    77b4:	e2460001 	sub	r0, r6, #1
    77b8:	fa002580 	blx	10dc0 <__udivsi3>
    77bc:	e1a01009 	mov	r1, r9
    77c0:	e1a0a000 	mov	sl, r0
    77c4:	e1a00005 	mov	r0, r5
    77c8:	fa00257c 	blx	10dc0 <__udivsi3>
    77cc:	e15a0000 	cmp	sl, r0
    77d0:	3a000029 	bcc	787c <f_lseek+0x130>
    77d4:	e2693000 	rsb	r3, r9, #0
    77d8:	e0033005 	and	r3, r3, r5
    77dc:	e5945018 	ldr	r5, [r4, #24]
    77e0:	e0466003 	sub	r6, r6, r3
    77e4:	e5843014 	str	r3, [r4, #20]
    77e8:	e3550000 	cmp	r5, #0
    77ec:	1a000027 	bne	7890 <f_lseek+0x144>
    77f0:	e594200c 	ldr	r2, [r4, #12]
    77f4:	e1520003 	cmp	r2, r3
    77f8:	35d42010 	ldrbcc	r2, [r4, #16]
    77fc:	3584300c 	strcc	r3, [r4, #12]
    7800:	33822040 	orrcc	r2, r2, #64	; 0x40
    7804:	35c42010 	strbcc	r2, [r4, #16]
    7808:	e7e83053 	ubfx	r3, r3, #0, #9
    780c:	e3530000 	cmp	r3, #0
    7810:	0a00000e 	beq	7850 <f_lseek+0x104>
    7814:	e594201c 	ldr	r2, [r4, #28]
    7818:	e1520005 	cmp	r2, r5
    781c:	0a00000b 	beq	7850 <f_lseek+0x104>
    7820:	e1d431d0 	ldrsb	r3, [r4, #16]
    7824:	e2846040 	add	r6, r4, #64	; 0x40
    7828:	e5d80001 	ldrb	r0, [r8, #1]
    782c:	e3530000 	cmp	r3, #0
    7830:	ba000047 	blt	7954 <f_lseek+0x208>
    7834:	e1a01006 	mov	r1, r6
    7838:	e3a03001 	mov	r3, #1
    783c:	e1a02005 	mov	r2, r5
    7840:	eb0006b2 	bl	9310 <disk_read>
    7844:	e3500000 	cmp	r0, #0
    7848:	1a00002d 	bne	7904 <f_lseek+0x1b8>
    784c:	e584501c 	str	r5, [r4, #28]
    7850:	e1a00007 	mov	r0, r7
    7854:	e28dd008 	add	sp, sp, #8
    7858:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    785c:	e1a06003 	mov	r6, r3
    7860:	e3560000 	cmp	r6, #0
    7864:	e3a03000 	mov	r3, #0
    7868:	e5843014 	str	r3, [r4, #20]
    786c:	1affffc9 	bne	7798 <f_lseek+0x4c>
    7870:	e1a00007 	mov	r0, r7
    7874:	e28dd008 	add	sp, sp, #8
    7878:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    787c:	e5945008 	ldr	r5, [r4, #8]
    7880:	e3550000 	cmp	r5, #0
    7884:	0a000022 	beq	7914 <f_lseek+0x1c8>
    7888:	e5943014 	ldr	r3, [r4, #20]
    788c:	e5845018 	str	r5, [r4, #24]
    7890:	e1590006 	cmp	r9, r6
    7894:	3a00000e 	bcc	78d4 <f_lseek+0x188>
    7898:	ea000037 	b	797c <f_lseek+0x230>
    789c:	ebfff993 	bl	5ef0 <create_chain>
    78a0:	e2505000 	subs	r5, r0, #0
    78a4:	0a000044 	beq	79bc <f_lseek+0x270>
    78a8:	e3750001 	cmn	r5, #1
    78ac:	0a000014 	beq	7904 <f_lseek+0x1b8>
    78b0:	e3550001 	cmp	r5, #1
    78b4:	9a00001c 	bls	792c <f_lseek+0x1e0>
    78b8:	e5983014 	ldr	r3, [r8, #20]
    78bc:	e1530005 	cmp	r3, r5
    78c0:	9a000019 	bls	792c <f_lseek+0x1e0>
    78c4:	e1590006 	cmp	r9, r6
    78c8:	e5943014 	ldr	r3, [r4, #20]
    78cc:	e5845018 	str	r5, [r4, #24]
    78d0:	2a000029 	bcs	797c <f_lseek+0x230>
    78d4:	e5d42010 	ldrb	r2, [r4, #16]
    78d8:	e0893003 	add	r3, r9, r3
    78dc:	e1a01005 	mov	r1, r5
    78e0:	e1a00004 	mov	r0, r4
    78e4:	e0466009 	sub	r6, r6, r9
    78e8:	e5843014 	str	r3, [r4, #20]
    78ec:	e3120002 	tst	r2, #2
    78f0:	1affffe9 	bne	789c <f_lseek+0x150>
    78f4:	e5940000 	ldr	r0, [r4]
    78f8:	ebfff8c6 	bl	5c18 <get_fat.isra.0>
    78fc:	e1a05000 	mov	r5, r0
    7900:	eaffffe8 	b	78a8 <f_lseek+0x15c>
    7904:	e3a03001 	mov	r3, #1
    7908:	e1a07003 	mov	r7, r3
    790c:	e5c43011 	strb	r3, [r4, #17]
    7910:	eaffffce 	b	7850 <f_lseek+0x104>
    7914:	e1a01005 	mov	r1, r5
    7918:	e1a00004 	mov	r0, r4
    791c:	ebfff973 	bl	5ef0 <create_chain>
    7920:	e3500001 	cmp	r0, #1
    7924:	e1a05000 	mov	r5, r0
    7928:	1a000003 	bne	793c <f_lseek+0x1f0>
    792c:	e3a03002 	mov	r3, #2
    7930:	e1a07003 	mov	r7, r3
    7934:	e5c43011 	strb	r3, [r4, #17]
    7938:	eaffffc4 	b	7850 <f_lseek+0x104>
    793c:	e3700001 	cmn	r0, #1
    7940:	0affffef 	beq	7904 <f_lseek+0x1b8>
    7944:	e5943014 	ldr	r3, [r4, #20]
    7948:	e5840008 	str	r0, [r4, #8]
    794c:	e5840018 	str	r0, [r4, #24]
    7950:	eaffffa4 	b	77e8 <f_lseek+0x9c>
    7954:	e3a03001 	mov	r3, #1
    7958:	e1a01006 	mov	r1, r6
    795c:	eb0006c4 	bl	9474 <disk_write>
    7960:	e3500000 	cmp	r0, #0
    7964:	1affffe6 	bne	7904 <f_lseek+0x1b8>
    7968:	e5d43010 	ldrb	r3, [r4, #16]
    796c:	e203307f 	and	r3, r3, #127	; 0x7f
    7970:	e5c43010 	strb	r3, [r4, #16]
    7974:	e5d80001 	ldrb	r0, [r8, #1]
    7978:	eaffffad 	b	7834 <f_lseek+0xe8>
    797c:	e7e82056 	ubfx	r2, r6, #0, #9
    7980:	e0833006 	add	r3, r3, r6
    7984:	e3520000 	cmp	r2, #0
    7988:	e5843014 	str	r3, [r4, #20]
    798c:	0a00000c 	beq	79c4 <f_lseek+0x278>
    7990:	e5982014 	ldr	r2, [r8, #20]
    7994:	e2455002 	sub	r5, r5, #2
    7998:	e2422002 	sub	r2, r2, #2
    799c:	e1550002 	cmp	r5, r2
    79a0:	2affffe1 	bcs	792c <f_lseek+0x1e0>
    79a4:	e1d820ba 	ldrh	r2, [r8, #10]
    79a8:	e598102c 	ldr	r1, [r8, #44]	; 0x2c
    79ac:	e0321295 	mlas	r2, r5, r2, r1
    79b0:	0affffdd 	beq	792c <f_lseek+0x1e0>
    79b4:	e08254a6 	add	r5, r2, r6, lsr #9
    79b8:	eaffff8c 	b	77f0 <f_lseek+0xa4>
    79bc:	e5943014 	ldr	r3, [r4, #20]
    79c0:	eaffff8a 	b	77f0 <f_lseek+0xa4>
    79c4:	e1a05002 	mov	r5, r2
    79c8:	eaffff88 	b	77f0 <f_lseek+0xa4>

000079cc <f_opendir>:
    79cc:	e92d4030 	push	{r4, r5, lr}
    79d0:	e2504000 	subs	r4, r0, #0
    79d4:	e24dd014 	sub	sp, sp, #20
    79d8:	03a00009 	moveq	r0, #9
    79dc:	e58d1004 	str	r1, [sp, #4]
    79e0:	0a000007 	beq	7a04 <f_opendir+0x38>
    79e4:	e3a02000 	mov	r2, #0
    79e8:	e28d100c 	add	r1, sp, #12
    79ec:	e28d0004 	add	r0, sp, #4
    79f0:	ebfffb89 	bl	681c <mount_volume>
    79f4:	e3500000 	cmp	r0, #0
    79f8:	0a000003 	beq	7a0c <f_opendir+0x40>
    79fc:	e3a03000 	mov	r3, #0
    7a00:	e5843000 	str	r3, [r4]
    7a04:	e28dd014 	add	sp, sp, #20
    7a08:	e8bd8030 	pop	{r4, r5, pc}
    7a0c:	e59d500c 	ldr	r5, [sp, #12]
    7a10:	e1a00004 	mov	r0, r4
    7a14:	e59d1004 	ldr	r1, [sp, #4]
    7a18:	e5845000 	str	r5, [r4]
    7a1c:	ebfff9fb 	bl	6210 <follow_path>
    7a20:	e3500000 	cmp	r0, #0
    7a24:	1a000015 	bne	7a80 <f_opendir+0xb4>
    7a28:	e1d432db 	ldrsb	r3, [r4, #43]	; 0x2b
    7a2c:	e3530000 	cmp	r3, #0
    7a30:	ba000009 	blt	7a5c <f_opendir+0x90>
    7a34:	e5d43006 	ldrb	r3, [r4, #6]
    7a38:	e3130010 	tst	r3, #16
    7a3c:	0a000011 	beq	7a88 <f_opendir+0xbc>
    7a40:	e5d53000 	ldrb	r3, [r5]
    7a44:	e594201c 	ldr	r2, [r4, #28]
    7a48:	e3530003 	cmp	r3, #3
    7a4c:	e1d231ba 	ldrh	r3, [r2, #26]
    7a50:	01d221b4 	ldrheq	r2, [r2, #20]
    7a54:	01833802 	orreq	r3, r3, r2, lsl #16
    7a58:	e5843008 	str	r3, [r4, #8]
    7a5c:	e1d530b6 	ldrh	r3, [r5, #6]
    7a60:	e1a00004 	mov	r0, r4
    7a64:	e1c430b4 	strh	r3, [r4, #4]
    7a68:	ebfff8ac 	bl	5d20 <dir_sdi.constprop.0>
    7a6c:	e3500004 	cmp	r0, #4
    7a70:	0a000004 	beq	7a88 <f_opendir+0xbc>
    7a74:	e3500000 	cmp	r0, #0
    7a78:	0affffe1 	beq	7a04 <f_opendir+0x38>
    7a7c:	eaffffde 	b	79fc <f_opendir+0x30>
    7a80:	e3500004 	cmp	r0, #4
    7a84:	1affffdc 	bne	79fc <f_opendir+0x30>
    7a88:	e3a00005 	mov	r0, #5
    7a8c:	eaffffda 	b	79fc <f_opendir+0x30>

00007a90 <f_closedir>:
    7a90:	e92d4010 	push	{r4, lr}
    7a94:	e2504000 	subs	r4, r0, #0
    7a98:	0a000009 	beq	7ac4 <f_closedir+0x34>
    7a9c:	e5943000 	ldr	r3, [r4]
    7aa0:	e3530000 	cmp	r3, #0
    7aa4:	0a000006 	beq	7ac4 <f_closedir+0x34>
    7aa8:	e5d32000 	ldrb	r2, [r3]
    7aac:	e3520000 	cmp	r2, #0
    7ab0:	0a000003 	beq	7ac4 <f_closedir+0x34>
    7ab4:	e1d410b4 	ldrh	r1, [r4, #4]
    7ab8:	e1d320b6 	ldrh	r2, [r3, #6]
    7abc:	e1510002 	cmp	r1, r2
    7ac0:	0a000001 	beq	7acc <f_closedir+0x3c>
    7ac4:	e3a00009 	mov	r0, #9
    7ac8:	e8bd8010 	pop	{r4, pc}
    7acc:	e5d30001 	ldrb	r0, [r3, #1]
    7ad0:	eb00057f 	bl	90d4 <disk_status>
    7ad4:	e2100001 	ands	r0, r0, #1
    7ad8:	1afffff9 	bne	7ac4 <f_closedir+0x34>
    7adc:	e5840000 	str	r0, [r4]
    7ae0:	e8bd8010 	pop	{r4, pc}

00007ae4 <f_readdir>:
    7ae4:	e92d4070 	push	{r4, r5, r6, lr}
    7ae8:	e2504000 	subs	r4, r0, #0
    7aec:	e1a05001 	mov	r5, r1
    7af0:	0a000009 	beq	7b1c <f_readdir+0x38>
    7af4:	e5943000 	ldr	r3, [r4]
    7af8:	e3530000 	cmp	r3, #0
    7afc:	0a000006 	beq	7b1c <f_readdir+0x38>
    7b00:	e5d32000 	ldrb	r2, [r3]
    7b04:	e3520000 	cmp	r2, #0
    7b08:	0a000003 	beq	7b1c <f_readdir+0x38>
    7b0c:	e1d410b4 	ldrh	r1, [r4, #4]
    7b10:	e1d320b6 	ldrh	r2, [r3, #6]
    7b14:	e1510002 	cmp	r1, r2
    7b18:	0a000009 	beq	7b44 <f_readdir+0x60>
    7b1c:	e3a03001 	mov	r3, #1
    7b20:	e3a00009 	mov	r0, #9
    7b24:	e3550000 	cmp	r5, #0
    7b28:	03a03000 	moveq	r3, #0
    7b2c:	12033001 	andne	r3, r3, #1
    7b30:	e3530000 	cmp	r3, #0
    7b34:	08bd8070 	popeq	{r4, r5, r6, pc}
    7b38:	e3a03000 	mov	r3, #0
    7b3c:	e5c53009 	strb	r3, [r5, #9]
    7b40:	e8bd8070 	pop	{r4, r5, r6, pc}
    7b44:	e5d30001 	ldrb	r0, [r3, #1]
    7b48:	eb000561 	bl	90d4 <disk_status>
    7b4c:	e2103001 	ands	r3, r0, #1
    7b50:	1afffff1 	bne	7b1c <f_readdir+0x38>
    7b54:	e3550000 	cmp	r5, #0
    7b58:	e1a00004 	mov	r0, r4
    7b5c:	0a000012 	beq	7bac <f_readdir+0xc8>
    7b60:	e5c53009 	strb	r3, [r5, #9]
    7b64:	ebfffa89 	bl	6590 <dir_read.constprop.0>
    7b68:	e21030fb 	ands	r3, r0, #251	; 0xfb
    7b6c:	1afffff1 	bne	7b38 <f_readdir+0x54>
    7b70:	e5c53009 	strb	r3, [r5, #9]
    7b74:	e5943018 	ldr	r3, [r4, #24]
    7b78:	e3530000 	cmp	r3, #0
    7b7c:	0a000002 	beq	7b8c <f_readdir+0xa8>
    7b80:	e594001c 	ldr	r0, [r4, #28]
    7b84:	e1a01005 	mov	r1, r5
    7b88:	ebfff72f 	bl	584c <get_fileinfo.part.0.constprop.0.isra.0>
    7b8c:	e3a01000 	mov	r1, #0
    7b90:	e1a00004 	mov	r0, r4
    7b94:	ebfff94f 	bl	60d8 <dir_next>
    7b98:	e3500004 	cmp	r0, #4
    7b9c:	0a000004 	beq	7bb4 <f_readdir+0xd0>
    7ba0:	e2503000 	subs	r3, r0, #0
    7ba4:	13a03001 	movne	r3, #1
    7ba8:	eaffffdd 	b	7b24 <f_readdir+0x40>
    7bac:	e8bd4070 	pop	{r4, r5, r6, lr}
    7bb0:	eafff85a 	b	5d20 <dir_sdi.constprop.0>
    7bb4:	e3a00000 	mov	r0, #0
    7bb8:	e8bd8070 	pop	{r4, r5, r6, pc}

00007bbc <f_stat>:
    7bbc:	e92d4030 	push	{r4, r5, lr}
    7bc0:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    7bc4:	e3a02028 	mov	r2, #40	; 0x28
    7bc8:	e58d0004 	str	r0, [sp, #4]
    7bcc:	e1a05001 	mov	r5, r1
    7bd0:	e28d0010 	add	r0, sp, #16
    7bd4:	e3a01000 	mov	r1, #0
    7bd8:	fa0025c2 	blx	112e8 <memset>
    7bdc:	e3a02000 	mov	r2, #0
    7be0:	e28d100c 	add	r1, sp, #12
    7be4:	e28d0004 	add	r0, sp, #4
    7be8:	ebfffb0b 	bl	681c <mount_volume>
    7bec:	e2504000 	subs	r4, r0, #0
    7bf0:	0a000005 	beq	7c0c <f_stat+0x50>
    7bf4:	e3550000 	cmp	r5, #0
    7bf8:	13a03000 	movne	r3, #0
    7bfc:	15c53009 	strbne	r3, [r5, #9]
    7c00:	e1a00004 	mov	r0, r4
    7c04:	e28dd03c 	add	sp, sp, #60	; 0x3c
    7c08:	e8bd8030 	pop	{r4, r5, pc}
    7c0c:	e59d1004 	ldr	r1, [sp, #4]
    7c10:	e28d000c 	add	r0, sp, #12
    7c14:	ebfff97d 	bl	6210 <follow_path>
    7c18:	e2504000 	subs	r4, r0, #0
    7c1c:	1afffff4 	bne	7bf4 <f_stat+0x38>
    7c20:	e1dd33d7 	ldrsb	r3, [sp, #55]	; 0x37
    7c24:	e3530000 	cmp	r3, #0
    7c28:	ba000009 	blt	7c54 <f_stat+0x98>
    7c2c:	e3550000 	cmp	r5, #0
    7c30:	0afffff2 	beq	7c00 <f_stat+0x44>
    7c34:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    7c38:	e5c54009 	strb	r4, [r5, #9]
    7c3c:	e3530000 	cmp	r3, #0
    7c40:	0affffee 	beq	7c00 <f_stat+0x44>
    7c44:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    7c48:	e1a01005 	mov	r1, r5
    7c4c:	ebfff6fe 	bl	584c <get_fileinfo.part.0.constprop.0.isra.0>
    7c50:	eaffffea 	b	7c00 <f_stat+0x44>
    7c54:	e3a04006 	mov	r4, #6
    7c58:	eaffffe5 	b	7bf4 <f_stat+0x38>

00007c5c <f_getfree>:
    7c5c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7c60:	e24dd010 	sub	sp, sp, #16
    7c64:	e58d0004 	str	r0, [sp, #4]
    7c68:	e1a08001 	mov	r8, r1
    7c6c:	e1a04002 	mov	r4, r2
    7c70:	e28d100c 	add	r1, sp, #12
    7c74:	e3a02000 	mov	r2, #0
    7c78:	e28d0004 	add	r0, sp, #4
    7c7c:	ebfffae6 	bl	681c <mount_volume>
    7c80:	e2507000 	subs	r7, r0, #0
    7c84:	1a000026 	bne	7d24 <f_getfree+0xc8>
    7c88:	e59d500c 	ldr	r5, [sp, #12]
    7c8c:	e5956014 	ldr	r6, [r5, #20]
    7c90:	e5953010 	ldr	r3, [r5, #16]
    7c94:	e5845000 	str	r5, [r4]
    7c98:	e2462002 	sub	r2, r6, #2
    7c9c:	e1530002 	cmp	r3, r2
    7ca0:	95883000 	strls	r3, [r8]
    7ca4:	9a00001e 	bls	7d24 <f_getfree+0xc8>
    7ca8:	e5d53000 	ldrb	r3, [r5]
    7cac:	e3530001 	cmp	r3, #1
    7cb0:	0a00001e 	beq	7d30 <f_getfree+0xd4>
    7cb4:	e595a024 	ldr	sl, [r5, #36]	; 0x24
    7cb8:	e1a04007 	mov	r4, r7
    7cbc:	e1a09007 	mov	r9, r7
    7cc0:	ea000006 	b	7ce0 <f_getfree+0x84>
    7cc4:	e5922040 	ldr	r2, [r2, #64]	; 0x40
    7cc8:	e2844004 	add	r4, r4, #4
    7ccc:	e7e84054 	ubfx	r4, r4, #0, #9
    7cd0:	e3d2220f 	bics	r2, r2, #-268435456	; 0xf0000000
    7cd4:	02899001 	addeq	r9, r9, #1
    7cd8:	e2566001 	subs	r6, r6, #1
    7cdc:	0a00000b 	beq	7d10 <f_getfree+0xb4>
    7ce0:	e3540000 	cmp	r4, #0
    7ce4:	0a000023 	beq	7d78 <f_getfree+0x11c>
    7ce8:	e3530002 	cmp	r3, #2
    7cec:	e0852004 	add	r2, r5, r4
    7cf0:	1afffff3 	bne	7cc4 <f_getfree+0x68>
    7cf4:	e1d224b0 	ldrh	r2, [r2, #64]	; 0x40
    7cf8:	e2844002 	add	r4, r4, #2
    7cfc:	e7e84054 	ubfx	r4, r4, #0, #9
    7d00:	e3520000 	cmp	r2, #0
    7d04:	02899001 	addeq	r9, r9, #1
    7d08:	e2566001 	subs	r6, r6, #1
    7d0c:	1afffff3 	bne	7ce0 <f_getfree+0x84>
    7d10:	e5889000 	str	r9, [r8]
    7d14:	e5d53005 	ldrb	r3, [r5, #5]
    7d18:	e5859010 	str	r9, [r5, #16]
    7d1c:	e3833001 	orr	r3, r3, #1
    7d20:	e5c53005 	strb	r3, [r5, #5]
    7d24:	e1a00007 	mov	r0, r7
    7d28:	e28dd010 	add	sp, sp, #16
    7d2c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    7d30:	e3a04002 	mov	r4, #2
    7d34:	e1a09007 	mov	r9, r7
    7d38:	ea000006 	b	7d58 <f_getfree+0xfc>
    7d3c:	e3500001 	cmp	r0, #1
    7d40:	0a000015 	beq	7d9c <f_getfree+0x140>
    7d44:	e5953014 	ldr	r3, [r5, #20]
    7d48:	e3500000 	cmp	r0, #0
    7d4c:	02899001 	addeq	r9, r9, #1
    7d50:	e1530004 	cmp	r3, r4
    7d54:	9affffed 	bls	7d10 <f_getfree+0xb4>
    7d58:	e1a01004 	mov	r1, r4
    7d5c:	e1a00005 	mov	r0, r5
    7d60:	ebfff7ac 	bl	5c18 <get_fat.isra.0>
    7d64:	e3700001 	cmn	r0, #1
    7d68:	e2844001 	add	r4, r4, #1
    7d6c:	1afffff2 	bne	7d3c <f_getfree+0xe0>
    7d70:	e3a07001 	mov	r7, #1
    7d74:	eaffffea 	b	7d24 <f_getfree+0xc8>
    7d78:	e1a0100a 	mov	r1, sl
    7d7c:	e1a00005 	mov	r0, r5
    7d80:	ebfff71a 	bl	59f0 <move_window>
    7d84:	e3500000 	cmp	r0, #0
    7d88:	e28aa001 	add	sl, sl, #1
    7d8c:	05d53000 	ldrbeq	r3, [r5]
    7d90:	0affffd4 	beq	7ce8 <f_getfree+0x8c>
    7d94:	e1a07000 	mov	r7, r0
    7d98:	eaffffe1 	b	7d24 <f_getfree+0xc8>
    7d9c:	e3a07002 	mov	r7, #2
    7da0:	eaffffdf 	b	7d24 <f_getfree+0xc8>

00007da4 <f_truncate>:
    7da4:	e92d4070 	push	{r4, r5, r6, lr}
    7da8:	e2504000 	subs	r4, r0, #0
    7dac:	0a000009 	beq	7dd8 <f_truncate+0x34>
    7db0:	e5943000 	ldr	r3, [r4]
    7db4:	e3530000 	cmp	r3, #0
    7db8:	0a000006 	beq	7dd8 <f_truncate+0x34>
    7dbc:	e5d32000 	ldrb	r2, [r3]
    7dc0:	e3520000 	cmp	r2, #0
    7dc4:	0a000003 	beq	7dd8 <f_truncate+0x34>
    7dc8:	e1d410b4 	ldrh	r1, [r4, #4]
    7dcc:	e1d320b6 	ldrh	r2, [r3, #6]
    7dd0:	e1510002 	cmp	r1, r2
    7dd4:	0a000002 	beq	7de4 <f_truncate+0x40>
    7dd8:	e3a05009 	mov	r5, #9
    7ddc:	e1a00005 	mov	r0, r5
    7de0:	e8bd8070 	pop	{r4, r5, r6, pc}
    7de4:	e5d30001 	ldrb	r0, [r3, #1]
    7de8:	eb0004b9 	bl	90d4 <disk_status>
    7dec:	e3100001 	tst	r0, #1
    7df0:	1afffff8 	bne	7dd8 <f_truncate+0x34>
    7df4:	e5d45011 	ldrb	r5, [r4, #17]
    7df8:	e3550000 	cmp	r5, #0
    7dfc:	1afffff6 	bne	7ddc <f_truncate+0x38>
    7e00:	e5d43010 	ldrb	r3, [r4, #16]
    7e04:	e3130002 	tst	r3, #2
    7e08:	03a05007 	moveq	r5, #7
    7e0c:	0afffff2 	beq	7ddc <f_truncate+0x38>
    7e10:	e5943014 	ldr	r3, [r4, #20]
    7e14:	e594200c 	ldr	r2, [r4, #12]
    7e18:	e5946000 	ldr	r6, [r4]
    7e1c:	e1530002 	cmp	r3, r2
    7e20:	2affffed 	bcs	7ddc <f_truncate+0x38>
    7e24:	e3530000 	cmp	r3, #0
    7e28:	1a000018 	bne	7e90 <f_truncate+0xec>
    7e2c:	e5941008 	ldr	r1, [r4, #8]
    7e30:	e1a02005 	mov	r2, r5
    7e34:	e1a00004 	mov	r0, r4
    7e38:	ebfff7f1 	bl	5e04 <remove_chain>
    7e3c:	e5845008 	str	r5, [r4, #8]
    7e40:	e5943014 	ldr	r3, [r4, #20]
    7e44:	e3500000 	cmp	r0, #0
    7e48:	e584300c 	str	r3, [r4, #12]
    7e4c:	e5d43010 	ldrb	r3, [r4, #16]
    7e50:	e3833040 	orr	r3, r3, #64	; 0x40
    7e54:	e5c43010 	strb	r3, [r4, #16]
    7e58:	1a000030 	bne	7f20 <f_truncate+0x17c>
    7e5c:	e3130080 	tst	r3, #128	; 0x80
    7e60:	0affffdd 	beq	7ddc <f_truncate+0x38>
    7e64:	e594201c 	ldr	r2, [r4, #28]
    7e68:	e3a03001 	mov	r3, #1
    7e6c:	e5d60001 	ldrb	r0, [r6, #1]
    7e70:	e2841040 	add	r1, r4, #64	; 0x40
    7e74:	eb00057e 	bl	9474 <disk_write>
    7e78:	e3500000 	cmp	r0, #0
    7e7c:	1a00001f 	bne	7f00 <f_truncate+0x15c>
    7e80:	e5d43010 	ldrb	r3, [r4, #16]
    7e84:	e203307f 	and	r3, r3, #127	; 0x7f
    7e88:	e5c43010 	strb	r3, [r4, #16]
    7e8c:	eaffffd2 	b	7ddc <f_truncate+0x38>
    7e90:	e5941018 	ldr	r1, [r4, #24]
    7e94:	e1a00006 	mov	r0, r6
    7e98:	ebfff75e 	bl	5c18 <get_fat.isra.0>
    7e9c:	e3700001 	cmn	r0, #1
    7ea0:	0a000011 	beq	7eec <f_truncate+0x148>
    7ea4:	e3500001 	cmp	r0, #1
    7ea8:	0a000007 	beq	7ecc <f_truncate+0x128>
    7eac:	e5963014 	ldr	r3, [r6, #20]
    7eb0:	e1530000 	cmp	r3, r0
    7eb4:	9a000013 	bls	7f08 <f_truncate+0x164>
    7eb8:	e1a01000 	mov	r1, r0
    7ebc:	e5942018 	ldr	r2, [r4, #24]
    7ec0:	e1a00004 	mov	r0, r4
    7ec4:	ebfff7ce 	bl	5e04 <remove_chain>
    7ec8:	eaffffdc 	b	7e40 <f_truncate+0x9c>
    7ecc:	e5d43010 	ldrb	r3, [r4, #16]
    7ed0:	e3a05002 	mov	r5, #2
    7ed4:	e5942014 	ldr	r2, [r4, #20]
    7ed8:	e3833040 	orr	r3, r3, #64	; 0x40
    7edc:	e584200c 	str	r2, [r4, #12]
    7ee0:	e5c43010 	strb	r3, [r4, #16]
    7ee4:	e5c45011 	strb	r5, [r4, #17]
    7ee8:	eaffffbb 	b	7ddc <f_truncate+0x38>
    7eec:	e5d43010 	ldrb	r3, [r4, #16]
    7ef0:	e5942014 	ldr	r2, [r4, #20]
    7ef4:	e3833040 	orr	r3, r3, #64	; 0x40
    7ef8:	e584200c 	str	r2, [r4, #12]
    7efc:	e5c43010 	strb	r3, [r4, #16]
    7f00:	e3a05001 	mov	r5, #1
    7f04:	eafffff6 	b	7ee4 <f_truncate+0x140>
    7f08:	e5d43010 	ldrb	r3, [r4, #16]
    7f0c:	e5942014 	ldr	r2, [r4, #20]
    7f10:	e3833040 	orr	r3, r3, #64	; 0x40
    7f14:	e584200c 	str	r2, [r4, #12]
    7f18:	e5c43010 	strb	r3, [r4, #16]
    7f1c:	eaffffce 	b	7e5c <f_truncate+0xb8>
    7f20:	e1a05000 	mov	r5, r0
    7f24:	eaffffee 	b	7ee4 <f_truncate+0x140>

00007f28 <f_unlink>:
    7f28:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    7f2c:	e24dd06c 	sub	sp, sp, #108	; 0x6c
    7f30:	e58d0004 	str	r0, [sp, #4]
    7f34:	e3a02002 	mov	r2, #2
    7f38:	e28d100c 	add	r1, sp, #12
    7f3c:	e28d0004 	add	r0, sp, #4
    7f40:	ebfffa35 	bl	681c <mount_volume>
    7f44:	e3500000 	cmp	r0, #0
    7f48:	0a000001 	beq	7f54 <f_unlink+0x2c>
    7f4c:	e28dd06c 	add	sp, sp, #108	; 0x6c
    7f50:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    7f54:	e59d400c 	ldr	r4, [sp, #12]
    7f58:	e28d0010 	add	r0, sp, #16
    7f5c:	e59d1004 	ldr	r1, [sp, #4]
    7f60:	e58d4010 	str	r4, [sp, #16]
    7f64:	ebfff8a9 	bl	6210 <follow_path>
    7f68:	e3500000 	cmp	r0, #0
    7f6c:	1afffff6 	bne	7f4c <f_unlink+0x24>
    7f70:	e5dd303b 	ldrb	r3, [sp, #59]	; 0x3b
    7f74:	e31300a0 	tst	r3, #160	; 0xa0
    7f78:	13a00006 	movne	r0, #6
    7f7c:	1afffff2 	bne	7f4c <f_unlink+0x24>
    7f80:	e5dd3016 	ldrb	r3, [sp, #22]
    7f84:	e3130001 	tst	r3, #1
    7f88:	1a00002a 	bne	8038 <f_unlink+0x110>
    7f8c:	e5d42000 	ldrb	r2, [r4]
    7f90:	e59d602c 	ldr	r6, [sp, #44]	; 0x2c
    7f94:	e3520003 	cmp	r2, #3
    7f98:	01d621b4 	ldrheq	r2, [r6, #20]
    7f9c:	e1d651ba 	ldrh	r5, [r6, #26]
    7fa0:	01855802 	orreq	r5, r5, r2, lsl #16
    7fa4:	e3130010 	tst	r3, #16
    7fa8:	1a00000e 	bne	7fe8 <f_unlink+0xc0>
    7fac:	e59d7010 	ldr	r7, [sp, #16]
    7fb0:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    7fb4:	e1a00007 	mov	r0, r7
    7fb8:	ebfff68c 	bl	59f0 <move_window>
    7fbc:	e3500000 	cmp	r0, #0
    7fc0:	1affffe1 	bne	7f4c <f_unlink+0x24>
    7fc4:	e3e0301a 	mvn	r3, #26
    7fc8:	e3550000 	cmp	r5, #0
    7fcc:	e5c63000 	strb	r3, [r6]
    7fd0:	e3a03001 	mov	r3, #1
    7fd4:	e5c73004 	strb	r3, [r7, #4]
    7fd8:	1a00000f 	bne	801c <f_unlink+0xf4>
    7fdc:	e1a00004 	mov	r0, r4
    7fe0:	ebfff63b 	bl	58d4 <sync_fs>
    7fe4:	eaffffd8 	b	7f4c <f_unlink+0x24>
    7fe8:	e28d003c 	add	r0, sp, #60	; 0x3c
    7fec:	e58d403c 	str	r4, [sp, #60]	; 0x3c
    7ff0:	e58d5044 	str	r5, [sp, #68]	; 0x44
    7ff4:	ebfff749 	bl	5d20 <dir_sdi.constprop.0>
    7ff8:	e3500000 	cmp	r0, #0
    7ffc:	1affffd2 	bne	7f4c <f_unlink+0x24>
    8000:	e28d003c 	add	r0, sp, #60	; 0x3c
    8004:	ebfff961 	bl	6590 <dir_read.constprop.0>
    8008:	e3500000 	cmp	r0, #0
    800c:	0a000009 	beq	8038 <f_unlink+0x110>
    8010:	e3500004 	cmp	r0, #4
    8014:	1affffcc 	bne	7f4c <f_unlink+0x24>
    8018:	eaffffe3 	b	7fac <f_unlink+0x84>
    801c:	e1a02000 	mov	r2, r0
    8020:	e1a01005 	mov	r1, r5
    8024:	e28d0010 	add	r0, sp, #16
    8028:	ebfff775 	bl	5e04 <remove_chain>
    802c:	e3500000 	cmp	r0, #0
    8030:	1affffc5 	bne	7f4c <f_unlink+0x24>
    8034:	eaffffe8 	b	7fdc <f_unlink+0xb4>
    8038:	e3a00007 	mov	r0, #7
    803c:	eaffffc2 	b	7f4c <f_unlink+0x24>

00008040 <f_mkdir>:
    8040:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8044:	e24dd048 	sub	sp, sp, #72	; 0x48
    8048:	e58d0004 	str	r0, [sp, #4]
    804c:	e3a02002 	mov	r2, #2
    8050:	e28d1008 	add	r1, sp, #8
    8054:	e28d0004 	add	r0, sp, #4
    8058:	ebfff9ef 	bl	681c <mount_volume>
    805c:	e2504000 	subs	r4, r0, #0
    8060:	0a000002 	beq	8070 <f_mkdir+0x30>
    8064:	e1a00004 	mov	r0, r4
    8068:	e28dd048 	add	sp, sp, #72	; 0x48
    806c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    8070:	e99d000a 	ldmib	sp, {r1, r3}
    8074:	e1a05000 	mov	r5, r0
    8078:	e28d001c 	add	r0, sp, #28
    807c:	e58d301c 	str	r3, [sp, #28]
    8080:	ebfff862 	bl	6210 <follow_path>
    8084:	e2504000 	subs	r4, r0, #0
    8088:	1a000006 	bne	80a8 <f_mkdir+0x68>
    808c:	e5dd3047 	ldrb	r3, [sp, #71]	; 0x47
    8090:	e31300a0 	tst	r3, #160	; 0xa0
    8094:	03a04008 	moveq	r4, #8
    8098:	13a04006 	movne	r4, #6
    809c:	e1a00004 	mov	r0, r4
    80a0:	e28dd048 	add	sp, sp, #72	; 0x48
    80a4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    80a8:	e3540004 	cmp	r4, #4
    80ac:	1affffec 	bne	8064 <f_mkdir+0x24>
    80b0:	e59d3008 	ldr	r3, [sp, #8]
    80b4:	e1a01005 	mov	r1, r5
    80b8:	e28d000c 	add	r0, sp, #12
    80bc:	e58d300c 	str	r3, [sp, #12]
    80c0:	ebfff78a 	bl	5ef0 <create_chain>
    80c4:	e2505000 	subs	r5, r0, #0
    80c8:	1a000006 	bne	80e8 <f_mkdir+0xa8>
    80cc:	e3a04007 	mov	r4, #7
    80d0:	eb0004e4 	bl	9468 <get_fattime>
    80d4:	e3a02000 	mov	r2, #0
    80d8:	e1a01005 	mov	r1, r5
    80dc:	e28d000c 	add	r0, sp, #12
    80e0:	ebfff747 	bl	5e04 <remove_chain>
    80e4:	eaffffde 	b	8064 <f_mkdir+0x24>
    80e8:	e3550001 	cmp	r5, #1
    80ec:	0a000050 	beq	8234 <f_mkdir+0x1f4>
    80f0:	e3750001 	cmn	r5, #1
    80f4:	1a000002 	bne	8104 <f_mkdir+0xc4>
    80f8:	e3a04001 	mov	r4, #1
    80fc:	eb0004d9 	bl	9468 <get_fattime>
    8100:	eafffff3 	b	80d4 <f_mkdir+0x94>
    8104:	eb0004d7 	bl	9468 <get_fattime>
    8108:	e1a01005 	mov	r1, r5
    810c:	e1a06000 	mov	r6, r0
    8110:	e59d0008 	ldr	r0, [sp, #8]
    8114:	ebfff5a3 	bl	57a8 <dir_clear>
    8118:	e2504000 	subs	r4, r0, #0
    811c:	1affffec 	bne	80d4 <f_mkdir+0x94>
    8120:	e59d2008 	ldr	r2, [sp, #8]
    8124:	e3023020 	movw	r3, #8224	; 0x2020
    8128:	e3423020 	movt	r3, #8224	; 0x2020
    812c:	e6ef7075 	uxtb	r7, r5
    8130:	e7e78455 	ubfx	r8, r5, #8, #8
    8134:	e5d2c000 	ldrb	ip, [r2]
    8138:	e2820060 	add	r0, r2, #96	; 0x60
    813c:	e5823041 	str	r3, [r2, #65]	; 0x41
    8140:	e5823045 	str	r3, [r2, #69]	; 0x45
    8144:	e1c234b9 	strh	r3, [r2, #73]	; 0x49
    8148:	e3a0302e 	mov	r3, #46	; 0x2e
    814c:	e35c0003 	cmp	ip, #3
    8150:	e5c23040 	strb	r3, [r2, #64]	; 0x40
    8154:	e3a03010 	mov	r3, #16
    8158:	e5826056 	str	r6, [r2, #86]	; 0x56
    815c:	e5c2304b 	strb	r3, [r2, #75]	; 0x4b
    8160:	01a03335 	lsreq	r3, r5, r3
    8164:	e5c2705a 	strb	r7, [r2, #90]	; 0x5a
    8168:	05c23054 	strbeq	r3, [r2, #84]	; 0x54
    816c:	01a03423 	lsreq	r3, r3, #8
    8170:	e5c2805b 	strb	r8, [r2, #91]	; 0x5b
    8174:	05c23055 	strbeq	r3, [r2, #85]	; 0x55
    8178:	e2823040 	add	r3, r2, #64	; 0x40
    817c:	e5931000 	ldr	r1, [r3]
    8180:	e2833008 	add	r3, r3, #8
    8184:	e5831018 	str	r1, [r3, #24]
    8188:	e5131004 	ldr	r1, [r3, #-4]
    818c:	e583101c 	str	r1, [r3, #28]
    8190:	e1500003 	cmp	r0, r3
    8194:	1afffff8 	bne	817c <f_mkdir+0x13c>
    8198:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    819c:	e35c0003 	cmp	ip, #3
    81a0:	e3a0102e 	mov	r1, #46	; 0x2e
    81a4:	e28d001c 	add	r0, sp, #28
    81a8:	e5c21061 	strb	r1, [r2, #97]	; 0x61
    81ac:	e5c2307a 	strb	r3, [r2, #122]	; 0x7a
    81b0:	e7e71453 	ubfx	r1, r3, #8, #8
    81b4:	01a03823 	lsreq	r3, r3, #16
    81b8:	e5c2107b 	strb	r1, [r2, #123]	; 0x7b
    81bc:	05c23074 	strbeq	r3, [r2, #116]	; 0x74
    81c0:	01a03423 	lsreq	r3, r3, #8
    81c4:	05c23075 	strbeq	r3, [r2, #117]	; 0x75
    81c8:	e3a03001 	mov	r3, #1
    81cc:	e5c23004 	strb	r3, [r2, #4]
    81d0:	ebfffa79 	bl	6bbc <dir_register>
    81d4:	e2504000 	subs	r4, r0, #0
    81d8:	1affffbd 	bne	80d4 <f_mkdir+0x94>
    81dc:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    81e0:	e3a01010 	mov	r1, #16
    81e4:	e59d0008 	ldr	r0, [sp, #8]
    81e8:	e583600e 	str	r6, [r3, #14]
    81ec:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    81f0:	e5836016 	str	r6, [r3, #22]
    81f4:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    81f8:	e5c3701a 	strb	r7, [r3, #26]
    81fc:	e5c3801b 	strb	r8, [r3, #27]
    8200:	e5d02000 	ldrb	r2, [r0]
    8204:	e3520003 	cmp	r2, #3
    8208:	01a05825 	lsreq	r5, r5, #16
    820c:	01a02425 	lsreq	r2, r5, #8
    8210:	05c35014 	strbeq	r5, [r3, #20]
    8214:	05c32015 	strbeq	r2, [r3, #21]
    8218:	e3a03001 	mov	r3, #1
    821c:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8220:	e5c2100b 	strb	r1, [r2, #11]
    8224:	e5c03004 	strb	r3, [r0, #4]
    8228:	ebfff5a9 	bl	58d4 <sync_fs>
    822c:	e1a04000 	mov	r4, r0
    8230:	eaffff8b 	b	8064 <f_mkdir+0x24>
    8234:	e3a04002 	mov	r4, #2
    8238:	eb00048a 	bl	9468 <get_fattime>
    823c:	eaffffa4 	b	80d4 <f_mkdir+0x94>

00008240 <f_rename>:
    8240:	e92d4070 	push	{r4, r5, r6, lr}
    8244:	e24dd088 	sub	sp, sp, #136	; 0x88
    8248:	e58d0004 	str	r0, [sp, #4]
    824c:	e1a0000d 	mov	r0, sp
    8250:	e58d1000 	str	r1, [sp]
    8254:	ebfff4f9 	bl	5640 <get_ldnumber>
    8258:	e3a02002 	mov	r2, #2
    825c:	e28d100c 	add	r1, sp, #12
    8260:	e28d0004 	add	r0, sp, #4
    8264:	ebfff96c 	bl	681c <mount_volume>
    8268:	e3500000 	cmp	r0, #0
    826c:	0a000001 	beq	8278 <f_rename+0x38>
    8270:	e28dd088 	add	sp, sp, #136	; 0x88
    8274:	e8bd8070 	pop	{r4, r5, r6, pc}
    8278:	e59d400c 	ldr	r4, [sp, #12]
    827c:	e28d0030 	add	r0, sp, #48	; 0x30
    8280:	e59d1004 	ldr	r1, [sp, #4]
    8284:	e58d4030 	str	r4, [sp, #48]	; 0x30
    8288:	ebfff7e0 	bl	6210 <follow_path>
    828c:	e3500000 	cmp	r0, #0
    8290:	1afffff6 	bne	8270 <f_rename+0x30>
    8294:	e5dd305b 	ldrb	r3, [sp, #91]	; 0x5b
    8298:	e31300a0 	tst	r3, #160	; 0xa0
    829c:	13a00006 	movne	r0, #6
    82a0:	1afffff2 	bne	8270 <f_rename+0x30>
    82a4:	e59d504c 	ldr	r5, [sp, #76]	; 0x4c
    82a8:	e28d2010 	add	r2, sp, #16
    82ac:	e1a03005 	mov	r3, r5
    82b0:	e2850020 	add	r0, r5, #32
    82b4:	e5931000 	ldr	r1, [r3]
    82b8:	e2833008 	add	r3, r3, #8
    82bc:	e2822008 	add	r2, r2, #8
    82c0:	e5021008 	str	r1, [r2, #-8]
    82c4:	e5131004 	ldr	r1, [r3, #-4]
    82c8:	e1530000 	cmp	r3, r0
    82cc:	e5021004 	str	r1, [r2, #-4]
    82d0:	1afffff7 	bne	82b4 <f_rename+0x74>
    82d4:	e28d3030 	add	r3, sp, #48	; 0x30
    82d8:	e28d205c 	add	r2, sp, #92	; 0x5c
    82dc:	e4931004 	ldr	r1, [r3], #4
    82e0:	e4821004 	str	r1, [r2], #4
    82e4:	e28d1088 	add	r1, sp, #136	; 0x88
    82e8:	e1520001 	cmp	r2, r1
    82ec:	1afffffa 	bne	82dc <f_rename+0x9c>
    82f0:	e59d1000 	ldr	r1, [sp]
    82f4:	e28d005c 	add	r0, sp, #92	; 0x5c
    82f8:	ebfff7c4 	bl	6210 <follow_path>
    82fc:	e3500000 	cmp	r0, #0
    8300:	0a000044 	beq	8418 <f_rename+0x1d8>
    8304:	e3500004 	cmp	r0, #4
    8308:	1affffd8 	bne	8270 <f_rename+0x30>
    830c:	e28d005c 	add	r0, sp, #92	; 0x5c
    8310:	ebfffa29 	bl	6bbc <dir_register>
    8314:	e3500000 	cmp	r0, #0
    8318:	1affffd4 	bne	8270 <f_rename+0x30>
    831c:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    8320:	e59d2025 	ldr	r2, [sp, #37]	; 0x25
    8324:	e59d1021 	ldr	r1, [sp, #33]	; 0x21
    8328:	e283c01f 	add	ip, r3, #31
    832c:	e5832015 	str	r2, [r3, #21]
    8330:	e59d2029 	ldr	r2, [sp, #41]	; 0x29
    8334:	e5831011 	str	r1, [r3, #17]
    8338:	e28d102d 	add	r1, sp, #45	; 0x2d
    833c:	e5832019 	str	r2, [r3, #25]
    8340:	e59d201d 	ldr	r2, [sp, #29]
    8344:	e583200d 	str	r2, [r3, #13]
    8348:	e283201c 	add	r2, r3, #28
    834c:	e4d10001 	ldrb	r0, [r1], #1
    8350:	e5e20001 	strb	r0, [r2, #1]!
    8354:	e15c0002 	cmp	ip, r2
    8358:	1afffffb 	bne	834c <f_rename+0x10c>
    835c:	e5dd201b 	ldrb	r2, [sp, #27]
    8360:	e3a01001 	mov	r1, #1
    8364:	e3120010 	tst	r2, #16
    8368:	03822020 	orreq	r2, r2, #32
    836c:	e5c3200b 	strb	r2, [r3, #11]
    8370:	e5c41004 	strb	r1, [r4, #4]
    8374:	e5d3200b 	ldrb	r2, [r3, #11]
    8378:	e3120010 	tst	r2, #16
    837c:	0a000018 	beq	83e4 <f_rename+0x1a4>
    8380:	e59d6064 	ldr	r6, [sp, #100]	; 0x64
    8384:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8388:	e1520006 	cmp	r2, r6
    838c:	0a000014 	beq	83e4 <f_rename+0x1a4>
    8390:	e5d41000 	ldrb	r1, [r4]
    8394:	e1d321ba 	ldrh	r2, [r3, #26]
    8398:	e3510003 	cmp	r1, #3
    839c:	e5941014 	ldr	r1, [r4, #20]
    83a0:	01d331b4 	ldrheq	r3, [r3, #20]
    83a4:	01822803 	orreq	r2, r2, r3, lsl #16
    83a8:	e2423002 	sub	r3, r2, #2
    83ac:	e2412002 	sub	r2, r1, #2
    83b0:	e1530002 	cmp	r3, r2
    83b4:	2a000022 	bcs	8444 <f_rename+0x204>
    83b8:	e1d420ba 	ldrh	r2, [r4, #10]
    83bc:	e594102c 	ldr	r1, [r4, #44]	; 0x2c
    83c0:	e0311293 	mlas	r1, r3, r2, r1
    83c4:	0a00001e 	beq	8444 <f_rename+0x204>
    83c8:	e1a00004 	mov	r0, r4
    83cc:	ebfff587 	bl	59f0 <move_window>
    83d0:	e3500000 	cmp	r0, #0
    83d4:	1affffa5 	bne	8270 <f_rename+0x30>
    83d8:	e5d43061 	ldrb	r3, [r4, #97]	; 0x61
    83dc:	e353002e 	cmp	r3, #46	; 0x2e
    83e0:	0a000019 	beq	844c <f_rename+0x20c>
    83e4:	e59d6030 	ldr	r6, [sp, #48]	; 0x30
    83e8:	e59d1048 	ldr	r1, [sp, #72]	; 0x48
    83ec:	e1a00006 	mov	r0, r6
    83f0:	ebfff57e 	bl	59f0 <move_window>
    83f4:	e3500000 	cmp	r0, #0
    83f8:	1affff9c 	bne	8270 <f_rename+0x30>
    83fc:	e3e0201a 	mvn	r2, #26
    8400:	e3a03001 	mov	r3, #1
    8404:	e5c52000 	strb	r2, [r5]
    8408:	e1a00004 	mov	r0, r4
    840c:	e5c63004 	strb	r3, [r6, #4]
    8410:	ebfff52f 	bl	58d4 <sync_fs>
    8414:	eaffff95 	b	8270 <f_rename+0x30>
    8418:	e59d2064 	ldr	r2, [sp, #100]	; 0x64
    841c:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    8420:	e1520003 	cmp	r2, r3
    8424:	0a000001 	beq	8430 <f_rename+0x1f0>
    8428:	e3a00008 	mov	r0, #8
    842c:	eaffff8f 	b	8270 <f_rename+0x30>
    8430:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
    8434:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    8438:	e1520003 	cmp	r2, r3
    843c:	1afffff9 	bne	8428 <f_rename+0x1e8>
    8440:	eaffffb1 	b	830c <f_rename+0xcc>
    8444:	e3a00002 	mov	r0, #2
    8448:	eaffff88 	b	8270 <f_rename+0x30>
    844c:	e5d42000 	ldrb	r2, [r4]
    8450:	e7e73456 	ubfx	r3, r6, #8, #8
    8454:	e5c4607a 	strb	r6, [r4, #122]	; 0x7a
    8458:	e5c4307b 	strb	r3, [r4, #123]	; 0x7b
    845c:	e3520003 	cmp	r2, #3
    8460:	01a06826 	lsreq	r6, r6, #16
    8464:	01a03426 	lsreq	r3, r6, #8
    8468:	05c46074 	strbeq	r6, [r4, #116]	; 0x74
    846c:	05c43075 	strbeq	r3, [r4, #117]	; 0x75
    8470:	e3a03001 	mov	r3, #1
    8474:	e5c43004 	strb	r3, [r4, #4]
    8478:	eaffffd9 	b	83e4 <f_rename+0x1a4>

0000847c <f_mkfs>:
    847c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8480:	e24dd06c 	sub	sp, sp, #108	; 0x6c
    8484:	e58d004c 	str	r0, [sp, #76]	; 0x4c
    8488:	e28d004c 	add	r0, sp, #76	; 0x4c
    848c:	e1a05001 	mov	r5, r1
    8490:	e1a0b002 	mov	fp, r2
    8494:	e58d3000 	str	r3, [sp]
    8498:	ebfff468 	bl	5640 <get_ldnumber>
    849c:	e3500000 	cmp	r0, #0
    84a0:	b3a0000b 	movlt	r0, #11
    84a4:	ba0000b4 	blt	877c <f_mkfs+0x300>
    84a8:	e30e3964 	movw	r3, #59748	; 0xe964
    84ac:	e3403001 	movt	r3, #1
    84b0:	e7933100 	ldr	r3, [r3, r0, lsl #2]
    84b4:	e3530000 	cmp	r3, #0
    84b8:	13a02000 	movne	r2, #0
    84bc:	15c32000 	strbne	r2, [r3]
    84c0:	e6ef3070 	uxtb	r3, r0
    84c4:	e1a00003 	mov	r0, r3
    84c8:	e58d3004 	str	r3, [sp, #4]
    84cc:	eb00035a 	bl	923c <disk_initialize>
    84d0:	e3100001 	tst	r0, #1
    84d4:	13a00003 	movne	r0, #3
    84d8:	1a0000a7 	bne	877c <f_mkfs+0x300>
    84dc:	e3100004 	tst	r0, #4
    84e0:	1a0000c6 	bne	8800 <f_mkfs+0x384>
    84e4:	e3550000 	cmp	r5, #0
    84e8:	0a0000ab 	beq	879c <f_mkfs+0x320>
    84ec:	e5953004 	ldr	r3, [r5, #4]
    84f0:	e3530000 	cmp	r3, #0
    84f4:	e58d3054 	str	r3, [sp, #84]	; 0x54
    84f8:	0a0000aa 	beq	87a8 <f_mkfs+0x32c>
    84fc:	e2432001 	sub	r2, r3, #1
    8500:	e3520902 	cmp	r2, #32768	; 0x8000
    8504:	2a0000a1 	bcs	8790 <f_mkfs+0x314>
    8508:	e1120003 	tst	r2, r3
    850c:	1a00009f 	bne	8790 <f_mkfs+0x314>
    8510:	e5d57001 	ldrb	r7, [r5, #1]
    8514:	e5958008 	ldr	r8, [r5, #8]
    8518:	e2473001 	sub	r3, r7, #1
    851c:	e58d701c 	str	r7, [sp, #28]
    8520:	e3530001 	cmp	r3, #1
    8524:	e2483001 	sub	r3, r8, #1
    8528:	83a07001 	movhi	r7, #1
    852c:	858d701c 	strhi	r7, [sp, #28]
    8530:	e3530902 	cmp	r3, #32768	; 0x8000
    8534:	23a08c02 	movcs	r8, #512	; 0x200
    8538:	2a000001 	bcs	8544 <f_mkfs+0xc8>
    853c:	e318000f 	tst	r8, #15
    8540:	13a08c02 	movne	r8, #512	; 0x200
    8544:	e595600c 	ldr	r6, [r5, #12]
    8548:	e3560401 	cmp	r6, #16777216	; 0x1000000
    854c:	8a00008c 	bhi	8784 <f_mkfs+0x308>
    8550:	e2463001 	sub	r3, r6, #1
    8554:	e1130006 	tst	r3, r6
    8558:	01a044a6 	lsreq	r4, r6, #9
    855c:	1a000088 	bne	8784 <f_mkfs+0x308>
    8560:	e59d2000 	ldr	r2, [sp]
    8564:	e16f3f1b 	clz	r3, fp
    8568:	e1a032a3 	lsr	r3, r3, #5
    856c:	e3520c02 	cmp	r2, #512	; 0x200
    8570:	33833001 	orrcc	r3, r3, #1
    8574:	e3530000 	cmp	r3, #0
    8578:	e58d3028 	str	r3, [sp, #40]	; 0x28
    857c:	13a00011 	movne	r0, #17
    8580:	1a00007d 	bne	877c <f_mkfs+0x300>
    8584:	e59d0004 	ldr	r0, [sp, #4]
    8588:	e28d2058 	add	r2, sp, #88	; 0x58
    858c:	e3a01001 	mov	r1, #1
    8590:	e58d3058 	str	r3, [sp, #88]	; 0x58
    8594:	e5d55000 	ldrb	r5, [r5]
    8598:	eb00037d 	bl	9394 <disk_ioctl>
    859c:	e2503000 	subs	r3, r0, #0
    85a0:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    85a4:	1a000131 	bne	8a70 <f_mkfs+0x5f4>
    85a8:	e2153008 	ands	r3, r5, #8
    85ac:	e58d3044 	str	r3, [sp, #68]	; 0x44
    85b0:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
    85b4:	0a000081 	beq	87c0 <f_mkfs+0x344>
    85b8:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    85bc:	e58d2010 	str	r2, [sp, #16]
    85c0:	e353007f 	cmp	r3, #127	; 0x7f
    85c4:	9a00006b 	bls	8778 <f_mkfs+0x2fc>
    85c8:	e3a03c02 	mov	r3, #512	; 0x200
    85cc:	e3403001 	movt	r3, #1
    85d0:	e1560003 	cmp	r6, r3
    85d4:	23a04080 	movcs	r4, #128	; 0x80
    85d8:	e2153002 	ands	r3, r5, #2
    85dc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    85e0:	e2055001 	and	r5, r5, #1
    85e4:	1a000123 	bne	8a78 <f_mkfs+0x5fc>
    85e8:	e3550000 	cmp	r5, #0
    85ec:	0a0001cf 	beq	8d30 <f_mkfs+0x8b4>
    85f0:	eb00039c 	bl	9468 <get_fattime>
    85f4:	e59d1010 	ldr	r1, [sp, #16]
    85f8:	e7f62258 	ubfx	r2, r8, #4, #23
    85fc:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
    8600:	e1a06004 	mov	r6, r4
    8604:	e58d0048 	str	r0, [sp, #72]	; 0x48
    8608:	e2811001 	add	r1, r1, #1
    860c:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    8610:	e58d2038 	str	r2, [sp, #56]	; 0x38
    8614:	e0812002 	add	r2, r1, r2
    8618:	e58d2034 	str	r2, [sp, #52]	; 0x34
    861c:	e2432001 	sub	r2, r3, #1
    8620:	e2633000 	rsb	r3, r3, #0
    8624:	e58d1040 	str	r1, [sp, #64]	; 0x40
    8628:	e58d000c 	str	r0, [sp, #12]
    862c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    8630:	e58d3020 	str	r3, [sp, #32]
    8634:	e3560000 	cmp	r6, #0
    8638:	0a000147 	beq	8b5c <f_mkfs+0x6e0>
    863c:	e1a04006 	mov	r4, r6
    8640:	e1a01004 	mov	r1, r4
    8644:	e59d000c 	ldr	r0, [sp, #12]
    8648:	fa0021dc 	blx	10dc0 <__udivsi3>
    864c:	e3003ff5 	movw	r3, #4085	; 0xff5
    8650:	e1a01007 	mov	r1, r7
    8654:	e1500003 	cmp	r0, r3
    8658:	90805080 	addls	r5, r0, r0, lsl #1
    865c:	82805002 	addhi	r5, r0, #2
    8660:	81a05085 	lslhi	r5, r5, #1
    8664:	83a03002 	movhi	r3, #2
    8668:	92855001 	addls	r5, r5, #1
    866c:	91a050a5 	lsrls	r5, r5, #1
    8670:	93a03001 	movls	r3, #1
    8674:	e58d3008 	str	r3, [sp, #8]
    8678:	92855003 	addls	r5, r5, #3
    867c:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    8680:	e2855f7f 	add	r5, r5, #508	; 0x1fc
    8684:	e2855003 	add	r5, r5, #3
    8688:	e1a0a4a5 	lsr	sl, r5, #9
    868c:	e0253a97 	mla	r5, r7, sl, r3
    8690:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    8694:	e0852003 	add	r2, r5, r3
    8698:	e59d3020 	ldr	r3, [sp, #32]
    869c:	e0022003 	and	r2, r2, r3
    86a0:	e0422005 	sub	r2, r2, r5
    86a4:	e1a00002 	mov	r0, r2
    86a8:	e58d2014 	str	r2, [sp, #20]
    86ac:	fa00225a 	blx	1101c <__aeabi_uidivmod>
    86b0:	e59d2014 	ldr	r2, [sp, #20]
    86b4:	e3510000 	cmp	r1, #0
    86b8:	159d3010 	ldrne	r3, [sp, #16]
    86bc:	e1a01007 	mov	r1, r7
    86c0:	059d3040 	ldreq	r3, [sp, #64]	; 0x40
    86c4:	13a09002 	movne	r9, #2
    86c8:	12422001 	subne	r2, r2, #1
    86cc:	03a09001 	moveq	r9, #1
    86d0:	12833002 	addne	r3, r3, #2
    86d4:	e1a00002 	mov	r0, r2
    86d8:	158d3030 	strne	r3, [sp, #48]	; 0x30
    86dc:	058d3030 	streq	r3, [sp, #48]	; 0x30
    86e0:	fa0021b6 	blx	10dc0 <__udivsi3>
    86e4:	e080300a 	add	r3, r0, sl
    86e8:	e58d3014 	str	r3, [sp, #20]
    86ec:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    86f0:	e58d3018 	str	r3, [sp, #24]
    86f4:	e59d3010 	ldr	r3, [sp, #16]
    86f8:	e59d200c 	ldr	r2, [sp, #12]
    86fc:	e0453003 	sub	r3, r5, r3
    8700:	e0833204 	add	r3, r3, r4, lsl #4
    8704:	e1530002 	cmp	r3, r2
    8708:	8a00001a 	bhi	8778 <f_mkfs+0x2fc>
    870c:	e59d3018 	ldr	r3, [sp, #24]
    8710:	e1a01004 	mov	r1, r4
    8714:	e0890003 	add	r0, r9, r3
    8718:	e59d3014 	ldr	r3, [sp, #20]
    871c:	e0420000 	sub	r0, r2, r0
    8720:	e0600397 	mls	r0, r7, r3, r0
    8724:	fa0021a5 	blx	10dc0 <__udivsi3>
    8728:	e59d3008 	ldr	r3, [sp, #8]
    872c:	e1a05000 	mov	r5, r0
    8730:	e3530003 	cmp	r3, #3
    8734:	0a000034 	beq	880c <f_mkfs+0x390>
    8738:	e59d3008 	ldr	r3, [sp, #8]
    873c:	e3530002 	cmp	r3, #2
    8740:	1a000198 	bne	8da8 <f_mkfs+0x92c>
    8744:	e30f3ff5 	movw	r3, #65525	; 0xfff5
    8748:	e1500003 	cmp	r0, r3
    874c:	9a000022 	bls	87dc <f_mkfs+0x360>
    8750:	e3560000 	cmp	r6, #0
    8754:	1a0000fb 	bne	8b48 <f_mkfs+0x6cc>
    8758:	e1a06084 	lsl	r6, r4, #1
    875c:	e3560040 	cmp	r6, #64	; 0x40
    8760:	9affffb3 	bls	8634 <f_mkfs+0x1b8>
    8764:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
    8768:	e3530000 	cmp	r3, #0
    876c:	1a00010e 	bne	8bac <f_mkfs+0x730>
    8770:	e3560080 	cmp	r6, #128	; 0x80
    8774:	9affffb0 	bls	863c <f_mkfs+0x1c0>
    8778:	e3a0000e 	mov	r0, #14
    877c:	e28dd06c 	add	sp, sp, #108	; 0x6c
    8780:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8784:	e3a04000 	mov	r4, #0
    8788:	e1a06004 	mov	r6, r4
    878c:	eaffff73 	b	8560 <f_mkfs+0xe4>
    8790:	e3a03001 	mov	r3, #1
    8794:	e58d3054 	str	r3, [sp, #84]	; 0x54
    8798:	eaffff5c 	b	8510 <f_mkfs+0x94>
    879c:	e58d5054 	str	r5, [sp, #84]	; 0x54
    87a0:	e3025020 	movw	r5, #8224	; 0x2020
    87a4:	e3405001 	movt	r5, #1
    87a8:	e59d0004 	ldr	r0, [sp, #4]
    87ac:	e28d2054 	add	r2, sp, #84	; 0x54
    87b0:	e3a01003 	mov	r1, #3
    87b4:	eb0002f6 	bl	9394 <disk_ioctl>
    87b8:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
    87bc:	eaffff4e 	b	84fc <f_mkfs+0x80>
    87c0:	e353003f 	cmp	r3, #63	; 0x3f
    87c4:	9affffeb 	bls	8778 <f_mkfs+0x2fc>
    87c8:	e243303f 	sub	r3, r3, #63	; 0x3f
    87cc:	e3a0203f 	mov	r2, #63	; 0x3f
    87d0:	e58d3058 	str	r3, [sp, #88]	; 0x58
    87d4:	e58d2010 	str	r2, [sp, #16]
    87d8:	eaffff78 	b	85c0 <f_mkfs+0x144>
    87dc:	e3003ff5 	movw	r3, #4085	; 0xff5
    87e0:	e1500003 	cmp	r0, r3
    87e4:	8a00000b 	bhi	8818 <f_mkfs+0x39c>
    87e8:	e3560000 	cmp	r6, #0
    87ec:	1affffe1 	bne	8778 <f_mkfs+0x2fc>
    87f0:	e1a06084 	lsl	r6, r4, #1
    87f4:	e3560080 	cmp	r6, #128	; 0x80
    87f8:	9affff8d 	bls	8634 <f_mkfs+0x1b8>
    87fc:	eaffffdd 	b	8778 <f_mkfs+0x2fc>
    8800:	e3a0000a 	mov	r0, #10
    8804:	e28dd06c 	add	sp, sp, #108	; 0x6c
    8808:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    880c:	e30f3ff5 	movw	r3, #65525	; 0xfff5
    8810:	e1500003 	cmp	r0, r3
    8814:	9a0000dd 	bls	8b90 <f_mkfs+0x714>
    8818:	e3a02c02 	mov	r2, #512	; 0x200
    881c:	e3a01000 	mov	r1, #0
    8820:	e1a0000b 	mov	r0, fp
    8824:	fa0022af 	blx	112e8 <memset>
    8828:	e59d301c 	ldr	r3, [sp, #28]
    882c:	e59d200c 	ldr	r2, [sp, #12]
    8830:	e5cb900e 	strb	r9, [fp, #14]
    8834:	e7e79459 	ubfx	r9, r9, #8, #8
    8838:	e5cb3010 	strb	r3, [fp, #16]
    883c:	e59d3008 	ldr	r3, [sp, #8]
    8840:	e5dd0014 	ldrb	r0, [sp, #20]
    8844:	e5cb400d 	strb	r4, [fp, #13]
    8848:	e3530003 	cmp	r3, #3
    884c:	e30f3eeb 	movw	r3, #65259	; 0xfeeb
    8850:	e3443d90 	movt	r3, #19856	; 0x4d90
    8854:	03a08000 	moveq	r8, #0
    8858:	e58b3000 	str	r3, [fp]
    885c:	e3043453 	movw	r3, #17491	; 0x4453
    8860:	e345334f 	movt	r3, #21327	; 0x534f
    8864:	e5cb900f 	strb	r9, [fp, #15]
    8868:	e58b3004 	str	r3, [fp, #4]
    886c:	e3023e35 	movw	r3, #11829	; 0x2e35
    8870:	e1cb30b8 	strh	r3, [fp, #8]
    8874:	e3a03030 	mov	r3, #48	; 0x30
    8878:	e5cb300a 	strb	r3, [fp, #10]
    887c:	e3a03002 	mov	r3, #2
    8880:	e5cb300c 	strb	r3, [fp, #12]
    8884:	16ef3078 	uxtbne	r3, r8
    8888:	17e78458 	ubfxne	r8, r8, #8, #8
    888c:	158d302c 	strne	r3, [sp, #44]	; 0x2c
    8890:	e3520801 	cmp	r2, #65536	; 0x10000
    8894:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    8898:	e5cb8012 	strb	r8, [fp, #18]
    889c:	e5cb3011 	strb	r3, [fp, #17]
    88a0:	e6ef3072 	uxtb	r3, r2
    88a4:	259d300c 	ldrcs	r3, [sp, #12]
    88a8:	35cb3013 	strbcc	r3, [fp, #19]
    88ac:	37e73452 	ubfxcc	r3, r2, #8, #8
    88b0:	35cb3014 	strbcc	r3, [fp, #20]
    88b4:	e59d200c 	ldr	r2, [sp, #12]
    88b8:	258b3020 	strcs	r3, [fp, #32]
    88bc:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    88c0:	e083c002 	add	ip, r3, r2
    88c4:	e59d3008 	ldr	r3, [sp, #8]
    88c8:	e6ef107c 	uxtb	r1, ip
    88cc:	e7e7245c 	ubfx	r2, ip, #8, #8
    88d0:	e3530003 	cmp	r3, #3
    88d4:	e59d3010 	ldr	r3, [sp, #16]
    88d8:	e5cb301c 	strb	r3, [fp, #28]
    88dc:	e3e03007 	mvn	r3, #7
    88e0:	e5cb3015 	strb	r3, [fp, #21]
    88e4:	e3a0303f 	mov	r3, #63	; 0x3f
    88e8:	e5cb3018 	strb	r3, [fp, #24]
    88ec:	e3e03000 	mvn	r3, #0
    88f0:	e5cb301a 	strb	r3, [fp, #26]
    88f4:	e1a03c2c 	lsr	r3, ip, #24
    88f8:	e7e7c85c 	ubfx	ip, ip, #16, #8
    88fc:	0a0000b8 	beq	8be4 <f_mkfs+0x768>
    8900:	e5cb1027 	strb	r1, [fp, #39]	; 0x27
    8904:	e59d1014 	ldr	r1, [sp, #20]
    8908:	e5cb2028 	strb	r2, [fp, #40]	; 0x28
    890c:	e30220ac 	movw	r2, #8364	; 0x20ac
    8910:	e5cb302a 	strb	r3, [fp, #42]	; 0x2a
    8914:	e3402001 	movt	r2, #1
    8918:	e7e71451 	ubfx	r1, r1, #8, #8
    891c:	e5cb0016 	strb	r0, [fp, #22]
    8920:	e5cb1017 	strb	r1, [fp, #23]
    8924:	e28b302b 	add	r3, fp, #43	; 0x2b
    8928:	e3e0107f 	mvn	r1, #127	; 0x7f
    892c:	e28b003b 	add	r0, fp, #59	; 0x3b
    8930:	e5cb1024 	strb	r1, [fp, #36]	; 0x24
    8934:	e3a01029 	mov	r1, #41	; 0x29
    8938:	e5cbc029 	strb	ip, [fp, #41]	; 0x29
    893c:	e5cb1026 	strb	r1, [fp, #38]	; 0x26
    8940:	e4921004 	ldr	r1, [r2], #4
    8944:	e4831004 	str	r1, [r3], #4
    8948:	e1500003 	cmp	r0, r3
    894c:	1afffffb 	bne	8940 <f_mkfs+0x4c4>
    8950:	e59f276c 	ldr	r2, [pc, #1900]	; 90c4 <f_mkfs+0xc48>
    8954:	e28b303a 	add	r3, fp, #58	; 0x3a
    8958:	e28b003d 	add	r0, fp, #61	; 0x3d
    895c:	e4d21001 	ldrb	r1, [r2], #1
    8960:	e5e31001 	strb	r1, [r3, #1]!
    8964:	e1500003 	cmp	r0, r3
    8968:	1afffffb 	bne	895c <f_mkfs+0x4e0>
    896c:	e30a1a55 	movw	r1, #43605	; 0xaa55
    8970:	e30031fe 	movw	r3, #510	; 0x1fe
    8974:	e34f1fff 	movt	r1, #65535	; 0xffff
    8978:	e59d2010 	ldr	r2, [sp, #16]
    897c:	e18b10b3 	strh	r1, [fp, r3]
    8980:	e08b3003 	add	r3, fp, r3
    8984:	e1a0100b 	mov	r1, fp
    8988:	e58d301c 	str	r3, [sp, #28]
    898c:	e59d0004 	ldr	r0, [sp, #4]
    8990:	e3a03001 	mov	r3, #1
    8994:	eb0002b6 	bl	9474 <disk_write>
    8998:	e2501000 	subs	r1, r0, #0
    899c:	1a000033 	bne	8a70 <f_mkfs+0x5f4>
    89a0:	e59d2000 	ldr	r2, [sp]
    89a4:	e1a0000b 	mov	r0, fp
    89a8:	e7c8201f 	bfc	r2, #0, #9
    89ac:	fa00224d 	blx	112e8 <memset>
    89b0:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    89b4:	e1a0200b 	mov	r2, fp
    89b8:	e58d4010 	str	r4, [sp, #16]
    89bc:	e3a08000 	mov	r8, #0
    89c0:	e58d700c 	str	r7, [sp, #12]
    89c4:	e3e09007 	mvn	r9, #7
    89c8:	e3530000 	cmp	r3, #0
    89cc:	e59d3000 	ldr	r3, [sp]
    89d0:	e59d4030 	ldr	r4, [sp, #48]	; 0x30
    89d4:	e59d7004 	ldr	r7, [sp, #4]
    89d8:	e1a064a3 	lsr	r6, r3, #9
    89dc:	e30f3ff8 	movw	r3, #65528	; 0xfff8
    89e0:	e34030ff 	movt	r3, #255	; 0xff
    89e4:	03e03007 	mvneq	r3, #7
    89e8:	e1a0ac23 	lsr	sl, r3, #24
    89ec:	e1a03008 	mov	r3, r8
    89f0:	e1a0b00a 	mov	fp, sl
    89f4:	e1a0a002 	mov	sl, r2
    89f8:	e59d2008 	ldr	r2, [sp, #8]
    89fc:	e59d5014 	ldr	r5, [sp, #20]
    8a00:	e58d3000 	str	r3, [sp]
    8a04:	e3520003 	cmp	r2, #3
    8a08:	03e01000 	mvneq	r1, #0
    8a0c:	03e00007 	mvneq	r0, #7
    8a10:	13e02000 	mvnne	r2, #0
    8a14:	01ca00f0 	strdeq	r0, [sl]
    8a18:	03e0120f 	mvneq	r1, #-268435456	; 0xf0000000
    8a1c:	11ca90b0 	strhne	r9, [sl]
    8a20:	058a1008 	streq	r1, [sl, #8]
    8a24:	15ca2002 	strbne	r2, [sl, #2]
    8a28:	15cab003 	strbne	fp, [sl, #3]
    8a2c:	ea000005 	b	8a48 <f_mkfs+0x5cc>
    8a30:	e3a02c02 	mov	r2, #512	; 0x200
    8a34:	e1a0000a 	mov	r0, sl
    8a38:	fa00222a 	blx	112e8 <memset>
    8a3c:	e0555008 	subs	r5, r5, r8
    8a40:	e0844008 	add	r4, r4, r8
    8a44:	0a0000bb 	beq	8d38 <f_mkfs+0x8bc>
    8a48:	e1550006 	cmp	r5, r6
    8a4c:	e1a0100a 	mov	r1, sl
    8a50:	31a08005 	movcc	r8, r5
    8a54:	21a08006 	movcs	r8, r6
    8a58:	e1a02004 	mov	r2, r4
    8a5c:	e1a03008 	mov	r3, r8
    8a60:	e1a00007 	mov	r0, r7
    8a64:	eb000282 	bl	9474 <disk_write>
    8a68:	e2501000 	subs	r1, r0, #0
    8a6c:	0affffef 	beq	8a30 <f_mkfs+0x5b4>
    8a70:	e3a00001 	mov	r0, #1
    8a74:	eaffff40 	b	877c <f_mkfs+0x300>
    8a78:	eb00027a 	bl	9468 <get_fattime>
    8a7c:	e59d1010 	ldr	r1, [sp, #16]
    8a80:	e7f62258 	ubfx	r2, r8, #4, #23
    8a84:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
    8a88:	e3550000 	cmp	r5, #0
    8a8c:	e58d0048 	str	r0, [sp, #72]	; 0x48
    8a90:	11a06004 	movne	r6, r4
    8a94:	e2811001 	add	r1, r1, #1
    8a98:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    8a9c:	e58d2038 	str	r2, [sp, #56]	; 0x38
    8aa0:	e0812002 	add	r2, r1, r2
    8aa4:	e58d2034 	str	r2, [sp, #52]	; 0x34
    8aa8:	e2432001 	sub	r2, r3, #1
    8aac:	e2633000 	rsb	r3, r3, #0
    8ab0:	e58d1040 	str	r1, [sp, #64]	; 0x40
    8ab4:	e58d000c 	str	r0, [sp, #12]
    8ab8:	e58d2024 	str	r2, [sp, #36]	; 0x24
    8abc:	e58d3020 	str	r3, [sp, #32]
    8ac0:	1afffedb 	bne	8634 <f_mkfs+0x1b8>
    8ac4:	e3540000 	cmp	r4, #0
    8ac8:	11a06004 	movne	r6, r4
    8acc:	0a000036 	beq	8bac <f_mkfs+0x730>
    8ad0:	e59d000c 	ldr	r0, [sp, #12]
    8ad4:	e1a01004 	mov	r1, r4
    8ad8:	fa0020b8 	blx	10dc0 <__udivsi3>
    8adc:	e30f2fff 	movw	r2, #65535	; 0xffff
    8ae0:	e2403cff 	sub	r3, r0, #65280	; 0xff00
    8ae4:	e24330f6 	sub	r3, r3, #246	; 0xf6
    8ae8:	e3402ffe 	movt	r2, #4094	; 0xffe
    8aec:	e1530002 	cmp	r3, r2
    8af0:	e3003207 	movw	r3, #519	; 0x207
    8af4:	e0833100 	add	r3, r3, r0, lsl #2
    8af8:	e1a034a3 	lsr	r3, r3, #9
    8afc:	e58d3014 	str	r3, [sp, #20]
    8b00:	8affff1c 	bhi	8778 <f_mkfs+0x2fc>
    8b04:	e59d3010 	ldr	r3, [sp, #16]
    8b08:	e2832020 	add	r2, r3, #32
    8b0c:	e3a03000 	mov	r3, #0
    8b10:	e58d3018 	str	r3, [sp, #24]
    8b14:	e59d3014 	ldr	r3, [sp, #20]
    8b18:	e0252397 	mla	r5, r7, r3, r2
    8b1c:	e3a03003 	mov	r3, #3
    8b20:	e58d3008 	str	r3, [sp, #8]
    8b24:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    8b28:	e0859003 	add	r9, r5, r3
    8b2c:	e59d3020 	ldr	r3, [sp, #32]
    8b30:	e0099003 	and	r9, r9, r3
    8b34:	e0499005 	sub	r9, r9, r5
    8b38:	e0893002 	add	r3, r9, r2
    8b3c:	e2899020 	add	r9, r9, #32
    8b40:	e58d3030 	str	r3, [sp, #48]	; 0x30
    8b44:	eafffeea 	b	86f4 <f_mkfs+0x278>
    8b48:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
    8b4c:	e3530000 	cmp	r3, #0
    8b50:	0affff08 	beq	8778 <f_mkfs+0x2fc>
    8b54:	e1a04006 	mov	r4, r6
    8b58:	eaffffdc 	b	8ad0 <f_mkfs+0x654>
    8b5c:	e59d100c 	ldr	r1, [sp, #12]
    8b60:	e3a03001 	mov	r3, #1
    8b64:	e59f255c 	ldr	r2, [pc, #1372]	; 90c8 <f_mkfs+0xc4c>
    8b68:	e1a04003 	mov	r4, r3
    8b6c:	e1a01621 	lsr	r1, r1, #12
    8b70:	ea000003 	b	8b84 <f_mkfs+0x708>
    8b74:	e1f230b2 	ldrh	r3, [r2, #2]!
    8b78:	e1a04084 	lsl	r4, r4, #1
    8b7c:	e3530000 	cmp	r3, #0
    8b80:	0afffeae 	beq	8640 <f_mkfs+0x1c4>
    8b84:	e1530001 	cmp	r3, r1
    8b88:	9afffff9 	bls	8b74 <f_mkfs+0x6f8>
    8b8c:	eafffeab 	b	8640 <f_mkfs+0x1c4>
    8b90:	e3560000 	cmp	r6, #0
    8b94:	1afffef7 	bne	8778 <f_mkfs+0x2fc>
    8b98:	e3540001 	cmp	r4, #1
    8b9c:	81a040a4 	lsrhi	r4, r4, #1
    8ba0:	81a06004 	movhi	r6, r4
    8ba4:	8affffc9 	bhi	8ad0 <f_mkfs+0x654>
    8ba8:	eafffef2 	b	8778 <f_mkfs+0x2fc>
    8bac:	e59d200c 	ldr	r2, [sp, #12]
    8bb0:	e3a04001 	mov	r4, #1
    8bb4:	e59f3510 	ldr	r3, [pc, #1296]	; 90cc <f_mkfs+0xc50>
    8bb8:	e1a06004 	mov	r6, r4
    8bbc:	e1a028a2 	lsr	r2, r2, #17
    8bc0:	ea000003 	b	8bd4 <f_mkfs+0x758>
    8bc4:	e1f360b2 	ldrh	r6, [r3, #2]!
    8bc8:	e1a04084 	lsl	r4, r4, #1
    8bcc:	e3560000 	cmp	r6, #0
    8bd0:	0affffbe 	beq	8ad0 <f_mkfs+0x654>
    8bd4:	e1560002 	cmp	r6, r2
    8bd8:	9afffff9 	bls	8bc4 <f_mkfs+0x748>
    8bdc:	e3a06000 	mov	r6, #0
    8be0:	eaffffba 	b	8ad0 <f_mkfs+0x654>
    8be4:	e5cb1043 	strb	r1, [fp, #67]	; 0x43
    8be8:	e3a01002 	mov	r1, #2
    8bec:	e5cb3046 	strb	r3, [fp, #70]	; 0x46
    8bf0:	e28b0057 	add	r0, fp, #87	; 0x57
    8bf4:	e59d3014 	ldr	r3, [sp, #20]
    8bf8:	e5cb102c 	strb	r1, [fp, #44]	; 0x2c
    8bfc:	e3a01001 	mov	r1, #1
    8c00:	e5cb2044 	strb	r2, [fp, #68]	; 0x44
    8c04:	e3022098 	movw	r2, #8344	; 0x2098
    8c08:	e5cb1030 	strb	r1, [fp, #48]	; 0x30
    8c0c:	e3a01006 	mov	r1, #6
    8c10:	e58b3024 	str	r3, [fp, #36]	; 0x24
    8c14:	e3402001 	movt	r2, #1
    8c18:	e5cb1032 	strb	r1, [fp, #50]	; 0x32
    8c1c:	e28b3047 	add	r3, fp, #71	; 0x47
    8c20:	e3e0107f 	mvn	r1, #127	; 0x7f
    8c24:	e5cbc045 	strb	ip, [fp, #69]	; 0x45
    8c28:	e5cb1040 	strb	r1, [fp, #64]	; 0x40
    8c2c:	e3a01029 	mov	r1, #41	; 0x29
    8c30:	e5cb1042 	strb	r1, [fp, #66]	; 0x42
    8c34:	e4921004 	ldr	r1, [r2], #4
    8c38:	e4831004 	str	r1, [r3], #4
    8c3c:	e1500003 	cmp	r0, r3
    8c40:	1afffffb 	bne	8c34 <f_mkfs+0x7b8>
    8c44:	e59f2484 	ldr	r2, [pc, #1156]	; 90d0 <f_mkfs+0xc54>
    8c48:	e28b3056 	add	r3, fp, #86	; 0x56
    8c4c:	e28b0059 	add	r0, fp, #89	; 0x59
    8c50:	e4d21001 	ldrb	r1, [r2], #1
    8c54:	e5e31001 	strb	r1, [r3, #1]!
    8c58:	e1530000 	cmp	r3, r0
    8c5c:	1afffffb 	bne	8c50 <f_mkfs+0x7d4>
    8c60:	e30a6a55 	movw	r6, #43605	; 0xaa55
    8c64:	e30081fe 	movw	r8, #510	; 0x1fe
    8c68:	e34f6fff 	movt	r6, #65535	; 0xffff
    8c6c:	e08bc008 	add	ip, fp, r8
    8c70:	e59d2010 	ldr	r2, [sp, #16]
    8c74:	e3a03001 	mov	r3, #1
    8c78:	e59d0004 	ldr	r0, [sp, #4]
    8c7c:	e1a0100b 	mov	r1, fp
    8c80:	e18b60b8 	strh	r6, [fp, r8]
    8c84:	e58dc01c 	str	ip, [sp, #28]
    8c88:	eb0001f9 	bl	9474 <disk_write>
    8c8c:	e2509000 	subs	r9, r0, #0
    8c90:	1affff76 	bne	8a70 <f_mkfs+0x5f4>
    8c94:	e59da004 	ldr	sl, [sp, #4]
    8c98:	e3a03001 	mov	r3, #1
    8c9c:	e59d2010 	ldr	r2, [sp, #16]
    8ca0:	e1a0100b 	mov	r1, fp
    8ca4:	e2455001 	sub	r5, r5, #1
    8ca8:	e1a0000a 	mov	r0, sl
    8cac:	e2822006 	add	r2, r2, #6
    8cb0:	eb0001ef 	bl	9474 <disk_write>
    8cb4:	e1a01009 	mov	r1, r9
    8cb8:	e3a02c02 	mov	r2, #512	; 0x200
    8cbc:	e1a0000b 	mov	r0, fp
    8cc0:	fa002188 	blx	112e8 <memset>
    8cc4:	e3053252 	movw	r3, #21074	; 0x5252
    8cc8:	e18b60b8 	strh	r6, [fp, r8]
    8ccc:	e3443161 	movt	r3, #16737	; 0x4161
    8cd0:	e59d2010 	ldr	r2, [sp, #16]
    8cd4:	e58b3000 	str	r3, [fp]
    8cd8:	e3073272 	movw	r3, #29298	; 0x7272
    8cdc:	e3463141 	movt	r3, #24897	; 0x6141
    8ce0:	e1a0100b 	mov	r1, fp
    8ce4:	e58b31e4 	str	r3, [fp, #484]	; 0x1e4
    8ce8:	e3a03002 	mov	r3, #2
    8cec:	e5cb31ec 	strb	r3, [fp, #492]	; 0x1ec
    8cf0:	e2822007 	add	r2, r2, #7
    8cf4:	e3a03001 	mov	r3, #1
    8cf8:	e1a0000a 	mov	r0, sl
    8cfc:	e58b51e8 	str	r5, [fp, #488]	; 0x1e8
    8d00:	eb0001db 	bl	9474 <disk_write>
    8d04:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    8d08:	e1a0100b 	mov	r1, fp
    8d0c:	e3a03001 	mov	r3, #1
    8d10:	e1a0000a 	mov	r0, sl
    8d14:	eb0001d6 	bl	9474 <disk_write>
    8d18:	e59d2000 	ldr	r2, [sp]
    8d1c:	e1a01009 	mov	r1, r9
    8d20:	e1a0000b 	mov	r0, fp
    8d24:	e7c8201f 	bfc	r2, #0, #9
    8d28:	fa00216e 	blx	112e8 <memset>
    8d2c:	eaffff1f 	b	89b0 <f_mkfs+0x534>
    8d30:	e3a00013 	mov	r0, #19
    8d34:	eafffe90 	b	877c <f_mkfs+0x300>
    8d38:	e59d3000 	ldr	r3, [sp]
    8d3c:	e59d200c 	ldr	r2, [sp, #12]
    8d40:	e2833001 	add	r3, r3, #1
    8d44:	e1530002 	cmp	r3, r2
    8d48:	1affff2a 	bne	89f8 <f_mkfs+0x57c>
    8d4c:	e59d3008 	ldr	r3, [sp, #8]
    8d50:	e1a07004 	mov	r7, r4
    8d54:	e59d4010 	ldr	r4, [sp, #16]
    8d58:	e1a0b00a 	mov	fp, sl
    8d5c:	e59d5018 	ldr	r5, [sp, #24]
    8d60:	e3530003 	cmp	r3, #3
    8d64:	e59d8004 	ldr	r8, [sp, #4]
    8d68:	01a05004 	moveq	r5, r4
    8d6c:	ea000001 	b	8d78 <f_mkfs+0x8fc>
    8d70:	e0555004 	subs	r5, r5, r4
    8d74:	0a000012 	beq	8dc4 <f_mkfs+0x948>
    8d78:	e1550006 	cmp	r5, r6
    8d7c:	e1a02007 	mov	r2, r7
    8d80:	31a04005 	movcc	r4, r5
    8d84:	21a04006 	movcs	r4, r6
    8d88:	e1a03004 	mov	r3, r4
    8d8c:	e1a0100b 	mov	r1, fp
    8d90:	e1a00008 	mov	r0, r8
    8d94:	e0877004 	add	r7, r7, r4
    8d98:	eb0001b5 	bl	9474 <disk_write>
    8d9c:	e3500000 	cmp	r0, #0
    8da0:	0afffff2 	beq	8d70 <f_mkfs+0x8f4>
    8da4:	eaffff31 	b	8a70 <f_mkfs+0x5f4>
    8da8:	e3003ff5 	movw	r3, #4085	; 0xff5
    8dac:	e1500003 	cmp	r0, r3
    8db0:	93a03001 	movls	r3, #1
    8db4:	958d3028 	strls	r3, [sp, #40]	; 0x28
    8db8:	958d3008 	strls	r3, [sp, #8]
    8dbc:	8afffe6d 	bhi	8778 <f_mkfs+0x2fc>
    8dc0:	eafffe94 	b	8818 <f_mkfs+0x39c>
    8dc4:	e59d2008 	ldr	r2, [sp, #8]
    8dc8:	e58d5018 	str	r5, [sp, #24]
    8dcc:	e3520003 	cmp	r2, #3
    8dd0:	0a0000b4 	beq	90a8 <f_mkfs+0xc2c>
    8dd4:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
    8dd8:	e3530801 	cmp	r3, #65536	; 0x10000
    8ddc:	23a03006 	movcs	r3, #6
    8de0:	258d3000 	strcs	r3, [sp]
    8de4:	2a000003 	bcs	8df8 <f_mkfs+0x97c>
    8de8:	e3520002 	cmp	r2, #2
    8dec:	13a03001 	movne	r3, #1
    8df0:	03a03004 	moveq	r3, #4
    8df4:	e58d3000 	str	r3, [sp]
    8df8:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    8dfc:	e3530000 	cmp	r3, #0
    8e00:	1a0000a1 	bne	908c <f_mkfs+0xc10>
    8e04:	e58d3064 	str	r3, [sp, #100]	; 0x64
    8e08:	e28d205c 	add	r2, sp, #92	; 0x5c
    8e0c:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
    8e10:	e3a01001 	mov	r1, #1
    8e14:	e59d0004 	ldr	r0, [sp, #4]
    8e18:	e58d3060 	str	r3, [sp, #96]	; 0x60
    8e1c:	eb00015c 	bl	9394 <disk_ioctl>
    8e20:	e3500000 	cmp	r0, #0
    8e24:	1affff11 	bne	8a70 <f_mkfs+0x5f4>
    8e28:	e59d905c 	ldr	r9, [sp, #92]	; 0x5c
    8e2c:	e30e31f8 	movw	r3, #57848	; 0xe1f8
    8e30:	e3403007 	movt	r3, #7
    8e34:	e1590003 	cmp	r9, r3
    8e38:	3a00009f 	bcc	90bc <f_mkfs+0xc40>
    8e3c:	e3a03008 	mov	r3, #8
    8e40:	e3a04005 	mov	r4, #5
    8e44:	e30f5c3e 	movw	r5, #64574	; 0xfc3e
    8e48:	e1a06003 	mov	r6, r3
    8e4c:	e1a06086 	lsl	r6, r6, #1
    8e50:	e2544001 	subs	r4, r4, #1
    8e54:	e1a00009 	mov	r0, r9
    8e58:	e6ef6076 	uxtb	r6, r6
    8e5c:	0a000003 	beq	8e70 <f_mkfs+0x9f4>
    8e60:	e1a01006 	mov	r1, r6
    8e64:	fa001fd5 	blx	10dc0 <__udivsi3>
    8e68:	e1500005 	cmp	r0, r5
    8e6c:	8afffff6 	bhi	8e4c <f_mkfs+0x9d0>
    8e70:	e3560000 	cmp	r6, #0
    8e74:	e1a03006 	mov	r3, r6
    8e78:	03a030ff 	moveq	r3, #255	; 0xff
    8e7c:	e3a02c02 	mov	r2, #512	; 0x200
    8e80:	e3a01000 	mov	r1, #0
    8e84:	e1a0000b 	mov	r0, fp
    8e88:	e58d300c 	str	r3, [sp, #12]
    8e8c:	fa002115 	blx	112e8 <memset>
    8e90:	e308251f 	movw	r2, #34079	; 0x851f
    8e94:	e28b5f6f 	add	r5, fp, #444	; 0x1bc
    8e98:	e34521eb 	movt	r2, #20971	; 0x51eb
    8e9c:	e58db010 	str	fp, [sp, #16]
    8ea0:	e0812299 	umull	r2, r1, r9, r2
    8ea4:	e2855003 	add	r5, r5, #3
    8ea8:	e28d2060 	add	r2, sp, #96	; 0x60
    8eac:	e3a0403f 	mov	r4, #63	; 0x3f
    8eb0:	e1a032a1 	lsr	r3, r1, #5
    8eb4:	e58d3008 	str	r3, [sp, #8]
    8eb8:	e59d300c 	ldr	r3, [sp, #12]
    8ebc:	e1a0b003 	mov	fp, r3
    8ec0:	ea00004d 	b	8ffc <f_mkfs+0xb80>
    8ec4:	e59d3008 	ldr	r3, [sp, #8]
    8ec8:	e0010193 	mul	r1, r3, r1
    8ecc:	0a000078 	beq	90b4 <f_mkfs+0xc38>
    8ed0:	e0916004 	adds	r6, r1, r4
    8ed4:	23a00001 	movcs	r0, #1
    8ed8:	33a00000 	movcc	r0, #0
    8edc:	e1590006 	cmp	r9, r6
    8ee0:	33800001 	orrcc	r0, r0, #1
    8ee4:	e3500000 	cmp	r0, #0
    8ee8:	0a000059 	beq	9054 <f_mkfs+0xbd8>
    8eec:	e0491004 	sub	r1, r9, r4
    8ef0:	e1a06009 	mov	r6, r9
    8ef4:	e1a0c424 	lsr	ip, r4, #8
    8ef8:	e1a00824 	lsr	r0, r4, #16
    8efc:	e6ef3074 	uxtb	r3, r4
    8f00:	e58d2014 	str	r2, [sp, #20]
    8f04:	e3a07000 	mov	r7, #0
    8f08:	e7c7701c 	bfi	r7, ip, #0, #8
    8f0c:	e58d300c 	str	r3, [sp, #12]
    8f10:	e7cf7410 	bfi	r7, r0, #8, #8
    8f14:	e1a00c24 	lsr	r0, r4, #24
    8f18:	e3a08000 	mov	r8, #0
    8f1c:	e7d77810 	bfi	r7, r0, #16, #8
    8f20:	e1a00421 	lsr	r0, r1, #8
    8f24:	e7df7c11 	bfi	r7, r1, #24, #8
    8f28:	e5c5000c 	strb	r0, [r5, #12]
    8f2c:	e1a00821 	lsr	r0, r1, #16
    8f30:	e1a01c21 	lsr	r1, r1, #24
    8f34:	e2855010 	add	r5, r5, #16
    8f38:	e5450003 	strb	r0, [r5, #-3]
    8f3c:	e1a00004 	mov	r0, r4
    8f40:	e5451002 	strb	r1, [r5, #-2]
    8f44:	e3a0103f 	mov	r1, #63	; 0x3f
    8f48:	fa001f9c 	blx	10dc0 <__udivsi3>
    8f4c:	e1a0100b 	mov	r1, fp
    8f50:	fa002031 	blx	1101c <__aeabi_uidivmod>
    8f54:	e1a0a000 	mov	sl, r0
    8f58:	e7c78011 	bfi	r8, r1, #0, #8
    8f5c:	e1a00004 	mov	r0, r4
    8f60:	e3a0103f 	mov	r1, #63	; 0x3f
    8f64:	fa00202c 	blx	1101c <__aeabi_uidivmod>
    8f68:	e1a0012a 	lsr	r0, sl, #2
    8f6c:	e2811001 	add	r1, r1, #1
    8f70:	e59d2000 	ldr	r2, [sp]
    8f74:	e1a04006 	mov	r4, r6
    8f78:	e3c0003f 	bic	r0, r0, #63	; 0x3f
    8f7c:	e2466001 	sub	r6, r6, #1
    8f80:	e1811000 	orr	r1, r1, r0
    8f84:	e1a00006 	mov	r0, r6
    8f88:	e7cf8411 	bfi	r8, r1, #8, #8
    8f8c:	e3a0103f 	mov	r1, #63	; 0x3f
    8f90:	e7d7881a 	bfi	r8, sl, #16, #8
    8f94:	e7df8c12 	bfi	r8, r2, #24, #8
    8f98:	fa001f88 	blx	10dc0 <__udivsi3>
    8f9c:	e1a0100b 	mov	r1, fp
    8fa0:	fa00201d 	blx	1101c <__aeabi_uidivmod>
    8fa4:	e1a0c000 	mov	ip, r0
    8fa8:	e1a00006 	mov	r0, r6
    8fac:	e3a06000 	mov	r6, #0
    8fb0:	e5058010 	str	r8, [r5, #-16]
    8fb4:	e7c76011 	bfi	r6, r1, #0, #8
    8fb8:	e1a0800c 	mov	r8, ip
    8fbc:	e3a0103f 	mov	r1, #63	; 0x3f
    8fc0:	fa002015 	blx	1101c <__aeabi_uidivmod>
    8fc4:	e1a00128 	lsr	r0, r8, #2
    8fc8:	e59d2018 	ldr	r2, [sp, #24]
    8fcc:	e2811001 	add	r1, r1, #1
    8fd0:	e59d300c 	ldr	r3, [sp, #12]
    8fd4:	e3c0003f 	bic	r0, r0, #63	; 0x3f
    8fd8:	e5057008 	str	r7, [r5, #-8]
    8fdc:	e1811000 	orr	r1, r1, r0
    8fe0:	e2822001 	add	r2, r2, #1
    8fe4:	e7cf6411 	bfi	r6, r1, #8, #8
    8fe8:	e58d2018 	str	r2, [sp, #24]
    8fec:	e7d76818 	bfi	r6, r8, #16, #8
    8ff0:	e59d2014 	ldr	r2, [sp, #20]
    8ff4:	e7df6c13 	bfi	r6, r3, #24, #8
    8ff8:	e505600c 	str	r6, [r5, #-12]
    8ffc:	e59d1018 	ldr	r1, [sp, #24]
    9000:	e3510003 	cmp	r1, #3
    9004:	83a01000 	movhi	r1, #0
    9008:	93a01001 	movls	r1, #1
    900c:	e3540000 	cmp	r4, #0
    9010:	03a01000 	moveq	r1, #0
    9014:	e1590004 	cmp	r9, r4
    9018:	93a01000 	movls	r1, #0
    901c:	82011001 	andhi	r1, r1, #1
    9020:	e3510000 	cmp	r1, #0
    9024:	0a00000c 	beq	905c <f_mkfs+0xbe0>
    9028:	e4921004 	ldr	r1, [r2], #4
    902c:	e3510064 	cmp	r1, #100	; 0x64
    9030:	9affffa3 	bls	8ec4 <f_mkfs+0xa48>
    9034:	e0916004 	adds	r6, r1, r4
    9038:	23a00001 	movcs	r0, #1
    903c:	33a00000 	movcc	r0, #0
    9040:	e1560009 	cmp	r6, r9
    9044:	83800001 	orrhi	r0, r0, #1
    9048:	e3500000 	cmp	r0, #0
    904c:	1affffa6 	bne	8eec <f_mkfs+0xa70>
    9050:	eaffffa7 	b	8ef4 <f_mkfs+0xa78>
    9054:	e3510000 	cmp	r1, #0
    9058:	1affffa5 	bne	8ef4 <f_mkfs+0xa78>
    905c:	e59d001c 	ldr	r0, [sp, #28]
    9060:	e30a2a55 	movw	r2, #43605	; 0xaa55
    9064:	e59db010 	ldr	fp, [sp, #16]
    9068:	e34f2fff 	movt	r2, #65535	; 0xffff
    906c:	e3a03001 	mov	r3, #1
    9070:	e1c020b0 	strh	r2, [r0]
    9074:	e3a02000 	mov	r2, #0
    9078:	e59d0004 	ldr	r0, [sp, #4]
    907c:	e1a0100b 	mov	r1, fp
    9080:	eb0000fb 	bl	9474 <disk_write>
    9084:	e3500000 	cmp	r0, #0
    9088:	1afffe78 	bne	8a70 <f_mkfs+0x5f4>
    908c:	e3a02000 	mov	r2, #0
    9090:	e59d0004 	ldr	r0, [sp, #4]
    9094:	e1a01002 	mov	r1, r2
    9098:	eb0000bd 	bl	9394 <disk_ioctl>
    909c:	e2500000 	subs	r0, r0, #0
    90a0:	13a00001 	movne	r0, #1
    90a4:	eafffdb4 	b	877c <f_mkfs+0x300>
    90a8:	e3a0300c 	mov	r3, #12
    90ac:	e58d3000 	str	r3, [sp]
    90b0:	eaffff50 	b	8df8 <f_mkfs+0x97c>
    90b4:	e1a01009 	mov	r1, r9
    90b8:	eaffffdd 	b	9034 <f_mkfs+0xbb8>
    90bc:	e3a03008 	mov	r3, #8
    90c0:	eaffff6d 	b	8e7c <f_mkfs+0xa00>
    90c4:	000120bc 	.word	0x000120bc
    90c8:	00012040 	.word	0x00012040
    90cc:	00012030 	.word	0x00012030
    90d0:	000120a8 	.word	0x000120a8

000090d4 <disk_status>:
    90d4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    90d8:	e3500001 	cmp	r0, #1
    90dc:	e30462bc 	movw	r6, #17084	; 0x42bc
    90e0:	e3406001 	movt	r6, #1
    90e4:	e7d65000 	ldrb	r5, [r6, r0]
    90e8:	9a000001 	bls	90f4 <disk_status+0x20>
    90ec:	e1a00005 	mov	r0, r5
    90f0:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    90f4:	e30e8a00 	movw	r8, #59904	; 0xea00
    90f8:	e3a03d0d 	mov	r3, #832	; 0x340
    90fc:	e3408001 	movt	r8, #1
    9100:	e1a04000 	mov	r4, r0
    9104:	e0238093 	mla	r3, r3, r0, r8
    9108:	e5933004 	ldr	r3, [r3, #4]
    910c:	e3530000 	cmp	r3, #0
    9110:	1a000007 	bne	9134 <disk_status+0x60>
    9114:	e3500000 	cmp	r0, #0
    9118:	0a00002d 	beq	91d4 <disk_status+0x100>
    911c:	e3855001 	orr	r5, r5, #1
    9120:	e1a00005 	mov	r0, r5
    9124:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9128:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    912c:	e2033103 	and	r3, r3, #-1073741824	; 0xc0000000
    9130:	e5883698 	str	r3, [r8, #1688]	; 0x698
    9134:	e1a09104 	lsl	r9, r4, #2
    9138:	e0883009 	add	r3, r8, r9
    913c:	e5933680 	ldr	r3, [r3, #1664]	; 0x680
    9140:	e5d32029 	ldrb	r2, [r3, #41]	; 0x29
    9144:	e3120001 	tst	r2, #1
    9148:	1a000000 	bne	9150 <disk_status+0x7c>
    914c:	e3855001 	orr	r5, r5, #1
    9150:	e0882009 	add	r2, r8, r9
    9154:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    9158:	e5922698 	ldr	r2, [r2, #1688]	; 0x698
    915c:	e3520101 	cmp	r2, #1073741824	; 0x40000000
    9160:	0a000017 	beq	91c4 <disk_status+0xf0>
    9164:	e088a009 	add	sl, r8, r9
    9168:	e59a2688 	ldr	r2, [sl, #1672]	; 0x688
    916c:	e3520000 	cmp	r2, #0
    9170:	0a00000b 	beq	91a4 <disk_status+0xd0>
    9174:	e3130801 	tst	r3, #65536	; 0x10000
    9178:	03a07f7d 	moveq	r7, #500	; 0x1f4
    917c:	0a000002 	beq	918c <disk_status+0xb8>
    9180:	ea000007 	b	91a4 <disk_status+0xd0>
    9184:	e2577001 	subs	r7, r7, #1
    9188:	0a000029 	beq	9234 <disk_status+0x160>
    918c:	e3020710 	movw	r0, #10000	; 0x2710
    9190:	ebfff0f7 	bl	5574 <usleep>
    9194:	e59a3680 	ldr	r3, [sl, #1664]	; 0x680
    9198:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    919c:	e3130801 	tst	r3, #65536	; 0x10000
    91a0:	0afffff7 	beq	9184 <disk_status+0xb0>
    91a4:	e0889009 	add	r9, r8, r9
    91a8:	e5992690 	ldr	r2, [r9, #1680]	; 0x690
    91ac:	e3520000 	cmp	r2, #0
    91b0:	0a000003 	beq	91c4 <disk_status+0xf0>
    91b4:	e3130702 	tst	r3, #524288	; 0x80000
    91b8:	020550fd 	andeq	r5, r5, #253	; 0xfd
    91bc:	03855004 	orreq	r5, r5, #4
    91c0:	0a000000 	beq	91c8 <disk_status+0xf4>
    91c4:	e20550f9 	and	r5, r5, #249	; 0xf9
    91c8:	e1a00005 	mov	r0, r5
    91cc:	e7c65004 	strb	r5, [r6, r4]
    91d0:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    91d4:	e30f3688 	movw	r3, #63112	; 0xf688
    91d8:	e3403001 	movt	r3, #1
    91dc:	e5930004 	ldr	r0, [r3, #4]
    91e0:	eb000b67 	bl	bf84 <XSdPs_LookupConfig>
    91e4:	e3500000 	cmp	r0, #0
    91e8:	0affffcb 	beq	911c <disk_status+0x48>
    91ec:	e5903004 	ldr	r3, [r0, #4]
    91f0:	e1d32fbe 	ldrh	r2, [r3, #254]	; 0xfe
    91f4:	e5883680 	str	r3, [r8, #1664]	; 0x680
    91f8:	e6ef2072 	uxtb	r2, r2
    91fc:	e3520002 	cmp	r2, #2
    9200:	e590200c 	ldr	r2, [r0, #12]
    9204:	e5882688 	str	r2, [r8, #1672]	; 0x688
    9208:	e5902010 	ldr	r2, [r0, #16]
    920c:	e5882690 	str	r2, [r8, #1680]	; 0x690
    9210:	0affffc4 	beq	9128 <disk_status+0x54>
    9214:	e5d32029 	ldrb	r2, [r3, #41]	; 0x29
    9218:	e5884698 	str	r4, [r8, #1688]	; 0x698
    921c:	e3120001 	tst	r2, #1
    9220:	01a09004 	moveq	r9, r4
    9224:	0affffc8 	beq	914c <disk_status+0x78>
    9228:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    922c:	e1a09004 	mov	r9, r4
    9230:	eaffffcb 	b	9164 <disk_status+0x90>
    9234:	e3a05003 	mov	r5, #3
    9238:	eaffffe2 	b	91c8 <disk_status+0xf4>

0000923c <disk_initialize>:
    923c:	e92d4070 	push	{r4, r5, r6, lr}
    9240:	e1a05000 	mov	r5, r0
    9244:	ebffffa2 	bl	90d4 <disk_status>
    9248:	e3100002 	tst	r0, #2
    924c:	e1a04000 	mov	r4, r0
    9250:	1a000007 	bne	9274 <disk_initialize+0x38>
    9254:	e3100001 	tst	r0, #1
    9258:	0a000005 	beq	9274 <disk_initialize+0x38>
    925c:	e3550001 	cmp	r5, #1
    9260:	9a000005 	bls	927c <disk_initialize+0x40>
    9264:	e30432bc 	movw	r3, #17084	; 0x42bc
    9268:	e20440fe 	and	r4, r4, #254	; 0xfe
    926c:	e3403001 	movt	r3, #1
    9270:	e7c34005 	strb	r4, [r3, r5]
    9274:	e1a00004 	mov	r0, r4
    9278:	e8bd8070 	pop	{r4, r5, r6, pc}
    927c:	e30e6a00 	movw	r6, #59904	; 0xea00
    9280:	e3406001 	movt	r6, #1
    9284:	e0863105 	add	r3, r6, r5, lsl #2
    9288:	e5932688 	ldr	r2, [r3, #1672]	; 0x688
    928c:	e3520000 	cmp	r2, #0
    9290:	0a000005 	beq	92ac <disk_initialize+0x70>
    9294:	e5932680 	ldr	r2, [r3, #1664]	; 0x680
    9298:	e2822024 	add	r2, r2, #36	; 0x24
    929c:	e5923000 	ldr	r3, [r2]
    92a0:	e2033807 	and	r3, r3, #458752	; 0x70000
    92a4:	e3530807 	cmp	r3, #458752	; 0x70000
    92a8:	1afffffb 	bne	929c <disk_initialize+0x60>
    92ac:	e3550000 	cmp	r5, #0
    92b0:	1a00000c 	bne	92e8 <disk_initialize+0xac>
    92b4:	e30f3688 	movw	r3, #63112	; 0xf688
    92b8:	e3403001 	movt	r3, #1
    92bc:	e5930004 	ldr	r0, [r3, #4]
    92c0:	eb000b2f 	bl	bf84 <XSdPs_LookupConfig>
    92c4:	e2501000 	subs	r1, r0, #0
    92c8:	0a000006 	beq	92e8 <disk_initialize+0xac>
    92cc:	e30e0a00 	movw	r0, #59904	; 0xea00
    92d0:	e5912004 	ldr	r2, [r1, #4]
    92d4:	e3400001 	movt	r0, #1
    92d8:	e5865044 	str	r5, [r6, #68]	; 0x44
    92dc:	eb00099a 	bl	b94c <XSdPs_CfgInitialize>
    92e0:	e3500000 	cmp	r0, #0
    92e4:	0a000003 	beq	92f8 <disk_initialize+0xbc>
    92e8:	e3844001 	orr	r4, r4, #1
    92ec:	e6ef4074 	uxtb	r4, r4
    92f0:	e1a00004 	mov	r0, r4
    92f4:	e8bd8070 	pop	{r4, r5, r6, pc}
    92f8:	e30e0a00 	movw	r0, #59904	; 0xea00
    92fc:	e3400001 	movt	r0, #1
    9300:	eb0009e8 	bl	baa8 <XSdPs_CardInitialize>
    9304:	e3500000 	cmp	r0, #0
    9308:	0affffd5 	beq	9264 <disk_initialize+0x28>
    930c:	eafffff5 	b	92e8 <disk_initialize+0xac>

00009310 <disk_read>:
    9310:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9314:	e1a04000 	mov	r4, r0
    9318:	e1a06001 	mov	r6, r1
    931c:	e1a05002 	mov	r5, r2
    9320:	e1a07003 	mov	r7, r3
    9324:	ebffff6a 	bl	90d4 <disk_status>
    9328:	e2100001 	ands	r0, r0, #1
    932c:	1a000014 	bne	9384 <disk_read+0x74>
    9330:	e3570000 	cmp	r7, #0
    9334:	0a000014 	beq	938c <disk_read+0x7c>
    9338:	e3540001 	cmp	r4, #1
    933c:	88bd81f0 	pophi	{r4, r5, r6, r7, r8, pc}
    9340:	e30e0a00 	movw	r0, #59904	; 0xea00
    9344:	e3a03d0d 	mov	r3, #832	; 0x340
    9348:	e3400001 	movt	r0, #1
    934c:	e1a02007 	mov	r2, r7
    9350:	e0230493 	mla	r3, r3, r4, r0
    9354:	e2644000 	rsb	r4, r4, #0
    9358:	e2044d0d 	and	r4, r4, #832	; 0x340
    935c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
    9360:	e0800004 	add	r0, r0, r4
    9364:	e3530000 	cmp	r3, #0
    9368:	e1a03006 	mov	r3, r6
    936c:	01a05485 	lsleq	r5, r5, #9
    9370:	e1a01005 	mov	r1, r5
    9374:	eb000a03 	bl	bb88 <XSdPs_ReadPolled>
    9378:	e2500000 	subs	r0, r0, #0
    937c:	13a00001 	movne	r0, #1
    9380:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    9384:	e3a00003 	mov	r0, #3
    9388:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    938c:	e3a00004 	mov	r0, #4
    9390:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00009394 <disk_ioctl>:
    9394:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9398:	e1a07000 	mov	r7, r0
    939c:	e1a04001 	mov	r4, r1
    93a0:	e1a06002 	mov	r6, r2
    93a4:	ebffff4a 	bl	90d4 <disk_status>
    93a8:	e2105001 	ands	r5, r0, #1
    93ac:	13a05003 	movne	r5, #3
    93b0:	1a00000a 	bne	93e0 <disk_ioctl+0x4c>
    93b4:	e3540004 	cmp	r4, #4
    93b8:	979ff104 	ldrls	pc, [pc, r4, lsl #2]
    93bc:	ea000027 	b	9460 <disk_ioctl+0xcc>
    93c0:	000093e0 	.word	0x000093e0
    93c4:	0000942c 	.word	0x0000942c
    93c8:	000093d4 	.word	0x000093d4
    93cc:	00009450 	.word	0x00009450
    93d0:	000093e8 	.word	0x000093e8
    93d4:	e3570001 	cmp	r7, #1
    93d8:	93a03c02 	movls	r3, #512	; 0x200
    93dc:	91c630b0 	strhls	r3, [r6]
    93e0:	e1a00005 	mov	r0, r5
    93e4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    93e8:	e3570001 	cmp	r7, #1
    93ec:	8afffffb 	bhi	93e0 <disk_ioctl+0x4c>
    93f0:	e30e3a00 	movw	r3, #59904	; 0xea00
    93f4:	e3a00d0d 	mov	r0, #832	; 0x340
    93f8:	e3403001 	movt	r3, #1
    93fc:	e8960006 	ldm	r6, {r1, r2}
    9400:	e0203790 	mla	r0, r0, r7, r3
    9404:	e5900050 	ldr	r0, [r0, #80]	; 0x50
    9408:	e3500000 	cmp	r0, #0
    940c:	e2670000 	rsb	r0, r7, #0
    9410:	01a01481 	lsleq	r1, r1, #9
    9414:	01a02482 	lsleq	r2, r2, #9
    9418:	e2000d0d 	and	r0, r0, #832	; 0x340
    941c:	08860006 	stmeq	r6, {r1, r2}
    9420:	e0830000 	add	r0, r3, r0
    9424:	eb000a6b 	bl	bdd8 <XSdPs_Erase>
    9428:	eaffffec 	b	93e0 <disk_ioctl+0x4c>
    942c:	e3570001 	cmp	r7, #1
    9430:	8affffea 	bhi	93e0 <disk_ioctl+0x4c>
    9434:	e30e3a00 	movw	r3, #59904	; 0xea00
    9438:	e3a02d0d 	mov	r2, #832	; 0x340
    943c:	e3403001 	movt	r3, #1
    9440:	e0233792 	mla	r3, r2, r7, r3
    9444:	e5933084 	ldr	r3, [r3, #132]	; 0x84
    9448:	e5863000 	str	r3, [r6]
    944c:	eaffffe3 	b	93e0 <disk_ioctl+0x4c>
    9450:	e3a03080 	mov	r3, #128	; 0x80
    9454:	e1a00005 	mov	r0, r5
    9458:	e5863000 	str	r3, [r6]
    945c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    9460:	e3a05004 	mov	r5, #4
    9464:	eaffffdd 	b	93e0 <disk_ioctl+0x4c>

00009468 <get_fattime>:
    9468:	e3a00000 	mov	r0, #0
    946c:	e3430c21 	movt	r0, #15393	; 0x3c21
    9470:	e12fff1e 	bx	lr

00009474 <disk_write>:
    9474:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9478:	e1a04000 	mov	r4, r0
    947c:	e1a06001 	mov	r6, r1
    9480:	e1a05002 	mov	r5, r2
    9484:	e1a07003 	mov	r7, r3
    9488:	ebffff11 	bl	90d4 <disk_status>
    948c:	e2100001 	ands	r0, r0, #1
    9490:	1a000014 	bne	94e8 <disk_write+0x74>
    9494:	e3570000 	cmp	r7, #0
    9498:	0a000014 	beq	94f0 <disk_write+0x7c>
    949c:	e3540001 	cmp	r4, #1
    94a0:	88bd81f0 	pophi	{r4, r5, r6, r7, r8, pc}
    94a4:	e30e0a00 	movw	r0, #59904	; 0xea00
    94a8:	e3a03d0d 	mov	r3, #832	; 0x340
    94ac:	e3400001 	movt	r0, #1
    94b0:	e1a02007 	mov	r2, r7
    94b4:	e0230493 	mla	r3, r3, r4, r0
    94b8:	e2644000 	rsb	r4, r4, #0
    94bc:	e2044d0d 	and	r4, r4, #832	; 0x340
    94c0:	e5933050 	ldr	r3, [r3, #80]	; 0x50
    94c4:	e0800004 	add	r0, r0, r4
    94c8:	e3530000 	cmp	r3, #0
    94cc:	e1a03006 	mov	r3, r6
    94d0:	01a05485 	lsleq	r5, r5, #9
    94d4:	e1a01005 	mov	r1, r5
    94d8:	eb0009e1 	bl	bc64 <XSdPs_WritePolled>
    94dc:	e2500000 	subs	r0, r0, #0
    94e0:	13a00001 	movne	r0, #1
    94e4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    94e8:	e3a00003 	mov	r0, #3
    94ec:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    94f0:	e3a00004 	mov	r0, #4
    94f4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

000094f8 <XDcfg_LookupConfig>:
    94f8:	e92d4030 	push	{r4, r5, lr}
    94fc:	e30f5638 	movw	r5, #63032	; 0xf638
    9500:	e3405001 	movt	r5, #1
    9504:	e1a0e000 	mov	lr, r0
    9508:	e5950000 	ldr	r0, [r5]
    950c:	e3500000 	cmp	r0, #0
    9510:	08bd8030 	popeq	{r4, r5, pc}
    9514:	e16f4f1e 	clz	r4, lr
    9518:	e1a03005 	mov	r3, r5
    951c:	e1a042a4 	lsr	r4, r4, #5
    9520:	e3a02000 	mov	r2, #0
    9524:	ea000003 	b	9538 <XDcfg_LookupConfig+0x40>
    9528:	e5b30010 	ldr	r0, [r3, #16]!
    952c:	e2822001 	add	r2, r2, #1
    9530:	e3500000 	cmp	r0, #0
    9534:	08bd8030 	popeq	{r4, r5, pc}
    9538:	e593c004 	ldr	ip, [r3, #4]
    953c:	e15c000e 	cmp	ip, lr
    9540:	11a01004 	movne	r1, r4
    9544:	03841001 	orreq	r1, r4, #1
    9548:	e3510000 	cmp	r1, #0
    954c:	0afffff5 	beq	9528 <XDcfg_LookupConfig+0x30>
    9550:	e0850202 	add	r0, r5, r2, lsl #4
    9554:	e8bd8030 	pop	{r4, r5, pc}

00009558 <XDcfg_IntrEnable>:
    9558:	e3500000 	cmp	r0, #0
    955c:	e92d4010 	push	{r4, lr}
    9560:	0a000016 	beq	95c0 <XDcfg_IntrEnable+0x68>
    9564:	e5902010 	ldr	r2, [r0, #16]
    9568:	e3013111 	movw	r3, #4369	; 0x1111
    956c:	e3413111 	movt	r3, #4369	; 0x1111
    9570:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9574:	e3404001 	movt	r4, #1
    9578:	e1520003 	cmp	r2, r3
    957c:	e3a03000 	mov	r3, #0
    9580:	e5843000 	str	r3, [r4]
    9584:	1a000007 	bne	95a8 <XDcfg_IntrEnable+0x50>
    9588:	e5900004 	ldr	r0, [r0, #4]
    958c:	e30f38ef 	movw	r3, #63727	; 0xf8ef
    9590:	e34030f7 	movt	r3, #247	; 0xf7
    9594:	e0033001 	and	r3, r3, r1
    9598:	e5902010 	ldr	r2, [r0, #16]
    959c:	e1c23003 	bic	r3, r2, r3
    95a0:	e5803010 	str	r3, [r0, #16]
    95a4:	e8bd8010 	pop	{r4, pc}
    95a8:	e59f0030 	ldr	r0, [pc, #48]	; 95e0 <XDcfg_IntrEnable+0x88>
    95ac:	e3a01045 	mov	r1, #69	; 0x45
    95b0:	eb00152f 	bl	ea74 <Xil_Assert>
    95b4:	e3a03001 	mov	r3, #1
    95b8:	e5843000 	str	r3, [r4]
    95bc:	e8bd8010 	pop	{r4, pc}
    95c0:	e59f0018 	ldr	r0, [pc, #24]	; 95e0 <XDcfg_IntrEnable+0x88>
    95c4:	e3a01044 	mov	r1, #68	; 0x44
    95c8:	eb001529 	bl	ea74 <Xil_Assert>
    95cc:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    95d0:	e3a02001 	mov	r2, #1
    95d4:	e3403001 	movt	r3, #1
    95d8:	e5832000 	str	r2, [r3]
    95dc:	e8bd8010 	pop	{r4, pc}
    95e0:	00012128 	.word	0x00012128

000095e4 <XDcfg_IntrDisable>:
    95e4:	e3500000 	cmp	r0, #0
    95e8:	e92d4010 	push	{r4, lr}
    95ec:	0a000016 	beq	964c <XDcfg_IntrDisable+0x68>
    95f0:	e5902010 	ldr	r2, [r0, #16]
    95f4:	e3013111 	movw	r3, #4369	; 0x1111
    95f8:	e3413111 	movt	r3, #4369	; 0x1111
    95fc:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9600:	e3404001 	movt	r4, #1
    9604:	e1520003 	cmp	r2, r3
    9608:	e3a03000 	mov	r3, #0
    960c:	e5843000 	str	r3, [r4]
    9610:	1a000007 	bne	9634 <XDcfg_IntrDisable+0x50>
    9614:	e5902004 	ldr	r2, [r0, #4]
    9618:	e30f38ef 	movw	r3, #63727	; 0xf8ef
    961c:	e34030f7 	movt	r3, #247	; 0xf7
    9620:	e0033001 	and	r3, r3, r1
    9624:	e5921010 	ldr	r1, [r2, #16]
    9628:	e1833001 	orr	r3, r3, r1
    962c:	e5823010 	str	r3, [r2, #16]
    9630:	e8bd8010 	pop	{r4, pc}
    9634:	e59f0030 	ldr	r0, [pc, #48]	; 966c <XDcfg_IntrDisable+0x88>
    9638:	e3a0106b 	mov	r1, #107	; 0x6b
    963c:	eb00150c 	bl	ea74 <Xil_Assert>
    9640:	e3a03001 	mov	r3, #1
    9644:	e5843000 	str	r3, [r4]
    9648:	e8bd8010 	pop	{r4, pc}
    964c:	e59f0018 	ldr	r0, [pc, #24]	; 966c <XDcfg_IntrDisable+0x88>
    9650:	e3a0106a 	mov	r1, #106	; 0x6a
    9654:	eb001506 	bl	ea74 <Xil_Assert>
    9658:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    965c:	e3a02001 	mov	r2, #1
    9660:	e3403001 	movt	r3, #1
    9664:	e5832000 	str	r2, [r3]
    9668:	e8bd8010 	pop	{r4, pc}
    966c:	00012128 	.word	0x00012128

00009670 <XDcfg_IntrGetEnabled>:
    9670:	e3500000 	cmp	r0, #0
    9674:	e92d4010 	push	{r4, lr}
    9678:	0a000013 	beq	96cc <XDcfg_IntrGetEnabled+0x5c>
    967c:	e5901010 	ldr	r1, [r0, #16]
    9680:	e3013111 	movw	r3, #4369	; 0x1111
    9684:	e3413111 	movt	r3, #4369	; 0x1111
    9688:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    968c:	e3404001 	movt	r4, #1
    9690:	e3a02000 	mov	r2, #0
    9694:	e1510003 	cmp	r1, r3
    9698:	e5842000 	str	r2, [r4]
    969c:	1a000003 	bne	96b0 <XDcfg_IntrGetEnabled+0x40>
    96a0:	e5903004 	ldr	r3, [r0, #4]
    96a4:	e5930010 	ldr	r0, [r3, #16]
    96a8:	e1e00000 	mvn	r0, r0
    96ac:	e8bd8010 	pop	{r4, pc}
    96b0:	e59f0034 	ldr	r0, [pc, #52]	; 96ec <XDcfg_IntrGetEnabled+0x7c>
    96b4:	e3a0108b 	mov	r1, #139	; 0x8b
    96b8:	eb0014ed 	bl	ea74 <Xil_Assert>
    96bc:	e3a03001 	mov	r3, #1
    96c0:	e5843000 	str	r3, [r4]
    96c4:	e3a00000 	mov	r0, #0
    96c8:	e8bd8010 	pop	{r4, pc}
    96cc:	e59f0018 	ldr	r0, [pc, #24]	; 96ec <XDcfg_IntrGetEnabled+0x7c>
    96d0:	e3a0108a 	mov	r1, #138	; 0x8a
    96d4:	eb0014e6 	bl	ea74 <Xil_Assert>
    96d8:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    96dc:	e3a02001 	mov	r2, #1
    96e0:	e3403001 	movt	r3, #1
    96e4:	e5832000 	str	r2, [r3]
    96e8:	eafffff5 	b	96c4 <XDcfg_IntrGetEnabled+0x54>
    96ec:	00012128 	.word	0x00012128

000096f0 <XDcfg_IntrGetStatus>:
    96f0:	e3500000 	cmp	r0, #0
    96f4:	e92d4010 	push	{r4, lr}
    96f8:	0a000012 	beq	9748 <XDcfg_IntrGetStatus+0x58>
    96fc:	e5901010 	ldr	r1, [r0, #16]
    9700:	e3013111 	movw	r3, #4369	; 0x1111
    9704:	e3413111 	movt	r3, #4369	; 0x1111
    9708:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    970c:	e3404001 	movt	r4, #1
    9710:	e3a02000 	mov	r2, #0
    9714:	e1510003 	cmp	r1, r3
    9718:	e5842000 	str	r2, [r4]
    971c:	1a000002 	bne	972c <XDcfg_IntrGetStatus+0x3c>
    9720:	e5903004 	ldr	r3, [r0, #4]
    9724:	e593000c 	ldr	r0, [r3, #12]
    9728:	e8bd8010 	pop	{r4, pc}
    972c:	e59f0034 	ldr	r0, [pc, #52]	; 9768 <XDcfg_IntrGetStatus+0x78>
    9730:	e3a010a9 	mov	r1, #169	; 0xa9
    9734:	eb0014ce 	bl	ea74 <Xil_Assert>
    9738:	e3a03001 	mov	r3, #1
    973c:	e5843000 	str	r3, [r4]
    9740:	e3a00000 	mov	r0, #0
    9744:	e8bd8010 	pop	{r4, pc}
    9748:	e59f0018 	ldr	r0, [pc, #24]	; 9768 <XDcfg_IntrGetStatus+0x78>
    974c:	e3a010a8 	mov	r1, #168	; 0xa8
    9750:	eb0014c7 	bl	ea74 <Xil_Assert>
    9754:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9758:	e3a02001 	mov	r2, #1
    975c:	e3403001 	movt	r3, #1
    9760:	e5832000 	str	r2, [r3]
    9764:	eafffff5 	b	9740 <XDcfg_IntrGetStatus+0x50>
    9768:	00012128 	.word	0x00012128

0000976c <XDcfg_IntrClear>:
    976c:	e3500000 	cmp	r0, #0
    9770:	e92d4010 	push	{r4, lr}
    9774:	0a000011 	beq	97c0 <XDcfg_IntrClear+0x54>
    9778:	e5902010 	ldr	r2, [r0, #16]
    977c:	e3013111 	movw	r3, #4369	; 0x1111
    9780:	e3413111 	movt	r3, #4369	; 0x1111
    9784:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9788:	e3404001 	movt	r4, #1
    978c:	e1520003 	cmp	r2, r3
    9790:	e3a03000 	mov	r3, #0
    9794:	e5843000 	str	r3, [r4]
    9798:	1a000002 	bne	97a8 <XDcfg_IntrClear+0x3c>
    979c:	e5903004 	ldr	r3, [r0, #4]
    97a0:	e583100c 	str	r1, [r3, #12]
    97a4:	e8bd8010 	pop	{r4, pc}
    97a8:	e59f0030 	ldr	r0, [pc, #48]	; 97e0 <XDcfg_IntrClear+0x74>
    97ac:	e3a010c9 	mov	r1, #201	; 0xc9
    97b0:	eb0014af 	bl	ea74 <Xil_Assert>
    97b4:	e3a03001 	mov	r3, #1
    97b8:	e5843000 	str	r3, [r4]
    97bc:	e8bd8010 	pop	{r4, pc}
    97c0:	e59f0018 	ldr	r0, [pc, #24]	; 97e0 <XDcfg_IntrClear+0x74>
    97c4:	e3a010c8 	mov	r1, #200	; 0xc8
    97c8:	eb0014a9 	bl	ea74 <Xil_Assert>
    97cc:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    97d0:	e3a02001 	mov	r2, #1
    97d4:	e3403001 	movt	r3, #1
    97d8:	e5832000 	str	r2, [r3]
    97dc:	e8bd8010 	pop	{r4, pc}
    97e0:	00012128 	.word	0x00012128

000097e4 <XDcfg_InterruptHandler>:
    97e4:	e3500000 	cmp	r0, #0
    97e8:	e92d4010 	push	{r4, lr}
    97ec:	0a000015 	beq	9848 <XDcfg_InterruptHandler+0x64>
    97f0:	e5901010 	ldr	r1, [r0, #16]
    97f4:	e3013111 	movw	r3, #4369	; 0x1111
    97f8:	e3413111 	movt	r3, #4369	; 0x1111
    97fc:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9800:	e3404001 	movt	r4, #1
    9804:	e3a02000 	mov	r2, #0
    9808:	e1510003 	cmp	r1, r3
    980c:	e5842000 	str	r2, [r4]
    9810:	1a000006 	bne	9830 <XDcfg_InterruptHandler+0x4c>
    9814:	e5903004 	ldr	r3, [r0, #4]
    9818:	e5902018 	ldr	r2, [r0, #24]
    981c:	e8bd4010 	pop	{r4, lr}
    9820:	e593100c 	ldr	r1, [r3, #12]
    9824:	e590001c 	ldr	r0, [r0, #28]
    9828:	e583100c 	str	r1, [r3, #12]
    982c:	e12fff12 	bx	r2
    9830:	e59f0030 	ldr	r0, [pc, #48]	; 9868 <XDcfg_InterruptHandler+0x84>
    9834:	e3a010e7 	mov	r1, #231	; 0xe7
    9838:	eb00148d 	bl	ea74 <Xil_Assert>
    983c:	e3a03001 	mov	r3, #1
    9840:	e5843000 	str	r3, [r4]
    9844:	e8bd8010 	pop	{r4, pc}
    9848:	e59f0018 	ldr	r0, [pc, #24]	; 9868 <XDcfg_InterruptHandler+0x84>
    984c:	e3a010e6 	mov	r1, #230	; 0xe6
    9850:	eb001487 	bl	ea74 <Xil_Assert>
    9854:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9858:	e3a02001 	mov	r2, #1
    985c:	e3403001 	movt	r3, #1
    9860:	e5832000 	str	r2, [r3]
    9864:	e8bd8010 	pop	{r4, pc}
    9868:	00012128 	.word	0x00012128

0000986c <XDcfg_SetHandler>:
    986c:	e3500000 	cmp	r0, #0
    9870:	e92d4010 	push	{r4, lr}
    9874:	0a000013 	beq	98c8 <XDcfg_SetHandler+0x5c>
    9878:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    987c:	e3510000 	cmp	r1, #0
    9880:	e3404001 	movt	r4, #1
    9884:	e3a03000 	mov	r3, #0
    9888:	e5843000 	str	r3, [r4]
    988c:	0a000015 	beq	98e8 <XDcfg_SetHandler+0x7c>
    9890:	e590c010 	ldr	ip, [r0, #16]
    9894:	e3013111 	movw	r3, #4369	; 0x1111
    9898:	e3413111 	movt	r3, #4369	; 0x1111
    989c:	e15c0003 	cmp	ip, r3
    98a0:	1a000002 	bne	98b0 <XDcfg_SetHandler+0x44>
    98a4:	e5801018 	str	r1, [r0, #24]
    98a8:	e580201c 	str	r2, [r0, #28]
    98ac:	e8bd8010 	pop	{r4, pc}
    98b0:	e59f0048 	ldr	r0, [pc, #72]	; 9900 <XDcfg_SetHandler+0x94>
    98b4:	e3001119 	movw	r1, #281	; 0x119
    98b8:	eb00146d 	bl	ea74 <Xil_Assert>
    98bc:	e3a03001 	mov	r3, #1
    98c0:	e5843000 	str	r3, [r4]
    98c4:	e8bd8010 	pop	{r4, pc}
    98c8:	e59f0030 	ldr	r0, [pc, #48]	; 9900 <XDcfg_SetHandler+0x94>
    98cc:	e3001117 	movw	r1, #279	; 0x117
    98d0:	eb001467 	bl	ea74 <Xil_Assert>
    98d4:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    98d8:	e3a02001 	mov	r2, #1
    98dc:	e3403001 	movt	r3, #1
    98e0:	e5832000 	str	r2, [r3]
    98e4:	e8bd8010 	pop	{r4, pc}
    98e8:	e59f0010 	ldr	r0, [pc, #16]	; 9900 <XDcfg_SetHandler+0x94>
    98ec:	e3a01f46 	mov	r1, #280	; 0x118
    98f0:	eb00145f 	bl	ea74 <Xil_Assert>
    98f4:	e3a03001 	mov	r3, #1
    98f8:	e5843000 	str	r3, [r4]
    98fc:	e8bd8010 	pop	{r4, pc}
    9900:	00012128 	.word	0x00012128

00009904 <XDcfg_CfgInitialize>:
    9904:	e3500000 	cmp	r0, #0
    9908:	e92d4010 	push	{r4, lr}
    990c:	0a000016 	beq	996c <XDcfg_CfgInitialize+0x68>
    9910:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9914:	e3510000 	cmp	r1, #0
    9918:	e3404001 	movt	r4, #1
    991c:	e3a03000 	mov	r3, #0
    9920:	e5843000 	str	r3, [r4]
    9924:	0a000018 	beq	998c <XDcfg_CfgInitialize+0x88>
    9928:	e590c014 	ldr	ip, [r0, #20]
    992c:	e3021222 	movw	r1, #8738	; 0x2222
    9930:	e3421222 	movt	r1, #8738	; 0x2222
    9934:	e15c0001 	cmp	ip, r1
    9938:	0a000009 	beq	9964 <XDcfg_CfgInitialize+0x60>
    993c:	e30dcf0d 	movw	ip, #57101	; 0xdf0d
    9940:	e3011111 	movw	r1, #4369	; 0x1111
    9944:	e347c57b 	movt	ip, #30075	; 0x757b
    9948:	e3411111 	movt	r1, #4369	; 0x1111
    994c:	e5802004 	str	r2, [r0, #4]
    9950:	e5803014 	str	r3, [r0, #20]
    9954:	e582c034 	str	ip, [r2, #52]	; 0x34
    9958:	e5801010 	str	r1, [r0, #16]
    995c:	e3a00000 	mov	r0, #0
    9960:	e8bd8010 	pop	{r4, pc}
    9964:	e3a00005 	mov	r0, #5
    9968:	e8bd8010 	pop	{r4, pc}
    996c:	e59f0030 	ldr	r0, [pc, #48]	; 99a4 <XDcfg_CfgInitialize+0xa0>
    9970:	e3a01070 	mov	r1, #112	; 0x70
    9974:	eb00143e 	bl	ea74 <Xil_Assert>
    9978:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    997c:	e3a02001 	mov	r2, #1
    9980:	e3403001 	movt	r3, #1
    9984:	e5832000 	str	r2, [r3]
    9988:	eafffff3 	b	995c <XDcfg_CfgInitialize+0x58>
    998c:	e59f0010 	ldr	r0, [pc, #16]	; 99a4 <XDcfg_CfgInitialize+0xa0>
    9990:	e3a01071 	mov	r1, #113	; 0x71
    9994:	eb001436 	bl	ea74 <Xil_Assert>
    9998:	e3a03001 	mov	r3, #1
    999c:	e5843000 	str	r3, [r4]
    99a0:	eaffffed 	b	995c <XDcfg_CfgInitialize+0x58>
    99a4:	000121b8 	.word	0x000121b8

000099a8 <XDcfg_EnablePCAP>:
    99a8:	e3500000 	cmp	r0, #0
    99ac:	e92d4010 	push	{r4, lr}
    99b0:	0a000013 	beq	9a04 <XDcfg_EnablePCAP+0x5c>
    99b4:	e5901010 	ldr	r1, [r0, #16]
    99b8:	e3013111 	movw	r3, #4369	; 0x1111
    99bc:	e3413111 	movt	r3, #4369	; 0x1111
    99c0:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    99c4:	e3404001 	movt	r4, #1
    99c8:	e3a02000 	mov	r2, #0
    99cc:	e1510003 	cmp	r1, r3
    99d0:	e5842000 	str	r2, [r4]
    99d4:	1a000004 	bne	99ec <XDcfg_EnablePCAP+0x44>
    99d8:	e5902004 	ldr	r2, [r0, #4]
    99dc:	e5923000 	ldr	r3, [r2]
    99e0:	e3833301 	orr	r3, r3, #67108864	; 0x4000000
    99e4:	e5823000 	str	r3, [r2]
    99e8:	e8bd8010 	pop	{r4, pc}
    99ec:	e59f0030 	ldr	r0, [pc, #48]	; 9a24 <XDcfg_EnablePCAP+0x7c>
    99f0:	e3a010ae 	mov	r1, #174	; 0xae
    99f4:	eb00141e 	bl	ea74 <Xil_Assert>
    99f8:	e3a03001 	mov	r3, #1
    99fc:	e5843000 	str	r3, [r4]
    9a00:	e8bd8010 	pop	{r4, pc}
    9a04:	e59f0018 	ldr	r0, [pc, #24]	; 9a24 <XDcfg_EnablePCAP+0x7c>
    9a08:	e3a010ad 	mov	r1, #173	; 0xad
    9a0c:	eb001418 	bl	ea74 <Xil_Assert>
    9a10:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9a14:	e3a02001 	mov	r2, #1
    9a18:	e3403001 	movt	r3, #1
    9a1c:	e5832000 	str	r2, [r3]
    9a20:	e8bd8010 	pop	{r4, pc}
    9a24:	000121b8 	.word	0x000121b8

00009a28 <XDcfg_DisablePCAP>:
    9a28:	e3500000 	cmp	r0, #0
    9a2c:	e92d4010 	push	{r4, lr}
    9a30:	0a000013 	beq	9a84 <XDcfg_DisablePCAP+0x5c>
    9a34:	e5901010 	ldr	r1, [r0, #16]
    9a38:	e3013111 	movw	r3, #4369	; 0x1111
    9a3c:	e3413111 	movt	r3, #4369	; 0x1111
    9a40:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9a44:	e3404001 	movt	r4, #1
    9a48:	e3a02000 	mov	r2, #0
    9a4c:	e1510003 	cmp	r1, r3
    9a50:	e5842000 	str	r2, [r4]
    9a54:	1a000004 	bne	9a6c <XDcfg_DisablePCAP+0x44>
    9a58:	e5902004 	ldr	r2, [r0, #4]
    9a5c:	e5923000 	ldr	r3, [r2]
    9a60:	e3c33301 	bic	r3, r3, #67108864	; 0x4000000
    9a64:	e5823000 	str	r3, [r2]
    9a68:	e8bd8010 	pop	{r4, pc}
    9a6c:	e59f0030 	ldr	r0, [pc, #48]	; 9aa4 <XDcfg_DisablePCAP+0x7c>
    9a70:	e3a010cd 	mov	r1, #205	; 0xcd
    9a74:	eb0013fe 	bl	ea74 <Xil_Assert>
    9a78:	e3a03001 	mov	r3, #1
    9a7c:	e5843000 	str	r3, [r4]
    9a80:	e8bd8010 	pop	{r4, pc}
    9a84:	e59f0018 	ldr	r0, [pc, #24]	; 9aa4 <XDcfg_DisablePCAP+0x7c>
    9a88:	e3a010cc 	mov	r1, #204	; 0xcc
    9a8c:	eb0013f8 	bl	ea74 <Xil_Assert>
    9a90:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9a94:	e3a02001 	mov	r2, #1
    9a98:	e3403001 	movt	r3, #1
    9a9c:	e5832000 	str	r2, [r3]
    9aa0:	e8bd8010 	pop	{r4, pc}
    9aa4:	000121b8 	.word	0x000121b8

00009aa8 <XDcfg_SetControlRegister>:
    9aa8:	e3500000 	cmp	r0, #0
    9aac:	e92d4010 	push	{r4, lr}
    9ab0:	0a000013 	beq	9b04 <XDcfg_SetControlRegister+0x5c>
    9ab4:	e5902010 	ldr	r2, [r0, #16]
    9ab8:	e3013111 	movw	r3, #4369	; 0x1111
    9abc:	e3413111 	movt	r3, #4369	; 0x1111
    9ac0:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9ac4:	e3404001 	movt	r4, #1
    9ac8:	e1520003 	cmp	r2, r3
    9acc:	e3a03000 	mov	r3, #0
    9ad0:	e5843000 	str	r3, [r4]
    9ad4:	1a000004 	bne	9aec <XDcfg_SetControlRegister+0x44>
    9ad8:	e5903004 	ldr	r3, [r0, #4]
    9adc:	e5932000 	ldr	r2, [r3]
    9ae0:	e1811002 	orr	r1, r1, r2
    9ae4:	e5831000 	str	r1, [r3]
    9ae8:	e8bd8010 	pop	{r4, pc}
    9aec:	e59f0030 	ldr	r0, [pc, #48]	; 9b24 <XDcfg_SetControlRegister+0x7c>
    9af0:	e3a010ed 	mov	r1, #237	; 0xed
    9af4:	eb0013de 	bl	ea74 <Xil_Assert>
    9af8:	e3a03001 	mov	r3, #1
    9afc:	e5843000 	str	r3, [r4]
    9b00:	e8bd8010 	pop	{r4, pc}
    9b04:	e59f0018 	ldr	r0, [pc, #24]	; 9b24 <XDcfg_SetControlRegister+0x7c>
    9b08:	e3a010ec 	mov	r1, #236	; 0xec
    9b0c:	eb0013d8 	bl	ea74 <Xil_Assert>
    9b10:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9b14:	e3a02001 	mov	r2, #1
    9b18:	e3403001 	movt	r3, #1
    9b1c:	e5832000 	str	r2, [r3]
    9b20:	e8bd8010 	pop	{r4, pc}
    9b24:	000121b8 	.word	0x000121b8

00009b28 <XDcfg_ClearControlRegister>:
    9b28:	e3500000 	cmp	r0, #0
    9b2c:	e92d4010 	push	{r4, lr}
    9b30:	0a000013 	beq	9b84 <XDcfg_ClearControlRegister+0x5c>
    9b34:	e5902010 	ldr	r2, [r0, #16]
    9b38:	e3013111 	movw	r3, #4369	; 0x1111
    9b3c:	e3413111 	movt	r3, #4369	; 0x1111
    9b40:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9b44:	e3404001 	movt	r4, #1
    9b48:	e1520003 	cmp	r2, r3
    9b4c:	e3a03000 	mov	r3, #0
    9b50:	e5843000 	str	r3, [r4]
    9b54:	1a000004 	bne	9b6c <XDcfg_ClearControlRegister+0x44>
    9b58:	e5902004 	ldr	r2, [r0, #4]
    9b5c:	e5923000 	ldr	r3, [r2]
    9b60:	e1c33001 	bic	r3, r3, r1
    9b64:	e5823000 	str	r3, [r2]
    9b68:	e8bd8010 	pop	{r4, pc}
    9b6c:	e59f0030 	ldr	r0, [pc, #48]	; 9ba4 <XDcfg_ClearControlRegister+0x7c>
    9b70:	e3a01f43 	mov	r1, #268	; 0x10c
    9b74:	eb0013be 	bl	ea74 <Xil_Assert>
    9b78:	e3a03001 	mov	r3, #1
    9b7c:	e5843000 	str	r3, [r4]
    9b80:	e8bd8010 	pop	{r4, pc}
    9b84:	e59f0018 	ldr	r0, [pc, #24]	; 9ba4 <XDcfg_ClearControlRegister+0x7c>
    9b88:	e300110b 	movw	r1, #267	; 0x10b
    9b8c:	eb0013b8 	bl	ea74 <Xil_Assert>
    9b90:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9b94:	e3a02001 	mov	r2, #1
    9b98:	e3403001 	movt	r3, #1
    9b9c:	e5832000 	str	r2, [r3]
    9ba0:	e8bd8010 	pop	{r4, pc}
    9ba4:	000121b8 	.word	0x000121b8

00009ba8 <XDcfg_GetControlRegister>:
    9ba8:	e3500000 	cmp	r0, #0
    9bac:	e92d4010 	push	{r4, lr}
    9bb0:	0a000012 	beq	9c00 <XDcfg_GetControlRegister+0x58>
    9bb4:	e5901010 	ldr	r1, [r0, #16]
    9bb8:	e3013111 	movw	r3, #4369	; 0x1111
    9bbc:	e3413111 	movt	r3, #4369	; 0x1111
    9bc0:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9bc4:	e3404001 	movt	r4, #1
    9bc8:	e3a02000 	mov	r2, #0
    9bcc:	e1510003 	cmp	r1, r3
    9bd0:	e5842000 	str	r2, [r4]
    9bd4:	1a000002 	bne	9be4 <XDcfg_GetControlRegister+0x3c>
    9bd8:	e5903004 	ldr	r3, [r0, #4]
    9bdc:	e5930000 	ldr	r0, [r3]
    9be0:	e8bd8010 	pop	{r4, pc}
    9be4:	e59f0034 	ldr	r0, [pc, #52]	; 9c20 <XDcfg_GetControlRegister+0x78>
    9be8:	e3a01f4b 	mov	r1, #300	; 0x12c
    9bec:	eb0013a0 	bl	ea74 <Xil_Assert>
    9bf0:	e3a03001 	mov	r3, #1
    9bf4:	e5843000 	str	r3, [r4]
    9bf8:	e3a00000 	mov	r0, #0
    9bfc:	e8bd8010 	pop	{r4, pc}
    9c00:	e59f0018 	ldr	r0, [pc, #24]	; 9c20 <XDcfg_GetControlRegister+0x78>
    9c04:	e300112b 	movw	r1, #299	; 0x12b
    9c08:	eb001399 	bl	ea74 <Xil_Assert>
    9c0c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9c10:	e3a02001 	mov	r2, #1
    9c14:	e3403001 	movt	r3, #1
    9c18:	e5832000 	str	r2, [r3]
    9c1c:	eafffff5 	b	9bf8 <XDcfg_GetControlRegister+0x50>
    9c20:	000121b8 	.word	0x000121b8

00009c24 <XDcfg_SetLockRegister>:
    9c24:	e3500000 	cmp	r0, #0
    9c28:	e92d4010 	push	{r4, lr}
    9c2c:	0a000011 	beq	9c78 <XDcfg_SetLockRegister+0x54>
    9c30:	e5902010 	ldr	r2, [r0, #16]
    9c34:	e3013111 	movw	r3, #4369	; 0x1111
    9c38:	e3413111 	movt	r3, #4369	; 0x1111
    9c3c:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9c40:	e3404001 	movt	r4, #1
    9c44:	e1520003 	cmp	r2, r3
    9c48:	e3a03000 	mov	r3, #0
    9c4c:	e5843000 	str	r3, [r4]
    9c50:	1a000002 	bne	9c60 <XDcfg_SetLockRegister+0x3c>
    9c54:	e5903004 	ldr	r3, [r0, #4]
    9c58:	e5831004 	str	r1, [r3, #4]
    9c5c:	e8bd8010 	pop	{r4, pc}
    9c60:	e59f0030 	ldr	r0, [pc, #48]	; 9c98 <XDcfg_SetLockRegister+0x74>
    9c64:	e3a01f52 	mov	r1, #328	; 0x148
    9c68:	eb001381 	bl	ea74 <Xil_Assert>
    9c6c:	e3a03001 	mov	r3, #1
    9c70:	e5843000 	str	r3, [r4]
    9c74:	e8bd8010 	pop	{r4, pc}
    9c78:	e59f0018 	ldr	r0, [pc, #24]	; 9c98 <XDcfg_SetLockRegister+0x74>
    9c7c:	e3001147 	movw	r1, #327	; 0x147
    9c80:	eb00137b 	bl	ea74 <Xil_Assert>
    9c84:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9c88:	e3a02001 	mov	r2, #1
    9c8c:	e3403001 	movt	r3, #1
    9c90:	e5832000 	str	r2, [r3]
    9c94:	e8bd8010 	pop	{r4, pc}
    9c98:	000121b8 	.word	0x000121b8

00009c9c <XDcfg_GetLockRegister>:
    9c9c:	e3500000 	cmp	r0, #0
    9ca0:	e92d4010 	push	{r4, lr}
    9ca4:	0a000012 	beq	9cf4 <XDcfg_GetLockRegister+0x58>
    9ca8:	e5901010 	ldr	r1, [r0, #16]
    9cac:	e3013111 	movw	r3, #4369	; 0x1111
    9cb0:	e3413111 	movt	r3, #4369	; 0x1111
    9cb4:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9cb8:	e3404001 	movt	r4, #1
    9cbc:	e3a02000 	mov	r2, #0
    9cc0:	e1510003 	cmp	r1, r3
    9cc4:	e5842000 	str	r2, [r4]
    9cc8:	1a000002 	bne	9cd8 <XDcfg_GetLockRegister+0x3c>
    9ccc:	e5903004 	ldr	r3, [r0, #4]
    9cd0:	e5930004 	ldr	r0, [r3, #4]
    9cd4:	e8bd8010 	pop	{r4, pc}
    9cd8:	e59f0034 	ldr	r0, [pc, #52]	; 9d14 <XDcfg_GetLockRegister+0x78>
    9cdc:	e3001163 	movw	r1, #355	; 0x163
    9ce0:	eb001363 	bl	ea74 <Xil_Assert>
    9ce4:	e3a03001 	mov	r3, #1
    9ce8:	e5843000 	str	r3, [r4]
    9cec:	e3a00000 	mov	r0, #0
    9cf0:	e8bd8010 	pop	{r4, pc}
    9cf4:	e59f0018 	ldr	r0, [pc, #24]	; 9d14 <XDcfg_GetLockRegister+0x78>
    9cf8:	e3001162 	movw	r1, #354	; 0x162
    9cfc:	eb00135c 	bl	ea74 <Xil_Assert>
    9d00:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9d04:	e3a02001 	mov	r2, #1
    9d08:	e3403001 	movt	r3, #1
    9d0c:	e5832000 	str	r2, [r3]
    9d10:	eafffff5 	b	9cec <XDcfg_GetLockRegister+0x50>
    9d14:	000121b8 	.word	0x000121b8

00009d18 <XDcfg_SetConfigRegister>:
    9d18:	e3500000 	cmp	r0, #0
    9d1c:	e92d4010 	push	{r4, lr}
    9d20:	0a000011 	beq	9d6c <XDcfg_SetConfigRegister+0x54>
    9d24:	e5902010 	ldr	r2, [r0, #16]
    9d28:	e3013111 	movw	r3, #4369	; 0x1111
    9d2c:	e3413111 	movt	r3, #4369	; 0x1111
    9d30:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9d34:	e3404001 	movt	r4, #1
    9d38:	e1520003 	cmp	r2, r3
    9d3c:	e3a03000 	mov	r3, #0
    9d40:	e5843000 	str	r3, [r4]
    9d44:	1a000002 	bne	9d54 <XDcfg_SetConfigRegister+0x3c>
    9d48:	e5903004 	ldr	r3, [r0, #4]
    9d4c:	e5831008 	str	r1, [r3, #8]
    9d50:	e8bd8010 	pop	{r4, pc}
    9d54:	e59f0030 	ldr	r0, [pc, #48]	; 9d8c <XDcfg_SetConfigRegister+0x74>
    9d58:	e300117f 	movw	r1, #383	; 0x17f
    9d5c:	eb001344 	bl	ea74 <Xil_Assert>
    9d60:	e3a03001 	mov	r3, #1
    9d64:	e5843000 	str	r3, [r4]
    9d68:	e8bd8010 	pop	{r4, pc}
    9d6c:	e59f0018 	ldr	r0, [pc, #24]	; 9d8c <XDcfg_SetConfigRegister+0x74>
    9d70:	e300117e 	movw	r1, #382	; 0x17e
    9d74:	eb00133e 	bl	ea74 <Xil_Assert>
    9d78:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9d7c:	e3a02001 	mov	r2, #1
    9d80:	e3403001 	movt	r3, #1
    9d84:	e5832000 	str	r2, [r3]
    9d88:	e8bd8010 	pop	{r4, pc}
    9d8c:	000121b8 	.word	0x000121b8

00009d90 <XDcfg_GetConfigRegister>:
    9d90:	e3500000 	cmp	r0, #0
    9d94:	e92d4010 	push	{r4, lr}
    9d98:	0a000012 	beq	9de8 <XDcfg_GetConfigRegister+0x58>
    9d9c:	e5901010 	ldr	r1, [r0, #16]
    9da0:	e3013111 	movw	r3, #4369	; 0x1111
    9da4:	e3413111 	movt	r3, #4369	; 0x1111
    9da8:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9dac:	e3404001 	movt	r4, #1
    9db0:	e3a02000 	mov	r2, #0
    9db4:	e1510003 	cmp	r1, r3
    9db8:	e5842000 	str	r2, [r4]
    9dbc:	1a000002 	bne	9dcc <XDcfg_GetConfigRegister+0x3c>
    9dc0:	e5903004 	ldr	r3, [r0, #4]
    9dc4:	e5930008 	ldr	r0, [r3, #8]
    9dc8:	e8bd8010 	pop	{r4, pc}
    9dcc:	e59f0034 	ldr	r0, [pc, #52]	; 9e08 <XDcfg_GetConfigRegister+0x78>
    9dd0:	e300119b 	movw	r1, #411	; 0x19b
    9dd4:	eb001326 	bl	ea74 <Xil_Assert>
    9dd8:	e3a03001 	mov	r3, #1
    9ddc:	e5843000 	str	r3, [r4]
    9de0:	e3a00000 	mov	r0, #0
    9de4:	e8bd8010 	pop	{r4, pc}
    9de8:	e59f0018 	ldr	r0, [pc, #24]	; 9e08 <XDcfg_GetConfigRegister+0x78>
    9dec:	e300119a 	movw	r1, #410	; 0x19a
    9df0:	eb00131f 	bl	ea74 <Xil_Assert>
    9df4:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9df8:	e3a02001 	mov	r2, #1
    9dfc:	e3403001 	movt	r3, #1
    9e00:	e5832000 	str	r2, [r3]
    9e04:	eafffff5 	b	9de0 <XDcfg_GetConfigRegister+0x50>
    9e08:	000121b8 	.word	0x000121b8

00009e0c <XDcfg_SetStatusRegister>:
    9e0c:	e3500000 	cmp	r0, #0
    9e10:	e92d4010 	push	{r4, lr}
    9e14:	0a000011 	beq	9e60 <XDcfg_SetStatusRegister+0x54>
    9e18:	e5902010 	ldr	r2, [r0, #16]
    9e1c:	e3013111 	movw	r3, #4369	; 0x1111
    9e20:	e3413111 	movt	r3, #4369	; 0x1111
    9e24:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9e28:	e3404001 	movt	r4, #1
    9e2c:	e1520003 	cmp	r2, r3
    9e30:	e3a03000 	mov	r3, #0
    9e34:	e5843000 	str	r3, [r4]
    9e38:	1a000002 	bne	9e48 <XDcfg_SetStatusRegister+0x3c>
    9e3c:	e5903004 	ldr	r3, [r0, #4]
    9e40:	e5831014 	str	r1, [r3, #20]
    9e44:	e8bd8010 	pop	{r4, pc}
    9e48:	e59f0030 	ldr	r0, [pc, #48]	; 9e80 <XDcfg_SetStatusRegister+0x74>
    9e4c:	e3a01f6d 	mov	r1, #436	; 0x1b4
    9e50:	eb001307 	bl	ea74 <Xil_Assert>
    9e54:	e3a03001 	mov	r3, #1
    9e58:	e5843000 	str	r3, [r4]
    9e5c:	e8bd8010 	pop	{r4, pc}
    9e60:	e59f0018 	ldr	r0, [pc, #24]	; 9e80 <XDcfg_SetStatusRegister+0x74>
    9e64:	e30011b3 	movw	r1, #435	; 0x1b3
    9e68:	eb001301 	bl	ea74 <Xil_Assert>
    9e6c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9e70:	e3a02001 	mov	r2, #1
    9e74:	e3403001 	movt	r3, #1
    9e78:	e5832000 	str	r2, [r3]
    9e7c:	e8bd8010 	pop	{r4, pc}
    9e80:	000121b8 	.word	0x000121b8

00009e84 <XDcfg_GetStatusRegister>:
    9e84:	e3500000 	cmp	r0, #0
    9e88:	e92d4010 	push	{r4, lr}
    9e8c:	0a000012 	beq	9edc <XDcfg_GetStatusRegister+0x58>
    9e90:	e5901010 	ldr	r1, [r0, #16]
    9e94:	e3013111 	movw	r3, #4369	; 0x1111
    9e98:	e3413111 	movt	r3, #4369	; 0x1111
    9e9c:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9ea0:	e3404001 	movt	r4, #1
    9ea4:	e3a02000 	mov	r2, #0
    9ea8:	e1510003 	cmp	r1, r3
    9eac:	e5842000 	str	r2, [r4]
    9eb0:	1a000002 	bne	9ec0 <XDcfg_GetStatusRegister+0x3c>
    9eb4:	e5903004 	ldr	r3, [r0, #4]
    9eb8:	e5930014 	ldr	r0, [r3, #20]
    9ebc:	e8bd8010 	pop	{r4, pc}
    9ec0:	e59f0034 	ldr	r0, [pc, #52]	; 9efc <XDcfg_GetStatusRegister+0x78>
    9ec4:	e30011cf 	movw	r1, #463	; 0x1cf
    9ec8:	eb0012e9 	bl	ea74 <Xil_Assert>
    9ecc:	e3a03001 	mov	r3, #1
    9ed0:	e5843000 	str	r3, [r4]
    9ed4:	e3a00000 	mov	r0, #0
    9ed8:	e8bd8010 	pop	{r4, pc}
    9edc:	e59f0018 	ldr	r0, [pc, #24]	; 9efc <XDcfg_GetStatusRegister+0x78>
    9ee0:	e30011ce 	movw	r1, #462	; 0x1ce
    9ee4:	eb0012e2 	bl	ea74 <Xil_Assert>
    9ee8:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9eec:	e3a02001 	mov	r2, #1
    9ef0:	e3403001 	movt	r3, #1
    9ef4:	e5832000 	str	r2, [r3]
    9ef8:	eafffff5 	b	9ed4 <XDcfg_GetStatusRegister+0x50>
    9efc:	000121b8 	.word	0x000121b8

00009f00 <XDcfg_SetRomShadowRegister>:
    9f00:	e3500000 	cmp	r0, #0
    9f04:	e92d4010 	push	{r4, lr}
    9f08:	0a000011 	beq	9f54 <XDcfg_SetRomShadowRegister+0x54>
    9f0c:	e5902010 	ldr	r2, [r0, #16]
    9f10:	e3013111 	movw	r3, #4369	; 0x1111
    9f14:	e3413111 	movt	r3, #4369	; 0x1111
    9f18:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9f1c:	e3404001 	movt	r4, #1
    9f20:	e1520003 	cmp	r2, r3
    9f24:	e3a03000 	mov	r3, #0
    9f28:	e5843000 	str	r3, [r4]
    9f2c:	1a000002 	bne	9f3c <XDcfg_SetRomShadowRegister+0x3c>
    9f30:	e5903004 	ldr	r3, [r0, #4]
    9f34:	e5831028 	str	r1, [r3, #40]	; 0x28
    9f38:	e8bd8010 	pop	{r4, pc}
    9f3c:	e59f0030 	ldr	r0, [pc, #48]	; 9f74 <XDcfg_SetRomShadowRegister+0x74>
    9f40:	e30011eb 	movw	r1, #491	; 0x1eb
    9f44:	eb0012ca 	bl	ea74 <Xil_Assert>
    9f48:	e3a03001 	mov	r3, #1
    9f4c:	e5843000 	str	r3, [r4]
    9f50:	e8bd8010 	pop	{r4, pc}
    9f54:	e59f0018 	ldr	r0, [pc, #24]	; 9f74 <XDcfg_SetRomShadowRegister+0x74>
    9f58:	e30011ea 	movw	r1, #490	; 0x1ea
    9f5c:	eb0012c4 	bl	ea74 <Xil_Assert>
    9f60:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9f64:	e3a02001 	mov	r2, #1
    9f68:	e3403001 	movt	r3, #1
    9f6c:	e5832000 	str	r2, [r3]
    9f70:	e8bd8010 	pop	{r4, pc}
    9f74:	000121b8 	.word	0x000121b8

00009f78 <XDcfg_GetSoftwareIdRegister>:
    9f78:	e3500000 	cmp	r0, #0
    9f7c:	e92d4010 	push	{r4, lr}
    9f80:	0a000012 	beq	9fd0 <XDcfg_GetSoftwareIdRegister+0x58>
    9f84:	e5901010 	ldr	r1, [r0, #16]
    9f88:	e3013111 	movw	r3, #4369	; 0x1111
    9f8c:	e3413111 	movt	r3, #4369	; 0x1111
    9f90:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    9f94:	e3404001 	movt	r4, #1
    9f98:	e3a02000 	mov	r2, #0
    9f9c:	e1510003 	cmp	r1, r3
    9fa0:	e5842000 	str	r2, [r4]
    9fa4:	1a000002 	bne	9fb4 <XDcfg_GetSoftwareIdRegister+0x3c>
    9fa8:	e5903004 	ldr	r3, [r0, #4]
    9fac:	e5930030 	ldr	r0, [r3, #48]	; 0x30
    9fb0:	e8bd8010 	pop	{r4, pc}
    9fb4:	e59f0034 	ldr	r0, [pc, #52]	; 9ff0 <XDcfg_GetSoftwareIdRegister+0x78>
    9fb8:	e3001205 	movw	r1, #517	; 0x205
    9fbc:	eb0012ac 	bl	ea74 <Xil_Assert>
    9fc0:	e3a03001 	mov	r3, #1
    9fc4:	e5843000 	str	r3, [r4]
    9fc8:	e3a00000 	mov	r0, #0
    9fcc:	e8bd8010 	pop	{r4, pc}
    9fd0:	e59f0018 	ldr	r0, [pc, #24]	; 9ff0 <XDcfg_GetSoftwareIdRegister+0x78>
    9fd4:	e3a01f81 	mov	r1, #516	; 0x204
    9fd8:	eb0012a5 	bl	ea74 <Xil_Assert>
    9fdc:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    9fe0:	e3a02001 	mov	r2, #1
    9fe4:	e3403001 	movt	r3, #1
    9fe8:	e5832000 	str	r2, [r3]
    9fec:	eafffff5 	b	9fc8 <XDcfg_GetSoftwareIdRegister+0x50>
    9ff0:	000121b8 	.word	0x000121b8

00009ff4 <XDcfg_SetMiscControlRegister>:
    9ff4:	e3500000 	cmp	r0, #0
    9ff8:	e92d4010 	push	{r4, lr}
    9ffc:	0a000013 	beq	a050 <XDcfg_SetMiscControlRegister+0x5c>
    a000:	e5902010 	ldr	r2, [r0, #16]
    a004:	e3013111 	movw	r3, #4369	; 0x1111
    a008:	e3413111 	movt	r3, #4369	; 0x1111
    a00c:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a010:	e3404001 	movt	r4, #1
    a014:	e1520003 	cmp	r2, r3
    a018:	e3a03000 	mov	r3, #0
    a01c:	e5843000 	str	r3, [r4]
    a020:	1a000004 	bne	a038 <XDcfg_SetMiscControlRegister+0x44>
    a024:	e5903004 	ldr	r3, [r0, #4]
    a028:	e5932080 	ldr	r2, [r3, #128]	; 0x80
    a02c:	e1811002 	orr	r1, r1, r2
    a030:	e5831080 	str	r1, [r3, #128]	; 0x80
    a034:	e8bd8010 	pop	{r4, pc}
    a038:	e59f0030 	ldr	r0, [pc, #48]	; a070 <XDcfg_SetMiscControlRegister+0x7c>
    a03c:	e3001223 	movw	r1, #547	; 0x223
    a040:	eb00128b 	bl	ea74 <Xil_Assert>
    a044:	e3a03001 	mov	r3, #1
    a048:	e5843000 	str	r3, [r4]
    a04c:	e8bd8010 	pop	{r4, pc}
    a050:	e59f0018 	ldr	r0, [pc, #24]	; a070 <XDcfg_SetMiscControlRegister+0x7c>
    a054:	e3001222 	movw	r1, #546	; 0x222
    a058:	eb001285 	bl	ea74 <Xil_Assert>
    a05c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a060:	e3a02001 	mov	r2, #1
    a064:	e3403001 	movt	r3, #1
    a068:	e5832000 	str	r2, [r3]
    a06c:	e8bd8010 	pop	{r4, pc}
    a070:	000121b8 	.word	0x000121b8

0000a074 <XDcfg_GetMiscControlRegister>:
    a074:	e3500000 	cmp	r0, #0
    a078:	e92d4010 	push	{r4, lr}
    a07c:	0a000012 	beq	a0cc <XDcfg_GetMiscControlRegister+0x58>
    a080:	e5901010 	ldr	r1, [r0, #16]
    a084:	e3013111 	movw	r3, #4369	; 0x1111
    a088:	e3413111 	movt	r3, #4369	; 0x1111
    a08c:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a090:	e3404001 	movt	r4, #1
    a094:	e3a02000 	mov	r2, #0
    a098:	e1510003 	cmp	r1, r3
    a09c:	e5842000 	str	r2, [r4]
    a0a0:	1a000002 	bne	a0b0 <XDcfg_GetMiscControlRegister+0x3c>
    a0a4:	e5903004 	ldr	r3, [r0, #4]
    a0a8:	e5930080 	ldr	r0, [r3, #128]	; 0x80
    a0ac:	e8bd8010 	pop	{r4, pc}
    a0b0:	e59f0034 	ldr	r0, [pc, #52]	; a0ec <XDcfg_GetMiscControlRegister+0x78>
    a0b4:	e3a01d09 	mov	r1, #576	; 0x240
    a0b8:	eb00126d 	bl	ea74 <Xil_Assert>
    a0bc:	e3a03001 	mov	r3, #1
    a0c0:	e5843000 	str	r3, [r4]
    a0c4:	e3a00000 	mov	r0, #0
    a0c8:	e8bd8010 	pop	{r4, pc}
    a0cc:	e59f0018 	ldr	r0, [pc, #24]	; a0ec <XDcfg_GetMiscControlRegister+0x78>
    a0d0:	e300123f 	movw	r1, #575	; 0x23f
    a0d4:	eb001266 	bl	ea74 <Xil_Assert>
    a0d8:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a0dc:	e3a02001 	mov	r2, #1
    a0e0:	e3403001 	movt	r3, #1
    a0e4:	e5832000 	str	r2, [r3]
    a0e8:	eafffff5 	b	a0c4 <XDcfg_GetMiscControlRegister+0x50>
    a0ec:	000121b8 	.word	0x000121b8

0000a0f0 <XDcfg_IsDmaBusy>:
    a0f0:	e3500000 	cmp	r0, #0
    a0f4:	e92d4010 	push	{r4, lr}
    a0f8:	0a000014 	beq	a150 <XDcfg_IsDmaBusy+0x60>
    a0fc:	e5901010 	ldr	r1, [r0, #16]
    a100:	e3013111 	movw	r3, #4369	; 0x1111
    a104:	e3413111 	movt	r3, #4369	; 0x1111
    a108:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a10c:	e3404001 	movt	r4, #1
    a110:	e3a02000 	mov	r2, #0
    a114:	e1510003 	cmp	r1, r3
    a118:	e5842000 	str	r2, [r4]
    a11c:	1a000004 	bne	a134 <XDcfg_IsDmaBusy+0x44>
    a120:	e5903004 	ldr	r3, [r0, #4]
    a124:	e5930014 	ldr	r0, [r3, #20]
    a128:	e1e00000 	mvn	r0, r0
    a12c:	e1a00fa0 	lsr	r0, r0, #31
    a130:	e8bd8010 	pop	{r4, pc}
    a134:	e59f0034 	ldr	r0, [pc, #52]	; a170 <XDcfg_IsDmaBusy+0x80>
    a138:	e300125b 	movw	r1, #603	; 0x25b
    a13c:	eb00124c 	bl	ea74 <Xil_Assert>
    a140:	e3a03001 	mov	r3, #1
    a144:	e5843000 	str	r3, [r4]
    a148:	e3a00000 	mov	r0, #0
    a14c:	e8bd8010 	pop	{r4, pc}
    a150:	e59f0018 	ldr	r0, [pc, #24]	; a170 <XDcfg_IsDmaBusy+0x80>
    a154:	e300125a 	movw	r1, #602	; 0x25a
    a158:	eb001245 	bl	ea74 <Xil_Assert>
    a15c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a160:	e3a02001 	mov	r2, #1
    a164:	e3403001 	movt	r3, #1
    a168:	e5832000 	str	r2, [r3]
    a16c:	eafffff5 	b	a148 <XDcfg_IsDmaBusy+0x58>
    a170:	000121b8 	.word	0x000121b8

0000a174 <XDcfg_InitiateDma>:
    a174:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    a178:	e590e004 	ldr	lr, [r0, #4]
    a17c:	e59dc004 	ldr	ip, [sp, #4]
    a180:	e58e1018 	str	r1, [lr, #24]
    a184:	e5901004 	ldr	r1, [r0, #4]
    a188:	e581201c 	str	r2, [r1, #28]
    a18c:	e5902004 	ldr	r2, [r0, #4]
    a190:	e5823020 	str	r3, [r2, #32]
    a194:	e5903004 	ldr	r3, [r0, #4]
    a198:	e583c024 	str	ip, [r3, #36]	; 0x24
    a19c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

0000a1a0 <XDcfg_Transfer>:
    a1a0:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    a1a4:	e2504000 	subs	r4, r0, #0
    a1a8:	0a000052 	beq	a2f8 <XDcfg_Transfer+0x158>
    a1ac:	e5949010 	ldr	r9, [r4, #16]
    a1b0:	e301c111 	movw	ip, #4369	; 0x1111
    a1b4:	e341c111 	movt	ip, #4369	; 0x1111
    a1b8:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    a1bc:	e1a06003 	mov	r6, r3
    a1c0:	e3405001 	movt	r5, #1
    a1c4:	e159000c 	cmp	r9, ip
    a1c8:	e3a03000 	mov	r3, #0
    a1cc:	e5853000 	str	r3, [r5]
    a1d0:	1a00002e 	bne	a290 <XDcfg_Transfer+0xf0>
    a1d4:	e1a08001 	mov	r8, r1
    a1d8:	e1a07002 	mov	r7, r2
    a1dc:	ebffffc3 	bl	a0f0 <XDcfg_IsDmaBusy>
    a1e0:	e3500000 	cmp	r0, #0
    a1e4:	0a00004b 	beq	a318 <XDcfg_Transfer+0x178>
    a1e8:	e5943004 	ldr	r3, [r4, #4]
    a1ec:	e5932014 	ldr	r2, [r3, #20]
    a1f0:	e3120010 	tst	r2, #16
    a1f4:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    a1f8:	1a00002b 	bne	a2ac <XDcfg_Transfer+0x10c>
    a1fc:	e3520005 	cmp	r2, #5
    a200:	1a000046 	bne	a320 <XDcfg_Transfer+0x180>
    a204:	e3570000 	cmp	r7, #0
    a208:	13580000 	cmpne	r8, #0
    a20c:	0a000037 	beq	a2f0 <XDcfg_Transfer+0x150>
    a210:	e59d2020 	ldr	r2, [sp, #32]
    a214:	e3520000 	cmp	r2, #0
    a218:	13560000 	cmpne	r6, #0
    a21c:	03a01001 	moveq	r1, #1
    a220:	13a01000 	movne	r1, #0
    a224:	0a000031 	beq	a2f0 <XDcfg_Transfer+0x150>
    a228:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    a22c:	e3520005 	cmp	r2, #5
    a230:	e5932080 	ldr	r2, [r3, #128]	; 0x80
    a234:	0a000077 	beq	a418 <XDcfg_Transfer+0x278>
    a238:	e3c22010 	bic	r2, r2, #16
    a23c:	e5832080 	str	r2, [r3, #128]	; 0x80
    a240:	e3013111 	movw	r3, #4369	; 0x1111
    a244:	e5942010 	ldr	r2, [r4, #16]
    a248:	e3413111 	movt	r3, #4369	; 0x1111
    a24c:	e5851000 	str	r1, [r5]
    a250:	e1520003 	cmp	r2, r3
    a254:	1a000042 	bne	a364 <XDcfg_Transfer+0x1c4>
    a258:	e5942004 	ldr	r2, [r4, #4]
    a25c:	e5923000 	ldr	r3, [r2]
    a260:	e3833402 	orr	r3, r3, #33554432	; 0x2000000
    a264:	e5823000 	str	r3, [r2]
    a268:	e5943004 	ldr	r3, [r4, #4]
    a26c:	e5838018 	str	r8, [r3, #24]
    a270:	e5943004 	ldr	r3, [r4, #4]
    a274:	e583601c 	str	r6, [r3, #28]
    a278:	e5943004 	ldr	r3, [r4, #4]
    a27c:	e5837020 	str	r7, [r3, #32]
    a280:	e59d2020 	ldr	r2, [sp, #32]
    a284:	e5943004 	ldr	r3, [r4, #4]
    a288:	e5832024 	str	r2, [r3, #36]	; 0x24
    a28c:	ea000004 	b	a2a4 <XDcfg_Transfer+0x104>
    a290:	e59f019c 	ldr	r0, [pc, #412]	; a434 <XDcfg_Transfer+0x294>
    a294:	e3a01fc2 	mov	r1, #776	; 0x308
    a298:	eb0011f5 	bl	ea74 <Xil_Assert>
    a29c:	e3a03001 	mov	r3, #1
    a2a0:	e5853000 	str	r3, [r5]
    a2a4:	e3a00000 	mov	r0, #0
    a2a8:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a2ac:	e2422001 	sub	r2, r2, #1
    a2b0:	e3520001 	cmp	r2, #1
    a2b4:	9a00001b 	bls	a328 <XDcfg_Transfer+0x188>
    a2b8:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    a2bc:	e3520003 	cmp	r2, #3
    a2c0:	0a000004 	beq	a2d8 <XDcfg_Transfer+0x138>
    a2c4:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    a2c8:	e2422004 	sub	r2, r2, #4
    a2cc:	e3520001 	cmp	r2, #1
    a2d0:	8afffff3 	bhi	a2a4 <XDcfg_Transfer+0x104>
    a2d4:	eaffffca 	b	a204 <XDcfg_Transfer+0x64>
    a2d8:	e59d2020 	ldr	r2, [sp, #32]
    a2dc:	e3520000 	cmp	r2, #0
    a2e0:	13560000 	cmpne	r6, #0
    a2e4:	03a01001 	moveq	r1, #1
    a2e8:	13a01000 	movne	r1, #0
    a2ec:	1a000022 	bne	a37c <XDcfg_Transfer+0x1dc>
    a2f0:	e3a0000f 	mov	r0, #15
    a2f4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a2f8:	e59f0134 	ldr	r0, [pc, #308]	; a434 <XDcfg_Transfer+0x294>
    a2fc:	e3001307 	movw	r1, #775	; 0x307
    a300:	eb0011db 	bl	ea74 <Xil_Assert>
    a304:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a308:	e3a02001 	mov	r2, #1
    a30c:	e3403001 	movt	r3, #1
    a310:	e5832000 	str	r2, [r3]
    a314:	eaffffe2 	b	a2a4 <XDcfg_Transfer+0x104>
    a318:	e3a00015 	mov	r0, #21
    a31c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a320:	e3a00001 	mov	r0, #1
    a324:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a328:	e3570000 	cmp	r7, #0
    a32c:	13580000 	cmpne	r8, #0
    a330:	03a01001 	moveq	r1, #1
    a334:	13a01000 	movne	r1, #0
    a338:	0affffec 	beq	a2f0 <XDcfg_Transfer+0x150>
    a33c:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    a340:	e3520001 	cmp	r2, #1
    a344:	e5932080 	ldr	r2, [r3, #128]	; 0x80
    a348:	e3c22010 	bic	r2, r2, #16
    a34c:	e5832080 	str	r2, [r3, #128]	; 0x80
    a350:	0a000032 	beq	a420 <XDcfg_Transfer+0x280>
    a354:	e5943010 	ldr	r3, [r4, #16]
    a358:	e5851000 	str	r1, [r5]
    a35c:	e1530009 	cmp	r3, r9
    a360:	0affffbc 	beq	a258 <XDcfg_Transfer+0xb8>
    a364:	e59f00c8 	ldr	r0, [pc, #200]	; a434 <XDcfg_Transfer+0x294>
    a368:	e3a010ed 	mov	r1, #237	; 0xed
    a36c:	eb0011c0 	bl	ea74 <Xil_Assert>
    a370:	e3a03001 	mov	r3, #1
    a374:	e5853000 	str	r3, [r5]
    a378:	eaffffba 	b	a268 <XDcfg_Transfer+0xc8>
    a37c:	e5932080 	ldr	r2, [r3, #128]	; 0x80
    a380:	e1a00004 	mov	r0, r4
    a384:	e3c22010 	bic	r2, r2, #16
    a388:	e5832080 	str	r2, [r3, #128]	; 0x80
    a38c:	e3e02000 	mvn	r2, #0
    a390:	e5943004 	ldr	r3, [r4, #4]
    a394:	e5838018 	str	r8, [r3, #24]
    a398:	e5943004 	ldr	r3, [r4, #4]
    a39c:	e583201c 	str	r2, [r3, #28]
    a3a0:	e5943004 	ldr	r3, [r4, #4]
    a3a4:	e5837020 	str	r7, [r3, #32]
    a3a8:	e5943004 	ldr	r3, [r4, #4]
    a3ac:	e5831024 	str	r1, [r3, #36]	; 0x24
    a3b0:	ebfffcae 	bl	9670 <XDcfg_IntrGetEnabled>
    a3b4:	e30f18ef 	movw	r1, #63727	; 0xf8ef
    a3b8:	e1a05000 	mov	r5, r0
    a3bc:	e34010f7 	movt	r1, #247	; 0xf7
    a3c0:	e1a00004 	mov	r0, r4
    a3c4:	ebfffc86 	bl	95e4 <XDcfg_IntrDisable>
    a3c8:	e5942004 	ldr	r2, [r4, #4]
    a3cc:	e282200c 	add	r2, r2, #12
    a3d0:	e5923000 	ldr	r3, [r2]
    a3d4:	e3130a01 	tst	r3, #4096	; 0x1000
    a3d8:	0afffffc 	beq	a3d0 <XDcfg_Transfer+0x230>
    a3dc:	e1a01005 	mov	r1, r5
    a3e0:	e1a00004 	mov	r0, r4
    a3e4:	ebfffc5b 	bl	9558 <XDcfg_IntrEnable>
    a3e8:	e5943004 	ldr	r3, [r4, #4]
    a3ec:	e3e01000 	mvn	r1, #0
    a3f0:	e3a02000 	mov	r2, #0
    a3f4:	e5831018 	str	r1, [r3, #24]
    a3f8:	e5943004 	ldr	r3, [r4, #4]
    a3fc:	e583601c 	str	r6, [r3, #28]
    a400:	e5943004 	ldr	r3, [r4, #4]
    a404:	e5832020 	str	r2, [r3, #32]
    a408:	e59d2020 	ldr	r2, [sp, #32]
    a40c:	e5943004 	ldr	r3, [r4, #4]
    a410:	e5832024 	str	r2, [r3, #36]	; 0x24
    a414:	eaffffa2 	b	a2a4 <XDcfg_Transfer+0x104>
    a418:	e3822010 	orr	r2, r2, #16
    a41c:	e5832080 	str	r2, [r3, #128]	; 0x80
    a420:	e5942004 	ldr	r2, [r4, #4]
    a424:	e5923000 	ldr	r3, [r2]
    a428:	e3c33402 	bic	r3, r3, #33554432	; 0x2000000
    a42c:	e5823000 	str	r3, [r2]
    a430:	eaffff8c 	b	a268 <XDcfg_Transfer+0xc8>
    a434:	000121b8 	.word	0x000121b8

0000a438 <XQspiPs_LookupConfig>:
    a438:	e92d4030 	push	{r4, r5, lr}
    a43c:	e30f5658 	movw	r5, #63064	; 0xf658
    a440:	e3405001 	movt	r5, #1
    a444:	e1a0e000 	mov	lr, r0
    a448:	e5950000 	ldr	r0, [r5]
    a44c:	e3500000 	cmp	r0, #0
    a450:	08bd8030 	popeq	{r4, r5, pc}
    a454:	e16f4f1e 	clz	r4, lr
    a458:	e1a03005 	mov	r3, r5
    a45c:	e1a042a4 	lsr	r4, r4, #5
    a460:	e3a02000 	mov	r2, #0
    a464:	ea000003 	b	a478 <XQspiPs_LookupConfig+0x40>
    a468:	e5b30018 	ldr	r0, [r3, #24]!
    a46c:	e2822001 	add	r2, r2, #1
    a470:	e3500000 	cmp	r0, #0
    a474:	08bd8030 	popeq	{r4, r5, pc}
    a478:	e593c004 	ldr	ip, [r3, #4]
    a47c:	e15c000e 	cmp	ip, lr
    a480:	11a01004 	movne	r1, r4
    a484:	03841001 	orreq	r1, r4, #1
    a488:	e3510000 	cmp	r1, #0
    a48c:	0afffff5 	beq	a468 <XQspiPs_LookupConfig+0x30>
    a490:	e0822082 	add	r2, r2, r2, lsl #1
    a494:	e0850182 	add	r0, r5, r2, lsl #3
    a498:	e8bd8030 	pop	{r4, r5, pc}

0000a49c <XQspiPs_SetOptions>:
    a49c:	e3500000 	cmp	r0, #0
    a4a0:	e92d4070 	push	{r4, r5, r6, lr}
    a4a4:	0a000030 	beq	a56c <XQspiPs_SetOptions+0xd0>
    a4a8:	e5902018 	ldr	r2, [r0, #24]
    a4ac:	e3013111 	movw	r3, #4369	; 0x1111
    a4b0:	e3413111 	movt	r3, #4369	; 0x1111
    a4b4:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a4b8:	e3404001 	movt	r4, #1
    a4bc:	e1520003 	cmp	r2, r3
    a4c0:	e3a03000 	mov	r3, #0
    a4c4:	e5843000 	str	r3, [r4]
    a4c8:	1a000019 	bne	a534 <XQspiPs_SetOptions+0x98>
    a4cc:	e590302c 	ldr	r3, [r0, #44]	; 0x2c
    a4d0:	e3530000 	cmp	r3, #0
    a4d4:	1a00001d 	bne	a550 <XQspiPs_SetOptions+0xb4>
    a4d8:	e5904004 	ldr	r4, [r0, #4]
    a4dc:	e3023050 	movw	r3, #8272	; 0x2050
    a4e0:	e3403001 	movt	r3, #1
    a4e4:	e2015080 	and	r5, r1, #128	; 0x80
    a4e8:	e283e028 	add	lr, r3, #40	; 0x28
    a4ec:	e3c11080 	bic	r1, r1, #128	; 0x80
    a4f0:	e5942000 	ldr	r2, [r4]
    a4f4:	e593c000 	ldr	ip, [r3]
    a4f8:	e2833008 	add	r3, r3, #8
    a4fc:	e111000c 	tst	r1, ip
    a500:	e513c004 	ldr	ip, [r3, #-4]
    a504:	1182200c 	orrne	r2, r2, ip
    a508:	01c2200c 	biceq	r2, r2, ip
    a50c:	e15e0003 	cmp	lr, r3
    a510:	1afffff7 	bne	a4f4 <XQspiPs_SetOptions+0x58>
    a514:	e5842000 	str	r2, [r4]
    a518:	e3550000 	cmp	r5, #0
    a51c:	e59430a0 	ldr	r3, [r4, #160]	; 0xa0
    a520:	03c33102 	biceq	r3, r3, #-2147483648	; 0x80000000
    a524:	058430a0 	streq	r3, [r4, #160]	; 0xa0
    a528:	1a00000a 	bne	a558 <XQspiPs_SetOptions+0xbc>
    a52c:	e3a00000 	mov	r0, #0
    a530:	e8bd8070 	pop	{r4, r5, r6, pc}
    a534:	e59f0050 	ldr	r0, [pc, #80]	; a58c <XQspiPs_SetOptions+0xf0>
    a538:	e3a0106a 	mov	r1, #106	; 0x6a
    a53c:	eb00114c 	bl	ea74 <Xil_Assert>
    a540:	e3a03001 	mov	r3, #1
    a544:	e3a00000 	mov	r0, #0
    a548:	e5843000 	str	r3, [r4]
    a54c:	e8bd8070 	pop	{r4, r5, r6, pc}
    a550:	e3a00015 	mov	r0, #21
    a554:	e8bd8070 	pop	{r4, r5, r6, pc}
    a558:	e300316b 	movw	r3, #363	; 0x16b
    a55c:	e3483000 	movt	r3, #32768	; 0x8000
    a560:	e58430a0 	str	r3, [r4, #160]	; 0xa0
    a564:	eb0003e9 	bl	b510 <XQspiPs_SetSlaveSelect>
    a568:	eaffffef 	b	a52c <XQspiPs_SetOptions+0x90>
    a56c:	e59f0018 	ldr	r0, [pc, #24]	; a58c <XQspiPs_SetOptions+0xf0>
    a570:	e3a01069 	mov	r1, #105	; 0x69
    a574:	eb00113e 	bl	ea74 <Xil_Assert>
    a578:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a57c:	e3a02001 	mov	r2, #1
    a580:	e3403001 	movt	r3, #1
    a584:	e5832000 	str	r2, [r3]
    a588:	eaffffe7 	b	a52c <XQspiPs_SetOptions+0x90>
    a58c:	0001222c 	.word	0x0001222c

0000a590 <XQspiPs_GetOptions>:
    a590:	e2503000 	subs	r3, r0, #0
    a594:	e92d4010 	push	{r4, lr}
    a598:	0a00001f 	beq	a61c <XQspiPs_GetOptions+0x8c>
    a59c:	e5931018 	ldr	r1, [r3, #24]
    a5a0:	e3012111 	movw	r2, #4369	; 0x1111
    a5a4:	e3412111 	movt	r2, #4369	; 0x1111
    a5a8:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a5ac:	e3404001 	movt	r4, #1
    a5b0:	e3a00000 	mov	r0, #0
    a5b4:	e1510002 	cmp	r1, r2
    a5b8:	e5840000 	str	r0, [r4]
    a5bc:	1a00000f 	bne	a600 <XQspiPs_GetOptions+0x70>
    a5c0:	e593e004 	ldr	lr, [r3, #4]
    a5c4:	e3023050 	movw	r3, #8272	; 0x2050
    a5c8:	e3403001 	movt	r3, #1
    a5cc:	e283c028 	add	ip, r3, #40	; 0x28
    a5d0:	e59e1000 	ldr	r1, [lr]
    a5d4:	e5932004 	ldr	r2, [r3, #4]
    a5d8:	e2833008 	add	r3, r3, #8
    a5dc:	e1110002 	tst	r1, r2
    a5e0:	15132008 	ldrne	r2, [r3, #-8]
    a5e4:	11800002 	orrne	r0, r0, r2
    a5e8:	e15c0003 	cmp	ip, r3
    a5ec:	1afffff8 	bne	a5d4 <XQspiPs_GetOptions+0x44>
    a5f0:	e59e30a0 	ldr	r3, [lr, #160]	; 0xa0
    a5f4:	e3530000 	cmp	r3, #0
    a5f8:	b3800080 	orrlt	r0, r0, #128	; 0x80
    a5fc:	e8bd8010 	pop	{r4, pc}
    a600:	e59f002c 	ldr	r0, [pc, #44]	; a634 <XQspiPs_GetOptions+0xa4>
    a604:	e3a010bc 	mov	r1, #188	; 0xbc
    a608:	eb001119 	bl	ea74 <Xil_Assert>
    a60c:	e3a03001 	mov	r3, #1
    a610:	e3a00000 	mov	r0, #0
    a614:	e5843000 	str	r3, [r4]
    a618:	e8bd8010 	pop	{r4, pc}
    a61c:	e59f0010 	ldr	r0, [pc, #16]	; a634 <XQspiPs_GetOptions+0xa4>
    a620:	e3a010bb 	mov	r1, #187	; 0xbb
    a624:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a628:	e3404001 	movt	r4, #1
    a62c:	eb001110 	bl	ea74 <Xil_Assert>
    a630:	eafffff5 	b	a60c <XQspiPs_GetOptions+0x7c>
    a634:	0001222c 	.word	0x0001222c

0000a638 <XQspiPs_SetClkPrescaler>:
    a638:	e3500000 	cmp	r0, #0
    a63c:	e92d4010 	push	{r4, lr}
    a640:	0a000023 	beq	a6d4 <XQspiPs_SetClkPrescaler+0x9c>
    a644:	e5902018 	ldr	r2, [r0, #24]
    a648:	e3013111 	movw	r3, #4369	; 0x1111
    a64c:	e3413111 	movt	r3, #4369	; 0x1111
    a650:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a654:	e3404001 	movt	r4, #1
    a658:	e1520003 	cmp	r2, r3
    a65c:	e3a03000 	mov	r3, #0
    a660:	e5843000 	str	r3, [r4]
    a664:	1a00000b 	bne	a698 <XQspiPs_SetClkPrescaler+0x60>
    a668:	e3510007 	cmp	r1, #7
    a66c:	8a000010 	bhi	a6b4 <XQspiPs_SetClkPrescaler+0x7c>
    a670:	e590302c 	ldr	r3, [r0, #44]	; 0x2c
    a674:	e3530000 	cmp	r3, #0
    a678:	1a000013 	bne	a6cc <XQspiPs_SetClkPrescaler+0x94>
    a67c:	e5902004 	ldr	r2, [r0, #4]
    a680:	e5923000 	ldr	r3, [r2]
    a684:	e3c33038 	bic	r3, r3, #56	; 0x38
    a688:	e1833181 	orr	r3, r3, r1, lsl #3
    a68c:	e5823000 	str	r3, [r2]
    a690:	e3a00000 	mov	r0, #0
    a694:	e8bd8010 	pop	{r4, pc}
    a698:	e59f0054 	ldr	r0, [pc, #84]	; a6f4 <XQspiPs_SetClkPrescaler+0xbc>
    a69c:	e3a010f4 	mov	r1, #244	; 0xf4
    a6a0:	eb0010f3 	bl	ea74 <Xil_Assert>
    a6a4:	e3a03001 	mov	r3, #1
    a6a8:	e3a00000 	mov	r0, #0
    a6ac:	e5843000 	str	r3, [r4]
    a6b0:	e8bd8010 	pop	{r4, pc}
    a6b4:	e59f0038 	ldr	r0, [pc, #56]	; a6f4 <XQspiPs_SetClkPrescaler+0xbc>
    a6b8:	e3a010f5 	mov	r1, #245	; 0xf5
    a6bc:	eb0010ec 	bl	ea74 <Xil_Assert>
    a6c0:	e3a03001 	mov	r3, #1
    a6c4:	e5843000 	str	r3, [r4]
    a6c8:	eafffff0 	b	a690 <XQspiPs_SetClkPrescaler+0x58>
    a6cc:	e3a00015 	mov	r0, #21
    a6d0:	e8bd8010 	pop	{r4, pc}
    a6d4:	e59f0018 	ldr	r0, [pc, #24]	; a6f4 <XQspiPs_SetClkPrescaler+0xbc>
    a6d8:	e3a010f3 	mov	r1, #243	; 0xf3
    a6dc:	eb0010e4 	bl	ea74 <Xil_Assert>
    a6e0:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a6e4:	e3a02001 	mov	r2, #1
    a6e8:	e3403001 	movt	r3, #1
    a6ec:	e5832000 	str	r2, [r3]
    a6f0:	eaffffe6 	b	a690 <XQspiPs_SetClkPrescaler+0x58>
    a6f4:	0001222c 	.word	0x0001222c

0000a6f8 <XQspiPs_GetClkPrescaler>:
    a6f8:	e3500000 	cmp	r0, #0
    a6fc:	e92d4010 	push	{r4, lr}
    a700:	0a000013 	beq	a754 <XQspiPs_GetClkPrescaler+0x5c>
    a704:	e5901018 	ldr	r1, [r0, #24]
    a708:	e3013111 	movw	r3, #4369	; 0x1111
    a70c:	e3413111 	movt	r3, #4369	; 0x1111
    a710:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a714:	e3404001 	movt	r4, #1
    a718:	e3a02000 	mov	r2, #0
    a71c:	e1510003 	cmp	r1, r3
    a720:	e5842000 	str	r2, [r4]
    a724:	1a000003 	bne	a738 <XQspiPs_GetClkPrescaler+0x40>
    a728:	e5903004 	ldr	r3, [r0, #4]
    a72c:	e5930000 	ldr	r0, [r3]
    a730:	e7e201d0 	ubfx	r0, r0, #3, #3
    a734:	e8bd8010 	pop	{r4, pc}
    a738:	e59f0034 	ldr	r0, [pc, #52]	; a774 <XQspiPs_GetClkPrescaler+0x7c>
    a73c:	e3a01f49 	mov	r1, #292	; 0x124
    a740:	eb0010cb 	bl	ea74 <Xil_Assert>
    a744:	e3a03001 	mov	r3, #1
    a748:	e5843000 	str	r3, [r4]
    a74c:	e3a00000 	mov	r0, #0
    a750:	e8bd8010 	pop	{r4, pc}
    a754:	e59f0018 	ldr	r0, [pc, #24]	; a774 <XQspiPs_GetClkPrescaler+0x7c>
    a758:	e3001123 	movw	r1, #291	; 0x123
    a75c:	eb0010c4 	bl	ea74 <Xil_Assert>
    a760:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a764:	e3a02001 	mov	r2, #1
    a768:	e3403001 	movt	r3, #1
    a76c:	e5832000 	str	r2, [r3]
    a770:	eafffff5 	b	a74c <XQspiPs_GetClkPrescaler+0x54>
    a774:	0001222c 	.word	0x0001222c

0000a778 <XQspiPs_SetDelays>:
    a778:	e3500000 	cmp	r0, #0
    a77c:	e92d4010 	push	{r4, lr}
    a780:	e5ddc008 	ldrb	ip, [sp, #8]
    a784:	0a00001b 	beq	a7f8 <XQspiPs_SetDelays+0x80>
    a788:	e5904018 	ldr	r4, [r0, #24]
    a78c:	e301e111 	movw	lr, #4369	; 0x1111
    a790:	e341e111 	movt	lr, #4369	; 0x1111
    a794:	e154000e 	cmp	r4, lr
    a798:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a79c:	e3404001 	movt	r4, #1
    a7a0:	e3a0e000 	mov	lr, #0
    a7a4:	e584e000 	str	lr, [r4]
    a7a8:	1a000009 	bne	a7d4 <XQspiPs_SetDelays+0x5c>
    a7ac:	e590e02c 	ldr	lr, [r0, #44]	; 0x2c
    a7b0:	e35e0000 	cmp	lr, #0
    a7b4:	1a00000d 	bne	a7f0 <XQspiPs_SetDelays+0x78>
    a7b8:	e18cc403 	orr	ip, ip, r3, lsl #8
    a7bc:	e5903004 	ldr	r3, [r0, #4]
    a7c0:	e18c2802 	orr	r2, ip, r2, lsl #16
    a7c4:	e1821c01 	orr	r1, r2, r1, lsl #24
    a7c8:	e5831018 	str	r1, [r3, #24]
    a7cc:	e3a00000 	mov	r0, #0
    a7d0:	e8bd8010 	pop	{r4, pc}
    a7d4:	e59f003c 	ldr	r0, [pc, #60]	; a818 <XQspiPs_SetDelays+0xa0>
    a7d8:	e3001153 	movw	r1, #339	; 0x153
    a7dc:	eb0010a4 	bl	ea74 <Xil_Assert>
    a7e0:	e3a03001 	mov	r3, #1
    a7e4:	e3a00000 	mov	r0, #0
    a7e8:	e5843000 	str	r3, [r4]
    a7ec:	e8bd8010 	pop	{r4, pc}
    a7f0:	e3a00015 	mov	r0, #21
    a7f4:	e8bd8010 	pop	{r4, pc}
    a7f8:	e59f0018 	ldr	r0, [pc, #24]	; a818 <XQspiPs_SetDelays+0xa0>
    a7fc:	e3001152 	movw	r1, #338	; 0x152
    a800:	eb00109b 	bl	ea74 <Xil_Assert>
    a804:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a808:	e3a02001 	mov	r2, #1
    a80c:	e3403001 	movt	r3, #1
    a810:	e5832000 	str	r2, [r3]
    a814:	eaffffec 	b	a7cc <XQspiPs_SetDelays+0x54>
    a818:	0001222c 	.word	0x0001222c

0000a81c <XQspiPs_GetDelays>:
    a81c:	e3500000 	cmp	r0, #0
    a820:	e92d4010 	push	{r4, lr}
    a824:	0a000019 	beq	a890 <XQspiPs_GetDelays+0x74>
    a828:	e590e018 	ldr	lr, [r0, #24]
    a82c:	e301c111 	movw	ip, #4369	; 0x1111
    a830:	e341c111 	movt	ip, #4369	; 0x1111
    a834:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    a838:	e3404001 	movt	r4, #1
    a83c:	e15e000c 	cmp	lr, ip
    a840:	e3a0c000 	mov	ip, #0
    a844:	e584c000 	str	ip, [r4]
    a848:	1a00000a 	bne	a878 <XQspiPs_GetDelays+0x5c>
    a84c:	e5900004 	ldr	r0, [r0, #4]
    a850:	e59dc008 	ldr	ip, [sp, #8]
    a854:	e5900018 	ldr	r0, [r0, #24]
    a858:	e5cc0000 	strb	r0, [ip]
    a85c:	e1a0c420 	lsr	ip, r0, #8
    a860:	e5c3c000 	strb	ip, [r3]
    a864:	e1a03820 	lsr	r3, r0, #16
    a868:	e1a00c20 	lsr	r0, r0, #24
    a86c:	e5c23000 	strb	r3, [r2]
    a870:	e5c10000 	strb	r0, [r1]
    a874:	e8bd8010 	pop	{r4, pc}
    a878:	e59f0030 	ldr	r0, [pc, #48]	; a8b0 <XQspiPs_GetDelays+0x94>
    a87c:	e3001185 	movw	r1, #389	; 0x185
    a880:	eb00107b 	bl	ea74 <Xil_Assert>
    a884:	e3a03001 	mov	r3, #1
    a888:	e5843000 	str	r3, [r4]
    a88c:	e8bd8010 	pop	{r4, pc}
    a890:	e59f0018 	ldr	r0, [pc, #24]	; a8b0 <XQspiPs_GetDelays+0x94>
    a894:	e3a01f61 	mov	r1, #388	; 0x184
    a898:	eb001075 	bl	ea74 <Xil_Assert>
    a89c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a8a0:	e3a02001 	mov	r2, #1
    a8a4:	e3403001 	movt	r3, #1
    a8a8:	e5832000 	str	r2, [r3]
    a8ac:	e8bd8010 	pop	{r4, pc}
    a8b0:	0001222c 	.word	0x0001222c

0000a8b4 <XQspiPs_GetReadData>:
    a8b4:	e590c020 	ldr	ip, [r0, #32]
    a8b8:	e1a03002 	mov	r3, r2
    a8bc:	e92d4010 	push	{r4, lr}
    a8c0:	e35c0000 	cmp	ip, #0
    a8c4:	0a000005 	beq	a8e0 <XQspiPs_GetReadData+0x2c>
    a8c8:	e3520002 	cmp	r2, #2
    a8cc:	0a000021 	beq	a958 <XQspiPs_GetReadData+0xa4>
    a8d0:	e3520003 	cmp	r2, #3
    a8d4:	0a000011 	beq	a920 <XQspiPs_GetReadData+0x6c>
    a8d8:	e3520001 	cmp	r2, #1
    a8dc:	0a000006 	beq	a8fc <XQspiPs_GetReadData+0x48>
    a8e0:	e5902024 	ldr	r2, [r0, #36]	; 0x24
    a8e4:	e3a01000 	mov	r1, #0
    a8e8:	e5801038 	str	r1, [r0, #56]	; 0x38
    a8ec:	e0422003 	sub	r2, r2, r3
    a8f0:	e1c22fc2 	bic	r2, r2, r2, asr #31
    a8f4:	e5802024 	str	r2, [r0, #36]	; 0x24
    a8f8:	e8bd8010 	pop	{r4, pc}
    a8fc:	e5902038 	ldr	r2, [r0, #56]	; 0x38
    a900:	e3520001 	cmp	r2, #1
    a904:	01a01c21 	lsreq	r1, r1, #24
    a908:	16ef1071 	uxtbne	r1, r1
    a90c:	e5cc1000 	strb	r1, [ip]
    a910:	e5902020 	ldr	r2, [r0, #32]
    a914:	e2822001 	add	r2, r2, #1
    a918:	e5802020 	str	r2, [r0, #32]
    a91c:	eaffffef 	b	a8e0 <XQspiPs_GetReadData+0x2c>
    a920:	e590e038 	ldr	lr, [r0, #56]	; 0x38
    a924:	e28c2002 	add	r2, ip, #2
    a928:	e35e0001 	cmp	lr, #1
    a92c:	01a0ec21 	lsreq	lr, r1, #24
    a930:	16ff4071 	uxthne	r4, r1
    a934:	07ef4451 	ubfxeq	r4, r1, #8, #16
    a938:	17e7e851 	ubfxne	lr, r1, #16, #8
    a93c:	e1cc40b0 	strh	r4, [ip]
    a940:	e5802020 	str	r2, [r0, #32]
    a944:	e5cce002 	strb	lr, [ip, #2]
    a948:	e5902020 	ldr	r2, [r0, #32]
    a94c:	e2822001 	add	r2, r2, #1
    a950:	e5802020 	str	r2, [r0, #32]
    a954:	eaffffe1 	b	a8e0 <XQspiPs_GetReadData+0x2c>
    a958:	e5902038 	ldr	r2, [r0, #56]	; 0x38
    a95c:	e3520001 	cmp	r2, #1
    a960:	01a02821 	lsreq	r2, r1, #16
    a964:	16ff1071 	uxthne	r1, r1
    a968:	07e71451 	ubfxeq	r1, r1, #8, #8
    a96c:	03c220ff 	biceq	r2, r2, #255	; 0xff
    a970:	01821001 	orreq	r1, r2, r1
    a974:	e0cc10b2 	strh	r1, [ip], #2
    a978:	e580c020 	str	ip, [r0, #32]
    a97c:	eaffffd7 	b	a8e0 <XQspiPs_GetReadData+0x2c>

0000a980 <StubStatusHandler>:
    a980:	e59f001c 	ldr	r0, [pc, #28]	; a9a4 <StubStatusHandler+0x24>
    a984:	e30014db 	movw	r1, #1243	; 0x4db
    a988:	e92d4010 	push	{r4, lr}
    a98c:	eb001038 	bl	ea74 <Xil_Assert>
    a990:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    a994:	e3a02001 	mov	r2, #1
    a998:	e3403001 	movt	r3, #1
    a99c:	e5832000 	str	r2, [r3]
    a9a0:	e8bd8010 	pop	{r4, pc}
    a9a4:	000122bc 	.word	0x000122bc

0000a9a8 <XQspiPs_Abort>:
    a9a8:	e5903004 	ldr	r3, [r0, #4]
    a9ac:	e3a0c000 	mov	ip, #0
    a9b0:	e3a0233e 	mov	r2, #-134217728	; 0xf8000000
    a9b4:	e583c014 	str	ip, [r3, #20]
    a9b8:	e5931000 	ldr	r1, [r3]
    a9bc:	e3811b11 	orr	r1, r1, #17408	; 0x4400
    a9c0:	e5831000 	str	r1, [r3]
    a9c4:	e592100c 	ldr	r1, [r2, #12]
    a9c8:	e151000c 	cmp	r1, ip
    a9cc:	130d1f0d 	movwne	r1, #57101	; 0xdf0d
    a9d0:	03a0c003 	moveq	ip, #3
    a9d4:	15821008 	strne	r1, [r2, #8]
    a9d8:	13a01003 	movne	r1, #3
    a9dc:	15821230 	strne	r1, [r2, #560]	; 0x230
    a9e0:	1307167b 	movwne	r1, #30331	; 0x767b
    a9e4:	0582c230 	streq	ip, [r2, #560]	; 0x230
    a9e8:	1582c230 	strne	ip, [r2, #560]	; 0x230
    a9ec:	05821230 	streq	r1, [r2, #560]	; 0x230
    a9f0:	15821004 	strne	r1, [r2, #4]
    a9f4:	e3a02000 	mov	r2, #0
    a9f8:	e3a01001 	mov	r1, #1
    a9fc:	e583102c 	str	r1, [r3, #44]	; 0x2c
    aa00:	e5831028 	str	r1, [r3, #40]	; 0x28
    aa04:	e5802024 	str	r2, [r0, #36]	; 0x24
    aa08:	e5802028 	str	r2, [r0, #40]	; 0x28
    aa0c:	e580202c 	str	r2, [r0, #44]	; 0x2c
    aa10:	e12fff1e 	bx	lr

0000aa14 <XQspiPs_Reset>:
    aa14:	e92d4070 	push	{r4, r5, r6, lr}
    aa18:	e2504000 	subs	r4, r0, #0
    aa1c:	0a000017 	beq	aa80 <XQspiPs_Reset+0x6c>
    aa20:	e5942018 	ldr	r2, [r4, #24]
    aa24:	e3013111 	movw	r3, #4369	; 0x1111
    aa28:	e3413111 	movt	r3, #4369	; 0x1111
    aa2c:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    aa30:	e3405001 	movt	r5, #1
    aa34:	e1520003 	cmp	r2, r3
    aa38:	e3a03000 	mov	r3, #0
    aa3c:	e5853000 	str	r3, [r5]
    aa40:	1a000008 	bne	aa68 <XQspiPs_Reset+0x54>
    aa44:	ebffffd7 	bl	a9a8 <XQspiPs_Abort>
    aa48:	e5941004 	ldr	r1, [r4, #4]
    aa4c:	e30434c1 	movw	r3, #17601	; 0x44c1
    aa50:	e3483008 	movt	r3, #32776	; 0x8008
    aa54:	e5912000 	ldr	r2, [r1]
    aa58:	e3c22002 	bic	r2, r2, #2
    aa5c:	e1823003 	orr	r3, r2, r3
    aa60:	e5813000 	str	r3, [r1]
    aa64:	e8bd8070 	pop	{r4, r5, r6, pc}
    aa68:	e59f0030 	ldr	r0, [pc, #48]	; aaa0 <XQspiPs_Reset+0x8c>
    aa6c:	e3001101 	movw	r1, #257	; 0x101
    aa70:	eb000fff 	bl	ea74 <Xil_Assert>
    aa74:	e3a03001 	mov	r3, #1
    aa78:	e5853000 	str	r3, [r5]
    aa7c:	e8bd8070 	pop	{r4, r5, r6, pc}
    aa80:	e59f0018 	ldr	r0, [pc, #24]	; aaa0 <XQspiPs_Reset+0x8c>
    aa84:	e3a01c01 	mov	r1, #256	; 0x100
    aa88:	eb000ff9 	bl	ea74 <Xil_Assert>
    aa8c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    aa90:	e3a02001 	mov	r2, #1
    aa94:	e3403001 	movt	r3, #1
    aa98:	e5832000 	str	r2, [r3]
    aa9c:	e8bd8070 	pop	{r4, r5, r6, pc}
    aaa0:	000122bc 	.word	0x000122bc

0000aaa4 <XQspiPs_CfgInitialize>:
    aaa4:	e2503000 	subs	r3, r0, #0
    aaa8:	e92d4070 	push	{r4, r5, r6, lr}
    aaac:	0a000020 	beq	ab34 <XQspiPs_CfgInitialize+0x90>
    aab0:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    aab4:	e3510000 	cmp	r1, #0
    aab8:	e1a04002 	mov	r4, r2
    aabc:	e3405001 	movt	r5, #1
    aac0:	e3a02000 	mov	r2, #0
    aac4:	e5852000 	str	r2, [r5]
    aac8:	0a000021 	beq	ab54 <XQspiPs_CfgInitialize+0xb0>
    aacc:	e593c02c 	ldr	ip, [r3, #44]	; 0x2c
    aad0:	e35c0001 	cmp	ip, #1
    aad4:	0a000014 	beq	ab2c <XQspiPs_CfgInitialize+0x88>
    aad8:	e583202c 	str	r2, [r3, #44]	; 0x2c
    aadc:	e583201c 	str	r2, [r3, #28]
    aae0:	e5832020 	str	r2, [r3, #32]
    aae4:	e3012111 	movw	r2, #4369	; 0x1111
    aae8:	e3412111 	movt	r2, #4369	; 0x1111
    aaec:	e5834004 	str	r4, [r3, #4]
    aaf0:	e5832018 	str	r2, [r3, #24]
    aaf4:	e30a2980 	movw	r2, #43392	; 0xa980
    aaf8:	e3402000 	movt	r2, #0
    aafc:	e5832030 	str	r2, [r3, #48]	; 0x30
    ab00:	e5d1200c 	ldrb	r2, [r1, #12]
    ab04:	e5c3200c 	strb	r2, [r3, #12]
    ab08:	ebffffa6 	bl	a9a8 <XQspiPs_Abort>
    ab0c:	e5942000 	ldr	r2, [r4]
    ab10:	e30434c1 	movw	r3, #17601	; 0x44c1
    ab14:	e3483008 	movt	r3, #32776	; 0x8008
    ab18:	e3c22002 	bic	r2, r2, #2
    ab1c:	e1823003 	orr	r3, r2, r3
    ab20:	e5843000 	str	r3, [r4]
    ab24:	e3a00000 	mov	r0, #0
    ab28:	e8bd8070 	pop	{r4, r5, r6, pc}
    ab2c:	e3a00005 	mov	r0, #5
    ab30:	e8bd8070 	pop	{r4, r5, r6, pc}
    ab34:	e59f0030 	ldr	r0, [pc, #48]	; ab6c <XQspiPs_CfgInitialize+0xc8>
    ab38:	e3a010c5 	mov	r1, #197	; 0xc5
    ab3c:	eb000fcc 	bl	ea74 <Xil_Assert>
    ab40:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    ab44:	e3a02001 	mov	r2, #1
    ab48:	e3403001 	movt	r3, #1
    ab4c:	e5832000 	str	r2, [r3]
    ab50:	eafffff3 	b	ab24 <XQspiPs_CfgInitialize+0x80>
    ab54:	e59f0010 	ldr	r0, [pc, #16]	; ab6c <XQspiPs_CfgInitialize+0xc8>
    ab58:	e3a010c6 	mov	r1, #198	; 0xc6
    ab5c:	eb000fc4 	bl	ea74 <Xil_Assert>
    ab60:	e3a03001 	mov	r3, #1
    ab64:	e5853000 	str	r3, [r5]
    ab68:	eaffffed 	b	ab24 <XQspiPs_CfgInitialize+0x80>
    ab6c:	000122bc 	.word	0x000122bc

0000ab70 <XQspiPs_Transfer>:
    ab70:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    ab74:	e2504000 	subs	r4, r0, #0
    ab78:	e24dd00c 	sub	sp, sp, #12
    ab7c:	0a000092 	beq	adcc <XQspiPs_Transfer+0x25c>
    ab80:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    ab84:	e3510000 	cmp	r1, #0
    ab88:	e1a06003 	mov	r6, r3
    ab8c:	e3405001 	movt	r5, #1
    ab90:	e3a03000 	mov	r3, #0
    ab94:	e5853000 	str	r3, [r5]
    ab98:	0a000095 	beq	adf4 <XQspiPs_Transfer+0x284>
    ab9c:	e3560000 	cmp	r6, #0
    aba0:	0a000073 	beq	ad74 <XQspiPs_Transfer+0x204>
    aba4:	e5940018 	ldr	r0, [r4, #24]
    aba8:	e3013111 	movw	r3, #4369	; 0x1111
    abac:	e3413111 	movt	r3, #4369	; 0x1111
    abb0:	e1500003 	cmp	r0, r3
    abb4:	1a000066 	bne	ad54 <XQspiPs_Transfer+0x1e4>
    abb8:	e594902c 	ldr	r9, [r4, #44]	; 0x2c
    abbc:	e3590000 	cmp	r9, #0
    abc0:	1a000089 	bne	adec <XQspiPs_Transfer+0x27c>
    abc4:	e30482c0 	movw	r8, #17088	; 0x42c0
    abc8:	e3a03001 	mov	r3, #1
    abcc:	e3408001 	movt	r8, #1
    abd0:	e5842020 	str	r2, [r4, #32]
    abd4:	e584101c 	str	r1, [r4, #28]
    abd8:	e1a02008 	mov	r2, r8
    abdc:	e5846024 	str	r6, [r4, #36]	; 0x24
    abe0:	e1a05009 	mov	r5, r9
    abe4:	e5846028 	str	r6, [r4, #40]	; 0x28
    abe8:	e584302c 	str	r3, [r4, #44]	; 0x2c
    abec:	e5d17000 	ldrb	r7, [r1]
    abf0:	ea000002 	b	ac00 <XQspiPs_Transfer+0x90>
    abf4:	e2855001 	add	r5, r5, #1
    abf8:	e355001a 	cmp	r5, #26
    abfc:	0a000003 	beq	ac10 <XQspiPs_Transfer+0xa0>
    ac00:	e5d21000 	ldrb	r1, [r2]
    ac04:	e2822003 	add	r2, r2, #3
    ac08:	e1510007 	cmp	r1, r7
    ac0c:	1afffff8 	bne	abf4 <XQspiPs_Transfer+0x84>
    ac10:	e5943004 	ldr	r3, [r4, #4]
    ac14:	e3a02020 	mov	r2, #32
    ac18:	e1a00004 	mov	r0, r4
    ac1c:	e583202c 	str	r2, [r3, #44]	; 0x2c
    ac20:	ebfffe5a 	bl	a590 <XQspiPs_GetOptions>
    ac24:	e594e004 	ldr	lr, [r4, #4]
    ac28:	e3100010 	tst	r0, #16
    ac2c:	e3a01001 	mov	r1, #1
    ac30:	159e3000 	ldrne	r3, [lr]
    ac34:	13c33b01 	bicne	r3, r3, #1024	; 0x400
    ac38:	158e3000 	strne	r3, [lr]
    ac3c:	e355001a 	cmp	r5, #26
    ac40:	e3a03041 	mov	r3, #65	; 0x41
    ac44:	e58e1014 	str	r1, [lr, #20]
    ac48:	e58e3004 	str	r3, [lr, #4]
    ac4c:	0a00004e 	beq	ad8c <XQspiPs_Transfer+0x21c>
    ac50:	e0855085 	add	r5, r5, r5, lsl #1
    ac54:	e7d83005 	ldrb	r3, [r8, r5]
    ac58:	e0888005 	add	r8, r8, r5
    ac5c:	e3530001 	cmp	r3, #1
    ac60:	03560003 	cmpeq	r6, #3
    ac64:	03a03001 	moveq	r3, #1
    ac68:	13a03000 	movne	r3, #0
    ac6c:	0a00007e 	beq	ae6c <XQspiPs_Transfer+0x2fc>
    ac70:	e5d82001 	ldrb	r2, [r8, #1]
    ac74:	e2529004 	subs	r9, r2, #4
    ac78:	e1a01002 	mov	r1, r2
    ac7c:	13a09001 	movne	r9, #1
    ac80:	e3530001 	cmp	r3, #1
    ac84:	e594301c 	ldr	r3, [r4, #28]
    ac88:	e5849038 	str	r9, [r4, #56]	; 0x38
    ac8c:	e6930002 	ldr	r0, [r3], r2
    ac90:	e584301c 	str	r3, [r4, #28]
    ac94:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    ac98:	e0433001 	sub	r3, r3, r1
    ac9c:	e1c33fc3 	bic	r3, r3, r3, asr #31
    aca0:	e5843028 	str	r3, [r4, #40]	; 0x28
    aca4:	e5d82002 	ldrb	r2, [r8, #2]
    aca8:	e782000e 	str	r0, [r2, lr]
    acac:	0a000056 	beq	ae0c <XQspiPs_Transfer+0x29c>
    acb0:	e3530000 	cmp	r3, #0
    acb4:	da00001c 	ble	ad2c <XQspiPs_Transfer+0x1bc>
    acb8:	e1e0cf03 	mvn	ip, r3, lsl #30
    acbc:	e5945020 	ldr	r5, [r4, #32]
    acc0:	e3a02001 	mov	r2, #1
    acc4:	e1e0cf2c 	mvn	ip, ip, lsr #30
    acc8:	e28e601c 	add	r6, lr, #28
    accc:	e3e07000 	mvn	r7, #0
    acd0:	ea000003 	b	ace4 <XQspiPs_Transfer+0x174>
    acd4:	e352003f 	cmp	r2, #63	; 0x3f
    acd8:	13530000 	cmpne	r3, #0
    acdc:	e5843028 	str	r3, [r4, #40]	; 0x28
    ace0:	da000011 	ble	ad2c <XQspiPs_Transfer+0x1bc>
    ace4:	e3550000 	cmp	r5, #0
    ace8:	0a000004 	beq	ad00 <XQspiPs_Transfer+0x190>
    acec:	e5941024 	ldr	r1, [r4, #36]	; 0x24
    acf0:	e0411003 	sub	r1, r1, r3
    acf4:	e3510004 	cmp	r1, #4
    acf8:	c5867000 	strgt	r7, [r6]
    acfc:	ca000003 	bgt	ad10 <XQspiPs_Transfer+0x1a0>
    ad00:	e594101c 	ldr	r1, [r4, #28]
    ad04:	e4910004 	ldr	r0, [r1], #4
    ad08:	e5860000 	str	r0, [r6]
    ad0c:	e584101c 	str	r1, [r4, #28]
    ad10:	e2433004 	sub	r3, r3, #4
    ad14:	e2822001 	add	r2, r2, #1
    ad18:	e153000c 	cmp	r3, ip
    ad1c:	e6ef2072 	uxtb	r2, r2
    ad20:	1affffeb 	bne	acd4 <XQspiPs_Transfer+0x164>
    ad24:	e3a03000 	mov	r3, #0
    ad28:	e5843028 	str	r3, [r4, #40]	; 0x28
    ad2c:	e3a03055 	mov	r3, #85	; 0x55
    ad30:	e1a00004 	mov	r0, r4
    ad34:	e58e3008 	str	r3, [lr, #8]
    ad38:	ebfffe14 	bl	a590 <XQspiPs_GetOptions>
    ad3c:	e3100020 	tst	r0, #32
    ad40:	15942004 	ldrne	r2, [r4, #4]
    ad44:	15923000 	ldrne	r3, [r2]
    ad48:	13833801 	orrne	r3, r3, #65536	; 0x10000
    ad4c:	15823000 	strne	r3, [r2]
    ad50:	ea000004 	b	ad68 <XQspiPs_Transfer+0x1f8>
    ad54:	e59f018c 	ldr	r0, [pc, #396]	; aee8 <XQspiPs_Transfer+0x378>
    ad58:	e3a01f6a 	mov	r1, #424	; 0x1a8
    ad5c:	eb000f44 	bl	ea74 <Xil_Assert>
    ad60:	e3a03001 	mov	r3, #1
    ad64:	e5853000 	str	r3, [r5]
    ad68:	e3a00000 	mov	r0, #0
    ad6c:	e28dd00c 	add	sp, sp, #12
    ad70:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
    ad74:	e59f016c 	ldr	r0, [pc, #364]	; aee8 <XQspiPs_Transfer+0x378>
    ad78:	e30011a7 	movw	r1, #423	; 0x1a7
    ad7c:	eb000f3c 	bl	ea74 <Xil_Assert>
    ad80:	e3a03001 	mov	r3, #1
    ad84:	e5853000 	str	r3, [r5]
    ad88:	eafffff6 	b	ad68 <XQspiPs_Transfer+0x1f8>
    ad8c:	e2062003 	and	r2, r6, #3
    ad90:	e3520002 	cmp	r2, #2
    ad94:	0a000048 	beq	aebc <XQspiPs_Transfer+0x34c>
    ad98:	e3520003 	cmp	r2, #3
    ad9c:	0a00003b 	beq	ae90 <XQspiPs_Transfer+0x320>
    ada0:	e1520001 	cmp	r2, r1
    ada4:	0a000025 	beq	ae40 <XQspiPs_Transfer+0x2d0>
    ada8:	e3a01004 	mov	r1, #4
    adac:	e3a0001c 	mov	r0, #28
    adb0:	e1a02001 	mov	r2, r1
    adb4:	e1a0800d 	mov	r8, sp
    adb8:	e3a03000 	mov	r3, #0
    adbc:	e5cd7000 	strb	r7, [sp]
    adc0:	e5cd1001 	strb	r1, [sp, #1]
    adc4:	e5cd0002 	strb	r0, [sp, #2]
    adc8:	eaffffac 	b	ac80 <XQspiPs_Transfer+0x110>
    adcc:	e59f0114 	ldr	r0, [pc, #276]	; aee8 <XQspiPs_Transfer+0x378>
    add0:	e30011a5 	movw	r1, #421	; 0x1a5
    add4:	eb000f26 	bl	ea74 <Xil_Assert>
    add8:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    addc:	e3a02001 	mov	r2, #1
    ade0:	e3403001 	movt	r3, #1
    ade4:	e5832000 	str	r2, [r3]
    ade8:	eaffffde 	b	ad68 <XQspiPs_Transfer+0x1f8>
    adec:	e3a00015 	mov	r0, #21
    adf0:	eaffffdd 	b	ad6c <XQspiPs_Transfer+0x1fc>
    adf4:	e59f00ec 	ldr	r0, [pc, #236]	; aee8 <XQspiPs_Transfer+0x378>
    adf8:	e30011a6 	movw	r1, #422	; 0x1a6
    adfc:	eb000f1c 	bl	ea74 <Xil_Assert>
    ae00:	e3a03001 	mov	r3, #1
    ae04:	e5853000 	str	r3, [r5]
    ae08:	eaffffd6 	b	ad68 <XQspiPs_Transfer+0x1f8>
    ae0c:	e1a00004 	mov	r0, r4
    ae10:	ebfffdde 	bl	a590 <XQspiPs_GetOptions>
    ae14:	e594e004 	ldr	lr, [r4, #4]
    ae18:	e3100020 	tst	r0, #32
    ae1c:	159e3000 	ldrne	r3, [lr]
    ae20:	e28e2004 	add	r2, lr, #4
    ae24:	13833801 	orrne	r3, r3, #65536	; 0x10000
    ae28:	158e3000 	strne	r3, [lr]
    ae2c:	e5923000 	ldr	r3, [r2]
    ae30:	e3130004 	tst	r3, #4
    ae34:	0afffffc 	beq	ae2c <XQspiPs_Transfer+0x2bc>
    ae38:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    ae3c:	eaffff9b 	b	acb0 <XQspiPs_Transfer+0x140>
    ae40:	e3560004 	cmp	r6, #4
    ae44:	e3e0107f 	mvn	r1, #127	; 0x7f
    ae48:	e5cd1002 	strb	r1, [sp, #2]
    ae4c:	93a03000 	movls	r3, #0
    ae50:	83a03001 	movhi	r3, #1
    ae54:	e1a09002 	mov	r9, r2
    ae58:	e1a01002 	mov	r1, r2
    ae5c:	e1a0800d 	mov	r8, sp
    ae60:	e5cd7000 	strb	r7, [sp]
    ae64:	e5cd2001 	strb	r2, [sp, #1]
    ae68:	eaffff84 	b	ac80 <XQspiPs_Transfer+0x110>
    ae6c:	e3083803 	movw	r3, #34819	; 0x8803
    ae70:	e34f3fff 	movt	r3, #65535	; 0xffff
    ae74:	e1c830b1 	strh	r3, [r8, #1]
    ae78:	e3a03000 	mov	r3, #0
    ae7c:	e5d82001 	ldrb	r2, [r8, #1]
    ae80:	e2529004 	subs	r9, r2, #4
    ae84:	e1a01002 	mov	r1, r2
    ae88:	13a09001 	movne	r9, #1
    ae8c:	eaffff7b 	b	ac80 <XQspiPs_Transfer+0x110>
    ae90:	e3560004 	cmp	r6, #4
    ae94:	e1a09001 	mov	r9, r1
    ae98:	e3e01077 	mvn	r1, #119	; 0x77
    ae9c:	93a03000 	movls	r3, #0
    aea0:	e5cd1002 	strb	r1, [sp, #2]
    aea4:	83a03001 	movhi	r3, #1
    aea8:	e1a01002 	mov	r1, r2
    aeac:	e1a0800d 	mov	r8, sp
    aeb0:	e5cd7000 	strb	r7, [sp]
    aeb4:	e5cd2001 	strb	r2, [sp, #1]
    aeb8:	eaffff70 	b	ac80 <XQspiPs_Transfer+0x110>
    aebc:	e3560004 	cmp	r6, #4
    aec0:	e1a09001 	mov	r9, r1
    aec4:	e3e0107b 	mvn	r1, #123	; 0x7b
    aec8:	93a03000 	movls	r3, #0
    aecc:	e5cd1002 	strb	r1, [sp, #2]
    aed0:	83a03001 	movhi	r3, #1
    aed4:	e1a01002 	mov	r1, r2
    aed8:	e1a0800d 	mov	r8, sp
    aedc:	e5cd7000 	strb	r7, [sp]
    aee0:	e5cd2001 	strb	r2, [sp, #1]
    aee4:	eaffff65 	b	ac80 <XQspiPs_Transfer+0x110>
    aee8:	000122bc 	.word	0x000122bc

0000aeec <XQspiPs_PolledTransfer>:
    aeec:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    aef0:	e2504000 	subs	r4, r0, #0
    aef4:	e24dd00c 	sub	sp, sp, #12
    aef8:	0a0000fd 	beq	b2f4 <XQspiPs_PolledTransfer+0x408>
    aefc:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    af00:	e3510000 	cmp	r1, #0
    af04:	e1a06003 	mov	r6, r3
    af08:	e3405001 	movt	r5, #1
    af0c:	e3a03000 	mov	r3, #0
    af10:	e5853000 	str	r3, [r5]
    af14:	0a0000fe 	beq	b314 <XQspiPs_PolledTransfer+0x428>
    af18:	e3560000 	cmp	r6, #0
    af1c:	0a0000d6 	beq	b27c <XQspiPs_PolledTransfer+0x390>
    af20:	e5940018 	ldr	r0, [r4, #24]
    af24:	e3013111 	movw	r3, #4369	; 0x1111
    af28:	e3413111 	movt	r3, #4369	; 0x1111
    af2c:	e1500003 	cmp	r0, r3
    af30:	1a00008a 	bne	b160 <XQspiPs_PolledTransfer+0x274>
    af34:	e594502c 	ldr	r5, [r4, #44]	; 0x2c
    af38:	e3550000 	cmp	r5, #0
    af3c:	1a0000ea 	bne	b2ec <XQspiPs_PolledTransfer+0x400>
    af40:	e30482c0 	movw	r8, #17088	; 0x42c0
    af44:	e3a03001 	mov	r3, #1
    af48:	e3408001 	movt	r8, #1
    af4c:	e5842020 	str	r2, [r4, #32]
    af50:	e584101c 	str	r1, [r4, #28]
    af54:	e1a02008 	mov	r2, r8
    af58:	e5846024 	str	r6, [r4, #36]	; 0x24
    af5c:	e5846028 	str	r6, [r4, #40]	; 0x28
    af60:	e584302c 	str	r3, [r4, #44]	; 0x2c
    af64:	e5d17000 	ldrb	r7, [r1]
    af68:	ea000002 	b	af78 <XQspiPs_PolledTransfer+0x8c>
    af6c:	e2855001 	add	r5, r5, #1
    af70:	e355001a 	cmp	r5, #26
    af74:	0a000003 	beq	af88 <XQspiPs_PolledTransfer+0x9c>
    af78:	e5d21000 	ldrb	r1, [r2]
    af7c:	e2822003 	add	r2, r2, #3
    af80:	e1510007 	cmp	r1, r7
    af84:	1afffff8 	bne	af6c <XQspiPs_PolledTransfer+0x80>
    af88:	e5943004 	ldr	r3, [r4, #4]
    af8c:	e3a02020 	mov	r2, #32
    af90:	e1a00004 	mov	r0, r4
    af94:	e583202c 	str	r2, [r3, #44]	; 0x2c
    af98:	ebfffd7c 	bl	a590 <XQspiPs_GetOptions>
    af9c:	e5942004 	ldr	r2, [r4, #4]
    afa0:	e3100010 	tst	r0, #16
    afa4:	15923000 	ldrne	r3, [r2]
    afa8:	13c33b01 	bicne	r3, r3, #1024	; 0x400
    afac:	15823000 	strne	r3, [r2]
    afb0:	e355001a 	cmp	r5, #26
    afb4:	e3a03001 	mov	r3, #1
    afb8:	e5823014 	str	r3, [r2, #20]
    afbc:	0a0000b9 	beq	b2a8 <XQspiPs_PolledTransfer+0x3bc>
    afc0:	e0855085 	add	r5, r5, r5, lsl #1
    afc4:	e7d83005 	ldrb	r3, [r8, r5]
    afc8:	e0888005 	add	r8, r8, r5
    afcc:	e3530001 	cmp	r3, #1
    afd0:	03560003 	cmpeq	r6, #3
    afd4:	03a06001 	moveq	r6, #1
    afd8:	13a06000 	movne	r6, #0
    afdc:	0a0000ec 	beq	b394 <XQspiPs_PolledTransfer+0x4a8>
    afe0:	e5d81001 	ldrb	r1, [r8, #1]
    afe4:	e2513004 	subs	r3, r1, #4
    afe8:	e1a00001 	mov	r0, r1
    afec:	13a03001 	movne	r3, #1
    aff0:	e5843038 	str	r3, [r4, #56]	; 0x38
    aff4:	e3560001 	cmp	r6, #1
    aff8:	e594301c 	ldr	r3, [r4, #28]
    affc:	e6931001 	ldr	r1, [r3], r1
    b000:	e584301c 	str	r3, [r4, #28]
    b004:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    b008:	e0433000 	sub	r3, r3, r0
    b00c:	e1c33fc3 	bic	r3, r3, r3, asr #31
    b010:	e5843028 	str	r3, [r4, #40]	; 0x28
    b014:	e5d83002 	ldrb	r3, [r8, #2]
    b018:	e7831002 	str	r1, [r3, r2]
    b01c:	0a0000c5 	beq	b338 <XQspiPs_PolledTransfer+0x44c>
    b020:	e1a00004 	mov	r0, r4
    b024:	ebfffd59 	bl	a590 <XQspiPs_GetOptions>
    b028:	e5946028 	ldr	r6, [r4, #40]	; 0x28
    b02c:	e2005020 	and	r5, r0, #32
    b030:	e3560000 	cmp	r6, #0
    b034:	da00007c 	ble	b22c <XQspiPs_PolledTransfer+0x340>
    b038:	e5940004 	ldr	r0, [r4, #4]
    b03c:	e1e07f06 	mvn	r7, r6, lsl #30
    b040:	e246c001 	sub	ip, r6, #1
    b044:	e5943020 	ldr	r3, [r4, #32]
    b048:	e3ccc003 	bic	ip, ip, #3
    b04c:	e2461004 	sub	r1, r6, #4
    b050:	e594e024 	ldr	lr, [r4, #36]	; 0x24
    b054:	e1e07f27 	mvn	r7, r7, lsr #30
    b058:	e24690f8 	sub	r9, r6, #248	; 0xf8
    b05c:	e041c00c 	sub	ip, r1, ip
    b060:	e280801c 	add	r8, r0, #28
    b064:	e3a02001 	mov	r2, #1
    b068:	e3e0a000 	mvn	sl, #0
    b06c:	ea000005 	b	b088 <XQspiPs_PolledTransfer+0x19c>
    b070:	e151000c 	cmp	r1, ip
    b074:	e5841028 	str	r1, [r4, #40]	; 0x28
    b078:	0a000085 	beq	b294 <XQspiPs_PolledTransfer+0x3a8>
    b07c:	e1510009 	cmp	r1, r9
    b080:	0a0000a9 	beq	b32c <XQspiPs_PolledTransfer+0x440>
    b084:	e2411004 	sub	r1, r1, #4
    b088:	e3530000 	cmp	r3, #0
    b08c:	e04e6006 	sub	r6, lr, r6
    b090:	0a000002 	beq	b0a0 <XQspiPs_PolledTransfer+0x1b4>
    b094:	e3560004 	cmp	r6, #4
    b098:	c588a000 	strgt	sl, [r8]
    b09c:	ca000003 	bgt	b0b0 <XQspiPs_PolledTransfer+0x1c4>
    b0a0:	e594601c 	ldr	r6, [r4, #28]
    b0a4:	e496b004 	ldr	fp, [r6], #4
    b0a8:	e588b000 	str	fp, [r8]
    b0ac:	e584601c 	str	r6, [r4, #28]
    b0b0:	e1510007 	cmp	r1, r7
    b0b4:	e2822001 	add	r2, r2, #1
    b0b8:	e6ef2072 	uxtb	r2, r2
    b0bc:	e1a06001 	mov	r6, r1
    b0c0:	1affffea 	bne	b070 <XQspiPs_PolledTransfer+0x184>
    b0c4:	e3a03000 	mov	r3, #0
    b0c8:	e5843028 	str	r3, [r4, #40]	; 0x28
    b0cc:	e35e0000 	cmp	lr, #0
    b0d0:	da00005c 	ble	b248 <XQspiPs_PolledTransfer+0x35c>
    b0d4:	e5940004 	ldr	r0, [r4, #4]
    b0d8:	e3550000 	cmp	r5, #0
    b0dc:	e2802004 	add	r2, r0, #4
    b0e0:	15903000 	ldrne	r3, [r0]
    b0e4:	13833801 	orrne	r3, r3, #65536	; 0x10000
    b0e8:	15803000 	strne	r3, [r0]
    b0ec:	e5923000 	ldr	r3, [r2]
    b0f0:	e3130014 	tst	r3, #20
    b0f4:	0afffffc 	beq	b0ec <XQspiPs_PolledTransfer+0x200>
    b0f8:	e25e2000 	subs	r2, lr, #0
    b0fc:	da00004c 	ble	b234 <XQspiPs_PolledTransfer+0x348>
    b100:	e3a06000 	mov	r6, #0
    b104:	ea00000c 	b	b13c <XQspiPs_PolledTransfer+0x250>
    b108:	e3520003 	cmp	r2, #3
    b10c:	e5911000 	ldr	r1, [r1]
    b110:	da00001a 	ble	b180 <XQspiPs_PolledTransfer+0x294>
    b114:	e2422004 	sub	r2, r2, #4
    b118:	e4831004 	str	r1, [r3], #4
    b11c:	e5842024 	str	r2, [r4, #36]	; 0x24
    b120:	e5843020 	str	r3, [r4, #32]
    b124:	e3560020 	cmp	r6, #32
    b128:	13520000 	cmpne	r2, #0
    b12c:	c3a01001 	movgt	r1, #1
    b130:	d3a01000 	movle	r1, #0
    b134:	da000016 	ble	b194 <XQspiPs_PolledTransfer+0x2a8>
    b138:	e5940004 	ldr	r0, [r4, #4]
    b13c:	e5943020 	ldr	r3, [r4, #32]
    b140:	e2801020 	add	r1, r0, #32
    b144:	e2866001 	add	r6, r6, #1
    b148:	e3530000 	cmp	r3, #0
    b14c:	1affffed 	bne	b108 <XQspiPs_PolledTransfer+0x21c>
    b150:	e2422004 	sub	r2, r2, #4
    b154:	e5903020 	ldr	r3, [r0, #32]
    b158:	e5842024 	str	r2, [r4, #36]	; 0x24
    b15c:	eafffff0 	b	b124 <XQspiPs_PolledTransfer+0x238>
    b160:	e59f02a0 	ldr	r0, [pc, #672]	; b408 <XQspiPs_PolledTransfer+0x51c>
    b164:	e30012d6 	movw	r1, #726	; 0x2d6
    b168:	eb000e41 	bl	ea74 <Xil_Assert>
    b16c:	e3a03001 	mov	r3, #1
    b170:	e5853000 	str	r3, [r5]
    b174:	e3a00000 	mov	r0, #0
    b178:	e28dd00c 	add	sp, sp, #12
    b17c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b180:	e6ef2072 	uxtb	r2, r2
    b184:	e1a00004 	mov	r0, r4
    b188:	ebfffdc9 	bl	a8b4 <XQspiPs_GetReadData>
    b18c:	e5942024 	ldr	r2, [r4, #36]	; 0x24
    b190:	eaffffe3 	b	b124 <XQspiPs_PolledTransfer+0x238>
    b194:	e594c028 	ldr	ip, [r4, #40]	; 0x28
    b198:	e35c0000 	cmp	ip, #0
    b19c:	da000022 	ble	b22c <XQspiPs_PolledTransfer+0x340>
    b1a0:	e5940004 	ldr	r0, [r4, #4]
    b1a4:	e1a02001 	mov	r2, r1
    b1a8:	e5943020 	ldr	r3, [r4, #32]
    b1ac:	e594e024 	ldr	lr, [r4, #36]	; 0x24
    b1b0:	e1e06f0c 	mvn	r6, ip, lsl #30
    b1b4:	e280701c 	add	r7, r0, #28
    b1b8:	e3e08000 	mvn	r8, #0
    b1bc:	e1e06f26 	mvn	r6, r6, lsr #30
    b1c0:	ea000007 	b	b1e4 <XQspiPs_PolledTransfer+0x2f8>
    b1c4:	e352001f 	cmp	r2, #31
    b1c8:	e584c028 	str	ip, [r4, #40]	; 0x28
    b1cc:	83a01000 	movhi	r1, #0
    b1d0:	93a01001 	movls	r1, #1
    b1d4:	e35c0000 	cmp	ip, #0
    b1d8:	d3a01000 	movle	r1, #0
    b1dc:	e3510000 	cmp	r1, #0
    b1e0:	0affffbc 	beq	b0d8 <XQspiPs_PolledTransfer+0x1ec>
    b1e4:	e3530000 	cmp	r3, #0
    b1e8:	e04e100c 	sub	r1, lr, ip
    b1ec:	0a000002 	beq	b1fc <XQspiPs_PolledTransfer+0x310>
    b1f0:	e3510004 	cmp	r1, #4
    b1f4:	c5878000 	strgt	r8, [r7]
    b1f8:	ca000003 	bgt	b20c <XQspiPs_PolledTransfer+0x320>
    b1fc:	e594101c 	ldr	r1, [r4, #28]
    b200:	e4919004 	ldr	r9, [r1], #4
    b204:	e5879000 	str	r9, [r7]
    b208:	e584101c 	str	r1, [r4, #28]
    b20c:	e24cc004 	sub	ip, ip, #4
    b210:	e2822001 	add	r2, r2, #1
    b214:	e15c0006 	cmp	ip, r6
    b218:	e6ef2072 	uxtb	r2, r2
    b21c:	1affffe8 	bne	b1c4 <XQspiPs_PolledTransfer+0x2d8>
    b220:	e3a03000 	mov	r3, #0
    b224:	e5843028 	str	r3, [r4, #40]	; 0x28
    b228:	eaffffaa 	b	b0d8 <XQspiPs_PolledTransfer+0x1ec>
    b22c:	e594e024 	ldr	lr, [r4, #36]	; 0x24
    b230:	eaffffa5 	b	b0cc <XQspiPs_PolledTransfer+0x1e0>
    b234:	e594c028 	ldr	ip, [r4, #40]	; 0x28
    b238:	e35c0000 	cmp	ip, #0
    b23c:	c5943020 	ldrgt	r3, [r4, #32]
    b240:	c3a02000 	movgt	r2, #0
    b244:	caffffd9 	bgt	b1b0 <XQspiPs_PolledTransfer+0x2c4>
    b248:	e1a00004 	mov	r0, r4
    b24c:	ebfffccf 	bl	a590 <XQspiPs_GetOptions>
    b250:	e5943004 	ldr	r3, [r4, #4]
    b254:	e3100010 	tst	r0, #16
    b258:	e3a01001 	mov	r1, #1
    b25c:	15932000 	ldrne	r2, [r3]
    b260:	13822b01 	orrne	r2, r2, #1024	; 0x400
    b264:	15832000 	strne	r2, [r3]
    b268:	e3a02000 	mov	r2, #0
    b26c:	e584202c 	str	r2, [r4, #44]	; 0x2c
    b270:	e5832014 	str	r2, [r3, #20]
    b274:	e583102c 	str	r1, [r3, #44]	; 0x2c
    b278:	eaffffbd 	b	b174 <XQspiPs_PolledTransfer+0x288>
    b27c:	e59f0184 	ldr	r0, [pc, #388]	; b408 <XQspiPs_PolledTransfer+0x51c>
    b280:	e30012d5 	movw	r1, #725	; 0x2d5
    b284:	eb000dfa 	bl	ea74 <Xil_Assert>
    b288:	e3a03001 	mov	r3, #1
    b28c:	e5853000 	str	r3, [r5]
    b290:	eaffffb7 	b	b174 <XQspiPs_PolledTransfer+0x288>
    b294:	e35c0000 	cmp	ip, #0
    b298:	daffff8b 	ble	b0cc <XQspiPs_PolledTransfer+0x1e0>
    b29c:	e352001f 	cmp	r2, #31
    b2a0:	8affff8c 	bhi	b0d8 <XQspiPs_PolledTransfer+0x1ec>
    b2a4:	eaffffc1 	b	b1b0 <XQspiPs_PolledTransfer+0x2c4>
    b2a8:	e2061003 	and	r1, r6, #3
    b2ac:	e3510002 	cmp	r1, #2
    b2b0:	0a00004a 	beq	b3e0 <XQspiPs_PolledTransfer+0x4f4>
    b2b4:	e3510003 	cmp	r1, #3
    b2b8:	0a00003e 	beq	b3b8 <XQspiPs_PolledTransfer+0x4cc>
    b2bc:	e1510003 	cmp	r1, r3
    b2c0:	0a000028 	beq	b368 <XQspiPs_PolledTransfer+0x47c>
    b2c4:	e3a0301c 	mov	r3, #28
    b2c8:	e3a00004 	mov	r0, #4
    b2cc:	e5cd3002 	strb	r3, [sp, #2]
    b2d0:	e3a03000 	mov	r3, #0
    b2d4:	e1a01000 	mov	r1, r0
    b2d8:	e1a0800d 	mov	r8, sp
    b2dc:	e1a06003 	mov	r6, r3
    b2e0:	e5cd7000 	strb	r7, [sp]
    b2e4:	e5cd0001 	strb	r0, [sp, #1]
    b2e8:	eaffff40 	b	aff0 <XQspiPs_PolledTransfer+0x104>
    b2ec:	e3a00015 	mov	r0, #21
    b2f0:	eaffffa0 	b	b178 <XQspiPs_PolledTransfer+0x28c>
    b2f4:	e59f010c 	ldr	r0, [pc, #268]	; b408 <XQspiPs_PolledTransfer+0x51c>
    b2f8:	e30012d3 	movw	r1, #723	; 0x2d3
    b2fc:	eb000ddc 	bl	ea74 <Xil_Assert>
    b300:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    b304:	e3a02001 	mov	r2, #1
    b308:	e3403001 	movt	r3, #1
    b30c:	e5832000 	str	r2, [r3]
    b310:	eaffff97 	b	b174 <XQspiPs_PolledTransfer+0x288>
    b314:	e59f00ec 	ldr	r0, [pc, #236]	; b408 <XQspiPs_PolledTransfer+0x51c>
    b318:	e3a01fb5 	mov	r1, #724	; 0x2d4
    b31c:	eb000dd4 	bl	ea74 <Xil_Assert>
    b320:	e3a03001 	mov	r3, #1
    b324:	e5853000 	str	r3, [r5]
    b328:	eaffff91 	b	b174 <XQspiPs_PolledTransfer+0x288>
    b32c:	e3510000 	cmp	r1, #0
    b330:	caffff68 	bgt	b0d8 <XQspiPs_PolledTransfer+0x1ec>
    b334:	eaffff64 	b	b0cc <XQspiPs_PolledTransfer+0x1e0>
    b338:	e1a00004 	mov	r0, r4
    b33c:	ebfffc93 	bl	a590 <XQspiPs_GetOptions>
    b340:	e5942004 	ldr	r2, [r4, #4]
    b344:	e3100020 	tst	r0, #32
    b348:	15923000 	ldrne	r3, [r2]
    b34c:	e2822004 	add	r2, r2, #4
    b350:	13833801 	orrne	r3, r3, #65536	; 0x10000
    b354:	15023004 	strne	r3, [r2, #-4]
    b358:	e5923000 	ldr	r3, [r2]
    b35c:	e3130004 	tst	r3, #4
    b360:	0afffffc 	beq	b358 <XQspiPs_PolledTransfer+0x46c>
    b364:	eaffff2d 	b	b020 <XQspiPs_PolledTransfer+0x134>
    b368:	e3560004 	cmp	r6, #4
    b36c:	e3e0307f 	mvn	r3, #127	; 0x7f
    b370:	e5cd3002 	strb	r3, [sp, #2]
    b374:	93a06000 	movls	r6, #0
    b378:	83a06001 	movhi	r6, #1
    b37c:	e1a03001 	mov	r3, r1
    b380:	e1a00001 	mov	r0, r1
    b384:	e1a0800d 	mov	r8, sp
    b388:	e5cd7000 	strb	r7, [sp]
    b38c:	e5cd1001 	strb	r1, [sp, #1]
    b390:	eaffff16 	b	aff0 <XQspiPs_PolledTransfer+0x104>
    b394:	e3083803 	movw	r3, #34819	; 0x8803
    b398:	e3a06000 	mov	r6, #0
    b39c:	e34f3fff 	movt	r3, #65535	; 0xffff
    b3a0:	e1c830b1 	strh	r3, [r8, #1]
    b3a4:	e5d81001 	ldrb	r1, [r8, #1]
    b3a8:	e2513004 	subs	r3, r1, #4
    b3ac:	e1a00001 	mov	r0, r1
    b3b0:	13a03001 	movne	r3, #1
    b3b4:	eaffff0d 	b	aff0 <XQspiPs_PolledTransfer+0x104>
    b3b8:	e3560004 	cmp	r6, #4
    b3bc:	e3e00077 	mvn	r0, #119	; 0x77
    b3c0:	e5cd0002 	strb	r0, [sp, #2]
    b3c4:	93a06000 	movls	r6, #0
    b3c8:	83a06001 	movhi	r6, #1
    b3cc:	e1a00001 	mov	r0, r1
    b3d0:	e1a0800d 	mov	r8, sp
    b3d4:	e5cd7000 	strb	r7, [sp]
    b3d8:	e5cd1001 	strb	r1, [sp, #1]
    b3dc:	eaffff03 	b	aff0 <XQspiPs_PolledTransfer+0x104>
    b3e0:	e3560004 	cmp	r6, #4
    b3e4:	e3e0007b 	mvn	r0, #123	; 0x7b
    b3e8:	e5cd0002 	strb	r0, [sp, #2]
    b3ec:	93a06000 	movls	r6, #0
    b3f0:	83a06001 	movhi	r6, #1
    b3f4:	e1a00001 	mov	r0, r1
    b3f8:	e1a0800d 	mov	r8, sp
    b3fc:	e5cd7000 	strb	r7, [sp]
    b400:	e5cd1001 	strb	r1, [sp, #1]
    b404:	eafffef9 	b	aff0 <XQspiPs_PolledTransfer+0x104>
    b408:	000122bc 	.word	0x000122bc

0000b40c <XQspiPs_LqspiRead>:
    b40c:	e92d4070 	push	{r4, r5, r6, lr}
    b410:	e2505000 	subs	r5, r0, #0
    b414:	0a00002e 	beq	b4d4 <XQspiPs_LqspiRead+0xc8>
    b418:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    b41c:	e3510000 	cmp	r1, #0
    b420:	e3404001 	movt	r4, #1
    b424:	e3a06000 	mov	r6, #0
    b428:	e1a0c001 	mov	ip, r1
    b42c:	e5846000 	str	r6, [r4]
    b430:	0a00002f 	beq	b4f4 <XQspiPs_LqspiRead+0xe8>
    b434:	e3530000 	cmp	r3, #0
    b438:	0a000016 	beq	b498 <XQspiPs_LqspiRead+0x8c>
    b43c:	e5950018 	ldr	r0, [r5, #24]
    b440:	e1a01002 	mov	r1, r2
    b444:	e3012111 	movw	r2, #4369	; 0x1111
    b448:	e3412111 	movt	r2, #4369	; 0x1111
    b44c:	e1500002 	cmp	r0, r2
    b450:	1a000009 	bne	b47c <XQspiPs_LqspiRead+0x70>
    b454:	e5952004 	ldr	r2, [r5, #4]
    b458:	e3a00001 	mov	r0, #1
    b45c:	e5820014 	str	r0, [r2, #20]
    b460:	e2822014 	add	r2, r2, #20
    b464:	e592e08c 	ldr	lr, [r2, #140]	; 0x8c
    b468:	e35e0000 	cmp	lr, #0
    b46c:	ba000010 	blt	b4b4 <XQspiPs_LqspiRead+0xa8>
    b470:	e3a03000 	mov	r3, #0
    b474:	e5823000 	str	r3, [r2]
    b478:	e8bd8070 	pop	{r4, r5, r6, pc}
    b47c:	e59f0088 	ldr	r0, [pc, #136]	; b50c <XQspiPs_LqspiRead+0x100>
    b480:	e3001447 	movw	r1, #1095	; 0x447
    b484:	eb000d7a 	bl	ea74 <Xil_Assert>
    b488:	e3a03001 	mov	r3, #1
    b48c:	e5843000 	str	r3, [r4]
    b490:	e3a00000 	mov	r0, #0
    b494:	e8bd8070 	pop	{r4, r5, r6, pc}
    b498:	e59f006c 	ldr	r0, [pc, #108]	; b50c <XQspiPs_LqspiRead+0x100>
    b49c:	e3001446 	movw	r1, #1094	; 0x446
    b4a0:	eb000d73 	bl	ea74 <Xil_Assert>
    b4a4:	e3a03001 	mov	r3, #1
    b4a8:	e3a00000 	mov	r0, #0
    b4ac:	e5843000 	str	r3, [r4]
    b4b0:	e8bd8070 	pop	{r4, r5, r6, pc}
    b4b4:	e1a02003 	mov	r2, r3
    b4b8:	e281133f 	add	r1, r1, #-67108864	; 0xfc000000
    b4bc:	e1a0000c 	mov	r0, ip
    b4c0:	eb00183e 	bl	115c0 <memcpy>
    b4c4:	e5952004 	ldr	r2, [r5, #4]
    b4c8:	e1a00006 	mov	r0, r6
    b4cc:	e2822014 	add	r2, r2, #20
    b4d0:	eaffffe6 	b	b470 <XQspiPs_LqspiRead+0x64>
    b4d4:	e59f0030 	ldr	r0, [pc, #48]	; b50c <XQspiPs_LqspiRead+0x100>
    b4d8:	e3001444 	movw	r1, #1092	; 0x444
    b4dc:	eb000d64 	bl	ea74 <Xil_Assert>
    b4e0:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    b4e4:	e3a02001 	mov	r2, #1
    b4e8:	e3403001 	movt	r3, #1
    b4ec:	e5832000 	str	r2, [r3]
    b4f0:	eaffffe6 	b	b490 <XQspiPs_LqspiRead+0x84>
    b4f4:	e59f0010 	ldr	r0, [pc, #16]	; b50c <XQspiPs_LqspiRead+0x100>
    b4f8:	e3001445 	movw	r1, #1093	; 0x445
    b4fc:	eb000d5c 	bl	ea74 <Xil_Assert>
    b500:	e3a03001 	mov	r3, #1
    b504:	e5843000 	str	r3, [r4]
    b508:	eaffffe0 	b	b490 <XQspiPs_LqspiRead+0x84>
    b50c:	000122bc 	.word	0x000122bc

0000b510 <XQspiPs_SetSlaveSelect>:
    b510:	e3500000 	cmp	r0, #0
    b514:	e92d4010 	push	{r4, lr}
    b518:	0a00001a 	beq	b588 <XQspiPs_SetSlaveSelect+0x78>
    b51c:	e5901018 	ldr	r1, [r0, #24]
    b520:	e3013111 	movw	r3, #4369	; 0x1111
    b524:	e3413111 	movt	r3, #4369	; 0x1111
    b528:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    b52c:	e3404001 	movt	r4, #1
    b530:	e3a02000 	mov	r2, #0
    b534:	e1510003 	cmp	r1, r3
    b538:	e5842000 	str	r2, [r4]
    b53c:	1a000008 	bne	b564 <XQspiPs_SetSlaveSelect+0x54>
    b540:	e590302c 	ldr	r3, [r0, #44]	; 0x2c
    b544:	e3530000 	cmp	r3, #0
    b548:	1a00000c 	bne	b580 <XQspiPs_SetSlaveSelect+0x70>
    b54c:	e5902004 	ldr	r2, [r0, #4]
    b550:	e5923000 	ldr	r3, [r2]
    b554:	e3c33b01 	bic	r3, r3, #1024	; 0x400
    b558:	e5823000 	str	r3, [r2]
    b55c:	e3a00000 	mov	r0, #0
    b560:	e8bd8010 	pop	{r4, pc}
    b564:	e59f003c 	ldr	r0, [pc, #60]	; b5a8 <XQspiPs_SetSlaveSelect+0x98>
    b568:	e300147e 	movw	r1, #1150	; 0x47e
    b56c:	eb000d40 	bl	ea74 <Xil_Assert>
    b570:	e3a03001 	mov	r3, #1
    b574:	e3a00000 	mov	r0, #0
    b578:	e5843000 	str	r3, [r4]
    b57c:	e8bd8010 	pop	{r4, pc}
    b580:	e3a00015 	mov	r0, #21
    b584:	e8bd8010 	pop	{r4, pc}
    b588:	e59f0018 	ldr	r0, [pc, #24]	; b5a8 <XQspiPs_SetSlaveSelect+0x98>
    b58c:	e300147d 	movw	r1, #1149	; 0x47d
    b590:	eb000d37 	bl	ea74 <Xil_Assert>
    b594:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    b598:	e3a02001 	mov	r2, #1
    b59c:	e3403001 	movt	r3, #1
    b5a0:	e5832000 	str	r2, [r3]
    b5a4:	eaffffec 	b	b55c <XQspiPs_SetSlaveSelect+0x4c>
    b5a8:	000122bc 	.word	0x000122bc

0000b5ac <XQspiPs_SetStatusHandler>:
    b5ac:	e3500000 	cmp	r0, #0
    b5b0:	e92d4010 	push	{r4, lr}
    b5b4:	0a000013 	beq	b608 <XQspiPs_SetStatusHandler+0x5c>
    b5b8:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    b5bc:	e3520000 	cmp	r2, #0
    b5c0:	e3404001 	movt	r4, #1
    b5c4:	e3a03000 	mov	r3, #0
    b5c8:	e5843000 	str	r3, [r4]
    b5cc:	0a000015 	beq	b628 <XQspiPs_SetStatusHandler+0x7c>
    b5d0:	e590c018 	ldr	ip, [r0, #24]
    b5d4:	e3013111 	movw	r3, #4369	; 0x1111
    b5d8:	e3413111 	movt	r3, #4369	; 0x1111
    b5dc:	e15c0003 	cmp	ip, r3
    b5e0:	1a000002 	bne	b5f0 <XQspiPs_SetStatusHandler+0x44>
    b5e4:	e5802030 	str	r2, [r0, #48]	; 0x30
    b5e8:	e5801034 	str	r1, [r0, #52]	; 0x34
    b5ec:	e8bd8010 	pop	{r4, pc}
    b5f0:	e59f0048 	ldr	r0, [pc, #72]	; b640 <XQspiPs_SetStatusHandler+0x94>
    b5f4:	e30014be 	movw	r1, #1214	; 0x4be
    b5f8:	eb000d1d 	bl	ea74 <Xil_Assert>
    b5fc:	e3a03001 	mov	r3, #1
    b600:	e5843000 	str	r3, [r4]
    b604:	e8bd8010 	pop	{r4, pc}
    b608:	e59f0030 	ldr	r0, [pc, #48]	; b640 <XQspiPs_SetStatusHandler+0x94>
    b60c:	e30014bc 	movw	r1, #1212	; 0x4bc
    b610:	eb000d17 	bl	ea74 <Xil_Assert>
    b614:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    b618:	e3a02001 	mov	r2, #1
    b61c:	e3403001 	movt	r3, #1
    b620:	e5832000 	str	r2, [r3]
    b624:	e8bd8010 	pop	{r4, pc}
    b628:	e59f0010 	ldr	r0, [pc, #16]	; b640 <XQspiPs_SetStatusHandler+0x94>
    b62c:	e30014bd 	movw	r1, #1213	; 0x4bd
    b630:	eb000d0f 	bl	ea74 <Xil_Assert>
    b634:	e3a03001 	mov	r3, #1
    b638:	e5843000 	str	r3, [r4]
    b63c:	e8bd8010 	pop	{r4, pc}
    b640:	000122bc 	.word	0x000122bc

0000b644 <XQspiPs_InterruptHandler>:
    b644:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    b648:	e2504000 	subs	r4, r0, #0
    b64c:	0a0000b2 	beq	b91c <XQspiPs_InterruptHandler+0x2d8>
    b650:	e5941018 	ldr	r1, [r4, #24]
    b654:	e3013111 	movw	r3, #4369	; 0x1111
    b658:	e3413111 	movt	r3, #4369	; 0x1111
    b65c:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    b660:	e3405001 	movt	r5, #1
    b664:	e3a02000 	mov	r2, #0
    b668:	e1510003 	cmp	r1, r3
    b66c:	e5852000 	str	r2, [r5]
    b670:	1a000074 	bne	b848 <XQspiPs_InterruptHandler+0x204>
    b674:	e594c004 	ldr	ip, [r4, #4]
    b678:	e3a03055 	mov	r3, #85	; 0x55
    b67c:	e59c6004 	ldr	r6, [ip, #4]
    b680:	e3160014 	tst	r6, #20
    b684:	e2062041 	and	r2, r6, #65	; 0x41
    b688:	e58c2004 	str	r2, [ip, #4]
    b68c:	e58c300c 	str	r3, [ip, #12]
    b690:	0a00004c 	beq	b7c8 <XQspiPs_InterruptHandler+0x184>
    b694:	e1c422d4 	ldrd	r2, [r4, #36]	; 0x24
    b698:	e0427003 	sub	r7, r2, r3
    b69c:	e3170003 	tst	r7, #3
    b6a0:	e1a07127 	lsr	r7, r7, #2
    b6a4:	12877001 	addne	r7, r7, #1
    b6a8:	0a000084 	beq	b8c0 <XQspiPs_InterruptHandler+0x27c>
    b6ac:	e3a05000 	mov	r5, #0
    b6b0:	ea00000e 	b	b6f0 <XQspiPs_InterruptHandler+0xac>
    b6b4:	e3520003 	cmp	r2, #3
    b6b8:	da00005c 	ble	b830 <XQspiPs_InterruptHandler+0x1ec>
    b6bc:	e5903000 	ldr	r3, [r0]
    b6c0:	e4813004 	str	r3, [r1], #4
    b6c4:	e584e024 	str	lr, [r4, #36]	; 0x24
    b6c8:	e5841020 	str	r1, [r4, #32]
    b6cc:	e2855001 	add	r5, r5, #1
    b6d0:	e1570005 	cmp	r7, r5
    b6d4:	83a03001 	movhi	r3, #1
    b6d8:	93a03000 	movls	r3, #0
    b6dc:	e355001f 	cmp	r5, #31
    b6e0:	83a03000 	movhi	r3, #0
    b6e4:	e3530000 	cmp	r3, #0
    b6e8:	0a00000b 	beq	b71c <XQspiPs_InterruptHandler+0xd8>
    b6ec:	e5942024 	ldr	r2, [r4, #36]	; 0x24
    b6f0:	e5943020 	ldr	r3, [r4, #32]
    b6f4:	e242e004 	sub	lr, r2, #4
    b6f8:	e28c0020 	add	r0, ip, #32
    b6fc:	e3530000 	cmp	r3, #0
    b700:	e1a01003 	mov	r1, r3
    b704:	1affffea 	bne	b6b4 <XQspiPs_InterruptHandler+0x70>
    b708:	e2522004 	subs	r2, r2, #4
    b70c:	e59c1020 	ldr	r1, [ip, #32]
    b710:	51a03002 	movpl	r3, r2
    b714:	e5843024 	str	r3, [r4, #36]	; 0x24
    b718:	eaffffeb 	b	b6cc <XQspiPs_InterruptHandler+0x88>
    b71c:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    b720:	e3530000 	cmp	r3, #0
    b724:	da000084 	ble	b93c <XQspiPs_InterruptHandler+0x2f8>
    b728:	e1e0ef03 	mvn	lr, r3, lsl #30
    b72c:	e5945020 	ldr	r5, [r4, #32]
    b730:	e3a02000 	mov	r2, #0
    b734:	e1e0ef2e 	mvn	lr, lr, lsr #30
    b738:	e28c701c 	add	r7, ip, #28
    b73c:	e3e08000 	mvn	r8, #0
    b740:	ea000003 	b	b754 <XQspiPs_InterruptHandler+0x110>
    b744:	e3520020 	cmp	r2, #32
    b748:	13530000 	cmpne	r3, #0
    b74c:	e5843028 	str	r3, [r4, #40]	; 0x28
    b750:	da000079 	ble	b93c <XQspiPs_InterruptHandler+0x2f8>
    b754:	e3550000 	cmp	r5, #0
    b758:	0a000004 	beq	b770 <XQspiPs_InterruptHandler+0x12c>
    b75c:	e5941024 	ldr	r1, [r4, #36]	; 0x24
    b760:	e0411003 	sub	r1, r1, r3
    b764:	e3510004 	cmp	r1, #4
    b768:	c5878000 	strgt	r8, [r7]
    b76c:	ca000003 	bgt	b780 <XQspiPs_InterruptHandler+0x13c>
    b770:	e594101c 	ldr	r1, [r4, #28]
    b774:	e4910004 	ldr	r0, [r1], #4
    b778:	e5870000 	str	r0, [r7]
    b77c:	e584101c 	str	r1, [r4, #28]
    b780:	e2433004 	sub	r3, r3, #4
    b784:	e2822001 	add	r2, r2, #1
    b788:	e153000e 	cmp	r3, lr
    b78c:	1affffec 	bne	b744 <XQspiPs_InterruptHandler+0x100>
    b790:	e3a03000 	mov	r3, #0
    b794:	e5843028 	str	r3, [r4, #40]	; 0x28
    b798:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    b79c:	e3530000 	cmp	r3, #0
    b7a0:	0a000049 	beq	b8cc <XQspiPs_InterruptHandler+0x288>
    b7a4:	e3a03055 	mov	r3, #85	; 0x55
    b7a8:	e1a00004 	mov	r0, r4
    b7ac:	e58c3008 	str	r3, [ip, #8]
    b7b0:	ebfffb76 	bl	a590 <XQspiPs_GetOptions>
    b7b4:	e3100020 	tst	r0, #32
    b7b8:	15942004 	ldrne	r2, [r4, #4]
    b7bc:	15923000 	ldrne	r3, [r2]
    b7c0:	13833801 	orrne	r3, r3, #65536	; 0x10000
    b7c4:	15823000 	strne	r3, [r2]
    b7c8:	e3160001 	tst	r6, #1
    b7cc:	1a000023 	bne	b860 <XQspiPs_InterruptHandler+0x21c>
    b7d0:	e3160040 	tst	r6, #64	; 0x40
    b7d4:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    b7d8:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    b7dc:	e3a02000 	mov	r2, #0
    b7e0:	e5945024 	ldr	r5, [r4, #36]	; 0x24
    b7e4:	e1a00004 	mov	r0, r4
    b7e8:	e584202c 	str	r2, [r4, #44]	; 0x2c
    b7ec:	e0455003 	sub	r5, r5, r3
    b7f0:	ebfffb66 	bl	a590 <XQspiPs_GetOptions>
    b7f4:	e5943004 	ldr	r3, [r4, #4]
    b7f8:	e3100010 	tst	r0, #16
    b7fc:	e3a01001 	mov	r1, #1
    b800:	e5940034 	ldr	r0, [r4, #52]	; 0x34
    b804:	15932000 	ldrne	r2, [r3]
    b808:	13822b01 	orrne	r2, r2, #1024	; 0x400
    b80c:	15832000 	strne	r2, [r3]
    b810:	e3a02000 	mov	r2, #0
    b814:	e5832014 	str	r2, [r3, #20]
    b818:	e1a02005 	mov	r2, r5
    b81c:	e583102c 	str	r1, [r3, #44]	; 0x2c
    b820:	e3001481 	movw	r1, #1153	; 0x481
    b824:	e5943030 	ldr	r3, [r4, #48]	; 0x30
    b828:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    b82c:	e12fff13 	bx	r3
    b830:	e5901000 	ldr	r1, [r0]
    b834:	e6ef2072 	uxtb	r2, r2
    b838:	e1a00004 	mov	r0, r4
    b83c:	ebfffc1c 	bl	a8b4 <XQspiPs_GetReadData>
    b840:	e594c004 	ldr	ip, [r4, #4]
    b844:	eaffffa0 	b	b6cc <XQspiPs_InterruptHandler+0x88>
    b848:	e59f00f8 	ldr	r0, [pc, #248]	; b948 <XQspiPs_InterruptHandler+0x304>
    b84c:	e300150c 	movw	r1, #1292	; 0x50c
    b850:	eb000c87 	bl	ea74 <Xil_Assert>
    b854:	e3a03001 	mov	r3, #1
    b858:	e5853000 	str	r3, [r5]
    b85c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    b860:	e5943028 	ldr	r3, [r4, #40]	; 0x28
    b864:	e3a02000 	mov	r2, #0
    b868:	e5945024 	ldr	r5, [r4, #36]	; 0x24
    b86c:	e1a00004 	mov	r0, r4
    b870:	e584202c 	str	r2, [r4, #44]	; 0x2c
    b874:	e0455003 	sub	r5, r5, r3
    b878:	ebfffb44 	bl	a590 <XQspiPs_GetOptions>
    b87c:	e5943004 	ldr	r3, [r4, #4]
    b880:	e3100010 	tst	r0, #16
    b884:	e3a01000 	mov	r1, #0
    b888:	e5940034 	ldr	r0, [r4, #52]	; 0x34
    b88c:	15932000 	ldrne	r2, [r3]
    b890:	13822b01 	orrne	r2, r2, #1024	; 0x400
    b894:	15832000 	strne	r2, [r3]
    b898:	e1a02005 	mov	r2, r5
    b89c:	e5831014 	str	r1, [r3, #20]
    b8a0:	e3a01001 	mov	r1, #1
    b8a4:	e583102c 	str	r1, [r3, #44]	; 0x2c
    b8a8:	e3001482 	movw	r1, #1154	; 0x482
    b8ac:	e5943030 	ldr	r3, [r4, #48]	; 0x30
    b8b0:	e12fff33 	blx	r3
    b8b4:	e3160040 	tst	r6, #64	; 0x40
    b8b8:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    b8bc:	eaffffc5 	b	b7d8 <XQspiPs_InterruptHandler+0x194>
    b8c0:	e3570000 	cmp	r7, #0
    b8c4:	1affff78 	bne	b6ac <XQspiPs_InterruptHandler+0x68>
    b8c8:	eaffff94 	b	b720 <XQspiPs_InterruptHandler+0xdc>
    b8cc:	e3a03055 	mov	r3, #85	; 0x55
    b8d0:	e1a00004 	mov	r0, r4
    b8d4:	e58c300c 	str	r3, [ip, #12]
    b8d8:	ebfffb2c 	bl	a590 <XQspiPs_GetOptions>
    b8dc:	e5943004 	ldr	r3, [r4, #4]
    b8e0:	e3100010 	tst	r0, #16
    b8e4:	e3a01001 	mov	r1, #1
    b8e8:	e5940034 	ldr	r0, [r4, #52]	; 0x34
    b8ec:	15932000 	ldrne	r2, [r3]
    b8f0:	13822b01 	orrne	r2, r2, #1024	; 0x400
    b8f4:	15832000 	strne	r2, [r3]
    b8f8:	e3a02000 	mov	r2, #0
    b8fc:	e584202c 	str	r2, [r4, #44]	; 0x2c
    b900:	e5832014 	str	r2, [r3, #20]
    b904:	e583102c 	str	r1, [r3, #44]	; 0x2c
    b908:	e3a01d12 	mov	r1, #1152	; 0x480
    b90c:	e5943030 	ldr	r3, [r4, #48]	; 0x30
    b910:	e5942024 	ldr	r2, [r4, #36]	; 0x24
    b914:	e12fff33 	blx	r3
    b918:	eaffffaa 	b	b7c8 <XQspiPs_InterruptHandler+0x184>
    b91c:	e59f0024 	ldr	r0, [pc, #36]	; b948 <XQspiPs_InterruptHandler+0x304>
    b920:	e300150b 	movw	r1, #1291	; 0x50b
    b924:	eb000c52 	bl	ea74 <Xil_Assert>
    b928:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    b92c:	e3a02001 	mov	r2, #1
    b930:	e3403001 	movt	r3, #1
    b934:	e5832000 	str	r2, [r3]
    b938:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    b93c:	e3530000 	cmp	r3, #0
    b940:	1affff97 	bne	b7a4 <XQspiPs_InterruptHandler+0x160>
    b944:	eaffff93 	b	b798 <XQspiPs_InterruptHandler+0x154>
    b948:	000122bc 	.word	0x000122bc

0000b94c <XSdPs_CfgInitialize>:
    b94c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    b950:	e2504000 	subs	r4, r0, #0
    b954:	0a000044 	beq	ba6c <XSdPs_CfgInitialize+0x120>
    b958:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    b95c:	e3510000 	cmp	r1, #0
    b960:	e3405001 	movt	r5, #1
    b964:	e3a03000 	mov	r3, #0
    b968:	e5853000 	str	r3, [r5]
    b96c:	0a000046 	beq	ba8c <XSdPs_CfgInitialize+0x140>
    b970:	e594c044 	ldr	ip, [r4, #68]	; 0x44
    b974:	e3015111 	movw	r5, #4369	; 0x1111
    b978:	e3415111 	movt	r5, #4369	; 0x1111
    b97c:	e15c0005 	cmp	ip, r5
    b980:	0a000037 	beq	ba64 <XSdPs_CfgInitialize+0x118>
    b984:	e591c008 	ldr	ip, [r1, #8]
    b988:	e5842004 	str	r2, [r4, #4]
    b98c:	e584c008 	str	ip, [r4, #8]
    b990:	e591c00c 	ldr	ip, [r1, #12]
    b994:	e584c00c 	str	ip, [r4, #12]
    b998:	e591c010 	ldr	ip, [r1, #16]
    b99c:	e584c010 	str	ip, [r4, #16]
    b9a0:	e591c014 	ldr	ip, [r1, #20]
    b9a4:	e584c014 	str	ip, [r4, #20]
    b9a8:	e591c018 	ldr	ip, [r1, #24]
    b9ac:	e584c018 	str	ip, [r4, #24]
    b9b0:	e591c01c 	ldr	ip, [r1, #28]
    b9b4:	e584c01c 	str	ip, [r4, #28]
    b9b8:	e1d1c2b0 	ldrh	ip, [r1, #32]
    b9bc:	e1c4c2b0 	strh	ip, [r4, #32]
    b9c0:	e591e038 	ldr	lr, [r1, #56]	; 0x38
    b9c4:	e591c03c 	ldr	ip, [r1, #60]	; 0x3c
    b9c8:	e5919028 	ldr	r9, [r1, #40]	; 0x28
    b9cc:	e591802c 	ldr	r8, [r1, #44]	; 0x2c
    b9d0:	e5917030 	ldr	r7, [r1, #48]	; 0x30
    b9d4:	e5916034 	ldr	r6, [r1, #52]	; 0x34
    b9d8:	e5911040 	ldr	r1, [r1, #64]	; 0x40
    b9dc:	e584e038 	str	lr, [r4, #56]	; 0x38
    b9e0:	e584c03c 	str	ip, [r4, #60]	; 0x3c
    b9e4:	e5841040 	str	r1, [r4, #64]	; 0x40
    b9e8:	e3a01006 	mov	r1, #6
    b9ec:	e5843084 	str	r3, [r4, #132]	; 0x84
    b9f0:	e5843090 	str	r3, [r4, #144]	; 0x90
    b9f4:	e584108c 	str	r1, [r4, #140]	; 0x8c
    b9f8:	e5849028 	str	r9, [r4, #40]	; 0x28
    b9fc:	e584802c 	str	r8, [r4, #44]	; 0x2c
    ba00:	e5847030 	str	r7, [r4, #48]	; 0x30
    ba04:	e5846034 	str	r6, [r4, #52]	; 0x34
    ba08:	e5843094 	str	r3, [r4, #148]	; 0x94
    ba0c:	e5c430a8 	strb	r3, [r4, #168]	; 0xa8
    ba10:	e5c430b0 	strb	r3, [r4, #176]	; 0xb0
    ba14:	e58430ac 	str	r3, [r4, #172]	; 0xac
    ba18:	e1d23fbe 	ldrh	r3, [r2, #254]	; 0xfe
    ba1c:	e5c43056 	strb	r3, [r4, #86]	; 0x56
    ba20:	e3a0333e 	mov	r3, #-134217728	; 0xf8000000
    ba24:	e58430a4 	str	r3, [r4, #164]	; 0xa4
    ba28:	e5923040 	ldr	r3, [r2, #64]	; 0x40
    ba2c:	e3a02000 	mov	r2, #0
    ba30:	e5843048 	str	r3, [r4, #72]	; 0x48
    ba34:	e3a03000 	mov	r3, #0
    ba38:	e1c429f8 	strd	r2, [r4, #152]	; 0x98
    ba3c:	eb00030e 	bl	c67c <XSdPs_ResetConfig>
    ba40:	e3500000 	cmp	r0, #0
    ba44:	0a000001 	beq	ba50 <XSdPs_CfgInitialize+0x104>
    ba48:	e3a00001 	mov	r0, #1
    ba4c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    ba50:	e1a00004 	mov	r0, r4
    ba54:	eb000315 	bl	c6b0 <XSdPs_HostConfig>
    ba58:	e5845044 	str	r5, [r4, #68]	; 0x44
    ba5c:	e3a00000 	mov	r0, #0
    ba60:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    ba64:	e3a00005 	mov	r0, #5
    ba68:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    ba6c:	e59f0030 	ldr	r0, [pc, #48]	; baa4 <XSdPs_CfgInitialize+0x158>
    ba70:	e3a01095 	mov	r1, #149	; 0x95
    ba74:	eb000bfe 	bl	ea74 <Xil_Assert>
    ba78:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    ba7c:	e3a02001 	mov	r2, #1
    ba80:	e3403001 	movt	r3, #1
    ba84:	e5832000 	str	r2, [r3]
    ba88:	eafffff3 	b	ba5c <XSdPs_CfgInitialize+0x110>
    ba8c:	e59f0010 	ldr	r0, [pc, #16]	; baa4 <XSdPs_CfgInitialize+0x158>
    ba90:	e3a01096 	mov	r1, #150	; 0x96
    ba94:	eb000bf6 	bl	ea74 <Xil_Assert>
    ba98:	e3a03001 	mov	r3, #1
    ba9c:	e5853000 	str	r3, [r5]
    baa0:	eaffffed 	b	ba5c <XSdPs_CfgInitialize+0x110>
    baa4:	00012342 	.word	0x00012342

0000baa8 <XSdPs_CardInitialize>:
    baa8:	e92d4070 	push	{r4, r5, r6, lr}
    baac:	e2504000 	subs	r4, r0, #0
    bab0:	0a000027 	beq	bb54 <XSdPs_CardInitialize+0xac>
    bab4:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    bab8:	e3013111 	movw	r3, #4369	; 0x1111
    babc:	e3413111 	movt	r3, #4369	; 0x1111
    bac0:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    bac4:	e3405001 	movt	r5, #1
    bac8:	e1520003 	cmp	r2, r3
    bacc:	e3a03000 	mov	r3, #0
    bad0:	e5853000 	str	r3, [r5]
    bad4:	1a000015 	bne	bb30 <XSdPs_CardInitialize+0x88>
    bad8:	e3a01d6a 	mov	r1, #6784	; 0x1a80
    badc:	e3a02001 	mov	r2, #1
    bae0:	e3401006 	movt	r1, #6
    bae4:	e5c42057 	strb	r2, [r4, #87]	; 0x57
    bae8:	e5c42054 	strb	r2, [r4, #84]	; 0x54
    baec:	e5c4305c 	strb	r3, [r4, #92]	; 0x5c
    baf0:	e5841058 	str	r1, [r4, #88]	; 0x58
    baf4:	eb0004cb 	bl	ce28 <XSdPs_Change_ClkFreq>
    baf8:	e3500000 	cmp	r0, #0
    bafc:	1a000012 	bne	bb4c <XSdPs_CardInitialize+0xa4>
    bb00:	e1a00004 	mov	r0, r4
    bb04:	eb00017a 	bl	c0f4 <XSdPs_IdentifyCard>
    bb08:	e3500000 	cmp	r0, #0
    bb0c:	1a00000e 	bne	bb4c <XSdPs_CardInitialize+0xa4>
    bb10:	e5d43054 	ldrb	r3, [r4, #84]	; 0x54
    bb14:	e1a00004 	mov	r0, r4
    bb18:	e3530001 	cmp	r3, #1
    bb1c:	0a000014 	beq	bb74 <XSdPs_CardInitialize+0xcc>
    bb20:	eb0001ad 	bl	c1dc <XSdPs_MmcCardInitialize>
    bb24:	e2500000 	subs	r0, r0, #0
    bb28:	13a00001 	movne	r0, #1
    bb2c:	e8bd8070 	pop	{r4, r5, r6, pc}
    bb30:	e59f004c 	ldr	r0, [pc, #76]	; bb84 <XSdPs_CardInitialize+0xdc>
    bb34:	e3a010f8 	mov	r1, #248	; 0xf8
    bb38:	eb000bcd 	bl	ea74 <Xil_Assert>
    bb3c:	e3a03001 	mov	r3, #1
    bb40:	e5853000 	str	r3, [r5]
    bb44:	e3a00000 	mov	r0, #0
    bb48:	e8bd8070 	pop	{r4, r5, r6, pc}
    bb4c:	e3a00001 	mov	r0, #1
    bb50:	e8bd8070 	pop	{r4, r5, r6, pc}
    bb54:	e59f0028 	ldr	r0, [pc, #40]	; bb84 <XSdPs_CardInitialize+0xdc>
    bb58:	e3a010f7 	mov	r1, #247	; 0xf7
    bb5c:	eb000bc4 	bl	ea74 <Xil_Assert>
    bb60:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bb64:	e3a02001 	mov	r2, #1
    bb68:	e3403001 	movt	r3, #1
    bb6c:	e5832000 	str	r2, [r3]
    bb70:	eafffff3 	b	bb44 <XSdPs_CardInitialize+0x9c>
    bb74:	eb00018a 	bl	c1a4 <XSdPs_SdCardInitialize>
    bb78:	e2500000 	subs	r0, r0, #0
    bb7c:	13a00001 	movne	r0, #1
    bb80:	e8bd8070 	pop	{r4, r5, r6, pc}
    bb84:	00012342 	.word	0x00012342

0000bb88 <XSdPs_ReadPolled>:
    bb88:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    bb8c:	e2505000 	subs	r5, r0, #0
    bb90:	0a00002a 	beq	bc40 <XSdPs_ReadPolled+0xb8>
    bb94:	e1a06003 	mov	r6, r3
    bb98:	e5953044 	ldr	r3, [r5, #68]	; 0x44
    bb9c:	e301c111 	movw	ip, #4369	; 0x1111
    bba0:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    bba4:	e341c111 	movt	ip, #4369	; 0x1111
    bba8:	e3404001 	movt	r4, #1
    bbac:	e153000c 	cmp	r3, ip
    bbb0:	e3a03000 	mov	r3, #0
    bbb4:	e5843000 	str	r3, [r4]
    bbb8:	1a000009 	bne	bbe4 <XSdPs_ReadPolled+0x5c>
    bbbc:	e5d530a8 	ldrb	r3, [r5, #168]	; 0xa8
    bbc0:	e3530001 	cmp	r3, #1
    bbc4:	0a000004 	beq	bbdc <XSdPs_ReadPolled+0x54>
    bbc8:	e1a08001 	mov	r8, r1
    bbcc:	e1a07002 	mov	r7, r2
    bbd0:	eb0007c9 	bl	dafc <XSdPs_SetupTransfer>
    bbd4:	e3500000 	cmp	r0, #0
    bbd8:	0a000008 	beq	bc00 <XSdPs_ReadPolled+0x78>
    bbdc:	e3a00001 	mov	r0, #1
    bbe0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    bbe4:	e59f0074 	ldr	r0, [pc, #116]	; bc60 <XSdPs_ReadPolled+0xd8>
    bbe8:	e300113f 	movw	r1, #319	; 0x13f
    bbec:	eb000ba0 	bl	ea74 <Xil_Assert>
    bbf0:	e3a03001 	mov	r3, #1
    bbf4:	e5843000 	str	r3, [r4]
    bbf8:	e3a00000 	mov	r0, #0
    bbfc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    bc00:	e1a03006 	mov	r3, r6
    bc04:	e1a01008 	mov	r1, r8
    bc08:	e1a02007 	mov	r2, r7
    bc0c:	e1a00005 	mov	r0, r5
    bc10:	eb0000f4 	bl	bfe8 <XSdPs_Read>
    bc14:	e3500000 	cmp	r0, #0
    bc18:	1affffef 	bne	bbdc <XSdPs_ReadPolled+0x54>
    bc1c:	e1a00005 	mov	r0, r5
    bc20:	eb000af9 	bl	e80c <XSdps_CheckTransferDone>
    bc24:	e3500000 	cmp	r0, #0
    bc28:	1affffeb 	bne	bbdc <XSdPs_ReadPolled+0x54>
    bc2c:	e59510ac 	ldr	r1, [r5, #172]	; 0xac
    bc30:	e1a00006 	mov	r0, r6
    bc34:	e0010791 	mul	r1, r1, r7
    bc38:	eb0010d2 	bl	ff88 <Xil_DCacheInvalidateRange>
    bc3c:	eaffffed 	b	bbf8 <XSdPs_ReadPolled+0x70>
    bc40:	e59f0018 	ldr	r0, [pc, #24]	; bc60 <XSdPs_ReadPolled+0xd8>
    bc44:	e300113e 	movw	r1, #318	; 0x13e
    bc48:	eb000b89 	bl	ea74 <Xil_Assert>
    bc4c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bc50:	e3a02001 	mov	r2, #1
    bc54:	e3403001 	movt	r3, #1
    bc58:	e5832000 	str	r2, [r3]
    bc5c:	eaffffe5 	b	bbf8 <XSdPs_ReadPolled+0x70>
    bc60:	00012342 	.word	0x00012342

0000bc64 <XSdPs_WritePolled>:
    bc64:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    bc68:	e2506000 	subs	r6, r0, #0
    bc6c:	0a000026 	beq	bd0c <XSdPs_WritePolled+0xa8>
    bc70:	e1a07002 	mov	r7, r2
    bc74:	e5962044 	ldr	r2, [r6, #68]	; 0x44
    bc78:	e1a05003 	mov	r5, r3
    bc7c:	e3013111 	movw	r3, #4369	; 0x1111
    bc80:	e3413111 	movt	r3, #4369	; 0x1111
    bc84:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    bc88:	e1520003 	cmp	r2, r3
    bc8c:	e3404001 	movt	r4, #1
    bc90:	e3a03000 	mov	r3, #0
    bc94:	e5843000 	str	r3, [r4]
    bc98:	1a000008 	bne	bcc0 <XSdPs_WritePolled+0x5c>
    bc9c:	e5d630a8 	ldrb	r3, [r6, #168]	; 0xa8
    bca0:	e3530001 	cmp	r3, #1
    bca4:	0a000003 	beq	bcb8 <XSdPs_WritePolled+0x54>
    bca8:	e1a08001 	mov	r8, r1
    bcac:	eb000792 	bl	dafc <XSdPs_SetupTransfer>
    bcb0:	e3500000 	cmp	r0, #0
    bcb4:	0a000008 	beq	bcdc <XSdPs_WritePolled+0x78>
    bcb8:	e3a00001 	mov	r0, #1
    bcbc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    bcc0:	e59f0064 	ldr	r0, [pc, #100]	; bd2c <XSdPs_WritePolled+0xc8>
    bcc4:	e3001186 	movw	r1, #390	; 0x186
    bcc8:	eb000b69 	bl	ea74 <Xil_Assert>
    bccc:	e3a03001 	mov	r3, #1
    bcd0:	e5843000 	str	r3, [r4]
    bcd4:	e3a00000 	mov	r0, #0
    bcd8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    bcdc:	e1a03005 	mov	r3, r5
    bce0:	e1a02007 	mov	r2, r7
    bce4:	e1a01008 	mov	r1, r8
    bce8:	e1a00006 	mov	r0, r6
    bcec:	eb0000d4 	bl	c044 <XSdPs_Write>
    bcf0:	e3500000 	cmp	r0, #0
    bcf4:	1affffef 	bne	bcb8 <XSdPs_WritePolled+0x54>
    bcf8:	e1a00006 	mov	r0, r6
    bcfc:	eb000ac2 	bl	e80c <XSdps_CheckTransferDone>
    bd00:	e2500000 	subs	r0, r0, #0
    bd04:	13a00001 	movne	r0, #1
    bd08:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    bd0c:	e59f0018 	ldr	r0, [pc, #24]	; bd2c <XSdPs_WritePolled+0xc8>
    bd10:	e3001185 	movw	r1, #389	; 0x185
    bd14:	eb000b56 	bl	ea74 <Xil_Assert>
    bd18:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bd1c:	e3a02001 	mov	r2, #1
    bd20:	e3403001 	movt	r3, #1
    bd24:	e5832000 	str	r2, [r3]
    bd28:	eaffffe9 	b	bcd4 <XSdPs_WritePolled+0x70>
    bd2c:	00012342 	.word	0x00012342

0000bd30 <XSdPs_Idle>:
    bd30:	e92d4070 	push	{r4, r5, r6, lr}
    bd34:	e2504000 	subs	r4, r0, #0
    bd38:	0a00001d 	beq	bdb4 <XSdPs_Idle+0x84>
    bd3c:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    bd40:	e3013111 	movw	r3, #4369	; 0x1111
    bd44:	e3413111 	movt	r3, #4369	; 0x1111
    bd48:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    bd4c:	e3405001 	movt	r5, #1
    bd50:	e1520003 	cmp	r2, r3
    bd54:	e3a03000 	mov	r3, #0
    bd58:	e5853000 	str	r3, [r5]
    bd5c:	1a000005 	bne	bd78 <XSdPs_Idle+0x48>
    bd60:	e3a01007 	mov	r1, #7
    bd64:	eb000ac3 	bl	e878 <XSdPs_CheckBusIdle>
    bd68:	e3500000 	cmp	r0, #0
    bd6c:	0a000008 	beq	bd94 <XSdPs_Idle+0x64>
    bd70:	e3a00001 	mov	r0, #1
    bd74:	e8bd8070 	pop	{r4, r5, r6, pc}
    bd78:	e59f0054 	ldr	r0, [pc, #84]	; bdd4 <XSdPs_Idle+0xa4>
    bd7c:	e30011bf 	movw	r1, #447	; 0x1bf
    bd80:	eb000b3b 	bl	ea74 <Xil_Assert>
    bd84:	e3a03001 	mov	r3, #1
    bd88:	e5853000 	str	r3, [r5]
    bd8c:	e3a00000 	mov	r0, #0
    bd90:	e8bd8070 	pop	{r4, r5, r6, pc}
    bd94:	e1a00004 	mov	r0, r4
    bd98:	eb000861 	bl	df24 <XSdPs_DisableBusPower>
    bd9c:	e3a01001 	mov	r1, #1
    bda0:	e1a00004 	mov	r0, r4
    bda4:	eb000773 	bl	db78 <XSdPs_Reset>
    bda8:	e2500000 	subs	r0, r0, #0
    bdac:	13a00001 	movne	r0, #1
    bdb0:	e8bd8070 	pop	{r4, r5, r6, pc}
    bdb4:	e59f0018 	ldr	r0, [pc, #24]	; bdd4 <XSdPs_Idle+0xa4>
    bdb8:	e30011be 	movw	r1, #446	; 0x1be
    bdbc:	eb000b2c 	bl	ea74 <Xil_Assert>
    bdc0:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bdc4:	e3a02001 	mov	r2, #1
    bdc8:	e3403001 	movt	r3, #1
    bdcc:	e5832000 	str	r2, [r3]
    bdd0:	eaffffed 	b	bd8c <XSdPs_Idle+0x5c>
    bdd4:	00012342 	.word	0x00012342

0000bdd8 <XSdPs_Erase>:
    bdd8:	e92d4070 	push	{r4, r5, r6, lr}
    bddc:	e2504000 	subs	r4, r0, #0
    bde0:	0a000034 	beq	beb8 <XSdPs_Erase+0xe0>
    bde4:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    bde8:	e3a03000 	mov	r3, #0
    bdec:	e1a06002 	mov	r6, r2
    bdf0:	e3405001 	movt	r5, #1
    bdf4:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    bdf8:	e5853000 	str	r3, [r5]
    bdfc:	e3013111 	movw	r3, #4369	; 0x1111
    be00:	e3413111 	movt	r3, #4369	; 0x1111
    be04:	e1520003 	cmp	r2, r3
    be08:	1a00001e 	bne	be88 <XSdPs_Erase+0xb0>
    be0c:	e5d430a8 	ldrb	r3, [r4, #168]	; 0xa8
    be10:	e3530001 	cmp	r3, #1
    be14:	0a000019 	beq	be80 <XSdPs_Erase+0xa8>
    be18:	e5d43056 	ldrb	r3, [r4, #86]	; 0x56
    be1c:	e3530002 	cmp	r3, #2
    be20:	0a00001f 	beq	bea4 <XSdPs_Erase+0xcc>
    be24:	e594300c 	ldr	r3, [r4, #12]
    be28:	e3530000 	cmp	r3, #0
    be2c:	0a000003 	beq	be40 <XSdPs_Erase+0x68>
    be30:	e5943004 	ldr	r3, [r4, #4]
    be34:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    be38:	e3130801 	tst	r3, #65536	; 0x10000
    be3c:	0a00000f 	beq	be80 <XSdPs_Erase+0xa8>
    be40:	e594307c 	ldr	r3, [r4, #124]	; 0x7c
    be44:	e3130402 	tst	r3, #33554432	; 0x2000000
    be48:	1a000001 	bne	be54 <XSdPs_Erase+0x7c>
    be4c:	e3a00000 	mov	r0, #0
    be50:	e8bd8070 	pop	{r4, r5, r6, pc}
    be54:	e3a03010 	mov	r3, #16
    be58:	e1a00004 	mov	r0, r4
    be5c:	e1c43ab0 	strh	r3, [r4, #160]	; 0xa0
    be60:	eb0003d1 	bl	cdac <XSdPs_SetStartAddr>
    be64:	e3500000 	cmp	r0, #0
    be68:	1a000004 	bne	be80 <XSdPs_Erase+0xa8>
    be6c:	e1a01006 	mov	r1, r6
    be70:	e1a00004 	mov	r0, r4
    be74:	eb0003d5 	bl	cdd0 <XSdPs_SetEndAddr>
    be78:	e3500000 	cmp	r0, #0
    be7c:	0a000015 	beq	bed8 <XSdPs_Erase+0x100>
    be80:	e3a00001 	mov	r0, #1
    be84:	e8bd8070 	pop	{r4, r5, r6, pc}
    be88:	e59f0054 	ldr	r0, [pc, #84]	; bee4 <XSdPs_Erase+0x10c>
    be8c:	e30011f7 	movw	r1, #503	; 0x1f7
    be90:	eb000af7 	bl	ea74 <Xil_Assert>
    be94:	e3a03001 	mov	r3, #1
    be98:	e3a00000 	mov	r0, #0
    be9c:	e5853000 	str	r3, [r5]
    bea0:	e8bd8070 	pop	{r4, r5, r6, pc}
    bea4:	e5943048 	ldr	r3, [r4, #72]	; 0x48
    bea8:	e2033103 	and	r3, r3, #-1073741824	; 0xc0000000
    beac:	e3530101 	cmp	r3, #1073741824	; 0x40000000
    beb0:	1affffdb 	bne	be24 <XSdPs_Erase+0x4c>
    beb4:	eaffffe1 	b	be40 <XSdPs_Erase+0x68>
    beb8:	e59f0024 	ldr	r0, [pc, #36]	; bee4 <XSdPs_Erase+0x10c>
    bebc:	e30011f6 	movw	r1, #502	; 0x1f6
    bec0:	eb000aeb 	bl	ea74 <Xil_Assert>
    bec4:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bec8:	e3a02001 	mov	r2, #1
    becc:	e3403001 	movt	r3, #1
    bed0:	e5832000 	str	r2, [r3]
    bed4:	eaffffdc 	b	be4c <XSdPs_Erase+0x74>
    bed8:	e1a00004 	mov	r0, r4
    bedc:	e8bd4070 	pop	{r4, r5, r6, lr}
    bee0:	ea0003c3 	b	cdf4 <XSdPs_SendErase>
    bee4:	00012342 	.word	0x00012342

0000bee8 <XSdPs_Sanitize>:
    bee8:	e2503000 	subs	r3, r0, #0
    beec:	e92d4010 	push	{r4, lr}
    bef0:	0a00001a 	beq	bf60 <XSdPs_Sanitize+0x78>
    bef4:	e5931044 	ldr	r1, [r3, #68]	; 0x44
    bef8:	e3012111 	movw	r2, #4369	; 0x1111
    befc:	e3412111 	movt	r2, #4369	; 0x1111
    bf00:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    bf04:	e3404001 	movt	r4, #1
    bf08:	e1510002 	cmp	r1, r2
    bf0c:	e3a02000 	mov	r2, #0
    bf10:	e5842000 	str	r2, [r4]
    bf14:	1a00000a 	bne	bf44 <XSdPs_Sanitize+0x5c>
    bf18:	e5d330a8 	ldrb	r3, [r3, #168]	; 0xa8
    bf1c:	e3530001 	cmp	r3, #1
    bf20:	0a000005 	beq	bf3c <XSdPs_Sanitize+0x54>
    bf24:	e3a01c01 	mov	r1, #256	; 0x100
    bf28:	e34013a5 	movt	r1, #933	; 0x3a5
    bf2c:	eb00053a 	bl	d41c <XSdPs_Set_Mmc_ExtCsd>
    bf30:	e2500000 	subs	r0, r0, #0
    bf34:	13a00001 	movne	r0, #1
    bf38:	e8bd8010 	pop	{r4, pc}
    bf3c:	e1a00003 	mov	r0, r3
    bf40:	e8bd8010 	pop	{r4, pc}
    bf44:	e59f0034 	ldr	r0, [pc, #52]	; bf80 <XSdPs_Sanitize+0x98>
    bf48:	e3001241 	movw	r1, #577	; 0x241
    bf4c:	eb000ac8 	bl	ea74 <Xil_Assert>
    bf50:	e3a03001 	mov	r3, #1
    bf54:	e5843000 	str	r3, [r4]
    bf58:	e3a00000 	mov	r0, #0
    bf5c:	e8bd8010 	pop	{r4, pc}
    bf60:	e59f0018 	ldr	r0, [pc, #24]	; bf80 <XSdPs_Sanitize+0x98>
    bf64:	e3a01d09 	mov	r1, #576	; 0x240
    bf68:	eb000ac1 	bl	ea74 <Xil_Assert>
    bf6c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    bf70:	e3a02001 	mov	r2, #1
    bf74:	e3403001 	movt	r3, #1
    bf78:	e5832000 	str	r2, [r3]
    bf7c:	eafffff5 	b	bf58 <XSdPs_Sanitize+0x70>
    bf80:	00012342 	.word	0x00012342

0000bf84 <XSdPs_LookupConfig>:
    bf84:	e92d4030 	push	{r4, r5, lr}
    bf88:	e30f5688 	movw	r5, #63112	; 0xf688
    bf8c:	e3405001 	movt	r5, #1
    bf90:	e1a0e000 	mov	lr, r0
    bf94:	e5950000 	ldr	r0, [r5]
    bf98:	e3500000 	cmp	r0, #0
    bf9c:	08bd8030 	popeq	{r4, r5, pc}
    bfa0:	e16f4f1e 	clz	r4, lr
    bfa4:	e1a03005 	mov	r3, r5
    bfa8:	e1a042a4 	lsr	r4, r4, #5
    bfac:	e3a02000 	mov	r2, #0
    bfb0:	ea000003 	b	bfc4 <XSdPs_LookupConfig+0x40>
    bfb4:	e5b30044 	ldr	r0, [r3, #68]!	; 0x44
    bfb8:	e2822001 	add	r2, r2, #1
    bfbc:	e3500000 	cmp	r0, #0
    bfc0:	08bd8030 	popeq	{r4, r5, pc}
    bfc4:	e593c004 	ldr	ip, [r3, #4]
    bfc8:	e15c000e 	cmp	ip, lr
    bfcc:	11a01004 	movne	r1, r4
    bfd0:	03841001 	orreq	r1, r4, #1
    bfd4:	e3510000 	cmp	r1, #0
    bfd8:	0afffff5 	beq	bfb4 <XSdPs_LookupConfig+0x30>
    bfdc:	e0822202 	add	r2, r2, r2, lsl #4
    bfe0:	e0850102 	add	r0, r5, r2, lsl #2
    bfe4:	e8bd8030 	pop	{r4, r5, pc}

0000bfe8 <XSdPs_Read>:
    bfe8:	e92d4070 	push	{r4, r5, r6, lr}
    bfec:	e1a04002 	mov	r4, r2
    bff0:	e59020ac 	ldr	r2, [r0, #172]	; 0xac
    bff4:	e1a06001 	mov	r6, r1
    bff8:	e0010294 	mul	r1, r4, r2
    bffc:	e3510602 	cmp	r1, #2097152	; 0x200000
    c000:	9a000001 	bls	c00c <XSdPs_Read+0x24>
    c004:	e3a00001 	mov	r0, #1
    c008:	e8bd8070 	pop	{r4, r5, r6, pc}
    c00c:	e6ff1074 	uxth	r1, r4
    c010:	e6ff2072 	uxth	r2, r2
    c014:	e1a05000 	mov	r5, r0
    c018:	eb000882 	bl	e228 <XSdPs_SetupReadDma>
    c01c:	e3540001 	cmp	r4, #1
    c020:	e1a03004 	mov	r3, r4
    c024:	03a01c11 	moveq	r1, #4352	; 0x1100
    c028:	13a01c12 	movne	r1, #4608	; 0x1200
    c02c:	e1a02006 	mov	r2, r6
    c030:	e1a00005 	mov	r0, r5
    c034:	eb0009b8 	bl	e71c <XSdPs_CmdTransfer>
    c038:	e2500000 	subs	r0, r0, #0
    c03c:	13a00001 	movne	r0, #1
    c040:	e8bd8070 	pop	{r4, r5, r6, pc}

0000c044 <XSdPs_Write>:
    c044:	e92d4070 	push	{r4, r5, r6, lr}
    c048:	e1a04002 	mov	r4, r2
    c04c:	e59020ac 	ldr	r2, [r0, #172]	; 0xac
    c050:	e1a06001 	mov	r6, r1
    c054:	e0010294 	mul	r1, r4, r2
    c058:	e3510602 	cmp	r1, #2097152	; 0x200000
    c05c:	9a000001 	bls	c068 <XSdPs_Write+0x24>
    c060:	e3a00001 	mov	r0, #1
    c064:	e8bd8070 	pop	{r4, r5, r6, pc}
    c068:	e6ff1074 	uxth	r1, r4
    c06c:	e6ff2072 	uxth	r2, r2
    c070:	e1a05000 	mov	r5, r0
    c074:	eb000881 	bl	e280 <XSdPs_SetupWriteDma>
    c078:	e3540001 	cmp	r4, #1
    c07c:	e1a03004 	mov	r3, r4
    c080:	03a01b06 	moveq	r1, #6144	; 0x1800
    c084:	13a01c19 	movne	r1, #6400	; 0x1900
    c088:	e1a02006 	mov	r2, r6
    c08c:	e1a00005 	mov	r0, r5
    c090:	eb0009a1 	bl	e71c <XSdPs_CmdTransfer>
    c094:	e2500000 	subs	r0, r0, #0
    c098:	13a00001 	movne	r0, #1
    c09c:	e8bd8070 	pop	{r4, r5, r6, pc}

0000c0a0 <XSdPs_CheckTransferComplete>:
    c0a0:	e5d020a8 	ldrb	r2, [r0, #168]	; 0xa8
    c0a4:	e1a03000 	mov	r3, r0
    c0a8:	e3520000 	cmp	r2, #0
    c0ac:	0a00000e 	beq	c0ec <XSdPs_CheckTransferComplete+0x4c>
    c0b0:	e5901004 	ldr	r1, [r0, #4]
    c0b4:	e1d123b0 	ldrh	r2, [r1, #48]	; 0x30
    c0b8:	e3120902 	tst	r2, #32768	; 0x8000
    c0bc:	e6ff2072 	uxth	r2, r2
    c0c0:	1a000007 	bne	c0e4 <XSdPs_CheckTransferComplete+0x44>
    c0c4:	e3120002 	tst	r2, #2
    c0c8:	13a00002 	movne	r0, #2
    c0cc:	13a02000 	movne	r2, #0
    c0d0:	11c103b0 	strhne	r0, [r1, #48]	; 0x30
    c0d4:	11a00002 	movne	r0, r2
    c0d8:	15c320a8 	strbne	r2, [r3, #168]	; 0xa8
    c0dc:	03a00015 	moveq	r0, #21
    c0e0:	e12fff1e 	bx	lr
    c0e4:	e3e03b03 	mvn	r3, #3072	; 0xc00
    c0e8:	e1c133b2 	strh	r3, [r1, #50]	; 0x32
    c0ec:	e3a00001 	mov	r0, #1
    c0f0:	e12fff1e 	bx	lr

0000c0f4 <XSdPs_IdentifyCard>:
    c0f4:	e92d4010 	push	{r4, lr}
    c0f8:	e1a04000 	mov	r4, r0
    c0fc:	e5d03056 	ldrb	r3, [r0, #86]	; 0x56
    c100:	e3530002 	cmp	r3, #2
    c104:	1a000003 	bne	c118 <XSdPs_IdentifyCard+0x24>
    c108:	e5903048 	ldr	r3, [r0, #72]	; 0x48
    c10c:	e2033103 	and	r3, r3, #-1073741824	; 0xc0000000
    c110:	e3530101 	cmp	r3, #1073741824	; 0x40000000
    c114:	0a00001e 	beq	c194 <XSdPs_IdentifyCard+0xa0>
    c118:	e3020710 	movw	r0, #10000	; 0x2710
    c11c:	ebffe514 	bl	5574 <usleep>
    c120:	e3a03000 	mov	r3, #0
    c124:	e1a00004 	mov	r0, r4
    c128:	e1a02003 	mov	r2, r3
    c12c:	e1a01003 	mov	r1, r3
    c130:	eb000979 	bl	e71c <XSdPs_CmdTransfer>
    c134:	e2503000 	subs	r3, r0, #0
    c138:	0a000001 	beq	c144 <XSdPs_IdentifyCard+0x50>
    c13c:	e3a00001 	mov	r0, #1
    c140:	e8bd8010 	pop	{r4, pc}
    c144:	e3a02902 	mov	r2, #32768	; 0x8000
    c148:	e3a01c01 	mov	r1, #256	; 0x100
    c14c:	e34420ff 	movt	r2, #16639	; 0x40ff
    c150:	e1a00004 	mov	r0, r4
    c154:	eb000970 	bl	e71c <XSdPs_CmdTransfer>
    c158:	e5943004 	ldr	r3, [r4, #4]
    c15c:	e3500000 	cmp	r0, #0
    c160:	03a00002 	moveq	r0, #2
    c164:	13a00001 	movne	r0, #1
    c168:	e3e02b03 	mvn	r2, #3072	; 0xc00
    c16c:	e3e01000 	mvn	r1, #0
    c170:	e5c40054 	strb	r0, [r4, #84]	; 0x54
    c174:	e1a00004 	mov	r0, r4
    c178:	e1c313b0 	strh	r1, [r3, #48]	; 0x30
    c17c:	e3a01002 	mov	r1, #2
    c180:	e1c323b2 	strh	r2, [r3, #50]	; 0x32
    c184:	eb00067b 	bl	db78 <XSdPs_Reset>
    c188:	e2500000 	subs	r0, r0, #0
    c18c:	13a00001 	movne	r0, #1
    c190:	e8bd8010 	pop	{r4, pc}
    c194:	e3a03005 	mov	r3, #5
    c198:	e3a00000 	mov	r0, #0
    c19c:	e5c43054 	strb	r3, [r4, #84]	; 0x54
    c1a0:	e8bd8010 	pop	{r4, pc}

0000c1a4 <XSdPs_SdCardInitialize>:
    c1a4:	e3a03004 	mov	r3, #4
    c1a8:	e92d4010 	push	{r4, lr}
    c1ac:	e5803014 	str	r3, [r0, #20]
    c1b0:	e1a04000 	mov	r4, r0
    c1b4:	eb000767 	bl	df58 <XSdPs_SdCardEnum>
    c1b8:	e3500000 	cmp	r0, #0
    c1bc:	0a000001 	beq	c1c8 <XSdPs_SdCardInitialize+0x24>
    c1c0:	e3a00001 	mov	r0, #1
    c1c4:	e8bd8010 	pop	{r4, pc}
    c1c8:	e1a00004 	mov	r0, r4
    c1cc:	eb000675 	bl	dba8 <XSdPs_SdModeInit>
    c1d0:	e2500000 	subs	r0, r0, #0
    c1d4:	13a00001 	movne	r0, #1
    c1d8:	e8bd8010 	pop	{r4, pc}

0000c1dc <XSdPs_MmcCardInitialize>:
    c1dc:	e92d4070 	push	{r4, r5, r6, lr}
    c1e0:	e1a05000 	mov	r5, r0
    c1e4:	eb000787 	bl	e008 <XSdPs_MmcCardEnum>
    c1e8:	e2504000 	subs	r4, r0, #0
    c1ec:	1a000015 	bne	c248 <XSdPs_MmcCardInitialize+0x6c>
    c1f0:	e5d53054 	ldrb	r3, [r5, #84]	; 0x54
    c1f4:	e3530002 	cmp	r3, #2
    c1f8:	0a00000f 	beq	c23c <XSdPs_MmcCardInitialize+0x60>
    c1fc:	e3530005 	cmp	r3, #5
    c200:	1a000010 	bne	c248 <XSdPs_MmcCardInitialize+0x6c>
    c204:	e1a00005 	mov	r0, r5
    c208:	eb0006fc 	bl	de00 <XSdPs_EmmcModeInit>
    c20c:	e3500000 	cmp	r0, #0
    c210:	1a00000c 	bne	c248 <XSdPs_MmcCardInitialize+0x6c>
    c214:	e595308c 	ldr	r3, [r5, #140]	; 0x8c
    c218:	e2433004 	sub	r3, r3, #4
    c21c:	e3d33004 	bics	r3, r3, #4
    c220:	1a000013 	bne	c274 <XSdPs_MmcCardInitialize+0x98>
    c224:	e5952004 	ldr	r2, [r5, #4]
    c228:	e3a03c02 	mov	r3, #512	; 0x200
    c22c:	e1a00004 	mov	r0, r4
    c230:	e1c230b4 	strh	r3, [r2, #4]
    c234:	e58530ac 	str	r3, [r5, #172]	; 0xac
    c238:	e8bd8070 	pop	{r4, r5, r6, pc}
    c23c:	e5d53055 	ldrb	r3, [r5, #85]	; 0x55
    c240:	e3530003 	cmp	r3, #3
    c244:	8a000002 	bhi	c254 <XSdPs_MmcCardInitialize+0x78>
    c248:	e3a04001 	mov	r4, #1
    c24c:	e1a00004 	mov	r0, r4
    c250:	e8bd8070 	pop	{r4, r5, r6, pc}
    c254:	e5d53056 	ldrb	r3, [r5, #86]	; 0x56
    c258:	e3530001 	cmp	r3, #1
    c25c:	1afffff9 	bne	c248 <XSdPs_MmcCardInitialize+0x6c>
    c260:	e1a00005 	mov	r0, r5
    c264:	eb0006b4 	bl	dd3c <XSdPs_MmcModeInit>
    c268:	e3500000 	cmp	r0, #0
    c26c:	0affffe8 	beq	c214 <XSdPs_MmcCardInitialize+0x38>
    c270:	eafffff4 	b	c248 <XSdPs_MmcCardInitialize+0x6c>
    c274:	e3a01c02 	mov	r1, #512	; 0x200
    c278:	e1a00005 	mov	r0, r5
    c27c:	eb000314 	bl	ced4 <XSdPs_SetBlkSize>
    c280:	e2504000 	subs	r4, r0, #0
    c284:	13a04001 	movne	r4, #1
    c288:	eaffffef 	b	c24c <XSdPs_MmcCardInitialize+0x70>

0000c28c <XSdPs_CheckCardDetect>:
    c28c:	e5d03056 	ldrb	r3, [r0, #86]	; 0x56
    c290:	e3530002 	cmp	r3, #2
    c294:	0a000007 	beq	c2b8 <XSdPs_CheckCardDetect+0x2c>
    c298:	e590300c 	ldr	r3, [r0, #12]
    c29c:	e3530000 	cmp	r3, #0
    c2a0:	0a000008 	beq	c2c8 <XSdPs_CheckCardDetect+0x3c>
    c2a4:	e5903004 	ldr	r3, [r0, #4]
    c2a8:	e5930024 	ldr	r0, [r3, #36]	; 0x24
    c2ac:	e2200801 	eor	r0, r0, #65536	; 0x10000
    c2b0:	e7e00850 	ubfx	r0, r0, #16, #1
    c2b4:	e12fff1e 	bx	lr
    c2b8:	e5903048 	ldr	r3, [r0, #72]	; 0x48
    c2bc:	e2033103 	and	r3, r3, #-1073741824	; 0xc0000000
    c2c0:	e3530101 	cmp	r3, #1073741824	; 0x40000000
    c2c4:	1afffff3 	bne	c298 <XSdPs_CheckCardDetect+0xc>
    c2c8:	e3a00000 	mov	r0, #0
    c2cc:	e12fff1e 	bx	lr

0000c2d0 <XSdPs_CardReset>:
    c2d0:	e3a03000 	mov	r3, #0
    c2d4:	e92d4010 	push	{r4, lr}
    c2d8:	e1a02003 	mov	r2, r3
    c2dc:	e1a01003 	mov	r1, r3
    c2e0:	eb00090d 	bl	e71c <XSdPs_CmdTransfer>
    c2e4:	e2500000 	subs	r0, r0, #0
    c2e8:	13a00001 	movne	r0, #1
    c2ec:	e8bd8010 	pop	{r4, pc}

0000c2f0 <XSdPs_CardIfCond>:
    c2f0:	e92d4070 	push	{r4, r5, r6, lr}
    c2f4:	e3a03000 	mov	r3, #0
    c2f8:	e30021aa 	movw	r2, #426	; 0x1aa
    c2fc:	e3a01b02 	mov	r1, #2048	; 0x800
    c300:	e1a04000 	mov	r4, r0
    c304:	eb000904 	bl	e71c <XSdPs_CmdTransfer>
    c308:	e3d05002 	bics	r5, r0, #2
    c30c:	1a000013 	bne	c360 <XSdPs_CardIfCond+0x70>
    c310:	e3500002 	cmp	r0, #2
    c314:	0a00000c 	beq	c34c <XSdPs_CardIfCond+0x5c>
    c318:	e5942004 	ldr	r2, [r4, #4]
    c31c:	e30031aa 	movw	r3, #426	; 0x1aa
    c320:	e5922010 	ldr	r2, [r2, #16]
    c324:	e1520003 	cmp	r2, r3
    c328:	13a03001 	movne	r3, #1
    c32c:	15c43055 	strbne	r3, [r4, #85]	; 0x55
    c330:	0a000001 	beq	c33c <XSdPs_CardIfCond+0x4c>
    c334:	e1a00005 	mov	r0, r5
    c338:	e8bd8070 	pop	{r4, r5, r6, pc}
    c33c:	e3a03002 	mov	r3, #2
    c340:	e1a00005 	mov	r0, r5
    c344:	e5c43055 	strb	r3, [r4, #85]	; 0x55
    c348:	e8bd8070 	pop	{r4, r5, r6, pc}
    c34c:	e1a01000 	mov	r1, r0
    c350:	e1a00004 	mov	r0, r4
    c354:	eb000607 	bl	db78 <XSdPs_Reset>
    c358:	e3500000 	cmp	r0, #0
    c35c:	0affffed 	beq	c318 <XSdPs_CardIfCond+0x28>
    c360:	e3a05001 	mov	r5, #1
    c364:	e1a00005 	mov	r0, r5
    c368:	e8bd8070 	pop	{r4, r5, r6, pc}

0000c36c <XSdPs_CardOpCond>:
    c36c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c370:	e3a07902 	mov	r7, #32768	; 0x8000
    c374:	e1a08007 	mov	r8, r7
    c378:	e1a04000 	mov	r4, r0
    c37c:	e3026710 	movw	r6, #10000	; 0x2710
    c380:	e34470ff 	movt	r7, #16639	; 0x40ff
    c384:	e34481ff 	movt	r8, #16895	; 0x41ff
    c388:	ea00000d 	b	c3c4 <XSdPs_CardOpCond+0x58>
    c38c:	eb0008e2 	bl	e71c <XSdPs_CmdTransfer>
    c390:	e1a05000 	mov	r5, r0
    c394:	e3550000 	cmp	r5, #0
    c398:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
    c39c:	e3a03001 	mov	r3, #1
    c3a0:	e1a01002 	mov	r1, r2
    c3a4:	1a000020 	bne	c42c <XSdPs_CardOpCond+0xc0>
    c3a8:	e5940004 	ldr	r0, [r4, #4]
    c3ac:	e2800010 	add	r0, r0, #16
    c3b0:	eb000c67 	bl	f554 <Xil_WaitForEvent>
    c3b4:	e3500000 	cmp	r0, #0
    c3b8:	0a00001e 	beq	c438 <XSdPs_CardOpCond+0xcc>
    c3bc:	e2566001 	subs	r6, r6, #1
    c3c0:	0a000019 	beq	c42c <XSdPs_CardOpCond+0xc0>
    c3c4:	e5d4c054 	ldrb	ip, [r4, #84]	; 0x54
    c3c8:	e3a03000 	mov	r3, #0
    c3cc:	e1a02007 	mov	r2, r7
    c3d0:	e3a01c01 	mov	r1, #256	; 0x100
    c3d4:	e1a00004 	mov	r0, r4
    c3d8:	e35c0001 	cmp	ip, #1
    c3dc:	1affffea 	bne	c38c <XSdPs_CardOpCond+0x20>
    c3e0:	e1a02003 	mov	r2, r3
    c3e4:	e3a01c37 	mov	r1, #14080	; 0x3700
    c3e8:	eb0008cb 	bl	e71c <XSdPs_CmdTransfer>
    c3ec:	e3500000 	cmp	r0, #0
    c3f0:	e1a02007 	mov	r2, r7
    c3f4:	1a00000c 	bne	c42c <XSdPs_CardOpCond+0xc0>
    c3f8:	e5d43056 	ldrb	r3, [r4, #86]	; 0x56
    c3fc:	e3530002 	cmp	r3, #2
    c400:	1a000003 	bne	c414 <XSdPs_CardOpCond+0xa8>
    c404:	e5943014 	ldr	r3, [r4, #20]
    c408:	e3530008 	cmp	r3, #8
    c40c:	01a02008 	moveq	r2, r8
    c410:	11a02007 	movne	r2, r7
    c414:	e3a03000 	mov	r3, #0
    c418:	e3a01ca9 	mov	r1, #43264	; 0xa900
    c41c:	e1a00004 	mov	r0, r4
    c420:	eb0008bd 	bl	e71c <XSdPs_CmdTransfer>
    c424:	e1a05000 	mov	r5, r0
    c428:	eaffffd9 	b	c394 <XSdPs_CardOpCond+0x28>
    c42c:	e3a05001 	mov	r5, #1
    c430:	e1a00005 	mov	r0, r5
    c434:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    c438:	e5943004 	ldr	r3, [r4, #4]
    c43c:	e5933010 	ldr	r3, [r3, #16]
    c440:	e3130101 	tst	r3, #1073741824	; 0x40000000
    c444:	13a02001 	movne	r2, #1
    c448:	15842050 	strne	r2, [r4, #80]	; 0x50
    c44c:	e3130401 	tst	r3, #16777216	; 0x1000000
    c450:	0afffff6 	beq	c430 <XSdPs_CardOpCond+0xc4>
    c454:	e3a03001 	mov	r3, #1
    c458:	e1a00004 	mov	r0, r4
    c45c:	e5c4305c 	strb	r3, [r4, #92]	; 0x5c
    c460:	eb000595 	bl	dabc <XSdPs_Switch_Voltage>
    c464:	e2505000 	subs	r5, r0, #0
    c468:	13a05001 	movne	r5, #1
    c46c:	e1a00005 	mov	r0, r5
    c470:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000c474 <XSdPs_GetCardId>:
    c474:	e3a03000 	mov	r3, #0
    c478:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c47c:	e1a02003 	mov	r2, r3
    c480:	e3a01c02 	mov	r1, #512	; 0x200
    c484:	e1a05000 	mov	r5, r0
    c488:	eb0008a3 	bl	e71c <XSdPs_CmdTransfer>
    c48c:	e2503000 	subs	r3, r0, #0
    c490:	1a000021 	bne	c51c <XSdPs_GetCardId+0xa8>
    c494:	e5952004 	ldr	r2, [r5, #4]
    c498:	e5d50054 	ldrb	r0, [r5, #84]	; 0x54
    c49c:	e5921010 	ldr	r1, [r2, #16]
    c4a0:	e3500001 	cmp	r0, #1
    c4a4:	e5851060 	str	r1, [r5, #96]	; 0x60
    c4a8:	e5921014 	ldr	r1, [r2, #20]
    c4ac:	e5851064 	str	r1, [r5, #100]	; 0x64
    c4b0:	e5921018 	ldr	r1, [r2, #24]
    c4b4:	e5851068 	str	r1, [r5, #104]	; 0x68
    c4b8:	e592201c 	ldr	r2, [r2, #28]
    c4bc:	e585206c 	str	r2, [r5, #108]	; 0x6c
    c4c0:	1a000018 	bne	c528 <XSdPs_GetCardId+0xb4>
    c4c4:	e3a07000 	mov	r7, #0
    c4c8:	e3a06032 	mov	r6, #50	; 0x32
    c4cc:	e34f7fff 	movt	r7, #65535	; 0xffff
    c4d0:	ea000006 	b	c4f0 <XSdPs_GetCardId+0x7c>
    c4d4:	e5950004 	ldr	r0, [r5, #4]
    c4d8:	e2800010 	add	r0, r0, #16
    c4dc:	eb000c1c 	bl	f554 <Xil_WaitForEvent>
    c4e0:	e3500000 	cmp	r0, #0
    c4e4:	1a000019 	bne	c550 <XSdPs_GetCardId+0xdc>
    c4e8:	e2566001 	subs	r6, r6, #1
    c4ec:	0a00000a 	beq	c51c <XSdPs_GetCardId+0xa8>
    c4f0:	e3a03000 	mov	r3, #0
    c4f4:	e3a01c03 	mov	r1, #768	; 0x300
    c4f8:	e1a02003 	mov	r2, r3
    c4fc:	e1a00005 	mov	r0, r5
    c500:	eb000885 	bl	e71c <XSdPs_CmdTransfer>
    c504:	e2504000 	subs	r4, r0, #0
    c508:	e3a01000 	mov	r1, #0
    c50c:	e3a03001 	mov	r3, #1
    c510:	e34f1fff 	movt	r1, #65535	; 0xffff
    c514:	e1a02004 	mov	r2, r4
    c518:	0affffed 	beq	c4d4 <XSdPs_GetCardId+0x60>
    c51c:	e3a04001 	mov	r4, #1
    c520:	e1a00004 	mov	r0, r4
    c524:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    c528:	e3a02000 	mov	r2, #0
    c52c:	e3a01c03 	mov	r1, #768	; 0x300
    c530:	e3412234 	movt	r2, #4660	; 0x1234
    c534:	e1a00005 	mov	r0, r5
    c538:	e5852070 	str	r2, [r5, #112]	; 0x70
    c53c:	eb000876 	bl	e71c <XSdPs_CmdTransfer>
    c540:	e2504000 	subs	r4, r0, #0
    c544:	13a04001 	movne	r4, #1
    c548:	e1a00004 	mov	r0, r4
    c54c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    c550:	e5953004 	ldr	r3, [r5, #4]
    c554:	e1a00004 	mov	r0, r4
    c558:	e5933010 	ldr	r3, [r3, #16]
    c55c:	e0033007 	and	r3, r3, r7
    c560:	e5853070 	str	r3, [r5, #112]	; 0x70
    c564:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000c568 <XSdPs_GetCsd>:
    c568:	e92d4010 	push	{r4, lr}
    c56c:	e3a03000 	mov	r3, #0
    c570:	e5902070 	ldr	r2, [r0, #112]	; 0x70
    c574:	e3a01c09 	mov	r1, #2304	; 0x900
    c578:	e1a04000 	mov	r4, r0
    c57c:	eb000866 	bl	e71c <XSdPs_CmdTransfer>
    c580:	e3500000 	cmp	r0, #0
    c584:	1a000017 	bne	c5e8 <XSdPs_GetCsd+0x80>
    c588:	e5943004 	ldr	r3, [r4, #4]
    c58c:	e5d41054 	ldrb	r1, [r4, #84]	; 0x54
    c590:	e593c010 	ldr	ip, [r3, #16]
    c594:	e3510001 	cmp	r1, #1
    c598:	e5932014 	ldr	r2, [r3, #20]
    c59c:	e5931018 	ldr	r1, [r3, #24]
    c5a0:	e593301c 	ldr	r3, [r3, #28]
    c5a4:	e584c074 	str	ip, [r4, #116]	; 0x74
    c5a8:	e5842078 	str	r2, [r4, #120]	; 0x78
    c5ac:	e584107c 	str	r1, [r4, #124]	; 0x7c
    c5b0:	e5843080 	str	r3, [r4, #128]	; 0x80
    c5b4:	0a000002 	beq	c5c4 <XSdPs_GetCsd+0x5c>
    c5b8:	e7e33953 	ubfx	r3, r3, #18, #4
    c5bc:	e5c43055 	strb	r3, [r4, #85]	; 0x55
    c5c0:	e8bd8010 	pop	{r4, pc}
    c5c4:	e2133503 	ands	r3, r3, #12582912	; 0xc00000
    c5c8:	0a000008 	beq	c5f0 <XSdPs_GetCsd+0x88>
    c5cc:	e3530501 	cmp	r3, #4194304	; 0x400000
    c5d0:	1a000004 	bne	c5e8 <XSdPs_GetCsd+0x80>
    c5d4:	e7f52452 	ubfx	r2, r2, #8, #22
    c5d8:	e2822001 	add	r2, r2, #1
    c5dc:	e1a02502 	lsl	r2, r2, #10
    c5e0:	e5842084 	str	r2, [r4, #132]	; 0x84
    c5e4:	e8bd8010 	pop	{r4, pc}
    c5e8:	e3a00001 	mov	r0, #1
    c5ec:	e8bd8010 	pop	{r4, pc}
    c5f0:	e1a03501 	lsl	r3, r1, #10
    c5f4:	e7e31451 	ubfx	r1, r1, #8, #4
    c5f8:	e2033b03 	and	r3, r3, #3072	; 0xc00
    c5fc:	e1833b22 	orr	r3, r3, r2, lsr #22
    c600:	e7e223d2 	ubfx	r2, r2, #7, #3
    c604:	e2822002 	add	r2, r2, #2
    c608:	e2833001 	add	r3, r3, #1
    c60c:	e1a03213 	lsl	r3, r3, r2
    c610:	e1a03113 	lsl	r3, r3, r1
    c614:	e1a034a3 	lsr	r3, r3, #9
    c618:	e5843084 	str	r3, [r4, #132]	; 0x84
    c61c:	e8bd8010 	pop	{r4, pc}

0000c620 <XSdPs_CardSetVoltage18>:
    c620:	e5902004 	ldr	r2, [r0, #4]
    c624:	e30f3ffa 	movw	r3, #65530	; 0xfffa
    c628:	e92d4010 	push	{r4, lr}
    c62c:	e1a04000 	mov	r4, r0
    c630:	e1d212bc 	ldrh	r1, [r2, #44]	; 0x2c
    c634:	e0033001 	and	r3, r3, r1
    c638:	e1c232bc 	strh	r3, [r2, #44]	; 0x2c
    c63c:	eb00080b 	bl	e670 <XSdPs_SetVoltage18>
    c640:	e3500000 	cmp	r0, #0
    c644:	0a000002 	beq	c654 <XSdPs_CardSetVoltage18+0x34>
    c648:	e3a04001 	mov	r4, #1
    c64c:	e1a00004 	mov	r0, r4
    c650:	e8bd8010 	pop	{r4, pc}
    c654:	e5943004 	ldr	r3, [r4, #4]
    c658:	e1a00004 	mov	r0, r4
    c65c:	e1d312bc 	ldrh	r1, [r3, #44]	; 0x2c
    c660:	eb00069b 	bl	e0d4 <XSdPs_EnableClock>
    c664:	e2504000 	subs	r4, r0, #0
    c668:	1afffff6 	bne	c648 <XSdPs_CardSetVoltage18+0x28>
    c66c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    c670:	ebffe3bf 	bl	5574 <usleep>
    c674:	e1a00004 	mov	r0, r4
    c678:	e8bd8010 	pop	{r4, pc}

0000c67c <XSdPs_ResetConfig>:
    c67c:	e92d4070 	push	{r4, r5, r6, lr}
    c680:	e1a05000 	mov	r5, r0
    c684:	eb000626 	bl	df24 <XSdPs_DisableBusPower>
    c688:	e3a01001 	mov	r1, #1
    c68c:	e1a00005 	mov	r0, r5
    c690:	eb000538 	bl	db78 <XSdPs_Reset>
    c694:	e2504000 	subs	r4, r0, #0
    c698:	13a04001 	movne	r4, #1
    c69c:	1a000001 	bne	c6a8 <XSdPs_ResetConfig+0x2c>
    c6a0:	e1a00005 	mov	r0, r5
    c6a4:	eb000626 	bl	df44 <XSdPs_EnableBusPower>
    c6a8:	e1a00004 	mov	r0, r4
    c6ac:	e8bd8070 	pop	{r4, r5, r6, pc}

0000c6b0 <XSdPs_HostConfig>:
    c6b0:	e92d4010 	push	{r4, lr}
    c6b4:	e1a04000 	mov	r4, r0
    c6b8:	eb0007f9 	bl	e6a4 <XSdPs_ConfigPower>
    c6bc:	e1a00004 	mov	r0, r4
    c6c0:	eb000805 	bl	e6dc <XSdPs_ConfigDma>
    c6c4:	e1a00004 	mov	r0, r4
    c6c8:	eb00080a 	bl	e6f8 <XSdPs_ConfigInterrupt>
    c6cc:	e5943004 	ldr	r3, [r4, #4]
    c6d0:	e3a01013 	mov	r1, #19
    c6d4:	e3a02c02 	mov	r2, #512	; 0x200
    c6d8:	e1c41ab0 	strh	r1, [r4, #160]	; 0xa0
    c6dc:	e1c320b4 	strh	r2, [r3, #4]
    c6e0:	e8bd8010 	pop	{r4, pc}

0000c6e4 <XSdPs_CheckResetDone>:
    c6e4:	e5900004 	ldr	r0, [r0, #4]
    c6e8:	e3043240 	movw	r3, #16960	; 0x4240
    c6ec:	e1a01c01 	lsl	r1, r1, #24
    c6f0:	e340300f 	movt	r3, #15
    c6f4:	e3a02000 	mov	r2, #0
    c6f8:	e92d4010 	push	{r4, lr}
    c6fc:	e280002c 	add	r0, r0, #44	; 0x2c
    c700:	eb000b93 	bl	f554 <Xil_WaitForEvent>
    c704:	e2500000 	subs	r0, r0, #0
    c708:	13a00001 	movne	r0, #1
    c70c:	e8bd8010 	pop	{r4, pc}

0000c710 <XSdPs_SetupVoltageSwitch>:
    c710:	e3a03000 	mov	r3, #0
    c714:	e92d4010 	push	{r4, lr}
    c718:	e1a02003 	mov	r2, r3
    c71c:	e3a01c0b 	mov	r1, #2816	; 0xb00
    c720:	e1a04000 	mov	r4, r0
    c724:	eb0007fc 	bl	e71c <XSdPs_CmdTransfer>
    c728:	e2502000 	subs	r2, r0, #0
    c72c:	0a000001 	beq	c738 <XSdPs_SetupVoltageSwitch+0x28>
    c730:	e3a00001 	mov	r0, #1
    c734:	e8bd8010 	pop	{r4, pc}
    c738:	e5940004 	ldr	r0, [r4, #4]
    c73c:	e3023710 	movw	r3, #10000	; 0x2710
    c740:	e3a0161f 	mov	r1, #32505856	; 0x1f00000
    c744:	e2800024 	add	r0, r0, #36	; 0x24
    c748:	eb000b81 	bl	f554 <Xil_WaitForEvent>
    c74c:	e2500000 	subs	r0, r0, #0
    c750:	13a00001 	movne	r0, #1
    c754:	e8bd8010 	pop	{r4, pc}

0000c758 <XSdPs_CheckBusHigh>:
    c758:	e5900004 	ldr	r0, [r0, #4]
    c75c:	e3a0261f 	mov	r2, #32505856	; 0x1f00000
    c760:	e3e0320e 	mvn	r3, #-536870912	; 0xe0000000
    c764:	e1a01002 	mov	r1, r2
    c768:	e92d4010 	push	{r4, lr}
    c76c:	e2800024 	add	r0, r0, #36	; 0x24
    c770:	eb000b77 	bl	f554 <Xil_WaitForEvent>
    c774:	e2500000 	subs	r0, r0, #0
    c778:	13a00001 	movne	r0, #1
    c77c:	e8bd8010 	pop	{r4, pc}

0000c780 <XSdPs_Identify_UhsMode>:
    c780:	e5d1200d 	ldrb	r2, [r1, #13]
    c784:	e1a03000 	mov	r3, r0
    c788:	e3120008 	tst	r2, #8
    c78c:	0a000004 	beq	c7a4 <XSdPs_Identify_UhsMode+0x24>
    c790:	e590c008 	ldr	ip, [r0, #8]
    c794:	e30419c0 	movw	r1, #18880	; 0x49c0
    c798:	e3401a6e 	movt	r1, #2670	; 0xa6e
    c79c:	e15c0001 	cmp	ip, r1
    c7a0:	2a00001b 	bcs	c814 <XSdPs_Identify_UhsMode+0x94>
    c7a4:	e3120004 	tst	r2, #4
    c7a8:	0a000004 	beq	c7c0 <XSdPs_Identify_UhsMode+0x40>
    c7ac:	e5930008 	ldr	r0, [r3, #8]
    c7b0:	e30e10ff 	movw	r1, #57599	; 0xe0ff
    c7b4:	e34015f5 	movt	r1, #1525	; 0x5f5
    c7b8:	e1500001 	cmp	r0, r1
    c7bc:	8a000017 	bhi	c820 <XSdPs_Identify_UhsMode+0xa0>
    c7c0:	e3120010 	tst	r2, #16
    c7c4:	0a000007 	beq	c7e8 <XSdPs_Identify_UhsMode+0x68>
    c7c8:	e5931008 	ldr	r1, [r3, #8]
    c7cc:	e30f207f 	movw	r2, #61567	; 0xf07f
    c7d0:	e34022fa 	movt	r2, #762	; 0x2fa
    c7d4:	e1510002 	cmp	r1, r2
    c7d8:	8a000014 	bhi	c830 <XSdPs_Identify_UhsMode+0xb0>
    c7dc:	e3a02000 	mov	r2, #0
    c7e0:	e583208c 	str	r2, [r3, #140]	; 0x8c
    c7e4:	e12fff1e 	bx	lr
    c7e8:	e3120002 	tst	r2, #2
    c7ec:	0afffffa 	beq	c7dc <XSdPs_Identify_UhsMode+0x5c>
    c7f0:	e5931008 	ldr	r1, [r3, #8]
    c7f4:	e30f207f 	movw	r2, #61567	; 0xf07f
    c7f8:	e34022fa 	movt	r2, #762	; 0x2fa
    c7fc:	e1510002 	cmp	r1, r2
    c800:	9afffff5 	bls	c7dc <XSdPs_Identify_UhsMode+0x5c>
    c804:	e3a02001 	mov	r2, #1
    c808:	e1a00003 	mov	r0, r3
    c80c:	e583208c 	str	r2, [r3, #140]	; 0x8c
    c810:	ea000495 	b	da6c <XSdPs_SetTapDelay_SDR25>
    c814:	e3a02003 	mov	r2, #3
    c818:	e580208c 	str	r2, [r0, #140]	; 0x8c
    c81c:	ea000471 	b	d9e8 <XSdPs_SetTapDelay_SDR104>
    c820:	e3a02002 	mov	r2, #2
    c824:	e1a00003 	mov	r0, r3
    c828:	e583208c 	str	r2, [r3, #140]	; 0x8c
    c82c:	ea000475 	b	da08 <XSdPs_SetTapDelay_SDR50>
    c830:	e3a02004 	mov	r2, #4
    c834:	e1a00003 	mov	r0, r3
    c838:	e583208c 	str	r2, [r3, #140]	; 0x8c
    c83c:	ea000476 	b	da1c <XSdPs_SetTapDelay_DDR50>

0000c840 <XSdPs_SetTapDelay>:
    c840:	e590108c 	ldr	r1, [r0, #140]	; 0x8c
    c844:	e92d4070 	push	{r4, r5, r6, lr}
    c848:	e3510000 	cmp	r1, #0
    c84c:	13510006 	cmpne	r1, #6
    c850:	03a04001 	moveq	r4, #1
    c854:	13a04000 	movne	r4, #0
    c858:	08bd8070 	popeq	{r4, r5, r6, pc}
    c85c:	e1a05000 	mov	r5, r0
    c860:	e3a01001 	mov	r1, #1
    c864:	eb00072e 	bl	e524 <XSdPs_DllRstCtrl>
    c868:	e1a00005 	mov	r0, r5
    c86c:	eb00073c 	bl	e564 <XSdPs_ConfigTapDelay>
    c870:	e1a01004 	mov	r1, r4
    c874:	e1a00005 	mov	r0, r5
    c878:	e8bd4070 	pop	{r4, r5, r6, lr}
    c87c:	ea000728 	b	e524 <XSdPs_DllRstCtrl>

0000c880 <XSdPs_Change_SdBusSpeed>:
    c880:	e92d4010 	push	{r4, lr}
    c884:	e24dd048 	sub	sp, sp, #72	; 0x48
    c888:	e1a04000 	mov	r4, r0
    c88c:	e3a02040 	mov	r2, #64	; 0x40
    c890:	e3a01000 	mov	r1, #0
    c894:	e28d0008 	add	r0, sp, #8
    c898:	fa001292 	blx	112e8 <memset>
    c89c:	e28d1004 	add	r1, sp, #4
    c8a0:	e1a00004 	mov	r0, r4
    c8a4:	eb00061c 	bl	e11c <XSdPs_CalcBusSpeed>
    c8a8:	e3500000 	cmp	r0, #0
    c8ac:	0a000002 	beq	c8bc <XSdPs_Change_SdBusSpeed+0x3c>
    c8b0:	e3a00001 	mov	r0, #1
    c8b4:	e28dd048 	add	sp, sp, #72	; 0x48
    c8b8:	e8bd8010 	pop	{r4, pc}
    c8bc:	e28d3008 	add	r3, sp, #8
    c8c0:	e3a02040 	mov	r2, #64	; 0x40
    c8c4:	e3a01001 	mov	r1, #1
    c8c8:	e1a00004 	mov	r0, r4
    c8cc:	eb000655 	bl	e228 <XSdPs_SetupReadDma>
    c8d0:	e59d2004 	ldr	r2, [sp, #4]
    c8d4:	e3a03001 	mov	r3, #1
    c8d8:	e3a01c06 	mov	r1, #1536	; 0x600
    c8dc:	e1a00004 	mov	r0, r4
    c8e0:	eb00078d 	bl	e71c <XSdPs_CmdTransfer>
    c8e4:	e3500000 	cmp	r0, #0
    c8e8:	1afffff0 	bne	c8b0 <XSdPs_Change_SdBusSpeed+0x30>
    c8ec:	e1a00004 	mov	r0, r4
    c8f0:	eb0007c5 	bl	e80c <XSdps_CheckTransferDone>
    c8f4:	e3500000 	cmp	r0, #0
    c8f8:	1affffec 	bne	c8b0 <XSdPs_Change_SdBusSpeed+0x30>
    c8fc:	e5d4305c 	ldrb	r3, [r4, #92]	; 0x5c
    c900:	e3530000 	cmp	r3, #0
    c904:	0affffea 	beq	c8b4 <XSdPs_Change_SdBusSpeed+0x34>
    c908:	e5942004 	ldr	r2, [r4, #4]
    c90c:	e30f3ff8 	movw	r3, #65528	; 0xfff8
    c910:	e1d418bc 	ldrh	r1, [r4, #140]	; 0x8c
    c914:	e1d2c3be 	ldrh	ip, [r2, #62]	; 0x3e
    c918:	e003300c 	and	r3, r3, ip
    c91c:	e1833001 	orr	r3, r3, r1
    c920:	e1c233be 	strh	r3, [r2, #62]	; 0x3e
    c924:	eaffffe2 	b	c8b4 <XSdPs_Change_SdBusSpeed+0x34>

0000c928 <XSdPs_Change_MmcBusSpeed>:
    c928:	e92d4010 	push	{r4, lr}
    c92c:	e24dd008 	sub	sp, sp, #8
    c930:	e28d1004 	add	r1, sp, #4
    c934:	e1a04000 	mov	r4, r0
    c938:	eb0005f7 	bl	e11c <XSdPs_CalcBusSpeed>
    c93c:	e2503000 	subs	r3, r0, #0
    c940:	0a000002 	beq	c950 <XSdPs_Change_MmcBusSpeed+0x28>
    c944:	e3a00001 	mov	r0, #1
    c948:	e28dd008 	add	sp, sp, #8
    c94c:	e8bd8010 	pop	{r4, pc}
    c950:	e59d2004 	ldr	r2, [sp, #4]
    c954:	e3a01c06 	mov	r1, #1536	; 0x600
    c958:	e1a00004 	mov	r0, r4
    c95c:	eb00076e 	bl	e71c <XSdPs_CmdTransfer>
    c960:	e3500000 	cmp	r0, #0
    c964:	1afffff6 	bne	c944 <XSdPs_Change_MmcBusSpeed+0x1c>
    c968:	e1a00004 	mov	r0, r4
    c96c:	eb0007a6 	bl	e80c <XSdps_CheckTransferDone>
    c970:	e2500000 	subs	r0, r0, #0
    c974:	13a00001 	movne	r0, #1
    c978:	e28dd008 	add	sp, sp, #8
    c97c:	e8bd8010 	pop	{r4, pc}

0000c980 <XSdPs_AutoTuning>:
    c980:	e92d4070 	push	{r4, r5, r6, lr}
    c984:	e3a03010 	mov	r3, #16
    c988:	e5d01057 	ldrb	r1, [r0, #87]	; 0x57
    c98c:	e1a06000 	mov	r6, r0
    c990:	e3a04028 	mov	r4, #40	; 0x28
    c994:	e5902004 	ldr	r2, [r0, #4]
    c998:	e3510003 	cmp	r1, #3
    c99c:	03a01080 	moveq	r1, #128	; 0x80
    c9a0:	13a01040 	movne	r1, #64	; 0x40
    c9a4:	e1c210b4 	strh	r1, [r2, #4]
    c9a8:	e1c03ab0 	strh	r3, [r0, #160]	; 0xa0
    c9ac:	eb000478 	bl	db94 <XSdPs_SetExecTuning>
    c9b0:	e3a00001 	mov	r0, #1
    c9b4:	ebffe2ee 	bl	5574 <usleep>
    c9b8:	ea000005 	b	c9d4 <XSdPs_AutoTuning+0x54>
    c9bc:	e5962004 	ldr	r2, [r6, #4]
    c9c0:	e1d213be 	ldrh	r1, [r2, #62]	; 0x3e
    c9c4:	e3110040 	tst	r1, #64	; 0x40
    c9c8:	0a000011 	beq	ca14 <XSdPs_AutoTuning+0x94>
    c9cc:	e21340ff 	ands	r4, r3, #255	; 0xff
    c9d0:	0a00000f 	beq	ca14 <XSdPs_AutoTuning+0x94>
    c9d4:	e5d6c054 	ldrb	ip, [r6, #84]	; 0x54
    c9d8:	e3a03001 	mov	r3, #1
    c9dc:	e3a01c15 	mov	r1, #5376	; 0x1500
    c9e0:	e3a02000 	mov	r2, #0
    c9e4:	e1a00006 	mov	r0, r6
    c9e8:	e15c0003 	cmp	ip, r3
    c9ec:	01a0300c 	moveq	r3, ip
    c9f0:	03a01c13 	moveq	r1, #4864	; 0x1300
    c9f4:	eb000748 	bl	e71c <XSdPs_CmdTransfer>
    c9f8:	e3500000 	cmp	r0, #0
    c9fc:	e1a05000 	mov	r5, r0
    ca00:	e2443001 	sub	r3, r4, #1
    ca04:	0affffec 	beq	c9bc <XSdPs_AutoTuning+0x3c>
    ca08:	e3a05001 	mov	r5, #1
    ca0c:	e1a00005 	mov	r0, r5
    ca10:	e8bd8070 	pop	{r4, r5, r6, pc}
    ca14:	e1d233be 	ldrh	r3, [r2, #62]	; 0x3e
    ca18:	e3130080 	tst	r3, #128	; 0x80
    ca1c:	0afffff9 	beq	ca08 <XSdPs_AutoTuning+0x88>
    ca20:	e3a00001 	mov	r0, #1
    ca24:	ebffe2d2 	bl	5574 <usleep>
    ca28:	e1a00005 	mov	r0, r5
    ca2c:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ca30 <XSdPs_SetupADMA2DescTbl>:
    ca30:	e5d03056 	ldrb	r3, [r0, #86]	; 0x56
    ca34:	e3530002 	cmp	r3, #2
    ca38:	0a000000 	beq	ca40 <XSdPs_SetupADMA2DescTbl+0x10>
    ca3c:	ea000625 	b	e2d8 <XSdPs_Setup32ADMA2DescTbl>
    ca40:	ea00064f 	b	e384 <XSdPs_Setup64ADMA2DescTbl>

0000ca44 <XSdPs_SetupADMA2DescTbl64Bit>:
    ca44:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    ca48:	e1a06000 	mov	r6, r0
    ca4c:	e5908004 	ldr	r8, [r0, #4]
    ca50:	e5907098 	ldr	r7, [r0, #152]	; 0x98
    ca54:	e1d890b4 	ldrh	r9, [r8, #4]
    ca58:	e590a09c 	ldr	sl, [r0, #156]	; 0x9c
    ca5c:	e7eb9059 	ubfx	r9, r9, #0, #12
    ca60:	e0050991 	mul	r5, r1, r9
    ca64:	e3550801 	cmp	r5, #65536	; 0x10000
    ca68:	33a05000 	movcc	r5, #0
    ca6c:	3a000015 	bcc	cac8 <XSdPs_SetupADMA2DescTbl64Bit+0x84>
    ca70:	e6ff3075 	uxth	r3, r5
    ca74:	e1a05825 	lsr	r5, r5, #16
    ca78:	e3530000 	cmp	r3, #0
    ca7c:	0a000023 	beq	cb10 <XSdPs_SetupADMA2DescTbl64Bit+0xcc>
    ca80:	e1a04006 	mov	r4, r6
    ca84:	e1a03007 	mov	r3, r7
    ca88:	e1a0e00a 	mov	lr, sl
    ca8c:	e3a0c000 	mov	ip, #0
    ca90:	e3a00021 	mov	r0, #33	; 0x21
    ca94:	e08c208c 	add	r2, ip, ip, lsl #1
    ca98:	e28cc001 	add	ip, ip, #1
    ca9c:	e284400c 	add	r4, r4, #12
    caa0:	e0862102 	add	r2, r6, r2, lsl #2
    caa4:	e58231c4 	str	r3, [r2, #452]	; 0x1c4
    caa8:	e2933801 	adds	r3, r3, #65536	; 0x10000
    caac:	e582e1c8 	str	lr, [r2, #456]	; 0x1c8
    cab0:	e2aee000 	adc	lr, lr, #0
    cab4:	e15c0005 	cmp	ip, r5
    cab8:	e58401b4 	str	r0, [r4, #436]	; 0x1b4
    cabc:	3afffff4 	bcc	ca94 <XSdPs_SetupADMA2DescTbl64Bit+0x50>
    cac0:	e3a03801 	mov	r3, #65536	; 0x10000
    cac4:	e0aa7395 	umlal	r7, sl, r5, r3
    cac8:	e0855085 	add	r5, r5, r5, lsl #1
    cacc:	e3a02023 	mov	r2, #35	; 0x23
    cad0:	e2860d07 	add	r0, r6, #448	; 0x1c0
    cad4:	e1610981 	smulbb	r1, r1, r9
    cad8:	e0865105 	add	r5, r6, r5, lsl #2
    cadc:	e2853d07 	add	r3, r5, #448	; 0x1c0
    cae0:	e58571c4 	str	r7, [r5, #452]	; 0x1c4
    cae4:	e585a1c8 	str	sl, [r5, #456]	; 0x1c8
    cae8:	e1c320b0 	strh	r2, [r3]
    caec:	e30031c2 	movw	r3, #450	; 0x1c2
    caf0:	e18510b3 	strh	r1, [r5, r3]
    caf4:	e3a01d06 	mov	r1, #384	; 0x180
    caf8:	e5880058 	str	r0, [r8, #88]	; 0x58
    cafc:	eb000d91 	bl	10148 <Xil_DCacheFlushRange>
    cb00:	e3a02000 	mov	r2, #0
    cb04:	e3a03000 	mov	r3, #0
    cb08:	e1c629f8 	strd	r2, [r6, #152]	; 0x98
    cb0c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    cb10:	e3550001 	cmp	r5, #1
    cb14:	e2455001 	sub	r5, r5, #1
    cb18:	1affffd8 	bne	ca80 <XSdPs_SetupADMA2DescTbl64Bit+0x3c>
    cb1c:	e1a05003 	mov	r5, r3
    cb20:	eaffffe8 	b	cac8 <XSdPs_SetupADMA2DescTbl64Bit+0x84>

0000cb24 <XSdPs_DllReset>:
    cb24:	e5902004 	ldr	r2, [r0, #4]
    cb28:	e30f3ffb 	movw	r3, #65531	; 0xfffb
    cb2c:	e92d4010 	push	{r4, lr}
    cb30:	e3a01001 	mov	r1, #1
    cb34:	e1a04000 	mov	r4, r0
    cb38:	e1d2c2bc 	ldrh	ip, [r2, #44]	; 0x2c
    cb3c:	e003300c 	and	r3, r3, ip
    cb40:	e1c232bc 	strh	r3, [r2, #44]	; 0x2c
    cb44:	eb000676 	bl	e524 <XSdPs_DllRstCtrl>
    cb48:	e3a00002 	mov	r0, #2
    cb4c:	ebffe288 	bl	5574 <usleep>
    cb50:	e1a00004 	mov	r0, r4
    cb54:	e3a01000 	mov	r1, #0
    cb58:	eb000671 	bl	e524 <XSdPs_DllRstCtrl>
    cb5c:	e5943004 	ldr	r3, [r4, #4]
    cb60:	e1a00004 	mov	r0, r4
    cb64:	e1d312bc 	ldrh	r1, [r3, #44]	; 0x2c
    cb68:	eb000559 	bl	e0d4 <XSdPs_EnableClock>
    cb6c:	e2500000 	subs	r0, r0, #0
    cb70:	13a00001 	movne	r0, #1
    cb74:	e8bd8010 	pop	{r4, pc}

0000cb78 <XSdPs_IdentifyEmmcMode>:
    cb78:	e5d03057 	ldrb	r3, [r0, #87]	; 0x57
    cb7c:	e3530001 	cmp	r3, #1
    cb80:	9a000016 	bls	cbe0 <XSdPs_IdentifyEmmcMode+0x68>
    cb84:	e5d130c4 	ldrb	r3, [r1, #196]	; 0xc4
    cb88:	e3130030 	tst	r3, #48	; 0x30
    cb8c:	0a000006 	beq	cbac <XSdPs_IdentifyEmmcMode+0x34>
    cb90:	e590303c 	ldr	r3, [r0, #60]	; 0x3c
    cb94:	e3a02007 	mov	r2, #7
    cb98:	e580208c 	str	r2, [r0, #140]	; 0x8c
    cb9c:	e3530000 	cmp	r3, #0
    cba0:	0a000011 	beq	cbec <XSdPs_IdentifyEmmcMode+0x74>
    cba4:	e5803090 	str	r3, [r0, #144]	; 0x90
    cba8:	e12fff1e 	bx	lr
    cbac:	e313000c 	tst	r3, #12
    cbb0:	0a000012 	beq	cc00 <XSdPs_IdentifyEmmcMode+0x88>
    cbb4:	e5903034 	ldr	r3, [r0, #52]	; 0x34
    cbb8:	e3a02004 	mov	r2, #4
    cbbc:	e580208c 	str	r2, [r0, #140]	; 0x8c
    cbc0:	e3530000 	cmp	r3, #0
    cbc4:	0a00001b 	beq	cc38 <XSdPs_IdentifyEmmcMode+0xc0>
    cbc8:	e5902030 	ldr	r2, [r0, #48]	; 0x30
    cbcc:	e3520000 	cmp	r2, #0
    cbd0:	0a000018 	beq	cc38 <XSdPs_IdentifyEmmcMode+0xc0>
    cbd4:	e5803090 	str	r3, [r0, #144]	; 0x90
    cbd8:	e5802094 	str	r2, [r0, #148]	; 0x94
    cbdc:	e12fff1e 	bx	lr
    cbe0:	e3a03006 	mov	r3, #6
    cbe4:	e580308c 	str	r3, [r0, #140]	; 0x8c
    cbe8:	e12fff1e 	bx	lr
    cbec:	e5903018 	ldr	r3, [r0, #24]
    cbf0:	e3530002 	cmp	r3, #2
    cbf4:	13a03003 	movne	r3, #3
    cbf8:	e5803090 	str	r3, [r0, #144]	; 0x90
    cbfc:	e12fff1e 	bx	lr
    cc00:	e3130002 	tst	r3, #2
    cc04:	0afffff5 	beq	cbe0 <XSdPs_IdentifyEmmcMode+0x68>
    cc08:	e590302c 	ldr	r3, [r0, #44]	; 0x2c
    cc0c:	e3a02005 	mov	r2, #5
    cc10:	e580208c 	str	r2, [r0, #140]	; 0x8c
    cc14:	e3530000 	cmp	r3, #0
    cc18:	0a000002 	beq	cc28 <XSdPs_IdentifyEmmcMode+0xb0>
    cc1c:	e5902028 	ldr	r2, [r0, #40]	; 0x28
    cc20:	e3520000 	cmp	r2, #0
    cc24:	1affffea 	bne	cbd4 <XSdPs_IdentifyEmmcMode+0x5c>
    cc28:	e3a02006 	mov	r2, #6
    cc2c:	e3a03015 	mov	r3, #21
    cc30:	e1c029f0 	strd	r2, [r0, #144]	; 0x90
    cc34:	e12fff1e 	bx	lr
    cc38:	e3a02006 	mov	r2, #6
    cc3c:	e3a03012 	mov	r3, #18
    cc40:	e1c029f0 	strd	r2, [r0, #144]	; 0x90
    cc44:	e12fff1e 	bx	lr

0000cc48 <XSdPs_CheckEmmcTiming>:
    cc48:	e92d4070 	push	{r4, r5, r6, lr}
    cc4c:	e1a04000 	mov	r4, r0
    cc50:	e1a05001 	mov	r5, r1
    cc54:	eb0001b7 	bl	d338 <XSdPs_Get_Mmc_ExtCsd>
    cc58:	e3500000 	cmp	r0, #0
    cc5c:	1a000005 	bne	cc78 <XSdPs_CheckEmmcTiming+0x30>
    cc60:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    cc64:	e3530007 	cmp	r3, #7
    cc68:	0a000004 	beq	cc80 <XSdPs_CheckEmmcTiming+0x38>
    cc6c:	e2433004 	sub	r3, r3, #4
    cc70:	e3530001 	cmp	r3, #1
    cc74:	9a000005 	bls	cc90 <XSdPs_CheckEmmcTiming+0x48>
    cc78:	e3a00001 	mov	r0, #1
    cc7c:	e8bd8070 	pop	{r4, r5, r6, pc}
    cc80:	e5d500b9 	ldrb	r0, [r5, #185]	; 0xb9
    cc84:	e2500002 	subs	r0, r0, #2
    cc88:	13a00001 	movne	r0, #1
    cc8c:	e8bd8070 	pop	{r4, r5, r6, pc}
    cc90:	e5d500b9 	ldrb	r0, [r5, #185]	; 0xb9
    cc94:	e2500001 	subs	r0, r0, #1
    cc98:	13a00001 	movne	r0, #1
    cc9c:	e8bd8070 	pop	{r4, r5, r6, pc}

0000cca0 <XSdPs_SetClock>:
    cca0:	e5902004 	ldr	r2, [r0, #4]
    cca4:	e2513000 	subs	r3, r1, #0
    cca8:	e3a0c000 	mov	ip, #0
    ccac:	e1c2c2bc 	strh	ip, [r2, #44]	; 0x2c
    ccb0:	1a000001 	bne	ccbc <XSdPs_SetClock+0x1c>
    ccb4:	e1a00003 	mov	r0, r3
    ccb8:	e12fff1e 	bx	lr
    ccbc:	e92d4010 	push	{r4, lr}
    ccc0:	e1a04000 	mov	r4, r0
    ccc4:	eb0005e0 	bl	e44c <XSdPs_CalcClock>
    ccc8:	e6ff1070 	uxth	r1, r0
    cccc:	e1a00004 	mov	r0, r4
    ccd0:	eb0004ff 	bl	e0d4 <XSdPs_EnableClock>
    ccd4:	e2500000 	subs	r0, r0, #0
    ccd8:	13a00001 	movne	r0, #1
    ccdc:	e8bd8010 	pop	{r4, pc}

0000cce0 <XSdPs_CheckVoltage18>:
    cce0:	e5903004 	ldr	r3, [r0, #4]
    cce4:	e1d303be 	ldrh	r0, [r3, #62]	; 0x3e
    cce8:	e2200008 	eor	r0, r0, #8
    ccec:	e7e001d0 	ubfx	r0, r0, #3, #1
    ccf0:	e12fff1e 	bx	lr

0000ccf4 <XSdPs_SetupCmd>:
    ccf4:	e92d4070 	push	{r4, r5, r6, lr}
    ccf8:	e1a06001 	mov	r6, r1
    ccfc:	e3a01001 	mov	r1, #1
    cd00:	e1a05000 	mov	r5, r0
    cd04:	e1a04002 	mov	r4, r2
    cd08:	eb0006da 	bl	e878 <XSdPs_CheckBusIdle>
    cd0c:	e3500000 	cmp	r0, #0
    cd10:	1a00000b 	bne	cd44 <XSdPs_SetupCmd+0x50>
    cd14:	e5953004 	ldr	r3, [r5, #4]
    cd18:	e6ff2074 	uxth	r2, r4
    cd1c:	e3e01000 	mvn	r1, #0
    cd20:	e1c320b6 	strh	r2, [r3, #6]
    cd24:	e3a0200e 	mov	r2, #14
    cd28:	e5c3202e 	strb	r2, [r3, #46]	; 0x2e
    cd2c:	e3e02b03 	mvn	r2, #3072	; 0xc00
    cd30:	e5953004 	ldr	r3, [r5, #4]
    cd34:	e5836008 	str	r6, [r3, #8]
    cd38:	e1c313b0 	strh	r1, [r3, #48]	; 0x30
    cd3c:	e1c323b2 	strh	r2, [r3, #50]	; 0x32
    cd40:	e8bd8070 	pop	{r4, r5, r6, pc}
    cd44:	e3a00001 	mov	r0, #1
    cd48:	e8bd8070 	pop	{r4, r5, r6, pc}

0000cd4c <XSdPs_SendCmd>:
    cd4c:	e92d4070 	push	{r4, r5, r6, lr}
    cd50:	e1a04001 	mov	r4, r1
    cd54:	e2444c13 	sub	r4, r4, #4864	; 0x1300
    cd58:	e1a05000 	mov	r5, r0
    cd5c:	eb0006d3 	bl	e8b0 <XSdPs_FrameCmd>
    cd60:	e3d43c02 	bics	r3, r4, #512	; 0x200
    cd64:	e5951004 	ldr	r1, [r5, #4]
    cd68:	e1a02000 	mov	r2, r0
    cd6c:	0a000004 	beq	cd84 <XSdPs_SendCmd+0x38>
    cd70:	e5913024 	ldr	r3, [r1, #36]	; 0x24
    cd74:	e3130002 	tst	r3, #2
    cd78:	0a000001 	beq	cd84 <XSdPs_SendCmd+0x38>
    cd7c:	e3100020 	tst	r0, #32
    cd80:	1a000007 	bne	cda4 <XSdPs_SendCmd+0x58>
    cd84:	e3a03000 	mov	r3, #0
    cd88:	e1d5cab0 	ldrh	ip, [r5, #160]	; 0xa0
    cd8c:	e3433fff 	movt	r3, #16383	; 0x3fff
    cd90:	e3a00000 	mov	r0, #0
    cd94:	e0033802 	and	r3, r3, r2, lsl #16
    cd98:	e183300c 	orr	r3, r3, ip
    cd9c:	e581300c 	str	r3, [r1, #12]
    cda0:	e8bd8070 	pop	{r4, r5, r6, pc}
    cda4:	e3a00001 	mov	r0, #1
    cda8:	e8bd8070 	pop	{r4, r5, r6, pc}

0000cdac <XSdPs_SetStartAddr>:
    cdac:	e5d03054 	ldrb	r3, [r0, #84]	; 0x54
    cdb0:	e1a02001 	mov	r2, r1
    cdb4:	e3530001 	cmp	r3, #1
    cdb8:	e3a03000 	mov	r3, #0
    cdbc:	0a000001 	beq	cdc8 <XSdPs_SetStartAddr+0x1c>
    cdc0:	e3a01c23 	mov	r1, #8960	; 0x2300
    cdc4:	ea000654 	b	e71c <XSdPs_CmdTransfer>
    cdc8:	e3a01a02 	mov	r1, #8192	; 0x2000
    cdcc:	ea000652 	b	e71c <XSdPs_CmdTransfer>

0000cdd0 <XSdPs_SetEndAddr>:
    cdd0:	e5d03054 	ldrb	r3, [r0, #84]	; 0x54
    cdd4:	e1a02001 	mov	r2, r1
    cdd8:	e3530001 	cmp	r3, #1
    cddc:	e3a03000 	mov	r3, #0
    cde0:	0a000001 	beq	cdec <XSdPs_SetEndAddr+0x1c>
    cde4:	e3a01b09 	mov	r1, #9216	; 0x2400
    cde8:	ea00064b 	b	e71c <XSdPs_CmdTransfer>
    cdec:	e3a01c21 	mov	r1, #8448	; 0x2100
    cdf0:	ea000649 	b	e71c <XSdPs_CmdTransfer>

0000cdf4 <XSdPs_SendErase>:
    cdf4:	e3a03000 	mov	r3, #0
    cdf8:	e92d4010 	push	{r4, lr}
    cdfc:	e1a02003 	mov	r2, r3
    ce00:	e3a01c26 	mov	r1, #9728	; 0x2600
    ce04:	e1a04000 	mov	r4, r0
    ce08:	eb000643 	bl	e71c <XSdPs_CmdTransfer>
    ce0c:	e3500000 	cmp	r0, #0
    ce10:	0a000001 	beq	ce1c <XSdPs_SendErase+0x28>
    ce14:	e3a00001 	mov	r0, #1
    ce18:	e8bd8010 	pop	{r4, pc}
    ce1c:	e1a00004 	mov	r0, r4
    ce20:	e8bd4010 	pop	{r4, lr}
    ce24:	ea000678 	b	e80c <XSdps_CheckTransferDone>

0000ce28 <XSdPs_Change_ClkFreq>:
    ce28:	e92d4030 	push	{r4, r5, lr}
    ce2c:	e2504000 	subs	r4, r0, #0
    ce30:	e24dd00c 	sub	sp, sp, #12
    ce34:	0a00001d 	beq	ceb0 <XSdPs_Change_ClkFreq+0x88>
    ce38:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    ce3c:	e3a03000 	mov	r3, #0
    ce40:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    ce44:	e3405001 	movt	r5, #1
    ce48:	e5853000 	str	r3, [r5]
    ce4c:	e3013111 	movw	r3, #4369	; 0x1111
    ce50:	e3413111 	movt	r3, #4369	; 0x1111
    ce54:	e1520003 	cmp	r2, r3
    ce58:	1a000008 	bne	ce80 <XSdPs_Change_ClkFreq+0x58>
    ce5c:	e5d43056 	ldrb	r3, [r4, #86]	; 0x56
    ce60:	e3530002 	cmp	r3, #2
    ce64:	0a00000d 	beq	cea0 <XSdPs_Change_ClkFreq+0x78>
    ce68:	e1a00004 	mov	r0, r4
    ce6c:	ebffff8b 	bl	cca0 <XSdPs_SetClock>
    ce70:	e2500000 	subs	r0, r0, #0
    ce74:	13a00001 	movne	r0, #1
    ce78:	e28dd00c 	add	sp, sp, #12
    ce7c:	e8bd8030 	pop	{r4, r5, pc}
    ce80:	e59f0048 	ldr	r0, [pc, #72]	; ced0 <XSdPs_Change_ClkFreq+0xa8>
    ce84:	e3a0106b 	mov	r1, #107	; 0x6b
    ce88:	eb0006f9 	bl	ea74 <Xil_Assert>
    ce8c:	e3a03001 	mov	r3, #1
    ce90:	e5853000 	str	r3, [r5]
    ce94:	e3a00000 	mov	r0, #0
    ce98:	e28dd00c 	add	sp, sp, #12
    ce9c:	e8bd8030 	pop	{r4, r5, pc}
    cea0:	e58d1004 	str	r1, [sp, #4]
    cea4:	ebfffe65 	bl	c840 <XSdPs_SetTapDelay>
    cea8:	e59d1004 	ldr	r1, [sp, #4]
    ceac:	eaffffed 	b	ce68 <XSdPs_Change_ClkFreq+0x40>
    ceb0:	e59f0018 	ldr	r0, [pc, #24]	; ced0 <XSdPs_Change_ClkFreq+0xa8>
    ceb4:	e3a0106a 	mov	r1, #106	; 0x6a
    ceb8:	eb0006ed 	bl	ea74 <Xil_Assert>
    cebc:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    cec0:	e3a02001 	mov	r2, #1
    cec4:	e3403001 	movt	r3, #1
    cec8:	e5832000 	str	r2, [r3]
    cecc:	eafffff0 	b	ce94 <XSdPs_Change_ClkFreq+0x6c>
    ced0:	000123b2 	.word	0x000123b2

0000ced4 <XSdPs_SetBlkSize>:
    ced4:	e92d4070 	push	{r4, r5, r6, lr}
    ced8:	e2505000 	subs	r5, r0, #0
    cedc:	0a000022 	beq	cf6c <XSdPs_SetBlkSize+0x98>
    cee0:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    cee4:	e3a03000 	mov	r3, #0
    cee8:	e5952044 	ldr	r2, [r5, #68]	; 0x44
    ceec:	e3404001 	movt	r4, #1
    cef0:	e5843000 	str	r3, [r4]
    cef4:	e3013111 	movw	r3, #4369	; 0x1111
    cef8:	e3413111 	movt	r3, #4369	; 0x1111
    cefc:	e1520003 	cmp	r2, r3
    cf00:	1a000010 	bne	cf48 <XSdPs_SetBlkSize+0x74>
    cf04:	e1a06001 	mov	r6, r1
    cf08:	e3001303 	movw	r1, #771	; 0x303
    cf0c:	eb000659 	bl	e878 <XSdPs_CheckBusIdle>
    cf10:	e2503000 	subs	r3, r0, #0
    cf14:	1a000012 	bne	cf64 <XSdPs_SetBlkSize+0x90>
    cf18:	e1a02006 	mov	r2, r6
    cf1c:	e3a01a01 	mov	r1, #4096	; 0x1000
    cf20:	e1a00005 	mov	r0, r5
    cf24:	eb0005fc 	bl	e71c <XSdPs_CmdTransfer>
    cf28:	e3500000 	cmp	r0, #0
    cf2c:	1a00000c 	bne	cf64 <XSdPs_SetBlkSize+0x90>
    cf30:	e5953004 	ldr	r3, [r5, #4]
    cf34:	e7eb2056 	ubfx	r2, r6, #0, #12
    cf38:	e3a00000 	mov	r0, #0
    cf3c:	e1c320b4 	strh	r2, [r3, #4]
    cf40:	e58560ac 	str	r6, [r5, #172]	; 0xac
    cf44:	e8bd8070 	pop	{r4, r5, r6, pc}
    cf48:	e59f003c 	ldr	r0, [pc, #60]	; cf8c <XSdPs_SetBlkSize+0xb8>
    cf4c:	e3a010a6 	mov	r1, #166	; 0xa6
    cf50:	eb0006c7 	bl	ea74 <Xil_Assert>
    cf54:	e3a03001 	mov	r3, #1
    cf58:	e5843000 	str	r3, [r4]
    cf5c:	e3a00000 	mov	r0, #0
    cf60:	e8bd8070 	pop	{r4, r5, r6, pc}
    cf64:	e3a00001 	mov	r0, #1
    cf68:	e8bd8070 	pop	{r4, r5, r6, pc}
    cf6c:	e59f0018 	ldr	r0, [pc, #24]	; cf8c <XSdPs_SetBlkSize+0xb8>
    cf70:	e3a010a5 	mov	r1, #165	; 0xa5
    cf74:	eb0006be 	bl	ea74 <Xil_Assert>
    cf78:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    cf7c:	e3a02001 	mov	r2, #1
    cf80:	e3403001 	movt	r3, #1
    cf84:	e5832000 	str	r2, [r3]
    cf88:	eafffff3 	b	cf5c <XSdPs_SetBlkSize+0x88>
    cf8c:	000123b2 	.word	0x000123b2

0000cf90 <XSdPs_Get_BusWidth>:
    cf90:	e92d4070 	push	{r4, r5, r6, lr}
    cf94:	e2504000 	subs	r4, r0, #0
    cf98:	0a00002d 	beq	d054 <XSdPs_Get_BusWidth+0xc4>
    cf9c:	e1a05001 	mov	r5, r1
    cfa0:	e5941044 	ldr	r1, [r4, #68]	; 0x44
    cfa4:	e3012111 	movw	r2, #4369	; 0x1111
    cfa8:	e30f64c4 	movw	r6, #62660	; 0xf4c4
    cfac:	e3412111 	movt	r2, #4369	; 0x1111
    cfb0:	e3a03000 	mov	r3, #0
    cfb4:	e1510002 	cmp	r1, r2
    cfb8:	e3406001 	movt	r6, #1
    cfbc:	e5863000 	str	r3, [r6]
    cfc0:	1a00001c 	bne	d038 <XSdPs_Get_BusWidth+0xa8>
    cfc4:	e5853000 	str	r3, [r5]
    cfc8:	e3a01c37 	mov	r1, #14080	; 0x3700
    cfcc:	e5853004 	str	r3, [r5, #4]
    cfd0:	e5942070 	ldr	r2, [r4, #112]	; 0x70
    cfd4:	eb0005d0 	bl	e71c <XSdPs_CmdTransfer>
    cfd8:	e2506000 	subs	r6, r0, #0
    cfdc:	0a000001 	beq	cfe8 <XSdPs_Get_BusWidth+0x58>
    cfe0:	e3a00001 	mov	r0, #1
    cfe4:	e8bd8070 	pop	{r4, r5, r6, pc}
    cfe8:	e1a03005 	mov	r3, r5
    cfec:	e3a02008 	mov	r2, #8
    cff0:	e3a01001 	mov	r1, #1
    cff4:	e1a00004 	mov	r0, r4
    cff8:	eb00048a 	bl	e228 <XSdPs_SetupReadDma>
    cffc:	e3a03001 	mov	r3, #1
    d000:	e1a02006 	mov	r2, r6
    d004:	e3a01cb3 	mov	r1, #45824	; 0xb300
    d008:	e1a00004 	mov	r0, r4
    d00c:	eb0005c2 	bl	e71c <XSdPs_CmdTransfer>
    d010:	e3500000 	cmp	r0, #0
    d014:	1afffff1 	bne	cfe0 <XSdPs_Get_BusWidth+0x50>
    d018:	e1a00004 	mov	r0, r4
    d01c:	eb0005fa 	bl	e80c <XSdps_CheckTransferDone>
    d020:	e3500000 	cmp	r0, #0
    d024:	1affffed 	bne	cfe0 <XSdPs_Get_BusWidth+0x50>
    d028:	e3a01008 	mov	r1, #8
    d02c:	e1a00005 	mov	r0, r5
    d030:	eb000bd4 	bl	ff88 <Xil_DCacheInvalidateRange>
    d034:	ea000004 	b	d04c <XSdPs_Get_BusWidth+0xbc>
    d038:	e59f0034 	ldr	r0, [pc, #52]	; d074 <XSdPs_Get_BusWidth+0xe4>
    d03c:	e3a010db 	mov	r1, #219	; 0xdb
    d040:	eb00068b 	bl	ea74 <Xil_Assert>
    d044:	e3a03001 	mov	r3, #1
    d048:	e5863000 	str	r3, [r6]
    d04c:	e3a00000 	mov	r0, #0
    d050:	e8bd8070 	pop	{r4, r5, r6, pc}
    d054:	e59f0018 	ldr	r0, [pc, #24]	; d074 <XSdPs_Get_BusWidth+0xe4>
    d058:	e3a010da 	mov	r1, #218	; 0xda
    d05c:	eb000684 	bl	ea74 <Xil_Assert>
    d060:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d064:	e3a02001 	mov	r2, #1
    d068:	e3403001 	movt	r3, #1
    d06c:	e5832000 	str	r2, [r3]
    d070:	eafffff5 	b	d04c <XSdPs_Get_BusWidth+0xbc>
    d074:	000123b2 	.word	0x000123b2

0000d078 <XSdPs_Get_BusSpeed>:
    d078:	e92d4070 	push	{r4, r5, r6, lr}
    d07c:	e2504000 	subs	r4, r0, #0
    d080:	0a00002d 	beq	d13c <XSdPs_Get_BusSpeed+0xc4>
    d084:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    d088:	e3013111 	movw	r3, #4369	; 0x1111
    d08c:	e3413111 	movt	r3, #4369	; 0x1111
    d090:	e30f64c4 	movw	r6, #62660	; 0xf4c4
    d094:	e3406001 	movt	r6, #1
    d098:	e1520003 	cmp	r2, r3
    d09c:	e3a02000 	mov	r2, #0
    d0a0:	01a05001 	moveq	r5, r1
    d0a4:	e5862000 	str	r2, [r6]
    d0a8:	01a03005 	moveq	r3, r5
    d0ac:	0285c040 	addeq	ip, r5, #64	; 0x40
    d0b0:	1a00001a 	bne	d120 <XSdPs_Get_BusSpeed+0xa8>
    d0b4:	e4832004 	str	r2, [r3], #4
    d0b8:	e15c0003 	cmp	ip, r3
    d0bc:	1afffffc 	bne	d0b4 <XSdPs_Get_BusSpeed+0x3c>
    d0c0:	e1a03005 	mov	r3, r5
    d0c4:	e3a02040 	mov	r2, #64	; 0x40
    d0c8:	e3a01001 	mov	r1, #1
    d0cc:	e1a00004 	mov	r0, r4
    d0d0:	eb000454 	bl	e228 <XSdPs_SetupReadDma>
    d0d4:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    d0d8:	e3a03001 	mov	r3, #1
    d0dc:	e34020ff 	movt	r2, #255	; 0xff
    d0e0:	e3a01c06 	mov	r1, #1536	; 0x600
    d0e4:	e1a00004 	mov	r0, r4
    d0e8:	eb00058b 	bl	e71c <XSdPs_CmdTransfer>
    d0ec:	e3500000 	cmp	r0, #0
    d0f0:	0a000001 	beq	d0fc <XSdPs_Get_BusSpeed+0x84>
    d0f4:	e3a00001 	mov	r0, #1
    d0f8:	e8bd8070 	pop	{r4, r5, r6, pc}
    d0fc:	e1a00004 	mov	r0, r4
    d100:	eb0005c1 	bl	e80c <XSdps_CheckTransferDone>
    d104:	e3500000 	cmp	r0, #0
    d108:	1afffff9 	bne	d0f4 <XSdPs_Get_BusSpeed+0x7c>
    d10c:	e1a00005 	mov	r0, r5
    d110:	e3a01040 	mov	r1, #64	; 0x40
    d114:	eb000b9b 	bl	ff88 <Xil_DCacheInvalidateRange>
    d118:	e3a00000 	mov	r0, #0
    d11c:	e8bd8070 	pop	{r4, r5, r6, pc}
    d120:	e59f0034 	ldr	r0, [pc, #52]	; d15c <XSdPs_Get_BusSpeed+0xe4>
    d124:	e300118e 	movw	r1, #398	; 0x18e
    d128:	eb000651 	bl	ea74 <Xil_Assert>
    d12c:	e3a03001 	mov	r3, #1
    d130:	e5863000 	str	r3, [r6]
    d134:	e3a00000 	mov	r0, #0
    d138:	e8bd8070 	pop	{r4, r5, r6, pc}
    d13c:	e59f0018 	ldr	r0, [pc, #24]	; d15c <XSdPs_Get_BusSpeed+0xe4>
    d140:	e300118d 	movw	r1, #397	; 0x18d
    d144:	eb00064a 	bl	ea74 <Xil_Assert>
    d148:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d14c:	e3a02001 	mov	r2, #1
    d150:	e3403001 	movt	r3, #1
    d154:	e5832000 	str	r2, [r3]
    d158:	eafffff5 	b	d134 <XSdPs_Get_BusSpeed+0xbc>
    d15c:	000123b2 	.word	0x000123b2

0000d160 <XSdPs_Get_Status>:
    d160:	e92d4070 	push	{r4, r5, r6, lr}
    d164:	e2505000 	subs	r5, r0, #0
    d168:	0a00002b 	beq	d21c <XSdPs_Get_Status+0xbc>
    d16c:	e1a06001 	mov	r6, r1
    d170:	e5951044 	ldr	r1, [r5, #68]	; 0x44
    d174:	e3012111 	movw	r2, #4369	; 0x1111
    d178:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d17c:	e3412111 	movt	r2, #4369	; 0x1111
    d180:	e3a03000 	mov	r3, #0
    d184:	e1510002 	cmp	r1, r2
    d188:	e3404001 	movt	r4, #1
    d18c:	e5843000 	str	r3, [r4]
    d190:	1a000012 	bne	d1e0 <XSdPs_Get_Status+0x80>
    d194:	e5952070 	ldr	r2, [r5, #112]	; 0x70
    d198:	e3a01c37 	mov	r1, #14080	; 0x3700
    d19c:	eb00055e 	bl	e71c <XSdPs_CmdTransfer>
    d1a0:	e2504000 	subs	r4, r0, #0
    d1a4:	1a00000b 	bne	d1d8 <XSdPs_Get_Status+0x78>
    d1a8:	e1a03006 	mov	r3, r6
    d1ac:	e3a02040 	mov	r2, #64	; 0x40
    d1b0:	e3a01001 	mov	r1, #1
    d1b4:	e1a00005 	mov	r0, r5
    d1b8:	eb00041a 	bl	e228 <XSdPs_SetupReadDma>
    d1bc:	e3a03001 	mov	r3, #1
    d1c0:	e1a02004 	mov	r2, r4
    d1c4:	e3a01c8d 	mov	r1, #36096	; 0x8d00
    d1c8:	e1a00005 	mov	r0, r5
    d1cc:	eb000552 	bl	e71c <XSdPs_CmdTransfer>
    d1d0:	e3500000 	cmp	r0, #0
    d1d4:	0a000008 	beq	d1fc <XSdPs_Get_Status+0x9c>
    d1d8:	e3a00001 	mov	r0, #1
    d1dc:	e8bd8070 	pop	{r4, r5, r6, pc}
    d1e0:	e59f0054 	ldr	r0, [pc, #84]	; d23c <XSdPs_Get_Status+0xdc>
    d1e4:	e3a01e1d 	mov	r1, #464	; 0x1d0
    d1e8:	eb000621 	bl	ea74 <Xil_Assert>
    d1ec:	e3a03001 	mov	r3, #1
    d1f0:	e5843000 	str	r3, [r4]
    d1f4:	e3a00000 	mov	r0, #0
    d1f8:	e8bd8070 	pop	{r4, r5, r6, pc}
    d1fc:	e1a00005 	mov	r0, r5
    d200:	eb000581 	bl	e80c <XSdps_CheckTransferDone>
    d204:	e3500000 	cmp	r0, #0
    d208:	1afffff2 	bne	d1d8 <XSdPs_Get_Status+0x78>
    d20c:	e3a01040 	mov	r1, #64	; 0x40
    d210:	e1a00006 	mov	r0, r6
    d214:	eb000b5b 	bl	ff88 <Xil_DCacheInvalidateRange>
    d218:	eafffff5 	b	d1f4 <XSdPs_Get_Status+0x94>
    d21c:	e59f0018 	ldr	r0, [pc, #24]	; d23c <XSdPs_Get_Status+0xdc>
    d220:	e30011cf 	movw	r1, #463	; 0x1cf
    d224:	eb000612 	bl	ea74 <Xil_Assert>
    d228:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d22c:	e3a02001 	mov	r2, #1
    d230:	e3403001 	movt	r3, #1
    d234:	e5832000 	str	r2, [r3]
    d238:	eaffffed 	b	d1f4 <XSdPs_Get_Status+0x94>
    d23c:	000123b2 	.word	0x000123b2

0000d240 <XSdPs_Change_BusSpeed>:
    d240:	e92d4070 	push	{r4, r5, r6, lr}
    d244:	e2504000 	subs	r4, r0, #0
    d248:	0a000031 	beq	d314 <XSdPs_Change_BusSpeed+0xd4>
    d24c:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    d250:	e3013111 	movw	r3, #4369	; 0x1111
    d254:	e3413111 	movt	r3, #4369	; 0x1111
    d258:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    d25c:	e3405001 	movt	r5, #1
    d260:	e1520003 	cmp	r2, r3
    d264:	e3a03000 	mov	r3, #0
    d268:	e5853000 	str	r3, [r5]
    d26c:	1a000021 	bne	d2f8 <XSdPs_Change_BusSpeed+0xb8>
    d270:	e5d43054 	ldrb	r3, [r4, #84]	; 0x54
    d274:	e3530001 	cmp	r3, #1
    d278:	0a000019 	beq	d2e4 <XSdPs_Change_BusSpeed+0xa4>
    d27c:	ebfffda9 	bl	c928 <XSdPs_Change_MmcBusSpeed>
    d280:	e3500000 	cmp	r0, #0
    d284:	1a000019 	bne	d2f0 <XSdPs_Change_BusSpeed+0xb0>
    d288:	e5941058 	ldr	r1, [r4, #88]	; 0x58
    d28c:	e1a00004 	mov	r0, r4
    d290:	ebfffee4 	bl	ce28 <XSdPs_Change_ClkFreq>
    d294:	e3500000 	cmp	r0, #0
    d298:	1a000014 	bne	d2f0 <XSdPs_Change_BusSpeed+0xb0>
    d29c:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    d2a0:	e2432007 	sub	r2, r3, #7
    d2a4:	e2433002 	sub	r3, r3, #2
    d2a8:	e3530001 	cmp	r3, #1
    d2ac:	83520001 	cmphi	r2, #1
    d2b0:	8a000003 	bhi	d2c4 <XSdPs_Change_BusSpeed+0x84>
    d2b4:	e1a00004 	mov	r0, r4
    d2b8:	eb000375 	bl	e094 <XSdPs_Execute_Tuning>
    d2bc:	e3500000 	cmp	r0, #0
    d2c0:	1a00000a 	bne	d2f0 <XSdPs_Change_BusSpeed+0xb0>
    d2c4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    d2c8:	ebffe0a9 	bl	5574 <usleep>
    d2cc:	e5942004 	ldr	r2, [r4, #4]
    d2d0:	e5d23028 	ldrb	r3, [r2, #40]	; 0x28
    d2d4:	e3833004 	orr	r3, r3, #4
    d2d8:	e5c23028 	strb	r3, [r2, #40]	; 0x28
    d2dc:	e3a00000 	mov	r0, #0
    d2e0:	e8bd8070 	pop	{r4, r5, r6, pc}
    d2e4:	ebfffd65 	bl	c880 <XSdPs_Change_SdBusSpeed>
    d2e8:	e3500000 	cmp	r0, #0
    d2ec:	0affffe5 	beq	d288 <XSdPs_Change_BusSpeed+0x48>
    d2f0:	e3a00001 	mov	r0, #1
    d2f4:	e8bd8070 	pop	{r4, r5, r6, pc}
    d2f8:	e59f0034 	ldr	r0, [pc, #52]	; d334 <XSdPs_Change_BusSpeed+0xf4>
    d2fc:	e3001211 	movw	r1, #529	; 0x211
    d300:	eb0005db 	bl	ea74 <Xil_Assert>
    d304:	e3a03001 	mov	r3, #1
    d308:	e3a00000 	mov	r0, #0
    d30c:	e5853000 	str	r3, [r5]
    d310:	e8bd8070 	pop	{r4, r5, r6, pc}
    d314:	e59f0018 	ldr	r0, [pc, #24]	; d334 <XSdPs_Change_BusSpeed+0xf4>
    d318:	e3a01e21 	mov	r1, #528	; 0x210
    d31c:	eb0005d4 	bl	ea74 <Xil_Assert>
    d320:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d324:	e3a02001 	mov	r2, #1
    d328:	e3403001 	movt	r3, #1
    d32c:	e5832000 	str	r2, [r3]
    d330:	eaffffe9 	b	d2dc <XSdPs_Change_BusSpeed+0x9c>
    d334:	000123b2 	.word	0x000123b2

0000d338 <XSdPs_Get_Mmc_ExtCsd>:
    d338:	e92d4070 	push	{r4, r5, r6, lr}
    d33c:	e2504000 	subs	r4, r0, #0
    d340:	0a00002c 	beq	d3f8 <XSdPs_Get_Mmc_ExtCsd+0xc0>
    d344:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    d348:	e3013111 	movw	r3, #4369	; 0x1111
    d34c:	e3413111 	movt	r3, #4369	; 0x1111
    d350:	e30f64c4 	movw	r6, #62660	; 0xf4c4
    d354:	e3406001 	movt	r6, #1
    d358:	e1520003 	cmp	r2, r3
    d35c:	e3a02000 	mov	r2, #0
    d360:	01a05001 	moveq	r5, r1
    d364:	e5862000 	str	r2, [r6]
    d368:	01a03005 	moveq	r3, r5
    d36c:	02850c02 	addeq	r0, r5, #512	; 0x200
    d370:	1a000019 	bne	d3dc <XSdPs_Get_Mmc_ExtCsd+0xa4>
    d374:	e4832004 	str	r2, [r3], #4
    d378:	e1500003 	cmp	r0, r3
    d37c:	1afffffc 	bne	d374 <XSdPs_Get_Mmc_ExtCsd+0x3c>
    d380:	e1a03005 	mov	r3, r5
    d384:	e3a02c02 	mov	r2, #512	; 0x200
    d388:	e3a01001 	mov	r1, #1
    d38c:	e1a00004 	mov	r0, r4
    d390:	eb0003a4 	bl	e228 <XSdPs_SetupReadDma>
    d394:	e3a03001 	mov	r3, #1
    d398:	e3a02000 	mov	r2, #0
    d39c:	e3a01b02 	mov	r1, #2048	; 0x800
    d3a0:	e1a00004 	mov	r0, r4
    d3a4:	eb0004dc 	bl	e71c <XSdPs_CmdTransfer>
    d3a8:	e3500000 	cmp	r0, #0
    d3ac:	0a000001 	beq	d3b8 <XSdPs_Get_Mmc_ExtCsd+0x80>
    d3b0:	e3a00001 	mov	r0, #1
    d3b4:	e8bd8070 	pop	{r4, r5, r6, pc}
    d3b8:	e1a00004 	mov	r0, r4
    d3bc:	eb000512 	bl	e80c <XSdps_CheckTransferDone>
    d3c0:	e3500000 	cmp	r0, #0
    d3c4:	1afffff9 	bne	d3b0 <XSdPs_Get_Mmc_ExtCsd+0x78>
    d3c8:	e1a00005 	mov	r0, r5
    d3cc:	e3a01c02 	mov	r1, #512	; 0x200
    d3d0:	eb000aec 	bl	ff88 <Xil_DCacheInvalidateRange>
    d3d4:	e3a00000 	mov	r0, #0
    d3d8:	e8bd8070 	pop	{r4, r5, r6, pc}
    d3dc:	e59f0034 	ldr	r0, [pc, #52]	; d418 <XSdPs_Get_Mmc_ExtCsd+0xe0>
    d3e0:	e3001265 	movw	r1, #613	; 0x265
    d3e4:	eb0005a2 	bl	ea74 <Xil_Assert>
    d3e8:	e3a03001 	mov	r3, #1
    d3ec:	e5863000 	str	r3, [r6]
    d3f0:	e3a00000 	mov	r0, #0
    d3f4:	e8bd8070 	pop	{r4, r5, r6, pc}
    d3f8:	e59f0018 	ldr	r0, [pc, #24]	; d418 <XSdPs_Get_Mmc_ExtCsd+0xe0>
    d3fc:	e3a01f99 	mov	r1, #612	; 0x264
    d400:	eb00059b 	bl	ea74 <Xil_Assert>
    d404:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d408:	e3a02001 	mov	r2, #1
    d40c:	e3403001 	movt	r3, #1
    d410:	e5832000 	str	r2, [r3]
    d414:	eafffff5 	b	d3f0 <XSdPs_Get_Mmc_ExtCsd+0xb8>
    d418:	000123b2 	.word	0x000123b2

0000d41c <XSdPs_Set_Mmc_ExtCsd>:
    d41c:	e92d4070 	push	{r4, r5, r6, lr}
    d420:	e2504000 	subs	r4, r0, #0
    d424:	0a00001b 	beq	d498 <XSdPs_Set_Mmc_ExtCsd+0x7c>
    d428:	e594c044 	ldr	ip, [r4, #68]	; 0x44
    d42c:	e3012111 	movw	r2, #4369	; 0x1111
    d430:	e3412111 	movt	r2, #4369	; 0x1111
    d434:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    d438:	e3a03000 	mov	r3, #0
    d43c:	e3405001 	movt	r5, #1
    d440:	e15c0002 	cmp	ip, r2
    d444:	e5853000 	str	r3, [r5]
    d448:	1a000006 	bne	d468 <XSdPs_Set_Mmc_ExtCsd+0x4c>
    d44c:	e1a02001 	mov	r2, r1
    d450:	e3a01c06 	mov	r1, #1536	; 0x600
    d454:	eb0004b0 	bl	e71c <XSdPs_CmdTransfer>
    d458:	e3500000 	cmp	r0, #0
    d45c:	0a000008 	beq	d484 <XSdPs_Set_Mmc_ExtCsd+0x68>
    d460:	e3a00001 	mov	r0, #1
    d464:	e8bd8070 	pop	{r4, r5, r6, pc}
    d468:	e59f0048 	ldr	r0, [pc, #72]	; d4b8 <XSdPs_Set_Mmc_ExtCsd+0x9c>
    d46c:	e3a01fa9 	mov	r1, #676	; 0x2a4
    d470:	eb00057f 	bl	ea74 <Xil_Assert>
    d474:	e3a03001 	mov	r3, #1
    d478:	e5853000 	str	r3, [r5]
    d47c:	e3a00000 	mov	r0, #0
    d480:	e8bd8070 	pop	{r4, r5, r6, pc}
    d484:	e1a00004 	mov	r0, r4
    d488:	eb0004df 	bl	e80c <XSdps_CheckTransferDone>
    d48c:	e2500000 	subs	r0, r0, #0
    d490:	13a00001 	movne	r0, #1
    d494:	e8bd8070 	pop	{r4, r5, r6, pc}
    d498:	e59f0018 	ldr	r0, [pc, #24]	; d4b8 <XSdPs_Set_Mmc_ExtCsd+0x9c>
    d49c:	e30012a3 	movw	r1, #675	; 0x2a3
    d4a0:	eb000573 	bl	ea74 <Xil_Assert>
    d4a4:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d4a8:	e3a02001 	mov	r2, #1
    d4ac:	e3403001 	movt	r3, #1
    d4b0:	e5832000 	str	r2, [r3]
    d4b4:	eafffff0 	b	d47c <XSdPs_Set_Mmc_ExtCsd+0x60>
    d4b8:	000123b2 	.word	0x000123b2

0000d4bc <XSdPs_Change_BusWidth>:
    d4bc:	e92d4070 	push	{r4, r5, r6, lr}
    d4c0:	e2504000 	subs	r4, r0, #0
    d4c4:	0a000056 	beq	d624 <XSdPs_Change_BusWidth+0x168>
    d4c8:	e5941044 	ldr	r1, [r4, #68]	; 0x44
    d4cc:	e3013111 	movw	r3, #4369	; 0x1111
    d4d0:	e3413111 	movt	r3, #4369	; 0x1111
    d4d4:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    d4d8:	e3405001 	movt	r5, #1
    d4dc:	e3a02000 	mov	r2, #0
    d4e0:	e1510003 	cmp	r1, r3
    d4e4:	e5852000 	str	r2, [r5]
    d4e8:	1a00002f 	bne	d5ac <XSdPs_Change_BusWidth+0xf0>
    d4ec:	e5d43056 	ldrb	r3, [r4, #86]	; 0x56
    d4f0:	e3530002 	cmp	r3, #2
    d4f4:	0a000025 	beq	d590 <XSdPs_Change_BusWidth+0xd4>
    d4f8:	e5d43054 	ldrb	r3, [r4, #84]	; 0x54
    d4fc:	e3530001 	cmp	r3, #1
    d500:	0a000030 	beq	d5c8 <XSdPs_Change_BusWidth+0x10c>
    d504:	e5d42057 	ldrb	r2, [r4, #87]	; 0x57
    d508:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    d50c:	e3520003 	cmp	r2, #3
    d510:	0a00003b 	beq	d604 <XSdPs_Change_BusWidth+0x148>
    d514:	e3a02c05 	mov	r2, #1280	; 0x500
    d518:	e3a01c01 	mov	r1, #256	; 0x100
    d51c:	e34023b7 	movt	r2, #951	; 0x3b7
    d520:	e3530004 	cmp	r3, #4
    d524:	e34013b7 	movt	r1, #951	; 0x3b7
    d528:	01a01002 	moveq	r1, r2
    d52c:	e1a00004 	mov	r0, r4
    d530:	ebffffb9 	bl	d41c <XSdPs_Set_Mmc_ExtCsd>
    d534:	e3500000 	cmp	r0, #0
    d538:	1a00002f 	bne	d5fc <XSdPs_Change_BusWidth+0x140>
    d53c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    d540:	ebffe00b 	bl	5574 <usleep>
    d544:	e5942004 	ldr	r2, [r4, #4]
    d548:	e5d41057 	ldrb	r1, [r4, #87]	; 0x57
    d54c:	e5d23028 	ldrb	r3, [r2, #40]	; 0x28
    d550:	e3510003 	cmp	r1, #3
    d554:	e6ef3073 	uxtb	r3, r3
    d558:	13833002 	orrne	r3, r3, #2
    d55c:	03833020 	orreq	r3, r3, #32
    d560:	e5c23028 	strb	r3, [r2, #40]	; 0x28
    d564:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    d568:	e3530004 	cmp	r3, #4
    d56c:	1a000005 	bne	d588 <XSdPs_Change_BusWidth+0xcc>
    d570:	e5942004 	ldr	r2, [r4, #4]
    d574:	e30f3ff8 	movw	r3, #65528	; 0xfff8
    d578:	e1d213be 	ldrh	r1, [r2, #62]	; 0x3e
    d57c:	e0033001 	and	r3, r3, r1
    d580:	e3833004 	orr	r3, r3, #4
    d584:	e1c233be 	strh	r3, [r2, #62]	; 0x3e
    d588:	e3a00000 	mov	r0, #0
    d58c:	e8bd8070 	pop	{r4, r5, r6, pc}
    d590:	e5943014 	ldr	r3, [r4, #20]
    d594:	e3530003 	cmp	r3, #3
    d598:	9afffffa 	bls	d588 <XSdPs_Change_BusWidth+0xcc>
    d59c:	e5d43054 	ldrb	r3, [r4, #84]	; 0x54
    d5a0:	e3530001 	cmp	r3, #1
    d5a4:	1affffd6 	bne	d504 <XSdPs_Change_BusWidth+0x48>
    d5a8:	ea000006 	b	d5c8 <XSdPs_Change_BusWidth+0x10c>
    d5ac:	e59f0090 	ldr	r0, [pc, #144]	; d644 <XSdPs_Change_BusWidth+0x188>
    d5b0:	e3001122 	movw	r1, #290	; 0x122
    d5b4:	eb00052e 	bl	ea74 <Xil_Assert>
    d5b8:	e3a03001 	mov	r3, #1
    d5bc:	e3a00000 	mov	r0, #0
    d5c0:	e5853000 	str	r3, [r5]
    d5c4:	e8bd8070 	pop	{r4, r5, r6, pc}
    d5c8:	e3a03000 	mov	r3, #0
    d5cc:	e5942070 	ldr	r2, [r4, #112]	; 0x70
    d5d0:	e3a01c37 	mov	r1, #14080	; 0x3700
    d5d4:	e1a00004 	mov	r0, r4
    d5d8:	eb00044f 	bl	e71c <XSdPs_CmdTransfer>
    d5dc:	e2503000 	subs	r3, r0, #0
    d5e0:	1a000005 	bne	d5fc <XSdPs_Change_BusWidth+0x140>
    d5e4:	e5d42057 	ldrb	r2, [r4, #87]	; 0x57
    d5e8:	e3a01c86 	mov	r1, #34304	; 0x8600
    d5ec:	e1a00004 	mov	r0, r4
    d5f0:	eb000449 	bl	e71c <XSdPs_CmdTransfer>
    d5f4:	e3500000 	cmp	r0, #0
    d5f8:	0affffcf 	beq	d53c <XSdPs_Change_BusWidth+0x80>
    d5fc:	e3a00001 	mov	r0, #1
    d600:	e8bd8070 	pop	{r4, r5, r6, pc}
    d604:	e2433004 	sub	r3, r3, #4
    d608:	e3a02c06 	mov	r2, #1536	; 0x600
    d60c:	e3a01c02 	mov	r1, #512	; 0x200
    d610:	e34023b7 	movt	r2, #951	; 0x3b7
    d614:	e3d33004 	bics	r3, r3, #4
    d618:	e34013b7 	movt	r1, #951	; 0x3b7
    d61c:	01a01002 	moveq	r1, r2
    d620:	eaffffc1 	b	d52c <XSdPs_Change_BusWidth+0x70>
    d624:	e59f0018 	ldr	r0, [pc, #24]	; d644 <XSdPs_Change_BusWidth+0x188>
    d628:	e3001121 	movw	r1, #289	; 0x121
    d62c:	eb000510 	bl	ea74 <Xil_Assert>
    d630:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d634:	e3a02001 	mov	r2, #1
    d638:	e3403001 	movt	r3, #1
    d63c:	e5832000 	str	r2, [r3]
    d640:	eaffffd0 	b	d588 <XSdPs_Change_BusWidth+0xcc>
    d644:	000123b2 	.word	0x000123b2

0000d648 <XSdPs_Pullup>:
    d648:	e92d4070 	push	{r4, r5, r6, lr}
    d64c:	e2504000 	subs	r4, r0, #0
    d650:	0a00001d 	beq	d6cc <XSdPs_Pullup+0x84>
    d654:	e5942044 	ldr	r2, [r4, #68]	; 0x44
    d658:	e3013111 	movw	r3, #4369	; 0x1111
    d65c:	e3413111 	movt	r3, #4369	; 0x1111
    d660:	e30f54c4 	movw	r5, #62660	; 0xf4c4
    d664:	e3405001 	movt	r5, #1
    d668:	e1520003 	cmp	r2, r3
    d66c:	e3a03000 	mov	r3, #0
    d670:	e5853000 	str	r3, [r5]
    d674:	1a000006 	bne	d694 <XSdPs_Pullup+0x4c>
    d678:	e5942070 	ldr	r2, [r4, #112]	; 0x70
    d67c:	e3a01c37 	mov	r1, #14080	; 0x3700
    d680:	eb000425 	bl	e71c <XSdPs_CmdTransfer>
    d684:	e2503000 	subs	r3, r0, #0
    d688:	0a000008 	beq	d6b0 <XSdPs_Pullup+0x68>
    d68c:	e3a00001 	mov	r0, #1
    d690:	e8bd8070 	pop	{r4, r5, r6, pc}
    d694:	e59f0050 	ldr	r0, [pc, #80]	; d6ec <XSdPs_Pullup+0xa4>
    d698:	e30012ce 	movw	r1, #718	; 0x2ce
    d69c:	eb0004f4 	bl	ea74 <Xil_Assert>
    d6a0:	e3a03001 	mov	r3, #1
    d6a4:	e5853000 	str	r3, [r5]
    d6a8:	e3a00000 	mov	r0, #0
    d6ac:	e8bd8070 	pop	{r4, r5, r6, pc}
    d6b0:	e1a02003 	mov	r2, r3
    d6b4:	e3a01caa 	mov	r1, #43520	; 0xaa00
    d6b8:	e1a00004 	mov	r0, r4
    d6bc:	eb000416 	bl	e71c <XSdPs_CmdTransfer>
    d6c0:	e2500000 	subs	r0, r0, #0
    d6c4:	13a00001 	movne	r0, #1
    d6c8:	e8bd8070 	pop	{r4, r5, r6, pc}
    d6cc:	e59f0018 	ldr	r0, [pc, #24]	; d6ec <XSdPs_Pullup+0xa4>
    d6d0:	e30012cd 	movw	r1, #717	; 0x2cd
    d6d4:	eb0004e6 	bl	ea74 <Xil_Assert>
    d6d8:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d6dc:	e3a02001 	mov	r2, #1
    d6e0:	e3403001 	movt	r3, #1
    d6e4:	e5832000 	str	r2, [r3]
    d6e8:	eaffffee 	b	d6a8 <XSdPs_Pullup+0x60>
    d6ec:	000123b2 	.word	0x000123b2

0000d6f0 <XSdPs_Select_Card>:
    d6f0:	e2502000 	subs	r2, r0, #0
    d6f4:	e92d4010 	push	{r4, lr}
    d6f8:	0a000013 	beq	d74c <XSdPs_Select_Card+0x5c>
    d6fc:	e5921044 	ldr	r1, [r2, #68]	; 0x44
    d700:	e3013111 	movw	r3, #4369	; 0x1111
    d704:	e3413111 	movt	r3, #4369	; 0x1111
    d708:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d70c:	e3404001 	movt	r4, #1
    d710:	e1510003 	cmp	r1, r3
    d714:	e3a03000 	mov	r3, #0
    d718:	e5843000 	str	r3, [r4]
    d71c:	0a000006 	beq	d73c <XSdPs_Select_Card+0x4c>
    d720:	e59f0044 	ldr	r0, [pc, #68]	; d76c <XSdPs_Select_Card+0x7c>
    d724:	e30012f9 	movw	r1, #761	; 0x2f9
    d728:	eb0004d1 	bl	ea74 <Xil_Assert>
    d72c:	e3a03001 	mov	r3, #1
    d730:	e5843000 	str	r3, [r4]
    d734:	e3a00000 	mov	r0, #0
    d738:	e8bd8010 	pop	{r4, pc}
    d73c:	e8bd4010 	pop	{r4, lr}
    d740:	e3a01c07 	mov	r1, #1792	; 0x700
    d744:	e5922070 	ldr	r2, [r2, #112]	; 0x70
    d748:	ea0003f3 	b	e71c <XSdPs_CmdTransfer>
    d74c:	e59f0018 	ldr	r0, [pc, #24]	; d76c <XSdPs_Select_Card+0x7c>
    d750:	e3a01fbe 	mov	r1, #760	; 0x2f8
    d754:	eb0004c6 	bl	ea74 <Xil_Assert>
    d758:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d75c:	e3a02001 	mov	r2, #1
    d760:	e3403001 	movt	r3, #1
    d764:	e5832000 	str	r2, [r3]
    d768:	eafffff1 	b	d734 <XSdPs_Select_Card+0x44>
    d76c:	000123b2 	.word	0x000123b2

0000d770 <XSdPs_StartReadTransfer>:
    d770:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d774:	e2506000 	subs	r6, r0, #0
    d778:	0a000024 	beq	d810 <XSdPs_StartReadTransfer+0xa0>
    d77c:	e1a07002 	mov	r7, r2
    d780:	e5962044 	ldr	r2, [r6, #68]	; 0x44
    d784:	e1a05003 	mov	r5, r3
    d788:	e3013111 	movw	r3, #4369	; 0x1111
    d78c:	e3413111 	movt	r3, #4369	; 0x1111
    d790:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d794:	e1520003 	cmp	r2, r3
    d798:	e3404001 	movt	r4, #1
    d79c:	e3a03000 	mov	r3, #0
    d7a0:	e5843000 	str	r3, [r4]
    d7a4:	1a000008 	bne	d7cc <XSdPs_StartReadTransfer+0x5c>
    d7a8:	e5d630a8 	ldrb	r3, [r6, #168]	; 0xa8
    d7ac:	e3530001 	cmp	r3, #1
    d7b0:	0a000003 	beq	d7c4 <XSdPs_StartReadTransfer+0x54>
    d7b4:	e1a08001 	mov	r8, r1
    d7b8:	eb0000cf 	bl	dafc <XSdPs_SetupTransfer>
    d7bc:	e3500000 	cmp	r0, #0
    d7c0:	0a000008 	beq	d7e8 <XSdPs_StartReadTransfer+0x78>
    d7c4:	e3a00001 	mov	r0, #1
    d7c8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d7cc:	e59f005c 	ldr	r0, [pc, #92]	; d830 <XSdPs_StartReadTransfer+0xc0>
    d7d0:	e3a01fc6 	mov	r1, #792	; 0x318
    d7d4:	eb0004a6 	bl	ea74 <Xil_Assert>
    d7d8:	e3a03001 	mov	r3, #1
    d7dc:	e5843000 	str	r3, [r4]
    d7e0:	e3a00000 	mov	r0, #0
    d7e4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d7e8:	e1a03005 	mov	r3, r5
    d7ec:	e1a02007 	mov	r2, r7
    d7f0:	e1a01008 	mov	r1, r8
    d7f4:	e1a00006 	mov	r0, r6
    d7f8:	ebfff9fa 	bl	bfe8 <XSdPs_Read>
    d7fc:	e3a03001 	mov	r3, #1
    d800:	e2500000 	subs	r0, r0, #0
    d804:	13a00001 	movne	r0, #1
    d808:	e5c630a8 	strb	r3, [r6, #168]	; 0xa8
    d80c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d810:	e59f0018 	ldr	r0, [pc, #24]	; d830 <XSdPs_StartReadTransfer+0xc0>
    d814:	e3001317 	movw	r1, #791	; 0x317
    d818:	eb000495 	bl	ea74 <Xil_Assert>
    d81c:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d820:	e3a02001 	mov	r2, #1
    d824:	e3403001 	movt	r3, #1
    d828:	e5832000 	str	r2, [r3]
    d82c:	eaffffeb 	b	d7e0 <XSdPs_StartReadTransfer+0x70>
    d830:	000123b2 	.word	0x000123b2

0000d834 <XSdPs_StartWriteTransfer>:
    d834:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d838:	e2506000 	subs	r6, r0, #0
    d83c:	0a000024 	beq	d8d4 <XSdPs_StartWriteTransfer+0xa0>
    d840:	e1a07002 	mov	r7, r2
    d844:	e5962044 	ldr	r2, [r6, #68]	; 0x44
    d848:	e1a05003 	mov	r5, r3
    d84c:	e3013111 	movw	r3, #4369	; 0x1111
    d850:	e3413111 	movt	r3, #4369	; 0x1111
    d854:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d858:	e1520003 	cmp	r2, r3
    d85c:	e3404001 	movt	r4, #1
    d860:	e3a03000 	mov	r3, #0
    d864:	e5843000 	str	r3, [r4]
    d868:	1a000008 	bne	d890 <XSdPs_StartWriteTransfer+0x5c>
    d86c:	e5d630a8 	ldrb	r3, [r6, #168]	; 0xa8
    d870:	e3530001 	cmp	r3, #1
    d874:	0a000003 	beq	d888 <XSdPs_StartWriteTransfer+0x54>
    d878:	e1a08001 	mov	r8, r1
    d87c:	eb00009e 	bl	dafc <XSdPs_SetupTransfer>
    d880:	e3500000 	cmp	r0, #0
    d884:	0a000008 	beq	d8ac <XSdPs_StartWriteTransfer+0x78>
    d888:	e3a00001 	mov	r0, #1
    d88c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d890:	e59f005c 	ldr	r0, [pc, #92]	; d8f4 <XSdPs_StartWriteTransfer+0xc0>
    d894:	e3a01fd2 	mov	r1, #840	; 0x348
    d898:	eb000475 	bl	ea74 <Xil_Assert>
    d89c:	e3a03001 	mov	r3, #1
    d8a0:	e5843000 	str	r3, [r4]
    d8a4:	e3a00000 	mov	r0, #0
    d8a8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d8ac:	e1a03005 	mov	r3, r5
    d8b0:	e1a02007 	mov	r2, r7
    d8b4:	e1a01008 	mov	r1, r8
    d8b8:	e1a00006 	mov	r0, r6
    d8bc:	ebfff9e0 	bl	c044 <XSdPs_Write>
    d8c0:	e3a03001 	mov	r3, #1
    d8c4:	e2500000 	subs	r0, r0, #0
    d8c8:	13a00001 	movne	r0, #1
    d8cc:	e5c630a8 	strb	r3, [r6, #168]	; 0xa8
    d8d0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    d8d4:	e59f0018 	ldr	r0, [pc, #24]	; d8f4 <XSdPs_StartWriteTransfer+0xc0>
    d8d8:	e3001347 	movw	r1, #839	; 0x347
    d8dc:	eb000464 	bl	ea74 <Xil_Assert>
    d8e0:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d8e4:	e3a02001 	mov	r2, #1
    d8e8:	e3403001 	movt	r3, #1
    d8ec:	e5832000 	str	r2, [r3]
    d8f0:	eaffffeb 	b	d8a4 <XSdPs_StartWriteTransfer+0x70>
    d8f4:	000123b2 	.word	0x000123b2

0000d8f8 <XSdPs_CheckReadTransfer>:
    d8f8:	e2503000 	subs	r3, r0, #0
    d8fc:	e92d4010 	push	{r4, lr}
    d900:	0a000011 	beq	d94c <XSdPs_CheckReadTransfer+0x54>
    d904:	e5931044 	ldr	r1, [r3, #68]	; 0x44
    d908:	e3013111 	movw	r3, #4369	; 0x1111
    d90c:	e3413111 	movt	r3, #4369	; 0x1111
    d910:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d914:	e3404001 	movt	r4, #1
    d918:	e3a02000 	mov	r2, #0
    d91c:	e1510003 	cmp	r1, r3
    d920:	e5842000 	str	r2, [r4]
    d924:	0a000006 	beq	d944 <XSdPs_CheckReadTransfer+0x4c>
    d928:	e59f003c 	ldr	r0, [pc, #60]	; d96c <XSdPs_CheckReadTransfer+0x74>
    d92c:	e3a01fdd 	mov	r1, #884	; 0x374
    d930:	eb00044f 	bl	ea74 <Xil_Assert>
    d934:	e3a03001 	mov	r3, #1
    d938:	e5843000 	str	r3, [r4]
    d93c:	e3a00000 	mov	r0, #0
    d940:	e8bd8010 	pop	{r4, pc}
    d944:	e8bd4010 	pop	{r4, lr}
    d948:	eafff9d4 	b	c0a0 <XSdPs_CheckTransferComplete>
    d94c:	e59f0018 	ldr	r0, [pc, #24]	; d96c <XSdPs_CheckReadTransfer+0x74>
    d950:	e3001373 	movw	r1, #883	; 0x373
    d954:	eb000446 	bl	ea74 <Xil_Assert>
    d958:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d95c:	e3a02001 	mov	r2, #1
    d960:	e3403001 	movt	r3, #1
    d964:	e5832000 	str	r2, [r3]
    d968:	eafffff3 	b	d93c <XSdPs_CheckReadTransfer+0x44>
    d96c:	000123b2 	.word	0x000123b2

0000d970 <XSdPs_CheckWriteTransfer>:
    d970:	e2503000 	subs	r3, r0, #0
    d974:	e92d4010 	push	{r4, lr}
    d978:	0a000011 	beq	d9c4 <XSdPs_CheckWriteTransfer+0x54>
    d97c:	e5931044 	ldr	r1, [r3, #68]	; 0x44
    d980:	e3013111 	movw	r3, #4369	; 0x1111
    d984:	e3413111 	movt	r3, #4369	; 0x1111
    d988:	e30f44c4 	movw	r4, #62660	; 0xf4c4
    d98c:	e3404001 	movt	r4, #1
    d990:	e3a02000 	mov	r2, #0
    d994:	e1510003 	cmp	r1, r3
    d998:	e5842000 	str	r2, [r4]
    d99c:	0a000006 	beq	d9bc <XSdPs_CheckWriteTransfer+0x4c>
    d9a0:	e59f003c 	ldr	r0, [pc, #60]	; d9e4 <XSdPs_CheckWriteTransfer+0x74>
    d9a4:	e300138d 	movw	r1, #909	; 0x38d
    d9a8:	eb000431 	bl	ea74 <Xil_Assert>
    d9ac:	e3a03001 	mov	r3, #1
    d9b0:	e5843000 	str	r3, [r4]
    d9b4:	e3a00000 	mov	r0, #0
    d9b8:	e8bd8010 	pop	{r4, pc}
    d9bc:	e8bd4010 	pop	{r4, lr}
    d9c0:	eafff9b6 	b	c0a0 <XSdPs_CheckTransferComplete>
    d9c4:	e59f0018 	ldr	r0, [pc, #24]	; d9e4 <XSdPs_CheckWriteTransfer+0x74>
    d9c8:	e3a01fe3 	mov	r1, #908	; 0x38c
    d9cc:	eb000428 	bl	ea74 <Xil_Assert>
    d9d0:	e30f34c4 	movw	r3, #62660	; 0xf4c4
    d9d4:	e3a02001 	mov	r2, #1
    d9d8:	e3403001 	movt	r3, #1
    d9dc:	e5832000 	str	r2, [r3]
    d9e0:	eafffff3 	b	d9b4 <XSdPs_CheckWriteTransfer+0x44>
    d9e4:	000123b2 	.word	0x000123b2

0000d9e8 <XSdPs_SetTapDelay_SDR104>:
    d9e8:	e590303c 	ldr	r3, [r0, #60]	; 0x3c
    d9ec:	e3530000 	cmp	r3, #0
    d9f0:	1a000002 	bne	da00 <XSdPs_SetTapDelay_SDR104+0x18>
    d9f4:	e5903018 	ldr	r3, [r0, #24]
    d9f8:	e3530002 	cmp	r3, #2
    d9fc:	13a03003 	movne	r3, #3
    da00:	e5803090 	str	r3, [r0, #144]	; 0x90
    da04:	e12fff1e 	bx	lr

0000da08 <XSdPs_SetTapDelay_SDR50>:
    da08:	e5903038 	ldr	r3, [r0, #56]	; 0x38
    da0c:	e3530000 	cmp	r3, #0
    da10:	03a03003 	moveq	r3, #3
    da14:	e5803090 	str	r3, [r0, #144]	; 0x90
    da18:	e12fff1e 	bx	lr

0000da1c <XSdPs_SetTapDelay_DDR50>:
    da1c:	e5903034 	ldr	r3, [r0, #52]	; 0x34
    da20:	e5d02020 	ldrb	r2, [r0, #32]
    da24:	e3530000 	cmp	r3, #0
    da28:	0a000009 	beq	da54 <XSdPs_SetTapDelay_DDR50+0x38>
    da2c:	e5901030 	ldr	r1, [r0, #48]	; 0x30
    da30:	e3510000 	cmp	r1, #0
    da34:	0a000006 	beq	da54 <XSdPs_SetTapDelay_DDR50+0x38>
    da38:	e351003d 	cmp	r1, #61	; 0x3d
    da3c:	03520004 	cmpeq	r2, #4
    da40:	e5803090 	str	r3, [r0, #144]	; 0x90
    da44:	03a03033 	moveq	r3, #51	; 0x33
    da48:	e5801094 	str	r1, [r0, #148]	; 0x94
    da4c:	05803094 	streq	r3, [r0, #148]	; 0x94
    da50:	e12fff1e 	bx	lr
    da54:	e3520004 	cmp	r2, #4
    da58:	e3a02004 	mov	r2, #4
    da5c:	03a03033 	moveq	r3, #51	; 0x33
    da60:	13a0303d 	movne	r3, #61	; 0x3d
    da64:	e1c029f0 	strd	r2, [r0, #144]	; 0x90
    da68:	e12fff1e 	bx	lr

0000da6c <XSdPs_SetTapDelay_SDR25>:
    da6c:	e590302c 	ldr	r3, [r0, #44]	; 0x2c
    da70:	e5d02020 	ldrb	r2, [r0, #32]
    da74:	e3530000 	cmp	r3, #0
    da78:	0a000009 	beq	daa4 <XSdPs_SetTapDelay_SDR25+0x38>
    da7c:	e5901028 	ldr	r1, [r0, #40]	; 0x28
    da80:	e3510000 	cmp	r1, #0
    da84:	0a000006 	beq	daa4 <XSdPs_SetTapDelay_SDR25+0x38>
    da88:	e3510015 	cmp	r1, #21
    da8c:	03520004 	cmpeq	r2, #4
    da90:	e5803090 	str	r3, [r0, #144]	; 0x90
    da94:	03a0302c 	moveq	r3, #44	; 0x2c
    da98:	e5801094 	str	r1, [r0, #148]	; 0x94
    da9c:	05803094 	streq	r3, [r0, #148]	; 0x94
    daa0:	e12fff1e 	bx	lr
    daa4:	e3520004 	cmp	r2, #4
    daa8:	e3a02005 	mov	r2, #5
    daac:	03a0302c 	moveq	r3, #44	; 0x2c
    dab0:	13a03015 	movne	r3, #21
    dab4:	e1c029f0 	strd	r2, [r0, #144]	; 0x90
    dab8:	e12fff1e 	bx	lr

0000dabc <XSdPs_Switch_Voltage>:
    dabc:	e92d4010 	push	{r4, lr}
    dac0:	e1a04000 	mov	r4, r0
    dac4:	ebfffb11 	bl	c710 <XSdPs_SetupVoltageSwitch>
    dac8:	e3500000 	cmp	r0, #0
    dacc:	0a000001 	beq	dad8 <XSdPs_Switch_Voltage+0x1c>
    dad0:	e3a00001 	mov	r0, #1
    dad4:	e8bd8010 	pop	{r4, pc}
    dad8:	e1a00004 	mov	r0, r4
    dadc:	ebfffacf 	bl	c620 <XSdPs_CardSetVoltage18>
    dae0:	e3500000 	cmp	r0, #0
    dae4:	1afffff9 	bne	dad0 <XSdPs_Switch_Voltage+0x14>
    dae8:	e1a00004 	mov	r0, r4
    daec:	ebfffb19 	bl	c758 <XSdPs_CheckBusHigh>
    daf0:	e2500000 	subs	r0, r0, #0
    daf4:	13a00001 	movne	r0, #1
    daf8:	e8bd8010 	pop	{r4, pc}

0000dafc <XSdPs_SetupTransfer>:
    dafc:	e5d02056 	ldrb	r2, [r0, #86]	; 0x56
    db00:	e5903004 	ldr	r3, [r0, #4]
    db04:	e3520002 	cmp	r2, #2
    db08:	0a000010 	beq	db50 <XSdPs_SetupTransfer+0x54>
    db0c:	e590200c 	ldr	r2, [r0, #12]
    db10:	e3520000 	cmp	r2, #0
    db14:	0a000002 	beq	db24 <XSdPs_SetupTransfer+0x28>
    db18:	e5932024 	ldr	r2, [r3, #36]	; 0x24
    db1c:	e3120801 	tst	r2, #65536	; 0x10000
    db20:	0a000012 	beq	db70 <XSdPs_SetupTransfer+0x74>
    db24:	e1d330b4 	ldrh	r3, [r3, #4]
    db28:	e3530c02 	cmp	r3, #512	; 0x200
    db2c:	1a000001 	bne	db38 <XSdPs_SetupTransfer+0x3c>
    db30:	e3a00000 	mov	r0, #0
    db34:	e12fff1e 	bx	lr
    db38:	e3a01c02 	mov	r1, #512	; 0x200
    db3c:	e92d4010 	push	{r4, lr}
    db40:	ebfffce3 	bl	ced4 <XSdPs_SetBlkSize>
    db44:	e2500000 	subs	r0, r0, #0
    db48:	13a00001 	movne	r0, #1
    db4c:	e8bd8010 	pop	{r4, pc}
    db50:	e5902048 	ldr	r2, [r0, #72]	; 0x48
    db54:	e2022103 	and	r2, r2, #-1073741824	; 0xc0000000
    db58:	e3520101 	cmp	r2, #1073741824	; 0x40000000
    db5c:	1affffea 	bne	db0c <XSdPs_SetupTransfer+0x10>
    db60:	e1d330b4 	ldrh	r3, [r3, #4]
    db64:	e3530c02 	cmp	r3, #512	; 0x200
    db68:	0afffff0 	beq	db30 <XSdPs_SetupTransfer+0x34>
    db6c:	eafffff1 	b	db38 <XSdPs_SetupTransfer+0x3c>
    db70:	e3a00001 	mov	r0, #1
    db74:	e12fff1e 	bx	lr

0000db78 <XSdPs_Reset>:
    db78:	e5902004 	ldr	r2, [r0, #4]
    db7c:	e92d4010 	push	{r4, lr}
    db80:	e5c2102f 	strb	r1, [r2, #47]	; 0x2f
    db84:	ebfffad6 	bl	c6e4 <XSdPs_CheckResetDone>
    db88:	e2500000 	subs	r0, r0, #0
    db8c:	13a00001 	movne	r0, #1
    db90:	e8bd8010 	pop	{r4, pc}

0000db94 <XSdPs_SetExecTuning>:
    db94:	e5902004 	ldr	r2, [r0, #4]
    db98:	e1d233be 	ldrh	r3, [r2, #62]	; 0x3e
    db9c:	e3833040 	orr	r3, r3, #64	; 0x40
    dba0:	e1c233be 	strh	r3, [r2, #62]	; 0x3e
    dba4:	e12fff1e 	bx	lr

0000dba8 <XSdPs_SdModeInit>:
    dba8:	e92d4030 	push	{r4, r5, lr}
    dbac:	e30f50a0 	movw	r5, #61600	; 0xf0a0
    dbb0:	e24dd044 	sub	sp, sp, #68	; 0x44
    dbb4:	e1a04000 	mov	r4, r0
    dbb8:	e3a02040 	mov	r2, #64	; 0x40
    dbbc:	e3a01000 	mov	r1, #0
    dbc0:	e1a0000d 	mov	r0, sp
    dbc4:	e3405001 	movt	r5, #1
    dbc8:	fa000dc6 	blx	112e8 <memset>
    dbcc:	e1a00004 	mov	r0, r4
    dbd0:	e1a01005 	mov	r1, r5
    dbd4:	ebfffced 	bl	cf90 <XSdPs_Get_BusWidth>
    dbd8:	e3500000 	cmp	r0, #0
    dbdc:	1a00003d 	bne	dcd8 <XSdPs_SdModeInit+0x130>
    dbe0:	e5d53001 	ldrb	r3, [r5, #1]
    dbe4:	e3130004 	tst	r3, #4
    dbe8:	0a000005 	beq	dc04 <XSdPs_SdModeInit+0x5c>
    dbec:	e3a03002 	mov	r3, #2
    dbf0:	e1a00004 	mov	r0, r4
    dbf4:	e5c43057 	strb	r3, [r4, #87]	; 0x57
    dbf8:	ebfffe2f 	bl	d4bc <XSdPs_Change_BusWidth>
    dbfc:	e3500000 	cmp	r0, #0
    dc00:	1a000034 	bne	dcd8 <XSdPs_SdModeInit+0x130>
    dc04:	e1a0100d 	mov	r1, sp
    dc08:	e1a00004 	mov	r0, r4
    dc0c:	ebfffd19 	bl	d078 <XSdPs_Get_BusSpeed>
    dc10:	e3500000 	cmp	r0, #0
    dc14:	1a000026 	bne	dcb4 <XSdPs_SdModeInit+0x10c>
    dc18:	e1d520d2 	ldrsb	r2, [r5, #2]
    dc1c:	e5d4305c 	ldrb	r3, [r4, #92]	; 0x5c
    dc20:	e3520000 	cmp	r2, #0
    dc24:	ba00002e 	blt	dce4 <XSdPs_SdModeInit+0x13c>
    dc28:	e3530000 	cmp	r3, #0
    dc2c:	1a000022 	bne	dcbc <XSdPs_SdModeInit+0x114>
    dc30:	e5d53000 	ldrb	r3, [r5]
    dc34:	e3530000 	cmp	r3, #0
    dc38:	0a000018 	beq	dca0 <XSdPs_SdModeInit+0xf8>
    dc3c:	e5dd300d 	ldrb	r3, [sp, #13]
    dc40:	e3130002 	tst	r3, #2
    dc44:	0a000015 	beq	dca0 <XSdPs_SdModeInit+0xf8>
    dc48:	e5d43057 	ldrb	r3, [r4, #87]	; 0x57
    dc4c:	e3530001 	cmp	r3, #1
    dc50:	9a000012 	bls	dca0 <XSdPs_SdModeInit+0xf8>
    dc54:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
    dc58:	e3a02005 	mov	r2, #5
    dc5c:	e5d41020 	ldrb	r1, [r4, #32]
    dc60:	e584208c 	str	r2, [r4, #140]	; 0x8c
    dc64:	e3530000 	cmp	r3, #0
    dc68:	0a00002d 	beq	dd24 <XSdPs_SdModeInit+0x17c>
    dc6c:	e5942028 	ldr	r2, [r4, #40]	; 0x28
    dc70:	e3520000 	cmp	r2, #0
    dc74:	0a00002a 	beq	dd24 <XSdPs_SdModeInit+0x17c>
    dc78:	e3520015 	cmp	r2, #21
    dc7c:	03510004 	cmpeq	r1, #4
    dc80:	e5843090 	str	r3, [r4, #144]	; 0x90
    dc84:	03a03028 	moveq	r3, #40	; 0x28
    dc88:	e5842094 	str	r2, [r4, #148]	; 0x94
    dc8c:	05843094 	streq	r3, [r4, #148]	; 0x94
    dc90:	e1a00004 	mov	r0, r4
    dc94:	ebfffd69 	bl	d240 <XSdPs_Change_BusSpeed>
    dc98:	e3500000 	cmp	r0, #0
    dc9c:	1a00000d 	bne	dcd8 <XSdPs_SdModeInit+0x130>
    dca0:	e3a01c02 	mov	r1, #512	; 0x200
    dca4:	e1a00004 	mov	r0, r4
    dca8:	ebfffc89 	bl	ced4 <XSdPs_SetBlkSize>
    dcac:	e2500000 	subs	r0, r0, #0
    dcb0:	13a00001 	movne	r0, #1
    dcb4:	e28dd044 	add	sp, sp, #68	; 0x44
    dcb8:	e8bd8030 	pop	{r4, r5, pc}
    dcbc:	e1a0100d 	mov	r1, sp
    dcc0:	e1a00004 	mov	r0, r4
    dcc4:	ebfffaad 	bl	c780 <XSdPs_Identify_UhsMode>
    dcc8:	e1a00004 	mov	r0, r4
    dccc:	ebfffd5b 	bl	d240 <XSdPs_Change_BusSpeed>
    dcd0:	e3500000 	cmp	r0, #0
    dcd4:	0afffff1 	beq	dca0 <XSdPs_SdModeInit+0xf8>
    dcd8:	e3a00001 	mov	r0, #1
    dcdc:	e28dd044 	add	sp, sp, #68	; 0x44
    dce0:	e8bd8030 	pop	{r4, r5, pc}
    dce4:	e5dd200d 	ldrb	r2, [sp, #13]
    dce8:	e3520003 	cmp	r2, #3
    dcec:	9affffcd 	bls	dc28 <XSdPs_SdModeInit+0x80>
    dcf0:	e5942014 	ldr	r2, [r4, #20]
    dcf4:	e3520008 	cmp	r2, #8
    dcf8:	1affffca 	bne	dc28 <XSdPs_SdModeInit+0x80>
    dcfc:	e3530000 	cmp	r3, #0
    dd00:	1affffed 	bne	dcbc <XSdPs_SdModeInit+0x114>
    dd04:	e3a03001 	mov	r3, #1
    dd08:	e1a00004 	mov	r0, r4
    dd0c:	e5c4305c 	strb	r3, [r4, #92]	; 0x5c
    dd10:	ebfffa42 	bl	c620 <XSdPs_CardSetVoltage18>
    dd14:	e3500000 	cmp	r0, #0
    dd18:	1affffee 	bne	dcd8 <XSdPs_SdModeInit+0x130>
    dd1c:	e5d4305c 	ldrb	r3, [r4, #92]	; 0x5c
    dd20:	eaffffc0 	b	dc28 <XSdPs_SdModeInit+0x80>
    dd24:	e3510004 	cmp	r1, #4
    dd28:	e3a02005 	mov	r2, #5
    dd2c:	03a03028 	moveq	r3, #40	; 0x28
    dd30:	13a03015 	movne	r3, #21
    dd34:	e1c429f0 	strd	r2, [r4, #144]	; 0x90
    dd38:	eaffffd4 	b	dc90 <XSdPs_SdModeInit+0xe8>

0000dd3c <XSdPs_MmcModeInit>:
    dd3c:	e3a03002 	mov	r3, #2
    dd40:	e92d4070 	push	{r4, r5, r6, lr}
    dd44:	e5c03057 	strb	r3, [r0, #87]	; 0x57
    dd48:	e1a04000 	mov	r4, r0
    dd4c:	ebfffdda 	bl	d4bc <XSdPs_Change_BusWidth>
    dd50:	e3500000 	cmp	r0, #0
    dd54:	0a000001 	beq	dd60 <XSdPs_MmcModeInit+0x24>
    dd58:	e3a00001 	mov	r0, #1
    dd5c:	e8bd8070 	pop	{r4, r5, r6, pc}
    dd60:	e30f50a0 	movw	r5, #61600	; 0xf0a0
    dd64:	e1a00004 	mov	r0, r4
    dd68:	e3405001 	movt	r5, #1
    dd6c:	e2851020 	add	r1, r5, #32
    dd70:	ebfffd70 	bl	d338 <XSdPs_Get_Mmc_ExtCsd>
    dd74:	e3500000 	cmp	r0, #0
    dd78:	1afffff6 	bne	dd58 <XSdPs_MmcModeInit+0x1c>
    dd7c:	e5d530f7 	ldrb	r3, [r5, #247]	; 0xf7
    dd80:	e1a03c03 	lsl	r3, r3, #24
    dd84:	e5843084 	str	r3, [r4, #132]	; 0x84
    dd88:	e5d520f6 	ldrb	r2, [r5, #246]	; 0xf6
    dd8c:	e1833802 	orr	r3, r3, r2, lsl #16
    dd90:	e5843084 	str	r3, [r4, #132]	; 0x84
    dd94:	e5d520f5 	ldrb	r2, [r5, #245]	; 0xf5
    dd98:	e1833402 	orr	r3, r3, r2, lsl #8
    dd9c:	e5843084 	str	r3, [r4, #132]	; 0x84
    dda0:	e5d520f4 	ldrb	r2, [r5, #244]	; 0xf4
    dda4:	e1823003 	orr	r3, r2, r3
    dda8:	e5843084 	str	r3, [r4, #132]	; 0x84
    ddac:	e5d530e4 	ldrb	r3, [r5, #228]	; 0xe4
    ddb0:	e3130002 	tst	r3, #2
    ddb4:	08bd8070 	popeq	{r4, r5, r6, pc}
    ddb8:	e5d43057 	ldrb	r3, [r4, #87]	; 0x57
    ddbc:	e3530001 	cmp	r3, #1
    ddc0:	98bd8070 	popls	{r4, r5, r6, pc}
    ddc4:	e3a03005 	mov	r3, #5
    ddc8:	e1a00004 	mov	r0, r4
    ddcc:	e584308c 	str	r3, [r4, #140]	; 0x8c
    ddd0:	ebfffd1a 	bl	d240 <XSdPs_Change_BusSpeed>
    ddd4:	e3500000 	cmp	r0, #0
    ddd8:	1affffde 	bne	dd58 <XSdPs_MmcModeInit+0x1c>
    dddc:	e2851020 	add	r1, r5, #32
    dde0:	e1a00004 	mov	r0, r4
    dde4:	ebfffd53 	bl	d338 <XSdPs_Get_Mmc_ExtCsd>
    dde8:	e3500000 	cmp	r0, #0
    ddec:	1affffd9 	bne	dd58 <XSdPs_MmcModeInit+0x1c>
    ddf0:	e5d500d9 	ldrb	r0, [r5, #217]	; 0xd9
    ddf4:	e2500001 	subs	r0, r0, #1
    ddf8:	13a00001 	movne	r0, #1
    ddfc:	e8bd8070 	pop	{r4, r5, r6, pc}

0000de00 <XSdPs_EmmcModeInit>:
    de00:	e92d4070 	push	{r4, r5, r6, lr}
    de04:	e1a04000 	mov	r4, r0
    de08:	e5d02056 	ldrb	r2, [r0, #86]	; 0x56
    de0c:	e5903014 	ldr	r3, [r0, #20]
    de10:	e3520002 	cmp	r2, #2
    de14:	0a00002d 	beq	ded0 <XSdPs_EmmcModeInit+0xd0>
    de18:	e3530004 	cmp	r3, #4
    de1c:	03a03002 	moveq	r3, #2
    de20:	13a03001 	movne	r3, #1
    de24:	e1a00004 	mov	r0, r4
    de28:	e5c43057 	strb	r3, [r4, #87]	; 0x57
    de2c:	ebfffda2 	bl	d4bc <XSdPs_Change_BusWidth>
    de30:	e3500000 	cmp	r0, #0
    de34:	0a000002 	beq	de44 <XSdPs_EmmcModeInit+0x44>
    de38:	e3a05001 	mov	r5, #1
    de3c:	e1a00005 	mov	r0, r5
    de40:	e8bd8070 	pop	{r4, r5, r6, pc}
    de44:	e30f60a0 	movw	r6, #61600	; 0xf0a0
    de48:	e1a00004 	mov	r0, r4
    de4c:	e3406001 	movt	r6, #1
    de50:	e2861e22 	add	r1, r6, #544	; 0x220
    de54:	ebfffd37 	bl	d338 <XSdPs_Get_Mmc_ExtCsd>
    de58:	e2505000 	subs	r5, r0, #0
    de5c:	1afffff5 	bne	de38 <XSdPs_EmmcModeInit+0x38>
    de60:	e5d632f7 	ldrb	r3, [r6, #759]	; 0x2f7
    de64:	e2861e22 	add	r1, r6, #544	; 0x220
    de68:	e1a00004 	mov	r0, r4
    de6c:	e1a03c03 	lsl	r3, r3, #24
    de70:	e5843084 	str	r3, [r4, #132]	; 0x84
    de74:	e5d622f6 	ldrb	r2, [r6, #758]	; 0x2f6
    de78:	e1833802 	orr	r3, r3, r2, lsl #16
    de7c:	e5843084 	str	r3, [r4, #132]	; 0x84
    de80:	e5d622f5 	ldrb	r2, [r6, #757]	; 0x2f5
    de84:	e1833402 	orr	r3, r3, r2, lsl #8
    de88:	e5843084 	str	r3, [r4, #132]	; 0x84
    de8c:	e5d622f4 	ldrb	r2, [r6, #756]	; 0x2f4
    de90:	e1823003 	orr	r3, r2, r3
    de94:	e5843084 	str	r3, [r4, #132]	; 0x84
    de98:	ebfffb36 	bl	cb78 <XSdPs_IdentifyEmmcMode>
    de9c:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    dea0:	e3530006 	cmp	r3, #6
    dea4:	1a00000d 	bne	dee0 <XSdPs_EmmcModeInit+0xe0>
    dea8:	e5d632c2 	ldrb	r3, [r6, #706]	; 0x2c2
    deac:	e3530000 	cmp	r3, #0
    deb0:	1affffe1 	bne	de3c <XSdPs_EmmcModeInit+0x3c>
    deb4:	e3a01c01 	mov	r1, #256	; 0x100
    deb8:	e1a00004 	mov	r0, r4
    debc:	e34013a2 	movt	r1, #930	; 0x3a2
    dec0:	ebfffd55 	bl	d41c <XSdPs_Set_Mmc_ExtCsd>
    dec4:	e2505000 	subs	r5, r0, #0
    dec8:	13a05001 	movne	r5, #1
    decc:	eaffffda 	b	de3c <XSdPs_EmmcModeInit+0x3c>
    ded0:	e3530008 	cmp	r3, #8
    ded4:	03a03003 	moveq	r3, #3
    ded8:	1affffce 	bne	de18 <XSdPs_EmmcModeInit+0x18>
    dedc:	eaffffd0 	b	de24 <XSdPs_EmmcModeInit+0x24>
    dee0:	e1a00004 	mov	r0, r4
    dee4:	ebfffcd5 	bl	d240 <XSdPs_Change_BusSpeed>
    dee8:	e3500000 	cmp	r0, #0
    deec:	1affffd1 	bne	de38 <XSdPs_EmmcModeInit+0x38>
    def0:	e2861e22 	add	r1, r6, #544	; 0x220
    def4:	e1a00004 	mov	r0, r4
    def8:	ebfffb52 	bl	cc48 <XSdPs_CheckEmmcTiming>
    defc:	e3500000 	cmp	r0, #0
    df00:	1affffcc 	bne	de38 <XSdPs_EmmcModeInit+0x38>
    df04:	e594308c 	ldr	r3, [r4, #140]	; 0x8c
    df08:	e3530004 	cmp	r3, #4
    df0c:	1affffe5 	bne	dea8 <XSdPs_EmmcModeInit+0xa8>
    df10:	e1a00004 	mov	r0, r4
    df14:	ebfffd68 	bl	d4bc <XSdPs_Change_BusWidth>
    df18:	e3500000 	cmp	r0, #0
    df1c:	0affffe1 	beq	dea8 <XSdPs_EmmcModeInit+0xa8>
    df20:	eaffffc4 	b	de38 <XSdPs_EmmcModeInit+0x38>

0000df24 <XSdPs_DisableBusPower>:
    df24:	e5d02056 	ldrb	r2, [r0, #86]	; 0x56
    df28:	e5903004 	ldr	r3, [r0, #4]
    df2c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    df30:	e3520002 	cmp	r2, #2
    df34:	03a02010 	moveq	r2, #16
    df38:	13a02000 	movne	r2, #0
    df3c:	e5c32029 	strb	r2, [r3, #41]	; 0x29
    df40:	eaffdd8b 	b	5574 <usleep>

0000df44 <XSdPs_EnableBusPower>:
    df44:	e5903004 	ldr	r3, [r0, #4]
    df48:	e3a0200f 	mov	r2, #15
    df4c:	e3a000c8 	mov	r0, #200	; 0xc8
    df50:	e5c32029 	strb	r2, [r3, #41]	; 0x29
    df54:	eaffdd86 	b	5574 <usleep>

0000df58 <XSdPs_SdCardEnum>:
    df58:	e92d4010 	push	{r4, lr}
    df5c:	e1a04000 	mov	r4, r0
    df60:	ebfff8c9 	bl	c28c <XSdPs_CheckCardDetect>
    df64:	e3500000 	cmp	r0, #0
    df68:	0a000001 	beq	df74 <XSdPs_SdCardEnum+0x1c>
    df6c:	e3a00001 	mov	r0, #1
    df70:	e8bd8010 	pop	{r4, pc}
    df74:	e1a00004 	mov	r0, r4
    df78:	ebfff8d4 	bl	c2d0 <XSdPs_CardReset>
    df7c:	e3500000 	cmp	r0, #0
    df80:	1afffff9 	bne	df6c <XSdPs_SdCardEnum+0x14>
    df84:	e1a00004 	mov	r0, r4
    df88:	ebfff8d8 	bl	c2f0 <XSdPs_CardIfCond>
    df8c:	e3500000 	cmp	r0, #0
    df90:	1afffff5 	bne	df6c <XSdPs_SdCardEnum+0x14>
    df94:	e1a00004 	mov	r0, r4
    df98:	ebfff8f3 	bl	c36c <XSdPs_CardOpCond>
    df9c:	e3500000 	cmp	r0, #0
    dfa0:	1afffff1 	bne	df6c <XSdPs_SdCardEnum+0x14>
    dfa4:	e1a00004 	mov	r0, r4
    dfa8:	ebfff931 	bl	c474 <XSdPs_GetCardId>
    dfac:	e3500000 	cmp	r0, #0
    dfb0:	1affffed 	bne	df6c <XSdPs_SdCardEnum+0x14>
    dfb4:	e1a00004 	mov	r0, r4
    dfb8:	ebfff96a 	bl	c568 <XSdPs_GetCsd>
    dfbc:	e3500000 	cmp	r0, #0
    dfc0:	1affffe9 	bne	df6c <XSdPs_SdCardEnum+0x14>
    dfc4:	e5d42056 	ldrb	r2, [r4, #86]	; 0x56
    dfc8:	e30e3ac0 	movw	r3, #60096	; 0xeac0
    dfcc:	e3403121 	movt	r3, #289	; 0x121
    dfd0:	e3071840 	movw	r1, #30784	; 0x7840
    dfd4:	e340117d 	movt	r1, #381	; 0x17d
    dfd8:	e1a00004 	mov	r0, r4
    dfdc:	e3520002 	cmp	r2, #2
    dfe0:	01a01003 	moveq	r1, r3
    dfe4:	e5841058 	str	r1, [r4, #88]	; 0x58
    dfe8:	ebfffb8e 	bl	ce28 <XSdPs_Change_ClkFreq>
    dfec:	e3500000 	cmp	r0, #0
    dff0:	1affffdd 	bne	df6c <XSdPs_SdCardEnum+0x14>
    dff4:	e1a00004 	mov	r0, r4
    dff8:	ebfffdbc 	bl	d6f0 <XSdPs_Select_Card>
    dffc:	e2500000 	subs	r0, r0, #0
    e000:	13a00001 	movne	r0, #1
    e004:	e8bd8010 	pop	{r4, pc}

0000e008 <XSdPs_MmcCardEnum>:
    e008:	e92d4010 	push	{r4, lr}
    e00c:	e1a04000 	mov	r4, r0
    e010:	ebfff89d 	bl	c28c <XSdPs_CheckCardDetect>
    e014:	e3500000 	cmp	r0, #0
    e018:	0a000001 	beq	e024 <XSdPs_MmcCardEnum+0x1c>
    e01c:	e3a00001 	mov	r0, #1
    e020:	e8bd8010 	pop	{r4, pc}
    e024:	e1a00004 	mov	r0, r4
    e028:	ebfff8a8 	bl	c2d0 <XSdPs_CardReset>
    e02c:	e3500000 	cmp	r0, #0
    e030:	1afffff9 	bne	e01c <XSdPs_MmcCardEnum+0x14>
    e034:	e1a00004 	mov	r0, r4
    e038:	ebfff8cb 	bl	c36c <XSdPs_CardOpCond>
    e03c:	e3500000 	cmp	r0, #0
    e040:	1afffff5 	bne	e01c <XSdPs_MmcCardEnum+0x14>
    e044:	e1a00004 	mov	r0, r4
    e048:	ebfff909 	bl	c474 <XSdPs_GetCardId>
    e04c:	e3500000 	cmp	r0, #0
    e050:	1afffff1 	bne	e01c <XSdPs_MmcCardEnum+0x14>
    e054:	e1a00004 	mov	r0, r4
    e058:	ebfff942 	bl	c568 <XSdPs_GetCsd>
    e05c:	e3500000 	cmp	r0, #0
    e060:	1affffed 	bne	e01c <XSdPs_MmcCardEnum+0x14>
    e064:	e30b1a80 	movw	r1, #47744	; 0xba80
    e068:	e1a00004 	mov	r0, r4
    e06c:	e340118c 	movt	r1, #396	; 0x18c
    e070:	e5841058 	str	r1, [r4, #88]	; 0x58
    e074:	ebfffb6b 	bl	ce28 <XSdPs_Change_ClkFreq>
    e078:	e3500000 	cmp	r0, #0
    e07c:	1affffe6 	bne	e01c <XSdPs_MmcCardEnum+0x14>
    e080:	e1a00004 	mov	r0, r4
    e084:	ebfffd99 	bl	d6f0 <XSdPs_Select_Card>
    e088:	e2500000 	subs	r0, r0, #0
    e08c:	13a00001 	movne	r0, #1
    e090:	e8bd8010 	pop	{r4, pc}

0000e094 <XSdPs_Execute_Tuning>:
    e094:	e92d4010 	push	{r4, lr}
    e098:	e1a04000 	mov	r4, r0
    e09c:	ebfffaa0 	bl	cb24 <XSdPs_DllReset>
    e0a0:	e3500000 	cmp	r0, #0
    e0a4:	0a000001 	beq	e0b0 <XSdPs_Execute_Tuning+0x1c>
    e0a8:	e3a00001 	mov	r0, #1
    e0ac:	e8bd8010 	pop	{r4, pc}
    e0b0:	e1a00004 	mov	r0, r4
    e0b4:	ebfffa31 	bl	c980 <XSdPs_AutoTuning>
    e0b8:	e3500000 	cmp	r0, #0
    e0bc:	1afffff9 	bne	e0a8 <XSdPs_Execute_Tuning+0x14>
    e0c0:	e1a00004 	mov	r0, r4
    e0c4:	ebfffa96 	bl	cb24 <XSdPs_DllReset>
    e0c8:	e2500000 	subs	r0, r0, #0
    e0cc:	13a00001 	movne	r0, #1
    e0d0:	e8bd8010 	pop	{r4, pc}

0000e0d4 <XSdPs_EnableClock>:
    e0d4:	e92d4070 	push	{r4, r5, r6, lr}
    e0d8:	e1a05000 	mov	r5, r0
    e0dc:	e5900004 	ldr	r0, [r0, #4]
    e0e0:	e1a04001 	mov	r4, r1
    e0e4:	e3a02002 	mov	r2, #2
    e0e8:	e3811001 	orr	r1, r1, #1
    e0ec:	e30439f0 	movw	r3, #18928	; 0x49f0
    e0f0:	e3403002 	movt	r3, #2
    e0f4:	e1c012bc 	strh	r1, [r0, #44]	; 0x2c
    e0f8:	e1a01002 	mov	r1, r2
    e0fc:	e280002c 	add	r0, r0, #44	; 0x2c
    e100:	eb000513 	bl	f554 <Xil_WaitForEvent>
    e104:	e3500000 	cmp	r0, #0
    e108:	05953004 	ldreq	r3, [r5, #4]
    e10c:	03844005 	orreq	r4, r4, #5
    e110:	13a00001 	movne	r0, #1
    e114:	01c342bc 	strheq	r4, [r3, #44]	; 0x2c
    e118:	e8bd8070 	pop	{r4, r5, r6, pc}

0000e11c <XSdPs_CalcBusSpeed>:
    e11c:	e5d02054 	ldrb	r2, [r0, #84]	; 0x54
    e120:	e590308c 	ldr	r3, [r0, #140]	; 0x8c
    e124:	e3520001 	cmp	r2, #1
    e128:	0a000015 	beq	e184 <XSdPs_CalcBusSpeed+0x68>
    e12c:	e3530005 	cmp	r3, #5
    e130:	8a000009 	bhi	e15c <XSdPs_CalcBusSpeed+0x40>
    e134:	e3530003 	cmp	r3, #3
    e138:	9a000021 	bls	e1c4 <XSdPs_CalcBusSpeed+0xa8>
    e13c:	e3a02c01 	mov	r2, #256	; 0x100
    e140:	e3a03c75 	mov	r3, #29952	; 0x7500
    e144:	e34023b9 	movt	r2, #953	; 0x3b9
    e148:	e3403319 	movt	r3, #793	; 0x319
    e14c:	e5812000 	str	r2, [r1]
    e150:	e5803058 	str	r3, [r0, #88]	; 0x58
    e154:	e3a00000 	mov	r0, #0
    e158:	e12fff1e 	bx	lr
    e15c:	e3530007 	cmp	r3, #7
    e160:	1a000017 	bne	e1c4 <XSdPs_CalcBusSpeed+0xa8>
    e164:	e3a02c02 	mov	r2, #512	; 0x200
    e168:	e3a03cc2 	mov	r3, #49664	; 0xc200
    e16c:	e34023b9 	movt	r2, #953	; 0x3b9
    e170:	e3403beb 	movt	r3, #3051	; 0xbeb
    e174:	e5812000 	str	r2, [r1]
    e178:	e5803058 	str	r3, [r0, #88]	; 0x58
    e17c:	e3a00000 	mov	r0, #0
    e180:	e12fff1e 	bx	lr
    e184:	e3530005 	cmp	r3, #5
    e188:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    e18c:	ea00000c 	b	e1c4 <XSdPs_CalcBusSpeed+0xa8>
    e190:	0000e1cc 	.word	0x0000e1cc
    e194:	0000e1a8 	.word	0x0000e1a8
    e198:	0000e1e8 	.word	0x0000e1e8
    e19c:	0000e204 	.word	0x0000e204
    e1a0:	0000e220 	.word	0x0000e220
    e1a4:	0000e1a8 	.word	0x0000e1a8
    e1a8:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    e1ac:	e30f3080 	movw	r3, #61568	; 0xf080
    e1b0:	e34820ff 	movt	r2, #33023	; 0x80ff
    e1b4:	e34032fa 	movt	r3, #762	; 0x2fa
    e1b8:	e5812000 	str	r2, [r1]
    e1bc:	e5803058 	str	r3, [r0, #88]	; 0x58
    e1c0:	eaffffe3 	b	e154 <XSdPs_CalcBusSpeed+0x38>
    e1c4:	e3a00001 	mov	r0, #1
    e1c8:	e12fff1e 	bx	lr
    e1cc:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    e1d0:	e3073840 	movw	r3, #30784	; 0x7840
    e1d4:	e34820ff 	movt	r2, #33023	; 0x80ff
    e1d8:	e340317d 	movt	r3, #381	; 0x17d
    e1dc:	e5812000 	str	r2, [r1]
    e1e0:	e5803058 	str	r3, [r0, #88]	; 0x58
    e1e4:	eaffffda 	b	e154 <XSdPs_CalcBusSpeed+0x38>
    e1e8:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    e1ec:	e3a03ce1 	mov	r3, #57600	; 0xe100
    e1f0:	e34820ff 	movt	r2, #33023	; 0x80ff
    e1f4:	e34035f5 	movt	r3, #1525	; 0x5f5
    e1f8:	e5812000 	str	r2, [r1]
    e1fc:	e5803058 	str	r3, [r0, #88]	; 0x58
    e200:	eaffffd3 	b	e154 <XSdPs_CalcBusSpeed+0x38>
    e204:	e30f2ff3 	movw	r2, #65523	; 0xfff3
    e208:	e3a03b35 	mov	r3, #54272	; 0xd400
    e20c:	e34820ff 	movt	r2, #33023	; 0x80ff
    e210:	e3403c65 	movt	r3, #3173	; 0xc65
    e214:	e5812000 	str	r2, [r1]
    e218:	e5803058 	str	r3, [r0, #88]	; 0x58
    e21c:	eaffffcc 	b	e154 <XSdPs_CalcBusSpeed+0x38>
    e220:	e30f2ff4 	movw	r2, #65524	; 0xfff4
    e224:	eaffffe0 	b	e1ac <XSdPs_CalcBusSpeed+0x90>

0000e228 <XSdPs_SetupReadDma>:
    e228:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e22c:	e1a07003 	mov	r7, r3
    e230:	e590309c 	ldr	r3, [r0, #156]	; 0x9c
    e234:	e7eb6052 	ubfx	r6, r2, #0, #12
    e238:	e1a04000 	mov	r4, r0
    e23c:	e1a05001 	mov	r5, r1
    e240:	e3530000 	cmp	r3, #0
    e244:	e5903004 	ldr	r3, [r0, #4]
    e248:	e1c360b4 	strh	r6, [r3, #4]
    e24c:	0a000005 	beq	e268 <XSdPs_SetupReadDma+0x40>
    e250:	ebfff9fb 	bl	ca44 <XSdPs_SetupADMA2DescTbl64Bit>
    e254:	e3550001 	cmp	r5, #1
    e258:	13a03037 	movne	r3, #55	; 0x37
    e25c:	03a03013 	moveq	r3, #19
    e260:	e1c43ab0 	strh	r3, [r4, #160]	; 0xa0
    e264:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e268:	e1a02007 	mov	r2, r7
    e26c:	ebfff9ef 	bl	ca30 <XSdPs_SetupADMA2DescTbl>
    e270:	e0010596 	mul	r1, r6, r5
    e274:	e1a00007 	mov	r0, r7
    e278:	eb000742 	bl	ff88 <Xil_DCacheInvalidateRange>
    e27c:	eafffff4 	b	e254 <XSdPs_SetupReadDma+0x2c>

0000e280 <XSdPs_SetupWriteDma>:
    e280:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e284:	e1a07003 	mov	r7, r3
    e288:	e590309c 	ldr	r3, [r0, #156]	; 0x9c
    e28c:	e7eb6052 	ubfx	r6, r2, #0, #12
    e290:	e1a04000 	mov	r4, r0
    e294:	e1a05001 	mov	r5, r1
    e298:	e3530000 	cmp	r3, #0
    e29c:	e5903004 	ldr	r3, [r0, #4]
    e2a0:	e1c360b4 	strh	r6, [r3, #4]
    e2a4:	0a000005 	beq	e2c0 <XSdPs_SetupWriteDma+0x40>
    e2a8:	ebfff9e5 	bl	ca44 <XSdPs_SetupADMA2DescTbl64Bit>
    e2ac:	e3550001 	cmp	r5, #1
    e2b0:	13a03027 	movne	r3, #39	; 0x27
    e2b4:	03a03003 	moveq	r3, #3
    e2b8:	e1c43ab0 	strh	r3, [r4, #160]	; 0xa0
    e2bc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e2c0:	e1a02007 	mov	r2, r7
    e2c4:	ebfff9d9 	bl	ca30 <XSdPs_SetupADMA2DescTbl>
    e2c8:	e0010596 	mul	r1, r6, r5
    e2cc:	e1a00007 	mov	r0, r7
    e2d0:	eb00079c 	bl	10148 <Xil_DCacheFlushRange>
    e2d4:	eafffff4 	b	e2ac <XSdPs_SetupWriteDma+0x2c>

0000e2d8 <XSdPs_Setup32ADMA2DescTbl>:
    e2d8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e2dc:	e1a03002 	mov	r3, r2
    e2e0:	e5907004 	ldr	r7, [r0, #4]
    e2e4:	e1a04000 	mov	r4, r0
    e2e8:	e1d780b4 	ldrh	r8, [r7, #4]
    e2ec:	e7eb8058 	ubfx	r8, r8, #0, #12
    e2f0:	e00e0891 	mul	lr, r1, r8
    e2f4:	e35e0801 	cmp	lr, #65536	; 0x10000
    e2f8:	33a0e000 	movcc	lr, #0
    e2fc:	328000c0 	addcc	r0, r0, #192	; 0xc0
    e300:	3a00000f 	bcc	e344 <XSdPs_Setup32ADMA2DescTbl+0x6c>
    e304:	e6ff007e 	uxth	r0, lr
    e308:	e1a0e82e 	lsr	lr, lr, #16
    e30c:	e3500000 	cmp	r0, #0
    e310:	0a000015 	beq	e36c <XSdPs_Setup32ADMA2DescTbl+0x94>
    e314:	e1a0c002 	mov	ip, r2
    e318:	e3a03000 	mov	r3, #0
    e31c:	e28460c4 	add	r6, r4, #196	; 0xc4
    e320:	e28400c0 	add	r0, r4, #192	; 0xc0
    e324:	e3a05021 	mov	r5, #33	; 0x21
    e328:	e786c183 	str	ip, [r6, r3, lsl #3]
    e32c:	e28cc801 	add	ip, ip, #65536	; 0x10000
    e330:	e7805183 	str	r5, [r0, r3, lsl #3]
    e334:	e2833001 	add	r3, r3, #1
    e338:	e15e0003 	cmp	lr, r3
    e33c:	8afffff9 	bhi	e328 <XSdPs_Setup32ADMA2DescTbl+0x50>
    e340:	e082380e 	add	r3, r2, lr, lsl #16
    e344:	e1610881 	smulbb	r1, r1, r8
    e348:	e084418e 	add	r4, r4, lr, lsl #3
    e34c:	e58430c4 	str	r3, [r4, #196]	; 0xc4
    e350:	e3a03023 	mov	r3, #35	; 0x23
    e354:	e1c41cb2 	strh	r1, [r4, #194]	; 0xc2
    e358:	e3a01c01 	mov	r1, #256	; 0x100
    e35c:	e1c43cb0 	strh	r3, [r4, #192]	; 0xc0
    e360:	e5870058 	str	r0, [r7, #88]	; 0x58
    e364:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e368:	ea000776 	b	10148 <Xil_DCacheFlushRange>
    e36c:	e35e0001 	cmp	lr, #1
    e370:	e24ee001 	sub	lr, lr, #1
    e374:	1affffe6 	bne	e314 <XSdPs_Setup32ADMA2DescTbl+0x3c>
    e378:	e1a0e000 	mov	lr, r0
    e37c:	e28400c0 	add	r0, r4, #192	; 0xc0
    e380:	eaffffef 	b	e344 <XSdPs_Setup32ADMA2DescTbl+0x6c>

0000e384 <XSdPs_Setup64ADMA2DescTbl>:
    e384:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    e388:	e1a03002 	mov	r3, r2
    e38c:	e5906004 	ldr	r6, [r0, #4]
    e390:	e1d690b4 	ldrh	r9, [r6, #4]
    e394:	e7eb9059 	ubfx	r9, r9, #0, #12
    e398:	e0050991 	mul	r5, r1, r9
    e39c:	e3550801 	cmp	r5, #65536	; 0x10000
    e3a0:	33a05000 	movcc	r5, #0
    e3a4:	3a000013 	bcc	e3f8 <XSdPs_Setup64ADMA2DescTbl+0x74>
    e3a8:	e6ffc075 	uxth	ip, r5
    e3ac:	e1a05825 	lsr	r5, r5, #16
    e3b0:	e35c0000 	cmp	ip, #0
    e3b4:	0a00001f 	beq	e438 <XSdPs_Setup64ADMA2DescTbl+0xb4>
    e3b8:	e3a0c000 	mov	ip, #0
    e3bc:	e1a04000 	mov	r4, r0
    e3c0:	e1a0e002 	mov	lr, r2
    e3c4:	e1a0800c 	mov	r8, ip
    e3c8:	e3a07021 	mov	r7, #33	; 0x21
    e3cc:	e08c308c 	add	r3, ip, ip, lsl #1
    e3d0:	e28cc001 	add	ip, ip, #1
    e3d4:	e15c0005 	cmp	ip, r5
    e3d8:	e0803103 	add	r3, r0, r3, lsl #2
    e3dc:	e284400c 	add	r4, r4, #12
    e3e0:	e583e1c4 	str	lr, [r3, #452]	; 0x1c4
    e3e4:	e28ee801 	add	lr, lr, #65536	; 0x10000
    e3e8:	e58381c8 	str	r8, [r3, #456]	; 0x1c8
    e3ec:	e58471b4 	str	r7, [r4, #436]	; 0x1b4
    e3f0:	3afffff5 	bcc	e3cc <XSdPs_Setup64ADMA2DescTbl+0x48>
    e3f4:	e0823805 	add	r3, r2, r5, lsl #16
    e3f8:	e0855085 	add	r5, r5, r5, lsl #1
    e3fc:	e3a02023 	mov	r2, #35	; 0x23
    e400:	e1610981 	smulbb	r1, r1, r9
    e404:	e0805105 	add	r5, r0, r5, lsl #2
    e408:	e2800d07 	add	r0, r0, #448	; 0x1c0
    e40c:	e58531c4 	str	r3, [r5, #452]	; 0x1c4
    e410:	e2853d07 	add	r3, r5, #448	; 0x1c0
    e414:	e1c320b0 	strh	r2, [r3]
    e418:	e3a02000 	mov	r2, #0
    e41c:	e30031c2 	movw	r3, #450	; 0x1c2
    e420:	e58521c8 	str	r2, [r5, #456]	; 0x1c8
    e424:	e18510b3 	strh	r1, [r5, r3]
    e428:	e3a01d06 	mov	r1, #384	; 0x180
    e42c:	e5860058 	str	r0, [r6, #88]	; 0x58
    e430:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    e434:	ea000743 	b	10148 <Xil_DCacheFlushRange>
    e438:	e3550001 	cmp	r5, #1
    e43c:	e2455001 	sub	r5, r5, #1
    e440:	1affffdc 	bne	e3b8 <XSdPs_Setup64ADMA2DescTbl+0x34>
    e444:	e1a0500c 	mov	r5, ip
    e448:	eaffffea 	b	e3f8 <XSdPs_Setup64ADMA2DescTbl+0x74>

0000e44c <XSdPs_CalcClock>:
    e44c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e450:	e1a06001 	mov	r6, r1
    e454:	e5d03056 	ldrb	r3, [r0, #86]	; 0x56
    e458:	e5907008 	ldr	r7, [r0, #8]
    e45c:	e3530002 	cmp	r3, #2
    e460:	0a00000f 	beq	e4a4 <XSdPs_CalcClock+0x58>
    e464:	e1510007 	cmp	r1, r7
    e468:	2a000024 	bcs	e500 <XSdPs_CalcClock+0xb4>
    e46c:	e3a05009 	mov	r5, #9
    e470:	e3a04001 	mov	r4, #1
    e474:	ea000003 	b	e488 <XSdPs_CalcClock+0x3c>
    e478:	e1a01004 	mov	r1, r4
    e47c:	fa000a4f 	blx	10dc0 <__udivsi3>
    e480:	e1500006 	cmp	r0, r6
    e484:	9a000020 	bls	e50c <XSdPs_CalcClock+0xc0>
    e488:	e1a04084 	lsl	r4, r4, #1
    e48c:	e2555001 	subs	r5, r5, #1
    e490:	e1a00007 	mov	r0, r7
    e494:	e6ff4074 	uxth	r4, r4
    e498:	1afffff6 	bne	e478 <XSdPs_CalcClock+0x2c>
    e49c:	e1a00005 	mov	r0, r5
    e4a0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e4a4:	e1510007 	cmp	r1, r7
    e4a8:	2a000014 	bcs	e500 <XSdPs_CalcClock+0xb4>
    e4ac:	e15100a7 	cmp	r1, r7, lsr #1
    e4b0:	2a000019 	bcs	e51c <XSdPs_CalcClock+0xd0>
    e4b4:	e3a04004 	mov	r4, #4
    e4b8:	ea000000 	b	e4c0 <XSdPs_CalcClock+0x74>
    e4bc:	e1a04005 	mov	r4, r5
    e4c0:	e3540b02 	cmp	r4, #2048	; 0x800
    e4c4:	e1a01004 	mov	r1, r4
    e4c8:	e1a00007 	mov	r0, r7
    e4cc:	e2845002 	add	r5, r4, #2
    e4d0:	0a00000a 	beq	e500 <XSdPs_CalcClock+0xb4>
    e4d4:	fa000a39 	blx	10dc0 <__udivsi3>
    e4d8:	e1500006 	cmp	r0, r6
    e4dc:	8afffff6 	bhi	e4bc <XSdPs_CalcClock+0x70>
    e4e0:	e6ff4074 	uxth	r4, r4
    e4e4:	e1a054a4 	lsr	r5, r4, #9
    e4e8:	e1a040a4 	lsr	r4, r4, #1
    e4ec:	e1a05305 	lsl	r5, r5, #6
    e4f0:	e1855404 	orr	r5, r5, r4, lsl #8
    e4f4:	e6ff5075 	uxth	r5, r5
    e4f8:	e1a00005 	mov	r0, r5
    e4fc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e500:	e3a05000 	mov	r5, #0
    e504:	e1a00005 	mov	r0, r5
    e508:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e50c:	e1a04384 	lsl	r4, r4, #7
    e510:	e2045cff 	and	r5, r4, #65280	; 0xff00
    e514:	e1a00005 	mov	r0, r5
    e518:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    e51c:	e3a05c01 	mov	r5, #256	; 0x100
    e520:	eaffffdd 	b	e49c <XSdPs_CalcClock+0x50>

0000e524 <XSdPs_DllRstCtrl>:
    e524:	e5902004 	ldr	r2, [r0, #4]
    e528:	e59030a4 	ldr	r3, [r0, #164]	; 0xa4
    e52c:	e37208ea 	cmn	r2, #15335424	; 0xea0000
    e530:	0a000005 	beq	e54c <XSdPs_DllRstCtrl+0x28>
    e534:	e5932358 	ldr	r2, [r3, #856]	; 0x358
    e538:	e3510001 	cmp	r1, #1
    e53c:	03822701 	orreq	r2, r2, #262144	; 0x40000
    e540:	13c22701 	bicne	r2, r2, #262144	; 0x40000
    e544:	e5832358 	str	r2, [r3, #856]	; 0x358
    e548:	e12fff1e 	bx	lr
    e54c:	e5932358 	ldr	r2, [r3, #856]	; 0x358
    e550:	e3510001 	cmp	r1, #1
    e554:	03822004 	orreq	r2, r2, #4
    e558:	13c22004 	bicne	r2, r2, #4
    e55c:	e5832358 	str	r2, [r3, #856]	; 0x358
    e560:	e12fff1e 	bx	lr

0000e564 <XSdPs_ConfigTapDelay>:
    e564:	e5901004 	ldr	r1, [r0, #4]
    e568:	e5902094 	ldr	r2, [r0, #148]	; 0x94
    e56c:	e5903090 	ldr	r3, [r0, #144]	; 0x90
    e570:	e37108ea 	cmn	r1, #15335424	; 0xea0000
    e574:	e590c0a4 	ldr	ip, [r0, #164]	; 0xa4
    e578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    e57c:	0a00001d 	beq	e5f8 <XSdPs_ConfigTapDelay+0x94>
    e580:	e1b01802 	lsls	r1, r2, #16
    e584:	e1a03803 	lsl	r3, r3, #16
    e588:	e59c2314 	ldr	r2, [ip, #788]	; 0x314
    e58c:	1a00000a 	bne	e5bc <XSdPs_ConfigTapDelay+0x58>
    e590:	e7d9281f 	bfc	r2, #16, #10
    e594:	e58c2314 	str	r2, [ip, #788]	; 0x314
    e598:	e59020a4 	ldr	r2, [r0, #164]	; 0xa4
    e59c:	e3530000 	cmp	r3, #0
    e5a0:	15921318 	ldrne	r1, [r2, #792]	; 0x318
    e5a4:	05923318 	ldreq	r3, [r2, #792]	; 0x318
    e5a8:	13c1183f 	bicne	r1, r1, #4128768	; 0x3f0000
    e5ac:	11833001 	orrne	r3, r3, r1
    e5b0:	03c3383f 	biceq	r3, r3, #4128768	; 0x3f0000
    e5b4:	e5823318 	str	r3, [r2, #792]	; 0x318
    e5b8:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    e5bc:	e382e402 	orr	lr, r2, #33554432	; 0x2000000
    e5c0:	e58ce314 	str	lr, [ip, #788]	; 0x314
    e5c4:	e382e403 	orr	lr, r2, #50331648	; 0x3000000
    e5c8:	e3c228ff 	bic	r2, r2, #16711680	; 0xff0000
    e5cc:	e1822001 	orr	r2, r2, r1
    e5d0:	e59010a4 	ldr	r1, [r0, #164]	; 0xa4
    e5d4:	e382c403 	orr	ip, r2, #50331648	; 0x3000000
    e5d8:	e3c22402 	bic	r2, r2, #33554432	; 0x2000000
    e5dc:	e3822401 	orr	r2, r2, #16777216	; 0x1000000
    e5e0:	e581e314 	str	lr, [r1, #788]	; 0x314
    e5e4:	e59010a4 	ldr	r1, [r0, #164]	; 0xa4
    e5e8:	e581c314 	str	ip, [r1, #788]	; 0x314
    e5ec:	e59010a4 	ldr	r1, [r0, #164]	; 0xa4
    e5f0:	e5812314 	str	r2, [r1, #788]	; 0x314
    e5f4:	eaffffe7 	b	e598 <XSdPs_ConfigTapDelay+0x34>
    e5f8:	e3520000 	cmp	r2, #0
    e5fc:	1a00000b 	bne	e630 <XSdPs_ConfigTapDelay+0xcc>
    e600:	e59c2314 	ldr	r2, [ip, #788]	; 0x314
    e604:	e7c9201f 	bfc	r2, #0, #10
    e608:	e58c2314 	str	r2, [ip, #788]	; 0x314
    e60c:	e59020a4 	ldr	r2, [r0, #164]	; 0xa4
    e610:	e3530000 	cmp	r3, #0
    e614:	15921318 	ldrne	r1, [r2, #792]	; 0x318
    e618:	05923318 	ldreq	r3, [r2, #792]	; 0x318
    e61c:	13c1103f 	bicne	r1, r1, #63	; 0x3f
    e620:	11833001 	orrne	r3, r3, r1
    e624:	03c3303f 	biceq	r3, r3, #63	; 0x3f
    e628:	e5823318 	str	r3, [r2, #792]	; 0x318
    e62c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    e630:	e59c1314 	ldr	r1, [ip, #788]	; 0x314
    e634:	e381ec02 	orr	lr, r1, #512	; 0x200
    e638:	e58ce314 	str	lr, [ip, #788]	; 0x314
    e63c:	e381ec03 	orr	lr, r1, #768	; 0x300
    e640:	e3c110ff 	bic	r1, r1, #255	; 0xff
    e644:	e1811002 	orr	r1, r1, r2
    e648:	e59020a4 	ldr	r2, [r0, #164]	; 0xa4
    e64c:	e381cc03 	orr	ip, r1, #768	; 0x300
    e650:	e3c11c02 	bic	r1, r1, #512	; 0x200
    e654:	e3811c01 	orr	r1, r1, #256	; 0x100
    e658:	e582e314 	str	lr, [r2, #788]	; 0x314
    e65c:	e59020a4 	ldr	r2, [r0, #164]	; 0xa4
    e660:	e582c314 	str	ip, [r2, #788]	; 0x314
    e664:	e59020a4 	ldr	r2, [r0, #164]	; 0xa4
    e668:	e5821314 	str	r1, [r2, #788]	; 0x314
    e66c:	eaffffe6 	b	e60c <XSdPs_ConfigTapDelay+0xa8>

0000e670 <XSdPs_SetVoltage18>:
    e670:	e92d4010 	push	{r4, lr}
    e674:	e1a04000 	mov	r4, r0
    e678:	e5942004 	ldr	r2, [r4, #4]
    e67c:	e3010388 	movw	r0, #5000	; 0x1388
    e680:	e1d233be 	ldrh	r3, [r2, #62]	; 0x3e
    e684:	e3833008 	orr	r3, r3, #8
    e688:	e1c233be 	strh	r3, [r2, #62]	; 0x3e
    e68c:	ebffdbb8 	bl	5574 <usleep>
    e690:	e1a00004 	mov	r0, r4
    e694:	ebfff991 	bl	cce0 <XSdPs_CheckVoltage18>
    e698:	e2500000 	subs	r0, r0, #0
    e69c:	13a00001 	movne	r0, #1
    e6a0:	e8bd8010 	pop	{r4, pc}

0000e6a4 <XSdPs_ConfigPower>:
    e6a4:	e5903048 	ldr	r3, [r0, #72]	; 0x48
    e6a8:	e3130401 	tst	r3, #16777216	; 0x1000000
    e6ac:	13a0200f 	movne	r2, #15
    e6b0:	1a000002 	bne	e6c0 <XSdPs_ConfigPower+0x1c>
    e6b4:	e3130402 	tst	r3, #33554432	; 0x2000000
    e6b8:	13a0200d 	movne	r2, #13
    e6bc:	0a000002 	beq	e6cc <XSdPs_ConfigPower+0x28>
    e6c0:	e5903004 	ldr	r3, [r0, #4]
    e6c4:	e5c32029 	strb	r2, [r3, #41]	; 0x29
    e6c8:	e12fff1e 	bx	lr
    e6cc:	e3130301 	tst	r3, #67108864	; 0x4000000
    e6d0:	03a02001 	moveq	r2, #1
    e6d4:	13a0200b 	movne	r2, #11
    e6d8:	eafffff8 	b	e6c0 <XSdPs_ConfigPower+0x1c>

0000e6dc <XSdPs_ConfigDma>:
    e6dc:	e5d02056 	ldrb	r2, [r0, #86]	; 0x56
    e6e0:	e5903004 	ldr	r3, [r0, #4]
    e6e4:	e3520002 	cmp	r2, #2
    e6e8:	03a02018 	moveq	r2, #24
    e6ec:	13a02010 	movne	r2, #16
    e6f0:	e5c32028 	strb	r2, [r3, #40]	; 0x28
    e6f4:	e12fff1e 	bx	lr

0000e6f8 <XSdPs_ConfigInterrupt>:
    e6f8:	e5903004 	ldr	r3, [r0, #4]
    e6fc:	e3a02000 	mov	r2, #0
    e700:	e3e00c01 	mvn	r0, #256	; 0x100
    e704:	e3e01b03 	mvn	r1, #3072	; 0xc00
    e708:	e1c303b4 	strh	r0, [r3, #52]	; 0x34
    e70c:	e1c313b6 	strh	r1, [r3, #54]	; 0x36
    e710:	e1c323b8 	strh	r2, [r3, #56]	; 0x38
    e714:	e1c323ba 	strh	r2, [r3, #58]	; 0x3a
    e718:	e12fff1e 	bx	lr

0000e71c <XSdPs_CmdTransfer>:
    e71c:	e92d4070 	push	{r4, r5, r6, lr}
    e720:	e1a0e002 	mov	lr, r2
    e724:	e24dd010 	sub	sp, sp, #16
    e728:	e1a04001 	mov	r4, r1
    e72c:	e1a02003 	mov	r2, r3
    e730:	e1a0100e 	mov	r1, lr
    e734:	e1a06000 	mov	r6, r0
    e738:	ebfff96d 	bl	ccf4 <XSdPs_SetupCmd>
    e73c:	e3500000 	cmp	r0, #0
    e740:	0a000003 	beq	e754 <XSdPs_CmdTransfer+0x38>
    e744:	e3a05001 	mov	r5, #1
    e748:	e1a00005 	mov	r0, r5
    e74c:	e28dd010 	add	sp, sp, #16
    e750:	e8bd8070 	pop	{r4, r5, r6, pc}
    e754:	e1a01004 	mov	r1, r4
    e758:	e1a00006 	mov	r0, r6
    e75c:	ebfff97a 	bl	cd4c <XSdPs_SendCmd>
    e760:	e2505000 	subs	r5, r0, #0
    e764:	1afffff6 	bne	e744 <XSdPs_CmdTransfer+0x28>
    e768:	e5960004 	ldr	r0, [r6, #4]
    e76c:	e244cc13 	sub	ip, r4, #4864	; 0x1300
    e770:	e3dc3c02 	bics	r3, ip, #512	; 0x200
    e774:	e2800030 	add	r0, r0, #48	; 0x30
    e778:	0a000014 	beq	e7d0 <XSdPs_CmdTransfer+0xb4>
    e77c:	e28d100c 	add	r1, sp, #12
    e780:	e3082001 	movw	r2, #32769	; 0x8001
    e784:	e3093680 	movw	r3, #38528	; 0x9680
    e788:	e58d1000 	str	r1, [sp]
    e78c:	e3403098 	movt	r3, #152	; 0x98
    e790:	e1a01002 	mov	r1, r2
    e794:	eb000382 	bl	f5a4 <Xil_WaitForEvents>
    e798:	e3500000 	cmp	r0, #0
    e79c:	1affffe8 	bne	e744 <XSdPs_CmdTransfer+0x28>
    e7a0:	e59d200c 	ldr	r2, [sp, #12]
    e7a4:	e5963004 	ldr	r3, [r6, #4]
    e7a8:	e3120902 	tst	r2, #32768	; 0x8000
    e7ac:	03a02001 	moveq	r2, #1
    e7b0:	01c323b0 	strheq	r2, [r3, #48]	; 0x30
    e7b4:	0affffe3 	beq	e748 <XSdPs_CmdTransfer+0x2c>
    e7b8:	e1d353b2 	ldrh	r5, [r3, #50]	; 0x32
    e7bc:	e3e02b03 	mvn	r2, #3072	; 0xc00
    e7c0:	e1c323b2 	strh	r2, [r3, #50]	; 0x32
    e7c4:	e3550002 	cmp	r5, #2
    e7c8:	33a05002 	movcc	r5, #2
    e7cc:	eaffffdd 	b	e748 <XSdPs_CmdTransfer+0x2c>
    e7d0:	e28d100c 	add	r1, sp, #12
    e7d4:	e3082021 	movw	r2, #32801	; 0x8021
    e7d8:	e3093680 	movw	r3, #38528	; 0x9680
    e7dc:	e58d1000 	str	r1, [sp]
    e7e0:	e3403098 	movt	r3, #152	; 0x98
    e7e4:	e1a01002 	mov	r1, r2
    e7e8:	eb00036d 	bl	f5a4 <Xil_WaitForEvents>
    e7ec:	e3500000 	cmp	r0, #0
    e7f0:	1affffd3 	bne	e744 <XSdPs_CmdTransfer+0x28>
    e7f4:	e59d200c 	ldr	r2, [sp, #12]
    e7f8:	e5963004 	ldr	r3, [r6, #4]
    e7fc:	e3120020 	tst	r2, #32
    e800:	13a01020 	movne	r1, #32
    e804:	11c313b0 	strhne	r1, [r3, #48]	; 0x30
    e808:	eaffffe6 	b	e7a8 <XSdPs_CmdTransfer+0x8c>

0000e80c <XSdps_CheckTransferDone>:
    e80c:	e92d4010 	push	{r4, lr}
    e810:	e1a04000 	mov	r4, r0
    e814:	e5900004 	ldr	r0, [r0, #4]
    e818:	e24dd010 	sub	sp, sp, #16
    e81c:	e28d100c 	add	r1, sp, #12
    e820:	e3082002 	movw	r2, #32770	; 0x8002
    e824:	e3043b40 	movw	r3, #19264	; 0x4b40
    e828:	e58d1000 	str	r1, [sp]
    e82c:	e340304c 	movt	r3, #76	; 0x4c
    e830:	e2800030 	add	r0, r0, #48	; 0x30
    e834:	e1a01002 	mov	r1, r2
    e838:	eb000359 	bl	f5a4 <Xil_WaitForEvents>
    e83c:	e3500000 	cmp	r0, #0
    e840:	1a000009 	bne	e86c <XSdps_CheckTransferDone+0x60>
    e844:	e59d300c 	ldr	r3, [sp, #12]
    e848:	e5942004 	ldr	r2, [r4, #4]
    e84c:	e2130902 	ands	r0, r3, #32768	; 0x8000
    e850:	03a03002 	moveq	r3, #2
    e854:	01c233b0 	strheq	r3, [r2, #48]	; 0x30
    e858:	1a000001 	bne	e864 <XSdps_CheckTransferDone+0x58>
    e85c:	e28dd010 	add	sp, sp, #16
    e860:	e8bd8010 	pop	{r4, pc}
    e864:	e3e03b03 	mvn	r3, #3072	; 0xc00
    e868:	e1c233b2 	strh	r3, [r2, #50]	; 0x32
    e86c:	e3a00001 	mov	r0, #1
    e870:	e28dd010 	add	sp, sp, #16
    e874:	e8bd8010 	pop	{r4, pc}

0000e878 <XSdPs_CheckBusIdle>:
    e878:	e5900004 	ldr	r0, [r0, #4]
    e87c:	e5903024 	ldr	r3, [r0, #36]	; 0x24
    e880:	e280c024 	add	ip, r0, #36	; 0x24
    e884:	e2130801 	ands	r0, r3, #65536	; 0x10000
    e888:	012fff1e 	bxeq	lr
    e88c:	e3093680 	movw	r3, #38528	; 0x9680
    e890:	e3a02000 	mov	r2, #0
    e894:	e3403098 	movt	r3, #152	; 0x98
    e898:	e1a0000c 	mov	r0, ip
    e89c:	e92d4010 	push	{r4, lr}
    e8a0:	eb00032b 	bl	f554 <Xil_WaitForEvent>
    e8a4:	e2500000 	subs	r0, r0, #0
    e8a8:	13a00001 	movne	r0, #1
    e8ac:	e8bd8010 	pop	{r4, pc}

0000e8b0 <XSdPs_FrameCmd>:
    e8b0:	e3510b02 	cmp	r1, #2048	; 0x800
    e8b4:	0a000045 	beq	e9d0 <XSdPs_FrameCmd+0x120>
    e8b8:	8a00000b 	bhi	e8ec <XSdPs_FrameCmd+0x3c>
    e8bc:	e3510c03 	cmp	r1, #768	; 0x300
    e8c0:	0a00003b 	beq	e9b4 <XSdPs_FrameCmd+0x104>
    e8c4:	9a00002d 	bls	e980 <XSdPs_FrameCmd+0xd0>
    e8c8:	e3510c06 	cmp	r1, #1536	; 0x600
    e8cc:	1a000026 	bne	e96c <XSdPs_FrameCmd+0xbc>
    e8d0:	e5d02054 	ldrb	r2, [r0, #84]	; 0x54
    e8d4:	e300161b 	movw	r1, #1563	; 0x61b
    e8d8:	e300363a 	movw	r3, #1594	; 0x63a
    e8dc:	e3520001 	cmp	r2, #1
    e8e0:	11a00001 	movne	r0, r1
    e8e4:	01a00003 	moveq	r0, r3
    e8e8:	e12fff1e 	bx	lr
    e8ec:	e3510c23 	cmp	r1, #8960	; 0x2300
    e8f0:	0a00002d 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    e8f4:	8a000006 	bhi	e914 <XSdPs_FrameCmd+0x64>
    e8f8:	e3510c11 	cmp	r1, #4352	; 0x1100
    e8fc:	0a000026 	beq	e99c <XSdPs_FrameCmd+0xec>
    e900:	8a00000e 	bhi	e940 <XSdPs_FrameCmd+0x90>
    e904:	e3510c09 	cmp	r1, #2304	; 0x900
    e908:	1a00003d 	bne	ea04 <XSdPs_FrameCmd+0x154>
    e90c:	e3810009 	orr	r0, r1, #9
    e910:	e12fff1e 	bx	lr
    e914:	e3510c8d 	cmp	r1, #36096	; 0x8d00
    e918:	0a00001f 	beq	e99c <XSdPs_FrameCmd+0xec>
    e91c:	8a000003 	bhi	e930 <XSdPs_FrameCmd+0x80>
    e920:	e3510c26 	cmp	r1, #9728	; 0x2600
    e924:	1a00003e 	bne	ea24 <XSdPs_FrameCmd+0x174>
    e928:	e381001b 	orr	r0, r1, #27
    e92c:	e12fff1e 	bx	lr
    e930:	e3510ca9 	cmp	r1, #43264	; 0xa900
    e934:	1a000042 	bne	ea44 <XSdPs_FrameCmd+0x194>
    e938:	e3810002 	orr	r0, r1, #2
    e93c:	e12fff1e 	bx	lr
    e940:	e3510c17 	cmp	r1, #5888	; 0x1700
    e944:	0a000014 	beq	e99c <XSdPs_FrameCmd+0xec>
    e948:	9a000027 	bls	e9ec <XSdPs_FrameCmd+0x13c>
    e94c:	e3510c19 	cmp	r1, #6400	; 0x1900
    e950:	0a000011 	beq	e99c <XSdPs_FrameCmd+0xec>
    e954:	9a00000e 	bls	e994 <XSdPs_FrameCmd+0xe4>
    e958:	e3c13c01 	bic	r3, r1, #256	; 0x100
    e95c:	e3530a02 	cmp	r3, #8192	; 0x2000
    e960:	0a000011 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    e964:	e1a00001 	mov	r0, r1
    e968:	e12fff1e 	bx	lr
    e96c:	e3510c07 	cmp	r1, #1792	; 0x700
    e970:	0a00000d 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    e974:	e3510c05 	cmp	r1, #1280	; 0x500
    e978:	0affffea 	beq	e928 <XSdPs_FrameCmd+0x78>
    e97c:	eafffff8 	b	e964 <XSdPs_FrameCmd+0xb4>
    e980:	e3510c01 	cmp	r1, #256	; 0x100
    e984:	0affffeb 	beq	e938 <XSdPs_FrameCmd+0x88>
    e988:	e3510c02 	cmp	r1, #512	; 0x200
    e98c:	0affffde 	beq	e90c <XSdPs_FrameCmd+0x5c>
    e990:	eafffff3 	b	e964 <XSdPs_FrameCmd+0xb4>
    e994:	e3510b06 	cmp	r1, #6144	; 0x1800
    e998:	1afffff1 	bne	e964 <XSdPs_FrameCmd+0xb4>
    e99c:	e381003a 	orr	r0, r1, #58	; 0x3a
    e9a0:	e12fff1e 	bx	lr
    e9a4:	e3510a01 	cmp	r1, #4096	; 0x1000
    e9a8:	1affffed 	bne	e964 <XSdPs_FrameCmd+0xb4>
    e9ac:	e381001a 	orr	r0, r1, #26
    e9b0:	e12fff1e 	bx	lr
    e9b4:	e5d02054 	ldrb	r2, [r0, #84]	; 0x54
    e9b8:	e300131a 	movw	r1, #794	; 0x31a
    e9bc:	e300331b 	movw	r3, #795	; 0x31b
    e9c0:	e3520001 	cmp	r2, #1
    e9c4:	11a00001 	movne	r0, r1
    e9c8:	01a00003 	moveq	r0, r3
    e9cc:	e12fff1e 	bx	lr
    e9d0:	e5d02054 	ldrb	r2, [r0, #84]	; 0x54
    e9d4:	e300183a 	movw	r1, #2106	; 0x83a
    e9d8:	e300381a 	movw	r3, #2074	; 0x81a
    e9dc:	e3520001 	cmp	r2, #1
    e9e0:	11a00001 	movne	r0, r1
    e9e4:	01a00003 	moveq	r0, r3
    e9e8:	e12fff1e 	bx	lr
    e9ec:	e3c13c01 	bic	r3, r1, #256	; 0x100
    e9f0:	e3530c12 	cmp	r3, #4608	; 0x1200
    e9f4:	0affffe8 	beq	e99c <XSdPs_FrameCmd+0xec>
    e9f8:	e3510c15 	cmp	r1, #5376	; 0x1500
    e9fc:	1affffd8 	bne	e964 <XSdPs_FrameCmd+0xb4>
    ea00:	eaffffe5 	b	e99c <XSdPs_FrameCmd+0xec>
    ea04:	3affffd6 	bcc	e964 <XSdPs_FrameCmd+0xb4>
    ea08:	e3510b03 	cmp	r1, #3072	; 0xc00
    ea0c:	0affffe6 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea10:	8affffe3 	bhi	e9a4 <XSdPs_FrameCmd+0xf4>
    ea14:	e3c13c01 	bic	r3, r1, #256	; 0x100
    ea18:	e3530c0a 	cmp	r3, #2560	; 0xa00
    ea1c:	1affffd0 	bne	e964 <XSdPs_FrameCmd+0xb4>
    ea20:	eaffffe1 	b	e9ac <XSdPs_FrameCmd+0xfc>
    ea24:	9a00000f 	bls	ea68 <XSdPs_FrameCmd+0x1b8>
    ea28:	e3510c37 	cmp	r1, #14080	; 0x3700
    ea2c:	0affffde 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea30:	e3510c86 	cmp	r1, #34304	; 0x8600
    ea34:	0affffdc 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea38:	e3510b0d 	cmp	r1, #13312	; 0x3400
    ea3c:	0affffda 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea40:	eaffffc7 	b	e964 <XSdPs_FrameCmd+0xb4>
    ea44:	9a000004 	bls	ea5c <XSdPs_FrameCmd+0x1ac>
    ea48:	e3510caa 	cmp	r1, #43520	; 0xaa00
    ea4c:	0affffd6 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea50:	e3510cb3 	cmp	r1, #45824	; 0xb300
    ea54:	0affffd0 	beq	e99c <XSdPs_FrameCmd+0xec>
    ea58:	eaffffc1 	b	e964 <XSdPs_FrameCmd+0xb4>
    ea5c:	e3510c97 	cmp	r1, #38656	; 0x9700
    ea60:	0affffcd 	beq	e99c <XSdPs_FrameCmd+0xec>
    ea64:	eaffffbe 	b	e964 <XSdPs_FrameCmd+0xb4>
    ea68:	e3510b09 	cmp	r1, #9216	; 0x2400
    ea6c:	0affffce 	beq	e9ac <XSdPs_FrameCmd+0xfc>
    ea70:	eaffffbb 	b	e964 <XSdPs_FrameCmd+0xb4>

0000ea74 <Xil_Assert>:
    ea74:	e30f34c0 	movw	r3, #62656	; 0xf4c0
    ea78:	e92d4010 	push	{r4, lr}
    ea7c:	e3403001 	movt	r3, #1
    ea80:	e5933000 	ldr	r3, [r3]
    ea84:	e3530000 	cmp	r3, #0
    ea88:	0a000000 	beq	ea90 <Xil_Assert+0x1c>
    ea8c:	e12fff33 	blx	r3
    ea90:	e3043310 	movw	r3, #17168	; 0x4310
    ea94:	e3403001 	movt	r3, #1
    ea98:	e5933000 	ldr	r3, [r3]
    ea9c:	e3530000 	cmp	r3, #0
    eaa0:	08bd8010 	popeq	{r4, pc}
    eaa4:	eafffffe 	b	eaa4 <Xil_Assert+0x30>

0000eaa8 <Xil_AssertSetCallback>:
    eaa8:	e30f34c0 	movw	r3, #62656	; 0xf4c0
    eaac:	e3403001 	movt	r3, #1
    eab0:	e5830000 	str	r0, [r3]
    eab4:	e12fff1e 	bx	lr

0000eab8 <XNullHandler>:
    eab8:	e12fff1e 	bx	lr
    eabc:	00000000 	andeq	r0, r0, r0

0000eac0 <outnum1>:
    eac0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    eac4:	e30263c4 	movw	r6, #9156	; 0x23c4
    eac8:	e3406001 	movt	r6, #1
    eacc:	e1a05000 	mov	r5, r0
    ead0:	e1a04001 	mov	r4, r1
    ead4:	e1a07002 	mov	r7, r2
    ead8:	e1a0a003 	mov	sl, r3
    eadc:	e8b6000f 	ldm	r6!, {r0, r1, r2, r3}
    eae0:	e24dd064 	sub	sp, sp, #100	; 0x64
    eae4:	e303e030 	movw	lr, #12336	; 0x3030
    eae8:	e28d800c 	add	r8, sp, #12
    eaec:	e28db020 	add	fp, sp, #32
    eaf0:	e343e030 	movt	lr, #12336	; 0x3030
    eaf4:	e1a0c00b 	mov	ip, fp
    eaf8:	e8a8000f 	stmia	r8!, {r0, r1, r2, r3}
    eafc:	e5963000 	ldr	r3, [r6]
    eb00:	e5c83000 	strb	r3, [r8]
    eb04:	e28d3060 	add	r3, sp, #96	; 0x60
    eb08:	e48ce004 	str	lr, [ip], #4
    eb0c:	e15c0003 	cmp	ip, r3
    eb10:	1afffffb 	bne	eb04 <outnum1+0x44>
    eb14:	e59a3018 	ldr	r3, [sl, #24]
    eb18:	e3530000 	cmp	r3, #0
    eb1c:	1a000005 	bne	eb38 <outnum1+0x78>
    eb20:	e1a03fa4 	lsr	r3, r4, #31
    eb24:	e357000a 	cmp	r7, #10
    eb28:	13a03000 	movne	r3, #0
    eb2c:	02033001 	andeq	r3, r3, #1
    eb30:	e3530000 	cmp	r3, #0
    eb34:	1a00003b 	bne	ec28 <outnum1+0x168>
    eb38:	e3a03000 	mov	r3, #0
    eb3c:	e58d3004 	str	r3, [sp, #4]
    eb40:	e1a09fc7 	asr	r9, r7, #31
    eb44:	e1a0800b 	mov	r8, fp
    eb48:	e3a06000 	mov	r6, #0
    eb4c:	e1a01004 	mov	r1, r4
    eb50:	e1a00005 	mov	r0, r5
    eb54:	e1a02007 	mov	r2, r7
    eb58:	e1a03009 	mov	r3, r9
    eb5c:	fa000936 	blx	1103c <__aeabi_uldivmod>
    eb60:	e28d300c 	add	r3, sp, #12
    eb64:	e1550007 	cmp	r5, r7
    eb68:	e7d33002 	ldrb	r3, [r3, r2]
    eb6c:	e0d44009 	sbcs	r4, r4, r9
    eb70:	e1a05000 	mov	r5, r0
    eb74:	e1a04001 	mov	r4, r1
    eb78:	e4c83001 	strb	r3, [r8], #1
    eb7c:	e1a03006 	mov	r3, r6
    eb80:	e2866001 	add	r6, r6, #1
    eb84:	2afffff0 	bcs	eb4c <outnum1+0x8c>
    eb88:	e59d2004 	ldr	r2, [sp, #4]
    eb8c:	e3520000 	cmp	r2, #0
    eb90:	0a000006 	beq	ebb0 <outnum1+0xf0>
    eb94:	e2831002 	add	r1, r3, #2
    eb98:	e2863060 	add	r3, r6, #96	; 0x60
    eb9c:	e08d2003 	add	r2, sp, r3
    eba0:	e1a03006 	mov	r3, r6
    eba4:	e1a06001 	mov	r6, r1
    eba8:	e3a0102d 	mov	r1, #45	; 0x2d
    ebac:	e5421040 	strb	r1, [r2, #-64]	; 0xffffffc0
    ebb0:	e58d3004 	str	r3, [sp, #4]
    ebb4:	e2863060 	add	r3, r6, #96	; 0x60
    ebb8:	e08d6003 	add	r6, sp, r3
    ebbc:	e3a02000 	mov	r2, #0
    ebc0:	e1a0000b 	mov	r0, fp
    ebc4:	e5462040 	strb	r2, [r6, #-64]	; 0xffffffc0
    ebc8:	fa000bfc 	blx	11bc0 <strlen>
    ebcc:	e59a2010 	ldr	r2, [sl, #16]
    ebd0:	e1a04000 	mov	r4, r0
    ebd4:	e59a1014 	ldr	r1, [sl, #20]
    ebd8:	e59d3004 	ldr	r3, [sp, #4]
    ebdc:	e2522000 	subs	r2, r2, #0
    ebe0:	e58a0000 	str	r0, [sl]
    ebe4:	13a02001 	movne	r2, #1
    ebe8:	e3510000 	cmp	r1, #0
    ebec:	13a02000 	movne	r2, #0
    ebf0:	e3520000 	cmp	r2, #0
    ebf4:	1a00001b 	bne	ec68 <outnum1+0x1a8>
    ebf8:	e2833001 	add	r3, r3, #1
    ebfc:	e08b5003 	add	r5, fp, r3
    ec00:	e5750001 	ldrb	r0, [r5, #-1]!
    ec04:	eb000c80 	bl	11e0c <outbyte>
    ec08:	e155000b 	cmp	r5, fp
    ec0c:	1afffffb 	bne	ec00 <outnum1+0x140>
    ec10:	e1ca21d0 	ldrd	r2, [sl, #16]
    ec14:	e3520000 	cmp	r2, #0
    ec18:	13530000 	cmpne	r3, #0
    ec1c:	1a000006 	bne	ec3c <outnum1+0x17c>
    ec20:	e28dd064 	add	sp, sp, #100	; 0x64
    ec24:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ec28:	e2755000 	rsbs	r5, r5, #0
    ec2c:	e3a03001 	mov	r3, #1
    ec30:	e2e44000 	rsc	r4, r4, #0
    ec34:	e58d3004 	str	r3, [sp, #4]
    ec38:	eaffffc0 	b	eb40 <outnum1+0x80>
    ec3c:	e59a4000 	ldr	r4, [sl]
    ec40:	e59a3004 	ldr	r3, [sl, #4]
    ec44:	e1540003 	cmp	r4, r3
    ec48:	aafffff4 	bge	ec20 <outnum1+0x160>
    ec4c:	e5da000c 	ldrb	r0, [sl, #12]
    ec50:	e2844001 	add	r4, r4, #1
    ec54:	eb000c6c 	bl	11e0c <outbyte>
    ec58:	e59a3004 	ldr	r3, [sl, #4]
    ec5c:	e1540003 	cmp	r4, r3
    ec60:	bafffff9 	blt	ec4c <outnum1+0x18c>
    ec64:	eaffffed 	b	ec20 <outnum1+0x160>
    ec68:	e59a2004 	ldr	r2, [sl, #4]
    ec6c:	e1500002 	cmp	r0, r2
    ec70:	aaffffe0 	bge	ebf8 <outnum1+0x138>
    ec74:	e1a05003 	mov	r5, r3
    ec78:	e5da000c 	ldrb	r0, [sl, #12]
    ec7c:	e2844001 	add	r4, r4, #1
    ec80:	eb000c61 	bl	11e0c <outbyte>
    ec84:	e59a3004 	ldr	r3, [sl, #4]
    ec88:	e1540003 	cmp	r4, r3
    ec8c:	bafffff9 	blt	ec78 <outnum1+0x1b8>
    ec90:	e1a03005 	mov	r3, r5
    ec94:	eaffffd7 	b	ebf8 <outnum1+0x138>

0000ec98 <outnum>:
    ec98:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ec9c:	e30273c4 	movw	r7, #9156	; 0x23c4
    eca0:	e3407001 	movt	r7, #1
    eca4:	e1a04000 	mov	r4, r0
    eca8:	e1a08001 	mov	r8, r1
    ecac:	e1a05002 	mov	r5, r2
    ecb0:	e8b7000f 	ldm	r7!, {r0, r1, r2, r3}
    ecb4:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    ecb8:	e28d9004 	add	r9, sp, #4
    ecbc:	e28d6018 	add	r6, sp, #24
    ecc0:	e303e030 	movw	lr, #12336	; 0x3030
    ecc4:	e1a0c006 	mov	ip, r6
    ecc8:	e343e030 	movt	lr, #12336	; 0x3030
    eccc:	e8a9000f 	stmia	r9!, {r0, r1, r2, r3}
    ecd0:	e5973000 	ldr	r3, [r7]
    ecd4:	e5c93000 	strb	r3, [r9]
    ecd8:	e28d3038 	add	r3, sp, #56	; 0x38
    ecdc:	e48ce004 	str	lr, [ip], #4
    ece0:	e15c0003 	cmp	ip, r3
    ece4:	1afffffb 	bne	ecd8 <outnum+0x40>
    ece8:	e5953018 	ldr	r3, [r5, #24]
    ecec:	e3530000 	cmp	r3, #0
    ecf0:	1a00003a 	bne	ede0 <outnum+0x148>
    ecf4:	e1a03fa4 	lsr	r3, r4, #31
    ecf8:	e358000a 	cmp	r8, #10
    ecfc:	13a03000 	movne	r3, #0
    ed00:	02033001 	andeq	r3, r3, #1
    ed04:	e3530000 	cmp	r3, #0
    ed08:	12644000 	rsbne	r4, r4, #0
    ed0c:	13a09001 	movne	r9, #1
    ed10:	0a000032 	beq	ede0 <outnum+0x148>
    ed14:	e1a0b006 	mov	fp, r6
    ed18:	e3a0a000 	mov	sl, #0
    ed1c:	e1a00004 	mov	r0, r4
    ed20:	e1a01008 	mov	r1, r8
    ed24:	fa0008bc 	blx	1101c <__aeabi_uidivmod>
    ed28:	e2813038 	add	r3, r1, #56	; 0x38
    ed2c:	e1540008 	cmp	r4, r8
    ed30:	e08d1003 	add	r1, sp, r3
    ed34:	e1a0700a 	mov	r7, sl
    ed38:	e5513034 	ldrb	r3, [r1, #-52]	; 0xffffffcc
    ed3c:	e1a04000 	mov	r4, r0
    ed40:	e28aa001 	add	sl, sl, #1
    ed44:	e4cb3001 	strb	r3, [fp], #1
    ed48:	2afffff3 	bcs	ed1c <outnum+0x84>
    ed4c:	e3590000 	cmp	r9, #0
    ed50:	0a000006 	beq	ed70 <outnum+0xd8>
    ed54:	e2872002 	add	r2, r7, #2
    ed58:	e28a3038 	add	r3, sl, #56	; 0x38
    ed5c:	e08d3003 	add	r3, sp, r3
    ed60:	e1a0700a 	mov	r7, sl
    ed64:	e1a0a002 	mov	sl, r2
    ed68:	e3a0202d 	mov	r2, #45	; 0x2d
    ed6c:	e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
    ed70:	e28a3038 	add	r3, sl, #56	; 0x38
    ed74:	e3a02000 	mov	r2, #0
    ed78:	e08d3003 	add	r3, sp, r3
    ed7c:	e1a00006 	mov	r0, r6
    ed80:	e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
    ed84:	fa000b8d 	blx	11bc0 <strlen>
    ed88:	e5953010 	ldr	r3, [r5, #16]
    ed8c:	e1a04000 	mov	r4, r0
    ed90:	e5952014 	ldr	r2, [r5, #20]
    ed94:	e5850000 	str	r0, [r5]
    ed98:	e2533000 	subs	r3, r3, #0
    ed9c:	13a03001 	movne	r3, #1
    eda0:	e3520000 	cmp	r2, #0
    eda4:	13a03000 	movne	r3, #0
    eda8:	e3530000 	cmp	r3, #0
    edac:	1a00000d 	bne	ede8 <outnum+0x150>
    edb0:	e2877001 	add	r7, r7, #1
    edb4:	e0867007 	add	r7, r6, r7
    edb8:	e5770001 	ldrb	r0, [r7, #-1]!
    edbc:	eb000c12 	bl	11e0c <outbyte>
    edc0:	e1570006 	cmp	r7, r6
    edc4:	1afffffb 	bne	edb8 <outnum+0x120>
    edc8:	e1c521d0 	ldrd	r2, [r5, #16]
    edcc:	e3520000 	cmp	r2, #0
    edd0:	13530000 	cmpne	r3, #0
    edd4:	1a00000d 	bne	ee10 <outnum+0x178>
    edd8:	e28dd03c 	add	sp, sp, #60	; 0x3c
    eddc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ede0:	e3a09000 	mov	r9, #0
    ede4:	eaffffca 	b	ed14 <outnum+0x7c>
    ede8:	e5953004 	ldr	r3, [r5, #4]
    edec:	e1500003 	cmp	r0, r3
    edf0:	aaffffee 	bge	edb0 <outnum+0x118>
    edf4:	e5d5000c 	ldrb	r0, [r5, #12]
    edf8:	e2844001 	add	r4, r4, #1
    edfc:	eb000c02 	bl	11e0c <outbyte>
    ee00:	e5953004 	ldr	r3, [r5, #4]
    ee04:	e1540003 	cmp	r4, r3
    ee08:	bafffff9 	blt	edf4 <outnum+0x15c>
    ee0c:	eaffffe7 	b	edb0 <outnum+0x118>
    ee10:	e5954000 	ldr	r4, [r5]
    ee14:	e5953004 	ldr	r3, [r5, #4]
    ee18:	e1540003 	cmp	r4, r3
    ee1c:	aaffffed 	bge	edd8 <outnum+0x140>
    ee20:	e5d5000c 	ldrb	r0, [r5, #12]
    ee24:	e2844001 	add	r4, r4, #1
    ee28:	eb000bf7 	bl	11e0c <outbyte>
    ee2c:	e5953004 	ldr	r3, [r5, #4]
    ee30:	e1540003 	cmp	r4, r3
    ee34:	bafffff9 	blt	ee20 <outnum+0x188>
    ee38:	eaffffe6 	b	edd8 <outnum+0x140>

0000ee3c <xil_vprintf>:
    ee3c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ee40:	e2505000 	subs	r5, r0, #0
    ee44:	ed2d8b02 	vpush	{d8}
    ee48:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    ee4c:	0a00008a 	beq	f07c <xil_vprintf+0x240>
    ee50:	e5d50000 	ldrb	r0, [r5]
    ee54:	e3500000 	cmp	r0, #0
    ee58:	0a000087 	beq	f07c <xil_vprintf+0x240>
    ee5c:	e3a06000 	mov	r6, #0
    ee60:	ed9f8bf8 	vldr	d8, [pc, #992]	; f248 <xil_vprintf+0x40c>
    ee64:	e1a0b001 	mov	fp, r1
    ee68:	e1a07006 	mov	r7, r6
    ee6c:	ea000004 	b	ee84 <xil_vprintf+0x48>
    ee70:	e2855001 	add	r5, r5, #1
    ee74:	eb000be4 	bl	11e0c <outbyte>
    ee78:	e5d50000 	ldrb	r0, [r5]
    ee7c:	e3500000 	cmp	r0, #0
    ee80:	0a00007d 	beq	f07c <xil_vprintf+0x240>
    ee84:	e3500025 	cmp	r0, #37	; 0x25
    ee88:	1afffff8 	bne	ee70 <xil_vprintf+0x34>
    ee8c:	e5d52001 	ldrb	r2, [r5, #1]
    ee90:	e3a08000 	mov	r8, #0
    ee94:	e1a09008 	mov	r9, r8
    ee98:	e3a0a001 	mov	sl, #1
    ee9c:	e3073fff 	movw	r3, #32767	; 0x7fff
    eea0:	e3a01020 	mov	r1, #32
    eea4:	e58d7020 	str	r7, [sp, #32]
    eea8:	ed8d8b06 	vstr	d8, [sp, #24]
    eeac:	e5cd1014 	strb	r1, [sp, #20]
    eeb0:	e58d3010 	str	r3, [sp, #16]
    eeb4:	ed8d8b02 	vstr	d8, [sp, #8]
    eeb8:	e2423030 	sub	r3, r2, #48	; 0x30
    eebc:	e2854001 	add	r4, r5, #1
    eec0:	e6ef1073 	uxtb	r1, r3
    eec4:	e3510009 	cmp	r1, #9
    eec8:	9a0000e6 	bls	f268 <xil_vprintf+0x42c>
    eecc:	e2423041 	sub	r3, r2, #65	; 0x41
    eed0:	e3530019 	cmp	r3, #25
    eed4:	92822020 	addls	r2, r2, #32
    eed8:	96ef3072 	uxtbls	r3, r2
    eedc:	91a02003 	movls	r2, r3
    eee0:	e2422025 	sub	r2, r2, #37	; 0x25
    eee4:	e3520053 	cmp	r2, #83	; 0x53
    eee8:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
    eeec:	ea00005d 	b	f068 <xil_vprintf+0x22c>
    eef0:	0000f110 	.word	0x0000f110
    eef4:	0000f068 	.word	0x0000f068
    eef8:	0000f068 	.word	0x0000f068
    eefc:	0000f068 	.word	0x0000f068
    ef00:	0000f068 	.word	0x0000f068
    ef04:	0000f068 	.word	0x0000f068
    ef08:	0000f068 	.word	0x0000f068
    ef0c:	0000f068 	.word	0x0000f068
    ef10:	0000f0f4 	.word	0x0000f0f4
    ef14:	0000f0bc 	.word	0x0000f0bc
    ef18:	0000f068 	.word	0x0000f068
    ef1c:	0000f068 	.word	0x0000f068
    ef20:	0000f068 	.word	0x0000f068
    ef24:	0000f068 	.word	0x0000f068
    ef28:	0000f068 	.word	0x0000f068
    ef2c:	0000f068 	.word	0x0000f068
    ef30:	0000f068 	.word	0x0000f068
    ef34:	0000f068 	.word	0x0000f068
    ef38:	0000f068 	.word	0x0000f068
    ef3c:	0000f068 	.word	0x0000f068
    ef40:	0000f068 	.word	0x0000f068
    ef44:	0000f068 	.word	0x0000f068
    ef48:	0000f068 	.word	0x0000f068
    ef4c:	0000f068 	.word	0x0000f068
    ef50:	0000f068 	.word	0x0000f068
    ef54:	0000f068 	.word	0x0000f068
    ef58:	0000f068 	.word	0x0000f068
    ef5c:	0000f068 	.word	0x0000f068
    ef60:	0000f068 	.word	0x0000f068
    ef64:	0000f068 	.word	0x0000f068
    ef68:	0000f068 	.word	0x0000f068
    ef6c:	0000f068 	.word	0x0000f068
    ef70:	0000f068 	.word	0x0000f068
    ef74:	0000f068 	.word	0x0000f068
    ef78:	0000f068 	.word	0x0000f068
    ef7c:	0000f068 	.word	0x0000f068
    ef80:	0000f068 	.word	0x0000f068
    ef84:	0000f068 	.word	0x0000f068
    ef88:	0000f068 	.word	0x0000f068
    ef8c:	0000f068 	.word	0x0000f068
    ef90:	0000f068 	.word	0x0000f068
    ef94:	0000f068 	.word	0x0000f068
    ef98:	0000f068 	.word	0x0000f068
    ef9c:	0000f068 	.word	0x0000f068
    efa0:	0000f068 	.word	0x0000f068
    efa4:	0000f068 	.word	0x0000f068
    efa8:	0000f068 	.word	0x0000f068
    efac:	0000f068 	.word	0x0000f068
    efb0:	0000f068 	.word	0x0000f068
    efb4:	0000f068 	.word	0x0000f068
    efb8:	0000f068 	.word	0x0000f068
    efbc:	0000f088 	.word	0x0000f088
    efc0:	0000f068 	.word	0x0000f068
    efc4:	0000f068 	.word	0x0000f068
    efc8:	0000f068 	.word	0x0000f068
    efcc:	0000f1c0 	.word	0x0000f1c0
    efd0:	0000f068 	.word	0x0000f068
    efd4:	0000f068 	.word	0x0000f068
    efd8:	0000f068 	.word	0x0000f068
    efdc:	0000f068 	.word	0x0000f068
    efe0:	0000f068 	.word	0x0000f068
    efe4:	0000f068 	.word	0x0000f068
    efe8:	0000f1b0 	.word	0x0000f1b0
    efec:	0000f048 	.word	0x0000f048
    eff0:	0000f068 	.word	0x0000f068
    eff4:	0000f068 	.word	0x0000f068
    eff8:	0000f068 	.word	0x0000f068
    effc:	0000f068 	.word	0x0000f068
    f000:	0000f048 	.word	0x0000f048
    f004:	0000f068 	.word	0x0000f068
    f008:	0000f068 	.word	0x0000f068
    f00c:	0000f250 	.word	0x0000f250
    f010:	0000f068 	.word	0x0000f068
    f014:	0000f068 	.word	0x0000f068
    f018:	0000f068 	.word	0x0000f068
    f01c:	0000f088 	.word	0x0000f088
    f020:	0000f068 	.word	0x0000f068
    f024:	0000f068 	.word	0x0000f068
    f028:	0000f124 	.word	0x0000f124
    f02c:	0000f068 	.word	0x0000f068
    f030:	0000f040 	.word	0x0000f040
    f034:	0000f068 	.word	0x0000f068
    f038:	0000f068 	.word	0x0000f068
    f03c:	0000f088 	.word	0x0000f088
    f040:	e3a03001 	mov	r3, #1
    f044:	e58d3020 	str	r3, [sp, #32]
    f048:	e3590000 	cmp	r9, #0
    f04c:	0a0000a2 	beq	f2dc <xil_vprintf+0x4a0>
    f050:	e28bb007 	add	fp, fp, #7
    f054:	e28d3008 	add	r3, sp, #8
    f058:	e3cbb007 	bic	fp, fp, #7
    f05c:	e3a0200a 	mov	r2, #10
    f060:	e0cb00d8 	ldrd	r0, [fp], #8
    f064:	ebfffe95 	bl	eac0 <outnum1>
    f068:	e2845001 	add	r5, r4, #1
    f06c:	e3a06001 	mov	r6, #1
    f070:	e5d50000 	ldrb	r0, [r5]
    f074:	e3500000 	cmp	r0, #0
    f078:	1affff81 	bne	ee84 <xil_vprintf+0x48>
    f07c:	e28dd02c 	add	sp, sp, #44	; 0x2c
    f080:	ecbd8b02 	vpop	{d8}
    f084:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    f088:	e3590000 	cmp	r9, #0
    f08c:	e3a03001 	mov	r3, #1
    f090:	e58d3020 	str	r3, [sp, #32]
    f094:	0a000095 	beq	f2f0 <xil_vprintf+0x4b4>
    f098:	e28bb007 	add	fp, fp, #7
    f09c:	e28d3008 	add	r3, sp, #8
    f0a0:	e3cbb007 	bic	fp, fp, #7
    f0a4:	e3a02010 	mov	r2, #16
    f0a8:	e0cb00d8 	ldrd	r0, [fp], #8
    f0ac:	e2845001 	add	r5, r4, #1
    f0b0:	e3a06001 	mov	r6, #1
    f0b4:	ebfffe81 	bl	eac0 <outnum1>
    f0b8:	eaffffec 	b	f070 <xil_vprintf+0x234>
    f0bc:	e5d53002 	ldrb	r3, [r5, #2]
    f0c0:	e353002a 	cmp	r3, #42	; 0x2a
    f0c4:	e1a02003 	mov	r2, r3
    f0c8:	11a05004 	movne	r5, r4
    f0cc:	13a08001 	movne	r8, #1
    f0d0:	13a06000 	movne	r6, #0
    f0d4:	1affff77 	bne	eeb8 <xil_vprintf+0x7c>
    f0d8:	e5d53003 	ldrb	r3, [r5, #3]
    f0dc:	e3530073 	cmp	r3, #115	; 0x73
    f0e0:	0a0000a8 	beq	f388 <xil_vprintf+0x54c>
    f0e4:	e2854002 	add	r4, r5, #2
    f0e8:	e3a06001 	mov	r6, #1
    f0ec:	e2845001 	add	r5, r4, #1
    f0f0:	eaffffde 	b	f070 <xil_vprintf+0x234>
    f0f4:	e5d53002 	ldrb	r3, [r5, #2]
    f0f8:	e3a06000 	mov	r6, #0
    f0fc:	e1a05004 	mov	r5, r4
    f100:	e1a02003 	mov	r2, r3
    f104:	e3a03001 	mov	r3, #1
    f108:	e58d301c 	str	r3, [sp, #28]
    f10c:	eaffff69 	b	eeb8 <xil_vprintf+0x7c>
    f110:	e3a00025 	mov	r0, #37	; 0x25
    f114:	e2845001 	add	r5, r4, #1
    f118:	e3a06001 	mov	r6, #1
    f11c:	eb000b3a 	bl	11e0c <outbyte>
    f120:	eaffffd2 	b	f070 <xil_vprintf+0x234>
    f124:	e1cd81d8 	ldrd	r8, [sp, #24]
    f128:	e59b6000 	ldr	r6, [fp]
    f12c:	e2588000 	subs	r8, r8, #0
    f130:	13a08001 	movne	r8, #1
    f134:	e3560000 	cmp	r6, #0
    f138:	0a000015 	beq	f194 <xil_vprintf+0x358>
    f13c:	e1a00006 	mov	r0, r6
    f140:	fa000a9e 	blx	11bc0 <strlen>
    f144:	e3590000 	cmp	r9, #0
    f148:	13a03000 	movne	r3, #0
    f14c:	02083001 	andeq	r3, r8, #1
    f150:	e1a05000 	mov	r5, r0
    f154:	e3530000 	cmp	r3, #0
    f158:	e58d0008 	str	r0, [sp, #8]
    f15c:	1a000079 	bne	f348 <xil_vprintf+0x50c>
    f160:	e5d60000 	ldrb	r0, [r6]
    f164:	e3500000 	cmp	r0, #0
    f168:	0a000009 	beq	f194 <xil_vprintf+0x358>
    f16c:	e59d5010 	ldr	r5, [sp, #16]
    f170:	ea000004 	b	f188 <xil_vprintf+0x34c>
    f174:	e58d5010 	str	r5, [sp, #16]
    f178:	eb000b23 	bl	11e0c <outbyte>
    f17c:	e5f60001 	ldrb	r0, [r6, #1]!
    f180:	e3500000 	cmp	r0, #0
    f184:	0a000002 	beq	f194 <xil_vprintf+0x358>
    f188:	e3550000 	cmp	r5, #0
    f18c:	e2455001 	sub	r5, r5, #1
    f190:	1afffff7 	bne	f174 <xil_vprintf+0x338>
    f194:	e3590000 	cmp	r9, #0
    f198:	03a08000 	moveq	r8, #0
    f19c:	12088001 	andne	r8, r8, #1
    f1a0:	e3580000 	cmp	r8, #0
    f1a4:	1a00005c 	bne	f31c <xil_vprintf+0x4e0>
    f1a8:	e28bb004 	add	fp, fp, #4
    f1ac:	eaffffad 	b	f068 <xil_vprintf+0x22c>
    f1b0:	e49b0004 	ldr	r0, [fp], #4
    f1b4:	e6ef0070 	uxtb	r0, r0
    f1b8:	eb000b13 	bl	11e0c <outbyte>
    f1bc:	eaffffa9 	b	f068 <xil_vprintf+0x22c>
    f1c0:	e5d50002 	ldrb	r0, [r5, #2]
    f1c4:	e2854002 	add	r4, r5, #2
    f1c8:	e2403061 	sub	r3, r0, #97	; 0x61
    f1cc:	e3530011 	cmp	r3, #17
    f1d0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    f1d4:	ea000014 	b	f22c <xil_vprintf+0x3f0>
    f1d8:	0000f314 	.word	0x0000f314
    f1dc:	0000f22c 	.word	0x0000f22c
    f1e0:	0000f22c 	.word	0x0000f22c
    f1e4:	0000f22c 	.word	0x0000f22c
    f1e8:	0000f22c 	.word	0x0000f22c
    f1ec:	0000f22c 	.word	0x0000f22c
    f1f0:	0000f22c 	.word	0x0000f22c
    f1f4:	0000f30c 	.word	0x0000f30c
    f1f8:	0000f22c 	.word	0x0000f22c
    f1fc:	0000f22c 	.word	0x0000f22c
    f200:	0000f22c 	.word	0x0000f22c
    f204:	0000f22c 	.word	0x0000f22c
    f208:	0000f22c 	.word	0x0000f22c
    f20c:	0000f220 	.word	0x0000f220
    f210:	0000f22c 	.word	0x0000f22c
    f214:	0000f22c 	.word	0x0000f22c
    f218:	0000f22c 	.word	0x0000f22c
    f21c:	0000f304 	.word	0x0000f304
    f220:	e3a0000d 	mov	r0, #13
    f224:	eb000af8 	bl	11e0c <outbyte>
    f228:	e3a0000a 	mov	r0, #10
    f22c:	eb000af6 	bl	11e0c <outbyte>
    f230:	e5d53003 	ldrb	r3, [r5, #3]
    f234:	e3a06000 	mov	r6, #0
    f238:	e1a05004 	mov	r5, r4
    f23c:	e1a02003 	mov	r2, r3
    f240:	eaffff1c 	b	eeb8 <xil_vprintf+0x7c>
    f244:	e320f000 	nop	{0}
	...
    f250:	e5d53002 	ldrb	r3, [r5, #2]
    f254:	e3a09001 	mov	r9, #1
    f258:	e1a05004 	mov	r5, r4
    f25c:	e3a06000 	mov	r6, #0
    f260:	e1a02003 	mov	r2, r3
    f264:	eaffff13 	b	eeb8 <xil_vprintf+0x7c>
    f268:	e3580000 	cmp	r8, #0
    f26c:	1a00000f 	bne	f2b0 <xil_vprintf+0x474>
    f270:	e3520030 	cmp	r2, #48	; 0x30
    f274:	05cd2014 	strbeq	r2, [sp, #20]
    f278:	e3a02000 	mov	r2, #0
    f27c:	e0822102 	add	r2, r2, r2, lsl #2
    f280:	e1a05004 	mov	r5, r4
    f284:	e0832082 	add	r2, r3, r2, lsl #1
    f288:	e5f43001 	ldrb	r3, [r4, #1]!
    f28c:	e2433030 	sub	r3, r3, #48	; 0x30
    f290:	e6ef1073 	uxtb	r1, r3
    f294:	e3510009 	cmp	r1, #9
    f298:	9afffff7 	bls	f27c <xil_vprintf+0x440>
    f29c:	e58d200c 	str	r2, [sp, #12]
    f2a0:	e58da018 	str	sl, [sp, #24]
    f2a4:	e5d43000 	ldrb	r3, [r4]
    f2a8:	e1a02003 	mov	r2, r3
    f2ac:	eaffff01 	b	eeb8 <xil_vprintf+0x7c>
    f2b0:	e3a02000 	mov	r2, #0
    f2b4:	e0822102 	add	r2, r2, r2, lsl #2
    f2b8:	e1a05004 	mov	r5, r4
    f2bc:	e0832082 	add	r2, r3, r2, lsl #1
    f2c0:	e5f43001 	ldrb	r3, [r4, #1]!
    f2c4:	e2433030 	sub	r3, r3, #48	; 0x30
    f2c8:	e6ef1073 	uxtb	r1, r3
    f2cc:	e3510009 	cmp	r1, #9
    f2d0:	9afffff7 	bls	f2b4 <xil_vprintf+0x478>
    f2d4:	e58d2010 	str	r2, [sp, #16]
    f2d8:	eafffff1 	b	f2a4 <xil_vprintf+0x468>
    f2dc:	e49b0004 	ldr	r0, [fp], #4
    f2e0:	e28d2008 	add	r2, sp, #8
    f2e4:	e3a0100a 	mov	r1, #10
    f2e8:	ebfffe6a 	bl	ec98 <outnum>
    f2ec:	eaffff5d 	b	f068 <xil_vprintf+0x22c>
    f2f0:	e49b0004 	ldr	r0, [fp], #4
    f2f4:	e28d2008 	add	r2, sp, #8
    f2f8:	e3a01010 	mov	r1, #16
    f2fc:	ebfffe65 	bl	ec98 <outnum>
    f300:	eaffff58 	b	f068 <xil_vprintf+0x22c>
    f304:	e3a0000d 	mov	r0, #13
    f308:	eaffffc7 	b	f22c <xil_vprintf+0x3f0>
    f30c:	e3a00008 	mov	r0, #8
    f310:	eaffffc5 	b	f22c <xil_vprintf+0x3f0>
    f314:	e3a00007 	mov	r0, #7
    f318:	eaffffc3 	b	f22c <xil_vprintf+0x3f0>
    f31c:	e59d5008 	ldr	r5, [sp, #8]
    f320:	e59d600c 	ldr	r6, [sp, #12]
    f324:	e1550006 	cmp	r5, r6
    f328:	aaffff9e 	bge	f1a8 <xil_vprintf+0x36c>
    f32c:	e5dd8014 	ldrb	r8, [sp, #20]
    f330:	e1a00008 	mov	r0, r8
    f334:	e2855001 	add	r5, r5, #1
    f338:	eb000ab3 	bl	11e0c <outbyte>
    f33c:	e1560005 	cmp	r6, r5
    f340:	1afffffa 	bne	f330 <xil_vprintf+0x4f4>
    f344:	eaffff97 	b	f1a8 <xil_vprintf+0x36c>
    f348:	e59da00c 	ldr	sl, [sp, #12]
    f34c:	e150000a 	cmp	r0, sl
    f350:	aa000008 	bge	f378 <xil_vprintf+0x53c>
    f354:	e5dd3014 	ldrb	r3, [sp, #20]
    f358:	e58d4004 	str	r4, [sp, #4]
    f35c:	e1a04003 	mov	r4, r3
    f360:	e1a00004 	mov	r0, r4
    f364:	e2855001 	add	r5, r5, #1
    f368:	eb000aa7 	bl	11e0c <outbyte>
    f36c:	e15a0005 	cmp	sl, r5
    f370:	1afffffa 	bne	f360 <xil_vprintf+0x524>
    f374:	e59d4004 	ldr	r4, [sp, #4]
    f378:	e5d60000 	ldrb	r0, [r6]
    f37c:	e3500000 	cmp	r0, #0
    f380:	1affff79 	bne	f16c <xil_vprintf+0x330>
    f384:	eaffff87 	b	f1a8 <xil_vprintf+0x36c>
    f388:	e1a0300b 	mov	r3, fp
    f38c:	e59b4004 	ldr	r4, [fp, #4]
    f390:	e4932008 	ldr	r2, [r3], #8
    f394:	e3520000 	cmp	r2, #0
    f398:	0a00000b 	beq	f3cc <xil_vprintf+0x590>
    f39c:	e2422001 	sub	r2, r2, #1
    f3a0:	e58d3004 	str	r3, [sp, #4]
    f3a4:	e084b002 	add	fp, r4, r2
    f3a8:	e2444001 	sub	r4, r4, #1
    f3ac:	ea000002 	b	f3bc <xil_vprintf+0x580>
    f3b0:	eb000a95 	bl	11e0c <outbyte>
    f3b4:	e15b0004 	cmp	fp, r4
    f3b8:	0a000002 	beq	f3c8 <xil_vprintf+0x58c>
    f3bc:	e5f40001 	ldrb	r0, [r4, #1]!
    f3c0:	e3500000 	cmp	r0, #0
    f3c4:	1afffff9 	bne	f3b0 <xil_vprintf+0x574>
    f3c8:	e59d3004 	ldr	r3, [sp, #4]
    f3cc:	e3560001 	cmp	r6, #1
    f3d0:	e2854003 	add	r4, r5, #3
    f3d4:	15d52004 	ldrbne	r2, [r5, #4]
    f3d8:	11a0b003 	movne	fp, r3
    f3dc:	11a05004 	movne	r5, r4
    f3e0:	1afffeb4 	bne	eeb8 <xil_vprintf+0x7c>
    f3e4:	e1a0b003 	mov	fp, r3
    f3e8:	eaffff1e 	b	f068 <xil_vprintf+0x22c>

0000f3ec <xil_printf>:
    f3ec:	e92d000f 	push	{r0, r1, r2, r3}
    f3f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f3f4:	e24dd00c 	sub	sp, sp, #12
    f3f8:	e28d1014 	add	r1, sp, #20
    f3fc:	e59d0010 	ldr	r0, [sp, #16]
    f400:	e58d1004 	str	r1, [sp, #4]
    f404:	ebfffe8c 	bl	ee3c <xil_vprintf>
    f408:	e28dd00c 	add	sp, sp, #12
    f40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    f410:	e28dd010 	add	sp, sp, #16
    f414:	e12fff1e 	bx	lr

0000f418 <Xil_ConvertCharToNibble>:
    f418:	e2403030 	sub	r3, r0, #48	; 0x30
    f41c:	e6ef3073 	uxtb	r3, r3
    f420:	e3530009 	cmp	r3, #9
    f424:	95c13000 	strbls	r3, [r1]
    f428:	8a000001 	bhi	f434 <Xil_ConvertCharToNibble+0x1c>
    f42c:	e3a00000 	mov	r0, #0
    f430:	e12fff1e 	bx	lr
    f434:	e2403061 	sub	r3, r0, #97	; 0x61
    f438:	e3530005 	cmp	r3, #5
    f43c:	8a000003 	bhi	f450 <Xil_ConvertCharToNibble+0x38>
    f440:	e2400057 	sub	r0, r0, #87	; 0x57
    f444:	e5c10000 	strb	r0, [r1]
    f448:	e3a00000 	mov	r0, #0
    f44c:	e12fff1e 	bx	lr
    f450:	e2403041 	sub	r3, r0, #65	; 0x41
    f454:	e3530005 	cmp	r3, #5
    f458:	92400037 	subls	r0, r0, #55	; 0x37
    f45c:	95c10000 	strbls	r0, [r1]
    f460:	9afffff1 	bls	f42c <Xil_ConvertCharToNibble+0x14>
    f464:	e3a00001 	mov	r0, #1
    f468:	e12fff1e 	bx	lr

0000f46c <Xil_ConvertStringToHex>:
    f46c:	e3520000 	cmp	r2, #0
    f470:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    f474:	e3a0e000 	mov	lr, #0
    f478:	e24dd00c 	sub	sp, sp, #12
    f47c:	e58de000 	str	lr, [sp]
    f480:	e58de004 	str	lr, [sp, #4]
    f484:	0a000014 	beq	f4dc <Xil_ConvertStringToHex+0x70>
    f488:	e2414004 	sub	r4, r1, #4
    f48c:	e3a0c001 	mov	ip, #1
    f490:	e080500e 	add	r5, r0, lr
    f494:	e28e8009 	add	r8, lr, #9
    f498:	e24d6001 	sub	r6, sp, #1
    f49c:	e1a0e00c 	mov	lr, ip
    f4a0:	e4d51001 	ldrb	r1, [r5], #1
    f4a4:	e2413030 	sub	r3, r1, #48	; 0x30
    f4a8:	e2417061 	sub	r7, r1, #97	; 0x61
    f4ac:	e6ef3073 	uxtb	r3, r3
    f4b0:	e3530009 	cmp	r3, #9
    f4b4:	9a00000b 	bls	f4e8 <Xil_ConvertStringToHex+0x7c>
    f4b8:	e3570005 	cmp	r7, #5
    f4bc:	e2413057 	sub	r3, r1, #87	; 0x57
    f4c0:	96ef3073 	uxtbls	r3, r3
    f4c4:	e2419041 	sub	r9, r1, #65	; 0x41
    f4c8:	9a000006 	bls	f4e8 <Xil_ConvertStringToHex+0x7c>
    f4cc:	e3590005 	cmp	r9, #5
    f4d0:	e2411037 	sub	r1, r1, #55	; 0x37
    f4d4:	e6ef3071 	uxtb	r3, r1
    f4d8:	9a000002 	bls	f4e8 <Xil_ConvertStringToHex+0x7c>
    f4dc:	e3a00001 	mov	r0, #1
    f4e0:	e28dd00c 	add	sp, sp, #12
    f4e4:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
    f4e8:	e28cc001 	add	ip, ip, #1
    f4ec:	e5e63001 	strb	r3, [r6, #1]!
    f4f0:	e158000c 	cmp	r8, ip
    f4f4:	11a0e00c 	movne	lr, ip
    f4f8:	1affffe8 	bne	f4a0 <Xil_ConvertStringToHex+0x34>
    f4fc:	e5dd3001 	ldrb	r3, [sp, #1]
    f500:	e152000e 	cmp	r2, lr
    f504:	e5dd5000 	ldrb	r5, [sp]
    f508:	e5dd1007 	ldrb	r1, [sp, #7]
    f50c:	e1a03c03 	lsl	r3, r3, #24
    f510:	e1833e05 	orr	r3, r3, r5, lsl #28
    f514:	e5dd5002 	ldrb	r5, [sp, #2]
    f518:	e1833001 	orr	r3, r3, r1
    f51c:	e5dd1003 	ldrb	r1, [sp, #3]
    f520:	e1833a05 	orr	r3, r3, r5, lsl #20
    f524:	e5dd5004 	ldrb	r5, [sp, #4]
    f528:	e1833801 	orr	r3, r3, r1, lsl #16
    f52c:	e5dd1005 	ldrb	r1, [sp, #5]
    f530:	e1833605 	orr	r3, r3, r5, lsl #12
    f534:	e1833401 	orr	r3, r3, r1, lsl #8
    f538:	e5dd1006 	ldrb	r1, [sp, #6]
    f53c:	e1833201 	orr	r3, r3, r1, lsl #4
    f540:	e5a43004 	str	r3, [r4, #4]!
    f544:	8affffd1 	bhi	f490 <Xil_ConvertStringToHex+0x24>
    f548:	e3a00000 	mov	r0, #0
    f54c:	e28dd00c 	add	sp, sp, #12
    f550:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}

0000f554 <Xil_WaitForEvent>:
    f554:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f558:	e2534000 	subs	r4, r3, #0
    f55c:	11a07000 	movne	r7, r0
    f560:	11a06001 	movne	r6, r1
    f564:	11a05002 	movne	r5, r2
    f568:	1a000003 	bne	f57c <Xil_WaitForEvent+0x28>
    f56c:	ea00000a 	b	f59c <Xil_WaitForEvent+0x48>
    f570:	ebffd7ff 	bl	5574 <usleep>
    f574:	e3540000 	cmp	r4, #0
    f578:	0a000007 	beq	f59c <Xil_WaitForEvent+0x48>
    f57c:	e597c000 	ldr	ip, [r7]
    f580:	e3a00001 	mov	r0, #1
    f584:	e2444001 	sub	r4, r4, #1
    f588:	e00cc006 	and	ip, ip, r6
    f58c:	e15c0005 	cmp	ip, r5
    f590:	1afffff6 	bne	f570 <Xil_WaitForEvent+0x1c>
    f594:	e3a00000 	mov	r0, #0
    f598:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    f59c:	e3a00001 	mov	r0, #1
    f5a0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000f5a4 <Xil_WaitForEvents>:
    f5a4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f5a8:	e1a04003 	mov	r4, r3
    f5ac:	e59d8018 	ldr	r8, [sp, #24]
    f5b0:	e3a03000 	mov	r3, #0
    f5b4:	e1a07000 	mov	r7, r0
    f5b8:	e1a06001 	mov	r6, r1
    f5bc:	e1a05002 	mov	r5, r2
    f5c0:	e5883000 	str	r3, [r8]
    f5c4:	ea000002 	b	f5d4 <Xil_WaitForEvents+0x30>
    f5c8:	ebffd7e9 	bl	5574 <usleep>
    f5cc:	e3540000 	cmp	r4, #0
    f5d0:	0a000008 	beq	f5f8 <Xil_WaitForEvents+0x54>
    f5d4:	e597c000 	ldr	ip, [r7]
    f5d8:	e3a00001 	mov	r0, #1
    f5dc:	e2444001 	sub	r4, r4, #1
    f5e0:	e00cc006 	and	ip, ip, r6
    f5e4:	e11c0005 	tst	ip, r5
    f5e8:	0afffff6 	beq	f5c8 <Xil_WaitForEvents+0x24>
    f5ec:	e3a00000 	mov	r0, #0
    f5f0:	e588c000 	str	ip, [r8]
    f5f4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    f5f8:	e3a0001f 	mov	r0, #31
    f5fc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000f600 <Xil_WaitForEventSet>:
    f600:	e92d000c 	push	{r2, r3}
    f604:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f608:	e2518000 	subs	r8, r1, #0
    f60c:	e24dd008 	sub	sp, sp, #8
    f610:	01a07008 	moveq	r7, r8
    f614:	e28d3024 	add	r3, sp, #36	; 0x24
    f618:	e59d5020 	ldr	r5, [sp, #32]
    f61c:	e58d3004 	str	r3, [sp, #4]
    f620:	0a000014 	beq	f678 <Xil_WaitForEventSet+0x78>
    f624:	e3500000 	cmp	r0, #0
    f628:	e1a06000 	mov	r6, r0
    f62c:	13a07000 	movne	r7, #0
    f630:	0a000016 	beq	f690 <Xil_WaitForEventSet+0x90>
    f634:	e1a04006 	mov	r4, r6
    f638:	ea000002 	b	f648 <Xil_WaitForEventSet+0x48>
    f63c:	ebffd7cc 	bl	5574 <usleep>
    f640:	e3540000 	cmp	r4, #0
    f644:	0a00000b 	beq	f678 <Xil_WaitForEventSet+0x78>
    f648:	e5953000 	ldr	r3, [r5]
    f64c:	e3a00001 	mov	r0, #1
    f650:	e2444001 	sub	r4, r4, #1
    f654:	e3530000 	cmp	r3, #0
    f658:	0afffff7 	beq	f63c <Xil_WaitForEventSet+0x3c>
    f65c:	e59d3004 	ldr	r3, [sp, #4]
    f660:	e0877000 	add	r7, r7, r0
    f664:	e1580007 	cmp	r8, r7
    f668:	e2832004 	add	r2, r3, #4
    f66c:	e5935000 	ldr	r5, [r3]
    f670:	e58d2004 	str	r2, [sp, #4]
    f674:	1affffee 	bne	f634 <Xil_WaitForEventSet+0x34>
    f678:	e0580007 	subs	r0, r8, r7
    f67c:	13a00001 	movne	r0, #1
    f680:	e28dd008 	add	sp, sp, #8
    f684:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f688:	e28dd008 	add	sp, sp, #8
    f68c:	e12fff1e 	bx	lr
    f690:	e1a07000 	mov	r7, r0
    f694:	eafffff7 	b	f678 <Xil_WaitForEventSet+0x78>

0000f698 <Xil_UtilRMW32>:
    f698:	e5903000 	ldr	r3, [r0]
    f69c:	e0222003 	eor	r2, r2, r3
    f6a0:	e0022001 	and	r2, r2, r1
    f6a4:	e0222003 	eor	r2, r2, r3
    f6a8:	e5802000 	str	r2, [r0]
    f6ac:	e12fff1e 	bx	lr

0000f6b0 <Xil_SecureMemCpy>:
    f6b0:	e1530001 	cmp	r3, r1
    f6b4:	8a000009 	bhi	f6e0 <Xil_SecureMemCpy+0x30>
    f6b8:	e3530000 	cmp	r3, #0
    f6bc:	12422001 	subne	r2, r2, #1
    f6c0:	10803003 	addne	r3, r0, r3
    f6c4:	0a000003 	beq	f6d8 <Xil_SecureMemCpy+0x28>
    f6c8:	e5f21001 	ldrb	r1, [r2, #1]!
    f6cc:	e4c01001 	strb	r1, [r0], #1
    f6d0:	e1500003 	cmp	r0, r3
    f6d4:	1afffffb 	bne	f6c8 <Xil_SecureMemCpy+0x18>
    f6d8:	e3a00000 	mov	r0, #0
    f6dc:	e12fff1e 	bx	lr
    f6e0:	e3510000 	cmp	r1, #0
    f6e4:	10803001 	addne	r3, r0, r1
    f6e8:	13a02000 	movne	r2, #0
    f6ec:	0a000002 	beq	f6fc <Xil_SecureMemCpy+0x4c>
    f6f0:	e4c02001 	strb	r2, [r0], #1
    f6f4:	e1530000 	cmp	r3, r0
    f6f8:	1afffffc 	bne	f6f0 <Xil_SecureMemCpy+0x40>
    f6fc:	e3a00001 	mov	r0, #1
    f700:	e12fff1e 	bx	lr

0000f704 <Xil_SecureZeroize>:
    f704:	e92d4070 	push	{r4, r5, r6, lr}
    f708:	e1a05001 	mov	r5, r1
    f70c:	e1a02005 	mov	r2, r5
    f710:	e3a01000 	mov	r1, #0
    f714:	e1a06000 	mov	r6, r0
    f718:	fa0006f2 	blx	112e8 <memset>
    f71c:	e3550000 	cmp	r5, #0
    f720:	0a000010 	beq	f768 <Xil_SecureZeroize+0x64>
    f724:	e245e001 	sub	lr, r5, #1
    f728:	e2463001 	sub	r3, r6, #1
    f72c:	e086e00e 	add	lr, r6, lr
    f730:	ea000001 	b	f73c <Xil_SecureZeroize+0x38>
    f734:	e153000e 	cmp	r3, lr
    f738:	0a000005 	beq	f754 <Xil_SecureZeroize+0x50>
    f73c:	e1a04003 	mov	r4, r3
    f740:	e5f3c001 	ldrb	ip, [r3, #1]!
    f744:	e35c0000 	cmp	ip, #0
    f748:	0afffff9 	beq	f734 <Xil_SecureZeroize+0x30>
    f74c:	e3a00001 	mov	r0, #1
    f750:	e8bd8070 	pop	{r4, r5, r6, pc}
    f754:	e2844002 	add	r4, r4, #2
    f758:	e0444006 	sub	r4, r4, r6
    f75c:	e0550004 	subs	r0, r5, r4
    f760:	13a00001 	movne	r0, #1
    f764:	e8bd8070 	pop	{r4, r5, r6, pc}
    f768:	e1a04005 	mov	r4, r5
    f76c:	eafffffa 	b	f75c <Xil_SecureZeroize+0x58>

0000f770 <Xil_SMemCmp>:
    f770:	e92d4010 	push	{r4, lr}
    f774:	e1a0c002 	mov	ip, r2
    f778:	e59de008 	ldr	lr, [sp, #8]
    f77c:	e24e2001 	sub	r2, lr, #1
    f780:	e15e0003 	cmp	lr, r3
    f784:	91520001 	cmpls	r2, r1
    f788:	3a000001 	bcc	f794 <Xil_SMemCmp+0x24>
    f78c:	e3a0000f 	mov	r0, #15
    f790:	e8bd8010 	pop	{r4, pc}
    f794:	e1a0200e 	mov	r2, lr
    f798:	e1a0100c 	mov	r1, ip
    f79c:	fa00067c 	blx	11194 <memcmp>
    f7a0:	e2500000 	subs	r0, r0, #0
    f7a4:	13a00001 	movne	r0, #1
    f7a8:	e8bd8010 	pop	{r4, pc}

0000f7ac <Xil_SMemCmp_CT>:
    f7ac:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    f7b0:	e24dd014 	sub	sp, sp, #20
    f7b4:	e59dc028 	ldr	ip, [sp, #40]	; 0x28
    f7b8:	e24ce001 	sub	lr, ip, #1
    f7bc:	e15c0003 	cmp	ip, r3
    f7c0:	915e0001 	cmpls	lr, r1
    f7c4:	e3a03001 	mov	r3, #1
    f7c8:	e58d3000 	str	r3, [sp]
    f7cc:	e3a01000 	mov	r1, #0
    f7d0:	e58d3004 	str	r3, [sp, #4]
    f7d4:	e3e03000 	mvn	r3, #0
    f7d8:	e58d1008 	str	r1, [sp, #8]
    f7dc:	e58d300c 	str	r3, [sp, #12]
    f7e0:	23a0300f 	movcs	r3, #15
    f7e4:	258d3000 	strcs	r3, [sp]
    f7e8:	3a000004 	bcc	f800 <Xil_SMemCmp_CT+0x54>
    f7ec:	e59d0000 	ldr	r0, [sp]
    f7f0:	e59d3004 	ldr	r3, [sp, #4]
    f7f4:	e1800003 	orr	r0, r0, r3
    f7f8:	e28dd014 	add	sp, sp, #20
    f7fc:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    f800:	e35c0003 	cmp	ip, #3
    f804:	9a000017 	bls	f868 <Xil_SMemCmp_CT+0xbc>
    f808:	e24c6004 	sub	r6, ip, #4
    f80c:	e2401004 	sub	r1, r0, #4
    f810:	e3c65003 	bic	r5, r6, #3
    f814:	e1a06126 	lsr	r6, r6, #2
    f818:	e0805005 	add	r5, r0, r5
    f81c:	e1a0e002 	mov	lr, r2
    f820:	e5b13004 	ldr	r3, [r1, #4]!
    f824:	e49e7004 	ldr	r7, [lr], #4
    f828:	e59d4008 	ldr	r4, [sp, #8]
    f82c:	e1510005 	cmp	r1, r5
    f830:	e0233007 	eor	r3, r3, r7
    f834:	e1833004 	orr	r3, r3, r4
    f838:	e58d3008 	str	r3, [sp, #8]
    f83c:	e59d4008 	ldr	r4, [sp, #8]
    f840:	e59d300c 	ldr	r3, [sp, #12]
    f844:	e1c33004 	bic	r3, r3, r4
    f848:	e58d300c 	str	r3, [sp, #12]
    f84c:	1afffff3 	bne	f820 <Xil_SMemCmp_CT+0x74>
    f850:	e21cc003 	ands	ip, ip, #3
    f854:	0a000011 	beq	f8a0 <Xil_SMemCmp_CT+0xf4>
    f858:	e2866001 	add	r6, r6, #1
    f85c:	e1a06106 	lsl	r6, r6, #2
    f860:	e0800006 	add	r0, r0, r6
    f864:	e0822006 	add	r2, r2, r6
    f868:	e2400001 	sub	r0, r0, #1
    f86c:	e082c00c 	add	ip, r2, ip
    f870:	e4d2e001 	ldrb	lr, [r2], #1
    f874:	e5f03001 	ldrb	r3, [r0, #1]!
    f878:	e59d1008 	ldr	r1, [sp, #8]
    f87c:	e15c0002 	cmp	ip, r2
    f880:	e023300e 	eor	r3, r3, lr
    f884:	e1833001 	orr	r3, r3, r1
    f888:	e58d3008 	str	r3, [sp, #8]
    f88c:	e59d1008 	ldr	r1, [sp, #8]
    f890:	e59d300c 	ldr	r3, [sp, #12]
    f894:	e1c33001 	bic	r3, r3, r1
    f898:	e58d300c 	str	r3, [sp, #12]
    f89c:	1afffff3 	bne	f870 <Xil_SMemCmp_CT+0xc4>
    f8a0:	e59d3008 	ldr	r3, [sp, #8]
    f8a4:	e3530000 	cmp	r3, #0
    f8a8:	1affffcf 	bne	f7ec <Xil_SMemCmp_CT+0x40>
    f8ac:	e59d200c 	ldr	r2, [sp, #12]
    f8b0:	e3720001 	cmn	r2, #1
    f8b4:	058d3000 	streq	r3, [sp]
    f8b8:	058d3004 	streq	r3, [sp, #4]
    f8bc:	eaffffca 	b	f7ec <Xil_SMemCmp_CT+0x40>

0000f8c0 <Xil_SMemCpy>:
    f8c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f8c4:	e24dd00c 	sub	sp, sp, #12
    f8c8:	e59dc010 	ldr	ip, [sp, #16]
    f8cc:	e58d0000 	str	r0, [sp]
    f8d0:	e24ce001 	sub	lr, ip, #1
    f8d4:	e58d2004 	str	r2, [sp, #4]
    f8d8:	e15c0003 	cmp	ip, r3
    f8dc:	915e0001 	cmpls	lr, r1
    f8e0:	3a000002 	bcc	f8f0 <Xil_SMemCpy+0x30>
    f8e4:	e3a0000f 	mov	r0, #15
    f8e8:	e28dd00c 	add	sp, sp, #12
    f8ec:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    f8f0:	e1520000 	cmp	r2, r0
    f8f4:	2a000009 	bcs	f920 <Xil_SMemCpy+0x60>
    f8f8:	e082200e 	add	r2, r2, lr
    f8fc:	e1500002 	cmp	r0, r2
    f900:	9afffff7 	bls	f8e4 <Xil_SMemCpy+0x24>
    f904:	e59d0000 	ldr	r0, [sp]
    f908:	e1a0200c 	mov	r2, ip
    f90c:	e59d1004 	ldr	r1, [sp, #4]
    f910:	eb0004cd 	bl	10c4c <Xil_MemCpy>
    f914:	e3a00000 	mov	r0, #0
    f918:	e28dd00c 	add	sp, sp, #12
    f91c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    f920:	9afffff7 	bls	f904 <Xil_SMemCpy+0x44>
    f924:	e080000e 	add	r0, r0, lr
    f928:	e1520000 	cmp	r2, r0
    f92c:	8afffff4 	bhi	f904 <Xil_SMemCpy+0x44>
    f930:	eaffffeb 	b	f8e4 <Xil_SMemCpy+0x24>

0000f934 <Xil_SMemSet>:
    f934:	e92d4010 	push	{r4, lr}
    f938:	e243e001 	sub	lr, r3, #1
    f93c:	e15e0001 	cmp	lr, r1
    f940:	3a000001 	bcc	f94c <Xil_SMemSet+0x18>
    f944:	e3a0000f 	mov	r0, #15
    f948:	e8bd8010 	pop	{r4, pc}
    f94c:	e1a0c002 	mov	ip, r2
    f950:	e1a02003 	mov	r2, r3
    f954:	e1a0100c 	mov	r1, ip
    f958:	fa000662 	blx	112e8 <memset>
    f95c:	e3a00000 	mov	r0, #0
    f960:	e8bd8010 	pop	{r4, pc}

0000f964 <Xil_SStrCat>:
    f964:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f968:	e1a06001 	mov	r6, r1
    f96c:	e1a07000 	mov	r7, r0
    f970:	e1a01003 	mov	r1, r3
    f974:	e1a00002 	mov	r0, r2
    f978:	e1a04003 	mov	r4, r3
    f97c:	e1a08002 	mov	r8, r2
    f980:	fa0006cd 	blx	114bc <strnlen>
    f984:	e1a01006 	mov	r1, r6
    f988:	e1a05000 	mov	r5, r0
    f98c:	e1a00007 	mov	r0, r7
    f990:	fa0006c9 	blx	114bc <strnlen>
    f994:	e1540005 	cmp	r4, r5
    f998:	81560000 	cmphi	r6, r0
    f99c:	e0852000 	add	r2, r5, r0
    f9a0:	93a04001 	movls	r4, #1
    f9a4:	83a04000 	movhi	r4, #0
    f9a8:	e1560002 	cmp	r6, r2
    f9ac:	93844001 	orrls	r4, r4, #1
    f9b0:	e3540000 	cmp	r4, #0
    f9b4:	0a000001 	beq	f9c0 <Xil_SStrCat+0x5c>
    f9b8:	e3a0000f 	mov	r0, #15
    f9bc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    f9c0:	e1a01008 	mov	r1, r8
    f9c4:	e1a00007 	mov	r0, r7
    f9c8:	fa0006a4 	blx	11460 <strncat>
    f9cc:	e1a00004 	mov	r0, r4
    f9d0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000f9d4 <Xil_SStrCmp>:
    f9d4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f9d8:	e1a04003 	mov	r4, r3
    f9dc:	e1a06002 	mov	r6, r2
    f9e0:	e1a07001 	mov	r7, r1
    f9e4:	e1a08000 	mov	r8, r0
    f9e8:	fa0006b3 	blx	114bc <strnlen>
    f9ec:	e1a01004 	mov	r1, r4
    f9f0:	e1a05000 	mov	r5, r0
    f9f4:	e1a00006 	mov	r0, r6
    f9f8:	fa0006af 	blx	114bc <strnlen>
    f9fc:	e1540000 	cmp	r4, r0
    fa00:	81570005 	cmphi	r7, r5
    fa04:	9a00000a 	bls	fa34 <Xil_SStrCmp+0x60>
    fa08:	e1550000 	cmp	r5, r0
    fa0c:	0a000001 	beq	fa18 <Xil_SStrCmp+0x44>
    fa10:	e3a00001 	mov	r0, #1
    fa14:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    fa18:	e1a02005 	mov	r2, r5
    fa1c:	e1a01006 	mov	r1, r6
    fa20:	e1a00008 	mov	r0, r8
    fa24:	fa0005da 	blx	11194 <memcmp>
    fa28:	e2500000 	subs	r0, r0, #0
    fa2c:	13a00001 	movne	r0, #1
    fa30:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    fa34:	e3a0000f 	mov	r0, #15
    fa38:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000fa3c <Xil_SStrCmp_CT>:
    fa3c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    fa40:	e1a04003 	mov	r4, r3
    fa44:	e1a07002 	mov	r7, r2
    fa48:	e24dd008 	sub	sp, sp, #8
    fa4c:	e1a06001 	mov	r6, r1
    fa50:	e1a08000 	mov	r8, r0
    fa54:	fa000698 	blx	114bc <strnlen>
    fa58:	e1a01004 	mov	r1, r4
    fa5c:	e1a05000 	mov	r5, r0
    fa60:	e1a00007 	mov	r0, r7
    fa64:	fa000694 	blx	114bc <strnlen>
    fa68:	e1540000 	cmp	r4, r0
    fa6c:	81560005 	cmphi	r6, r5
    fa70:	93a0000f 	movls	r0, #15
    fa74:	9a000002 	bls	fa84 <Xil_SStrCmp_CT+0x48>
    fa78:	e1550000 	cmp	r5, r0
    fa7c:	13a00001 	movne	r0, #1
    fa80:	0a000001 	beq	fa8c <Xil_SStrCmp_CT+0x50>
    fa84:	e28dd008 	add	sp, sp, #8
    fa88:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    fa8c:	e1a03004 	mov	r3, r4
    fa90:	e1a02007 	mov	r2, r7
    fa94:	e1a01006 	mov	r1, r6
    fa98:	e1a00008 	mov	r0, r8
    fa9c:	e58d5000 	str	r5, [sp]
    faa0:	ebffff41 	bl	f7ac <Xil_SMemCmp_CT>
    faa4:	e28dd008 	add	sp, sp, #8
    faa8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000faac <Xil_SStrCpy>:
    faac:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    fab0:	e1a04003 	mov	r4, r3
    fab4:	e1a05001 	mov	r5, r1
    fab8:	e1a07000 	mov	r7, r0
    fabc:	e1a01003 	mov	r1, r3
    fac0:	e1a00002 	mov	r0, r2
    fac4:	e1a06002 	mov	r6, r2
    fac8:	fa00067b 	blx	114bc <strnlen>
    facc:	e1540005 	cmp	r4, r5
    fad0:	21a04005 	movcs	r4, r5
    fad4:	e1540000 	cmp	r4, r0
    fad8:	8a000001 	bhi	fae4 <Xil_SStrCpy+0x38>
    fadc:	e3a0000f 	mov	r0, #15
    fae0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    fae4:	e2802001 	add	r2, r0, #1
    fae8:	e1a01006 	mov	r1, r6
    faec:	e1a00007 	mov	r0, r7
    faf0:	eb0006b2 	bl	115c0 <memcpy>
    faf4:	e3a00000 	mov	r0, #0
    faf8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000fafc <Xil_SMemMove>:
    fafc:	e92d4030 	push	{r4, r5, lr}
    fb00:	e24dd00c 	sub	sp, sp, #12
    fb04:	e59de018 	ldr	lr, [sp, #24]
    fb08:	e1a05002 	mov	r5, r2
    fb0c:	e3a02001 	mov	r2, #1
    fb10:	e58d2004 	str	r2, [sp, #4]
    fb14:	e24ec001 	sub	ip, lr, #1
    fb18:	e15e0003 	cmp	lr, r3
    fb1c:	915c0001 	cmpls	ip, r1
    fb20:	23a04001 	movcs	r4, #1
    fb24:	33a04000 	movcc	r4, #0
    fb28:	3a000004 	bcc	fb40 <Xil_SMemMove+0x44>
    fb2c:	e3a0300f 	mov	r3, #15
    fb30:	e58d3004 	str	r3, [sp, #4]
    fb34:	e59d0004 	ldr	r0, [sp, #4]
    fb38:	e28dd00c 	add	sp, sp, #12
    fb3c:	e8bd8030 	pop	{r4, r5, pc}
    fb40:	e1a0200e 	mov	r2, lr
    fb44:	e1a01005 	mov	r1, r5
    fb48:	fa0005a8 	blx	111f0 <memmove>
    fb4c:	e58d4004 	str	r4, [sp, #4]
    fb50:	e59d0004 	ldr	r0, [sp, #4]
    fb54:	e28dd00c 	add	sp, sp, #12
    fb58:	e8bd8030 	pop	{r4, r5, pc}

0000fb5c <Xil_SecureRMW32>:
    fb5c:	e590c000 	ldr	ip, [r0]
    fb60:	e022300c 	eor	r3, r2, ip
    fb64:	e0033001 	and	r3, r3, r1
    fb68:	e023300c 	eor	r3, r3, ip
    fb6c:	e5803000 	str	r3, [r0]
    fb70:	e5903000 	ldr	r3, [r0]
    fb74:	e0222003 	eor	r2, r2, r3
    fb78:	e1120001 	tst	r2, r1
    fb7c:	13a00001 	movne	r0, #1
    fb80:	03a00000 	moveq	r0, #0
    fb84:	e12fff1e 	bx	lr

0000fb88 <Xil_SChangeEndiannessAndCpy>:
    fb88:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    fb8c:	e24dd00c 	sub	sp, sp, #12
    fb90:	e59dc010 	ldr	ip, [sp, #16]
    fb94:	e24ce001 	sub	lr, ip, #1
    fb98:	e15c0003 	cmp	ip, r3
    fb9c:	915e0001 	cmpls	lr, r1
    fba0:	3a000002 	bcc	fbb0 <Xil_SChangeEndiannessAndCpy+0x28>
    fba4:	e3a0000f 	mov	r0, #15
    fba8:	e28dd00c 	add	sp, sp, #12
    fbac:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    fbb0:	e1520000 	cmp	r2, r0
    fbb4:	2a000018 	bcs	fc1c <Xil_SChangeEndiannessAndCpy+0x94>
    fbb8:	e082e00e 	add	lr, r2, lr
    fbbc:	e150000e 	cmp	r0, lr
    fbc0:	9afffff7 	bls	fba4 <Xil_SChangeEndiannessAndCpy+0x1c>
    fbc4:	e3a03000 	mov	r3, #0
    fbc8:	e58d3004 	str	r3, [sp, #4]
    fbcc:	e59d3004 	ldr	r3, [sp, #4]
    fbd0:	e15c0003 	cmp	ip, r3
    fbd4:	9a00000b 	bls	fc08 <Xil_SChangeEndiannessAndCpy+0x80>
    fbd8:	e59d3004 	ldr	r3, [sp, #4]
    fbdc:	e59de004 	ldr	lr, [sp, #4]
    fbe0:	e59d1004 	ldr	r1, [sp, #4]
    fbe4:	e04c3003 	sub	r3, ip, r3
    fbe8:	e0823003 	add	r3, r2, r3
    fbec:	e2811001 	add	r1, r1, #1
    fbf0:	e58d1004 	str	r1, [sp, #4]
    fbf4:	e5531001 	ldrb	r1, [r3, #-1]
    fbf8:	e59d3004 	ldr	r3, [sp, #4]
    fbfc:	e7c0100e 	strb	r1, [r0, lr]
    fc00:	e153000c 	cmp	r3, ip
    fc04:	3afffff3 	bcc	fbd8 <Xil_SChangeEndiannessAndCpy+0x50>
    fc08:	e59d0004 	ldr	r0, [sp, #4]
    fc0c:	e050000c 	subs	r0, r0, ip
    fc10:	13a00001 	movne	r0, #1
    fc14:	e28dd00c 	add	sp, sp, #12
    fc18:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    fc1c:	9affffe8 	bls	fbc4 <Xil_SChangeEndiannessAndCpy+0x3c>
    fc20:	e080e00e 	add	lr, r0, lr
    fc24:	e152000e 	cmp	r2, lr
    fc28:	8affffe5 	bhi	fbc4 <Xil_SChangeEndiannessAndCpy+0x3c>
    fc2c:	eaffffdc 	b	fba4 <Xil_SChangeEndiannessAndCpy+0x1c>

0000fc30 <Xil_SReverseData>:
    fc30:	e92d4070 	push	{r4, r5, r6, lr}
    fc34:	e3a03001 	mov	r3, #1
    fc38:	e24dd010 	sub	sp, sp, #16
    fc3c:	e3510000 	cmp	r1, #0
    fc40:	e3a02000 	mov	r2, #0
    fc44:	e58d3004 	str	r3, [sp, #4]
    fc48:	e58d3008 	str	r3, [sp, #8]
    fc4c:	03a0300f 	moveq	r3, #15
    fc50:	e58d200c 	str	r2, [sp, #12]
    fc54:	058d3004 	streq	r3, [sp, #4]
    fc58:	0a000020 	beq	fce0 <Xil_SReverseData+0xb0>
    fc5c:	e58d200c 	str	r2, [sp, #12]
    fc60:	e1a050a1 	lsr	r5, r1, #1
    fc64:	e59d300c 	ldr	r3, [sp, #12]
    fc68:	e1550003 	cmp	r5, r3
    fc6c:	9a000011 	bls	fcb8 <Xil_SReverseData+0x88>
    fc70:	e59d200c 	ldr	r2, [sp, #12]
    fc74:	e59d400c 	ldr	r4, [sp, #12]
    fc78:	e59d300c 	ldr	r3, [sp, #12]
    fc7c:	e59de00c 	ldr	lr, [sp, #12]
    fc80:	e0412002 	sub	r2, r1, r2
    fc84:	e59dc00c 	ldr	ip, [sp, #12]
    fc88:	e0802002 	add	r2, r0, r2
    fc8c:	e7d06004 	ldrb	r6, [r0, r4]
    fc90:	e0413003 	sub	r3, r1, r3
    fc94:	e5524001 	ldrb	r4, [r2, #-1]
    fc98:	e0803003 	add	r3, r0, r3
    fc9c:	e28cc001 	add	ip, ip, #1
    fca0:	e58dc00c 	str	ip, [sp, #12]
    fca4:	e59d200c 	ldr	r2, [sp, #12]
    fca8:	e5436001 	strb	r6, [r3, #-1]
    fcac:	e7c0400e 	strb	r4, [r0, lr]
    fcb0:	e1520005 	cmp	r2, r5
    fcb4:	3affffed 	bcc	fc70 <Xil_SReverseData+0x40>
    fcb8:	e59d300c 	ldr	r3, [sp, #12]
    fcbc:	e1530005 	cmp	r3, r5
    fcc0:	03a03000 	moveq	r3, #0
    fcc4:	058d3004 	streq	r3, [sp, #4]
    fcc8:	e3a03000 	mov	r3, #0
    fccc:	e58d3008 	str	r3, [sp, #8]
    fcd0:	e59d3004 	ldr	r3, [sp, #4]
    fcd4:	e3530000 	cmp	r3, #0
    fcd8:	059d3008 	ldreq	r3, [sp, #8]
    fcdc:	058d3004 	streq	r3, [sp, #4]
    fce0:	e59d0004 	ldr	r0, [sp, #4]
    fce4:	e28dd010 	add	sp, sp, #16
    fce8:	e8bd8070 	pop	{r4, r5, r6, pc}

0000fcec <Xil_MemCpy64>:
    fcec:	e1520000 	cmp	r2, r0
    fcf0:	e1a0c001 	mov	ip, r1
    fcf4:	e0d3100c 	sbcs	r1, r3, ip
    fcf8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    fcfc:	e1a0e002 	mov	lr, r2
    fd00:	e59d2004 	ldr	r2, [sp, #4]
    fd04:	2a000007 	bcs	fd28 <Xil_MemCpy64+0x3c>
    fd08:	e092100e 	adds	r1, r2, lr
    fd0c:	e2a33000 	adc	r3, r3, #0
    fd10:	e1500001 	cmp	r0, r1
    fd14:	e0dcc003 	sbcs	ip, ip, r3
    fd18:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fd1c:	e1a0100e 	mov	r1, lr
    fd20:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    fd24:	ea0003c8 	b	10c4c <Xil_MemCpy>
    fd28:	e150000e 	cmp	r0, lr
    fd2c:	e0dc1003 	sbcs	r1, ip, r3
    fd30:	249df004 	popcs	{pc}		; (ldrcs pc, [sp], #4)
    fd34:	e0921000 	adds	r1, r2, r0
    fd38:	e2acc000 	adc	ip, ip, #0
    fd3c:	e15e0001 	cmp	lr, r1
    fd40:	e0d3300c 	sbcs	r3, r3, ip
    fd44:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fd48:	e1a0100e 	mov	r1, lr
    fd4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    fd50:	ea0003bd 	b	10c4c <Xil_MemCpy>

0000fd54 <Xil_IncrementBuffer>:
    fd54:	e2511001 	subs	r1, r1, #1
    fd58:	e1a0c002 	mov	ip, r2
    fd5c:	412fff1e 	bxmi	lr
    fd60:	e7d03001 	ldrb	r3, [r0, r1]
    fd64:	e0802001 	add	r2, r0, r1
    fd68:	e083300c 	add	r3, r3, ip
    fd6c:	e1b0c423 	lsrs	ip, r3, #8
    fd70:	e7c03001 	strb	r3, [r0, r1]
    fd74:	012fff1e 	bxeq	lr
    fd78:	e0423000 	sub	r3, r2, r0
    fd7c:	e3530001 	cmp	r3, #1
    fd80:	412fff1e 	bxmi	lr
    fd84:	e5723001 	ldrb	r3, [r2, #-1]!
    fd88:	e2833001 	add	r3, r3, #1
    fd8c:	e1b01423 	lsrs	r1, r3, #8
    fd90:	e5c23000 	strb	r3, [r2]
    fd94:	1afffff7 	bne	fd78 <Xil_IncrementBuffer+0x24>
    fd98:	e12fff1e 	bx	lr

0000fd9c <Xil_MemCpyFrom64To32Addr>:
    fd9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    fda0:	e59dc004 	ldr	ip, [sp, #4]
    fda4:	e35c0000 	cmp	ip, #0
    fda8:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    fdac:	e1a01002 	mov	r1, r2
    fdb0:	e3a02000 	mov	r2, #0
    fdb4:	e1520003 	cmp	r2, r3
    fdb8:	01500001 	cmpeq	r0, r1
    fdbc:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    fdc0:	e1510000 	cmp	r1, r0
    fdc4:	e2d3e000 	sbcs	lr, r3, #0
    fdc8:	2a000007 	bcs	fdec <Xil_MemCpyFrom64To32Addr+0x50>
    fdcc:	e091e00c 	adds	lr, r1, ip
    fdd0:	e2a33000 	adc	r3, r3, #0
    fdd4:	e150000e 	cmp	r0, lr
    fdd8:	e0d22003 	sbcs	r2, r2, r3
    fddc:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fde0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    fde4:	e1a0200c 	mov	r2, ip
    fde8:	ea000397 	b	10c4c <Xil_MemCpy>
    fdec:	e090e00c 	adds	lr, r0, ip
    fdf0:	e0a22002 	adc	r2, r2, r2
    fdf4:	e151000e 	cmp	r1, lr
    fdf8:	e0d33002 	sbcs	r3, r3, r2
    fdfc:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fe00:	eafffff6 	b	fde0 <Xil_MemCpyFrom64To32Addr+0x44>

0000fe04 <Xil_MemCpyFrom32To64Addr>:
    fe04:	e3530000 	cmp	r3, #0
    fe08:	012fff1e 	bxeq	lr
    fe0c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    fe10:	e3a0e000 	mov	lr, #0
    fe14:	e15e0001 	cmp	lr, r1
    fe18:	01520000 	cmpeq	r2, r0
    fe1c:	e1a0c002 	mov	ip, r2
    fe20:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
    fe24:	e1520000 	cmp	r2, r0
    fe28:	e0de2001 	sbcs	r2, lr, r1
    fe2c:	2a000008 	bcs	fe54 <Xil_MemCpyFrom32To64Addr+0x50>
    fe30:	e09c2003 	adds	r2, ip, r3
    fe34:	e0aee00e 	adc	lr, lr, lr
    fe38:	e1500002 	cmp	r0, r2
    fe3c:	e0d1100e 	sbcs	r1, r1, lr
    fe40:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fe44:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    fe48:	e1a02003 	mov	r2, r3
    fe4c:	e1a0100c 	mov	r1, ip
    fe50:	ea00037d 	b	10c4c <Xil_MemCpy>
    fe54:	e0902003 	adds	r2, r0, r3
    fe58:	e2a11000 	adc	r1, r1, #0
    fe5c:	e15c0002 	cmp	ip, r2
    fe60:	e0dee001 	sbcs	lr, lr, r1
    fe64:	349df004 	popcc	{pc}		; (ldrcc pc, [sp], #4)
    fe68:	eafffff5 	b	fe44 <Xil_MemCpyFrom32To64Addr+0x40>

0000fe6c <Xil_ExceptionNullHandler>:
    fe6c:	eafffffe 	b	fe6c <Xil_ExceptionNullHandler>

0000fe70 <Xil_DataAbortHandler>:
    fe70:	eafffffe 	b	fe70 <Xil_DataAbortHandler>

0000fe74 <Xil_PrefetchAbortHandler>:
    fe74:	eafffffe 	b	fe74 <Xil_PrefetchAbortHandler>

0000fe78 <Xil_UndefinedExceptionHandler>:
    fe78:	eafffffe 	b	fe78 <Xil_UndefinedExceptionHandler>

0000fe7c <Xil_ExceptionInit>:
    fe7c:	e12fff1e 	bx	lr

0000fe80 <Xil_ExceptionRegisterHandler>:
    fe80:	e3043314 	movw	r3, #17172	; 0x4314
    fe84:	e3403001 	movt	r3, #1
    fe88:	e083c180 	add	ip, r3, r0, lsl #3
    fe8c:	e7831180 	str	r1, [r3, r0, lsl #3]
    fe90:	e58c2004 	str	r2, [ip, #4]
    fe94:	e12fff1e 	bx	lr

0000fe98 <Xil_GetExceptionRegisterHandler>:
    fe98:	e3043314 	movw	r3, #17172	; 0x4314
    fe9c:	e3403001 	movt	r3, #1
    fea0:	e793c180 	ldr	ip, [r3, r0, lsl #3]
    fea4:	e0833180 	add	r3, r3, r0, lsl #3
    fea8:	e581c000 	str	ip, [r1]
    feac:	e5933004 	ldr	r3, [r3, #4]
    feb0:	e5823000 	str	r3, [r2]
    feb4:	e12fff1e 	bx	lr

0000feb8 <Xil_ExceptionRemoveHandler>:
    feb8:	e3043314 	movw	r3, #17172	; 0x4314
    febc:	e30f2e6c 	movw	r2, #65132	; 0xfe6c
    fec0:	e3403001 	movt	r3, #1
    fec4:	e3402000 	movt	r2, #0
    fec8:	e0831180 	add	r1, r3, r0, lsl #3
    fecc:	e3a0c000 	mov	ip, #0
    fed0:	e7832180 	str	r2, [r3, r0, lsl #3]
    fed4:	e581c004 	str	ip, [r1, #4]
    fed8:	e12fff1e 	bx	lr
    fedc:	0001d040 	.word	0x0001d040
    fee0:	0001d040 	.word	0x0001d040
    fee4:	0001d040 	.word	0x0001d040
    fee8:	0001f634 	.word	0x0001f634
    feec:	ffff6000 	.word	0xffff6000

0000fef0 <_start>:
    fef0:	eb0003a3 	bl	10d84 <__cpu_init>
    fef4:	e3a00000 	mov	r0, #0
    fef8:	e51f1024 	ldr	r1, [pc, #-36]	; fedc <Xil_ExceptionRemoveHandler+0x24>
    fefc:	e51f2024 	ldr	r2, [pc, #-36]	; fee0 <Xil_ExceptionRemoveHandler+0x28>
    ff00:	e1510002 	cmp	r1, r2
    ff04:	aa000001 	bge	ff10 <_start+0x20>
    ff08:	e4810004 	str	r0, [r1], #4
    ff0c:	eafffffb 	b	ff00 <_start+0x10>
    ff10:	e51f1034 	ldr	r1, [pc, #-52]	; fee4 <Xil_ExceptionRemoveHandler+0x2c>
    ff14:	e51f2034 	ldr	r2, [pc, #-52]	; fee8 <Xil_ExceptionRemoveHandler+0x30>
    ff18:	e1510002 	cmp	r1, r2
    ff1c:	aa000001 	bge	ff28 <_start+0x38>
    ff20:	e4810004 	str	r0, [r1], #4
    ff24:	eafffffb 	b	ff18 <_start+0x28>
    ff28:	e51fd044 	ldr	sp, [pc, #-68]	; feec <Xil_ExceptionRemoveHandler+0x34>
    ff2c:	e3a00000 	mov	r0, #0
    ff30:	e3a01000 	mov	r1, #0
    ff34:	fa000569 	blx	114e0 <__libc_init_array>
    ff38:	e3a00000 	mov	r0, #0
    ff3c:	e3a01000 	mov	r1, #0
    ff40:	ebffc5f0 	bl	1708 <main>
    ff44:	fa00057b 	blx	11538 <__libc_fini_array>
    ff48:	fa000489 	blx	11174 <exit>
    ff4c:	eafffffe 	b	ff4c <_start+0x5c>

0000ff50 <Xil_DCacheInvalidateLine>:
    ff50:	e10f3000 	mrs	r3, CPSR
    ff54:	e38320c0 	orr	r2, r3, #192	; 0xc0
    ff58:	e129f002 	msr	CPSR_fc, r2
    ff5c:	e3a02a02 	mov	r2, #8192	; 0x2000
    ff60:	e34f28f0 	movt	r2, #63728	; 0xf8f0
    ff64:	e5820770 	str	r0, [r2, #1904]	; 0x770
    ff68:	f57ff04f 	dsb	sy
    ff6c:	e3a02000 	mov	r2, #0
    ff70:	ee402f10 	mcr	15, 2, r2, cr0, cr0, {0}
    ff74:	e3c0001f 	bic	r0, r0, #31
    ff78:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
    ff7c:	f57ff04f 	dsb	sy
    ff80:	e129f003 	msr	CPSR_fc, r3
    ff84:	e12fff1e 	bx	lr

0000ff88 <Xil_DCacheInvalidateRange>:
    ff88:	e92d4010 	push	{r4, lr}
    ff8c:	e10fe000 	mrs	lr, CPSR
    ff90:	e38e30c0 	orr	r3, lr, #192	; 0xc0
    ff94:	e129f003 	msr	CPSR_fc, r3
    ff98:	e3510000 	cmp	r1, #0
    ff9c:	0a000038 	beq	10084 <Xil_DCacheInvalidateRange+0xfc>
    ffa0:	e0902001 	adds	r2, r0, r1
    ffa4:	2a00001b 	bcs	10018 <Xil_DCacheInvalidateRange+0x90>
    ffa8:	e310001f 	tst	r0, #31
    ffac:	e202c01f 	and	ip, r2, #31
    ffb0:	1a00001d 	bne	1002c <Xil_DCacheInvalidateRange+0xa4>
    ffb4:	e35c0000 	cmp	ip, #0
    ffb8:	1a00003c 	bne	100b0 <Xil_DCacheInvalidateRange+0x128>
    ffbc:	e1520000 	cmp	r2, r0
    ffc0:	da00002e 	ble	10080 <Xil_DCacheInvalidateRange+0xf8>
    ffc4:	e3a01a02 	mov	r1, #8192	; 0x2000
    ffc8:	e1a03000 	mov	r3, r0
    ffcc:	e34f18f0 	movt	r1, #63728	; 0xf8f0
    ffd0:	e3a0c000 	mov	ip, #0
    ffd4:	e3730021 	cmn	r3, #33	; 0x21
    ffd8:	e5813770 	str	r3, [r1, #1904]	; 0x770
    ffdc:	e2833020 	add	r3, r3, #32
    ffe0:	83e03000 	mvnhi	r3, #0
    ffe4:	e1520003 	cmp	r2, r3
    ffe8:	e581c730 	str	ip, [r1, #1840]	; 0x730
    ffec:	cafffff8 	bgt	ffd4 <Xil_DCacheInvalidateRange+0x4c>
    fff0:	e1500002 	cmp	r0, r2
    fff4:	aa000021 	bge	10080 <Xil_DCacheInvalidateRange+0xf8>
    fff8:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
    fffc:	e3700021 	cmn	r0, #33	; 0x21
   10000:	9a000021 	bls	1008c <Xil_DCacheInvalidateRange+0x104>
   10004:	e3520000 	cmp	r2, #0
   10008:	ba00001c 	blt	10080 <Xil_DCacheInvalidateRange+0xf8>
   1000c:	e3e03000 	mvn	r3, #0
   10010:	ee073f36 	mcr	15, 0, r3, cr7, cr6, {1}
   10014:	eafffffd 	b	10010 <Xil_DCacheInvalidateRange+0x88>
   10018:	e310001f 	tst	r0, #31
   1001c:	03e02000 	mvneq	r2, #0
   10020:	0a000022 	beq	100b0 <Xil_DCacheInvalidateRange+0x128>
   10024:	e3a0c01f 	mov	ip, #31
   10028:	e3e02000 	mvn	r2, #0
   1002c:	e3c0101f 	bic	r1, r0, #31
   10030:	e3a00000 	mov	r0, #0
   10034:	ee400f10 	mcr	15, 2, r0, cr0, cr0, {0}
   10038:	ee071f3e 	mcr	15, 0, r1, cr7, cr14, {1}
   1003c:	f57ff04f 	dsb	sy
   10040:	e3a03a02 	mov	r3, #8192	; 0x2000
   10044:	e3710020 	cmn	r1, #32
   10048:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1004c:	e3a04003 	mov	r4, #3
   10050:	e5834f40 	str	r4, [r3, #3904]	; 0xf40
   10054:	e58317b0 	str	r1, [r3, #1968]	; 0x7b0
   10058:	e5831770 	str	r1, [r3, #1904]	; 0x770
   1005c:	e5830730 	str	r0, [r3, #1840]	; 0x730
   10060:	e5830f40 	str	r0, [r3, #3904]	; 0xf40
   10064:	e5830730 	str	r0, [r3, #1840]	; 0x730
   10068:	1a000009 	bne	10094 <Xil_DCacheInvalidateRange+0x10c>
   1006c:	e35c0000 	cmp	ip, #0
   10070:	0a000002 	beq	10080 <Xil_DCacheInvalidateRange+0xf8>
   10074:	e3c2c01f 	bic	ip, r2, #31
   10078:	e37c0020 	cmn	ip, #32
   1007c:	1a00001d 	bne	100f8 <Xil_DCacheInvalidateRange+0x170>
   10080:	f57ff04f 	dsb	sy
   10084:	e129f00e 	msr	CPSR_fc, lr
   10088:	e8bd8010 	pop	{r4, pc}
   1008c:	e2800020 	add	r0, r0, #32
   10090:	eaffffd6 	b	fff0 <Xil_DCacheInvalidateRange+0x68>
   10094:	e15c0000 	cmp	ip, r0
   10098:	e2810020 	add	r0, r1, #32
   1009c:	0affffc6 	beq	ffbc <Xil_DCacheInvalidateRange+0x34>
   100a0:	e3c2c01f 	bic	ip, r2, #31
   100a4:	e151000c 	cmp	r1, ip
   100a8:	0affffc3 	beq	ffbc <Xil_DCacheInvalidateRange+0x34>
   100ac:	ea000000 	b	100b4 <Xil_DCacheInvalidateRange+0x12c>
   100b0:	e3c2c01f 	bic	ip, r2, #31
   100b4:	e3a01000 	mov	r1, #0
   100b8:	ee401f10 	mcr	15, 2, r1, cr0, cr0, {0}
   100bc:	ee07cf3e 	mcr	15, 0, ip, cr7, cr14, {1}
   100c0:	f57ff04f 	dsb	sy
   100c4:	e3a03a02 	mov	r3, #8192	; 0x2000
   100c8:	e352001f 	cmp	r2, #31
   100cc:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   100d0:	e3a04003 	mov	r4, #3
   100d4:	e5834f40 	str	r4, [r3, #3904]	; 0xf40
   100d8:	82422020 	subhi	r2, r2, #32
   100dc:	e583c7b0 	str	ip, [r3, #1968]	; 0x7b0
   100e0:	91a02001 	movls	r2, r1
   100e4:	e583c770 	str	ip, [r3, #1904]	; 0x770
   100e8:	e5831730 	str	r1, [r3, #1840]	; 0x730
   100ec:	e5831f40 	str	r1, [r3, #3904]	; 0xf40
   100f0:	e5831730 	str	r1, [r3, #1840]	; 0x730
   100f4:	eaffffb0 	b	ffbc <Xil_DCacheInvalidateRange+0x34>
   100f8:	e1a00002 	mov	r0, r2
   100fc:	eaffffec 	b	100b4 <Xil_DCacheInvalidateRange+0x12c>

00010100 <Xil_DCacheFlushLine>:
   10100:	e10f1000 	mrs	r1, CPSR
   10104:	e38130c0 	orr	r3, r1, #192	; 0xc0
   10108:	e129f003 	msr	CPSR_fc, r3
   1010c:	e3a02000 	mov	r2, #0
   10110:	ee402f10 	mcr	15, 2, r2, cr0, cr0, {0}
   10114:	e3c0301f 	bic	r3, r0, #31
   10118:	ee073f3e 	mcr	15, 0, r3, cr7, cr14, {1}
   1011c:	f57ff04f 	dsb	sy
   10120:	e3a03a02 	mov	r3, #8192	; 0x2000
   10124:	e3a0c003 	mov	ip, #3
   10128:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1012c:	e583cf40 	str	ip, [r3, #3904]	; 0xf40
   10130:	e58307b0 	str	r0, [r3, #1968]	; 0x7b0
   10134:	e5830770 	str	r0, [r3, #1904]	; 0x770
   10138:	e5832730 	str	r2, [r3, #1840]	; 0x730
   1013c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10140:	e129f001 	msr	CPSR_fc, r1
   10144:	e12fff1e 	bx	lr

00010148 <Xil_DCacheFlushRange>:
   10148:	e10fc000 	mrs	ip, CPSR
   1014c:	e38c30c0 	orr	r3, ip, #192	; 0xc0
   10150:	e129f003 	msr	CPSR_fc, r3
   10154:	e3510000 	cmp	r1, #0
   10158:	0a000029 	beq	10204 <Xil_DCacheFlushRange+0xbc>
   1015c:	e0901001 	adds	r1, r0, r1
   10160:	e3c0001f 	bic	r0, r0, #31
   10164:	2a000028 	bcs	1020c <Xil_DCacheFlushRange+0xc4>
   10168:	e1510000 	cmp	r1, r0
   1016c:	e1a02001 	mov	r2, r1
   10170:	9a000035 	bls	1024c <Xil_DCacheFlushRange+0x104>
   10174:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
   10178:	e3700020 	cmn	r0, #32
   1017c:	0a000038 	beq	10264 <Xil_DCacheFlushRange+0x11c>
   10180:	e1a03000 	mov	r3, r0
   10184:	ea000002 	b	10194 <Xil_DCacheFlushRange+0x4c>
   10188:	ee073f3e 	mcr	15, 0, r3, cr7, cr14, {1}
   1018c:	e3730021 	cmn	r3, #33	; 0x21
   10190:	8a000002 	bhi	101a0 <Xil_DCacheFlushRange+0x58>
   10194:	e2833020 	add	r3, r3, #32
   10198:	e1530002 	cmp	r3, r2
   1019c:	3afffff9 	bcc	10188 <Xil_DCacheFlushRange+0x40>
   101a0:	f57ff04f 	dsb	sy
   101a4:	e3a03a02 	mov	r3, #8192	; 0x2000
   101a8:	e1500002 	cmp	r0, r2
   101ac:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   101b0:	e3a01003 	mov	r1, #3
   101b4:	e5831f40 	str	r1, [r3, #3904]	; 0xf40
   101b8:	2a00000d 	bcs	101f4 <Xil_DCacheFlushRange+0xac>
   101bc:	e3a01000 	mov	r1, #0
   101c0:	e58307f0 	str	r0, [r3, #2032]	; 0x7f0
   101c4:	e5831730 	str	r1, [r3, #1840]	; 0x730
   101c8:	e3a03a02 	mov	r3, #8192	; 0x2000
   101cc:	e3a01000 	mov	r1, #0
   101d0:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   101d4:	ea000003 	b	101e8 <Xil_DCacheFlushRange+0xa0>
   101d8:	e3700021 	cmn	r0, #33	; 0x21
   101dc:	e58307f0 	str	r0, [r3, #2032]	; 0x7f0
   101e0:	e5831730 	str	r1, [r3, #1840]	; 0x730
   101e4:	8a000002 	bhi	101f4 <Xil_DCacheFlushRange+0xac>
   101e8:	e2800020 	add	r0, r0, #32
   101ec:	e1500002 	cmp	r0, r2
   101f0:	3afffff8 	bcc	101d8 <Xil_DCacheFlushRange+0x90>
   101f4:	e3a03a02 	mov	r3, #8192	; 0x2000
   101f8:	e3a02000 	mov	r2, #0
   101fc:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10200:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10204:	e129f00c 	msr	CPSR_fc, ip
   10208:	e12fff1e 	bx	lr
   1020c:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
   10210:	e3700020 	cmn	r0, #32
   10214:	13e02000 	mvnne	r2, #0
   10218:	1affffd8 	bne	10180 <Xil_DCacheFlushRange+0x38>
   1021c:	f57ff04f 	dsb	sy
   10220:	e3a03a02 	mov	r3, #8192	; 0x2000
   10224:	e3a02003 	mov	r2, #3
   10228:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1022c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10230:	e3a03a02 	mov	r3, #8192	; 0x2000
   10234:	e3e0101f 	mvn	r1, #31
   10238:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1023c:	e3a02000 	mov	r2, #0
   10240:	e58317f0 	str	r1, [r3, #2032]	; 0x7f0
   10244:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10248:	eaffffe9 	b	101f4 <Xil_DCacheFlushRange+0xac>
   1024c:	f57ff04f 	dsb	sy
   10250:	e3a03a02 	mov	r3, #8192	; 0x2000
   10254:	e3a02003 	mov	r2, #3
   10258:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1025c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10260:	eaffffe3 	b	101f4 <Xil_DCacheFlushRange+0xac>
   10264:	f57ff04f 	dsb	sy
   10268:	e3a03a02 	mov	r3, #8192	; 0x2000
   1026c:	e3710020 	cmn	r1, #32
   10270:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10274:	e3a02003 	mov	r2, #3
   10278:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   1027c:	8affffeb 	bhi	10230 <Xil_DCacheFlushRange+0xe8>
   10280:	eaffffdb 	b	101f4 <Xil_DCacheFlushRange+0xac>

00010284 <Xil_DCacheStoreLine>:
   10284:	e10f2000 	mrs	r2, CPSR
   10288:	e38230c0 	orr	r3, r2, #192	; 0xc0
   1028c:	e129f003 	msr	CPSR_fc, r3
   10290:	e3a01000 	mov	r1, #0
   10294:	ee401f10 	mcr	15, 2, r1, cr0, cr0, {0}
   10298:	e3c0301f 	bic	r3, r0, #31
   1029c:	ee073f3a 	mcr	15, 0, r3, cr7, cr10, {1}
   102a0:	f57ff04f 	dsb	sy
   102a4:	e3a03a02 	mov	r3, #8192	; 0x2000
   102a8:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   102ac:	e58307b0 	str	r0, [r3, #1968]	; 0x7b0
   102b0:	e5831730 	str	r1, [r3, #1840]	; 0x730
   102b4:	e129f002 	msr	CPSR_fc, r2
   102b8:	e12fff1e 	bx	lr

000102bc <Xil_ICacheDisable>:
   102bc:	e3a02a02 	mov	r2, #8192	; 0x2000
   102c0:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   102c4:	e5923100 	ldr	r3, [r2, #256]	; 0x100
   102c8:	e3130001 	tst	r3, #1
   102cc:	1a000006 	bne	102ec <Xil_ICacheDisable+0x30>
   102d0:	f57ff04f 	dsb	sy
   102d4:	e3a03000 	mov	r3, #0
   102d8:	ee073f15 	mcr	15, 0, r3, cr7, cr5, {0}
   102dc:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   102e0:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
   102e4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   102e8:	e12fff1e 	bx	lr
   102ec:	e3a01003 	mov	r1, #3
   102f0:	e30f3fff 	movw	r3, #65535	; 0xffff
   102f4:	e5821f40 	str	r1, [r2, #3904]	; 0xf40
   102f8:	e58237fc 	str	r3, [r2, #2044]	; 0x7fc
   102fc:	e59237fc 	ldr	r3, [r2, #2044]	; 0x7fc
   10300:	e6ff3073 	uxth	r3, r3
   10304:	e3530000 	cmp	r3, #0
   10308:	1afffffb 	bne	102fc <Xil_ICacheDisable+0x40>
   1030c:	e3a03a02 	mov	r3, #8192	; 0x2000
   10310:	e3a02000 	mov	r2, #0
   10314:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10318:	e5832730 	str	r2, [r3, #1840]	; 0x730
   1031c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10320:	f57ff04f 	dsb	sy
   10324:	e5932100 	ldr	r2, [r3, #256]	; 0x100
   10328:	e3c22001 	bic	r2, r2, #1
   1032c:	e5832100 	str	r2, [r3, #256]	; 0x100
   10330:	f57ff04f 	dsb	sy
   10334:	eaffffe5 	b	102d0 <Xil_ICacheDisable+0x14>

00010338 <Xil_ICacheInvalidateLine>:
   10338:	e10f3000 	mrs	r3, CPSR
   1033c:	e38320c0 	orr	r2, r3, #192	; 0xc0
   10340:	e129f002 	msr	CPSR_fc, r2
   10344:	e3a02a02 	mov	r2, #8192	; 0x2000
   10348:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   1034c:	e5820770 	str	r0, [r2, #1904]	; 0x770
   10350:	f57ff04f 	dsb	sy
   10354:	e3a02001 	mov	r2, #1
   10358:	ee402f10 	mcr	15, 2, r2, cr0, cr0, {0}
   1035c:	e3c0001f 	bic	r0, r0, #31
   10360:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   10364:	f57ff04f 	dsb	sy
   10368:	e129f003 	msr	CPSR_fc, r3
   1036c:	e12fff1e 	bx	lr

00010370 <Xil_ICacheInvalidateRange>:
   10370:	e10fc000 	mrs	ip, CPSR
   10374:	e38c30c0 	orr	r3, ip, #192	; 0xc0
   10378:	e129f003 	msr	CPSR_fc, r3
   1037c:	e3510000 	cmp	r1, #0
   10380:	0a000016 	beq	103e0 <Xil_ICacheInvalidateRange+0x70>
   10384:	e0901001 	adds	r1, r0, r1
   10388:	e3c0001f 	bic	r0, r0, #31
   1038c:	2a000015 	bcs	103e8 <Xil_ICacheInvalidateRange+0x78>
   10390:	e1500001 	cmp	r0, r1
   10394:	2a000010 	bcs	103dc <Xil_ICacheInvalidateRange+0x6c>
   10398:	e3a03a02 	mov	r3, #8192	; 0x2000
   1039c:	e3a02000 	mov	r2, #0
   103a0:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   103a4:	e5830770 	str	r0, [r3, #1904]	; 0x770
   103a8:	e5832730 	str	r2, [r3, #1840]	; 0x730
   103ac:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   103b0:	e3700020 	cmn	r0, #32
   103b4:	1a000005 	bne	103d0 <Xil_ICacheInvalidateRange+0x60>
   103b8:	ea000007 	b	103dc <Xil_ICacheInvalidateRange+0x6c>
   103bc:	e5830770 	str	r0, [r3, #1904]	; 0x770
   103c0:	e5832730 	str	r2, [r3, #1840]	; 0x730
   103c4:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   103c8:	e3700021 	cmn	r0, #33	; 0x21
   103cc:	8a000002 	bhi	103dc <Xil_ICacheInvalidateRange+0x6c>
   103d0:	e2800020 	add	r0, r0, #32
   103d4:	e1500001 	cmp	r0, r1
   103d8:	3afffff7 	bcc	103bc <Xil_ICacheInvalidateRange+0x4c>
   103dc:	f57ff04f 	dsb	sy
   103e0:	e129f00c 	msr	CPSR_fc, ip
   103e4:	e12fff1e 	bx	lr
   103e8:	e3e01000 	mvn	r1, #0
   103ec:	eaffffe9 	b	10398 <Xil_ICacheInvalidateRange+0x28>

000103f0 <Xil_L1DCacheInvalidate>:
   103f0:	e92d4070 	push	{r4, r5, r6, lr}
   103f4:	e10f5000 	mrs	r5, CPSR
   103f8:	e38530c0 	orr	r3, r5, #192	; 0xc0
   103fc:	e129f003 	msr	CPSR_fc, r3
   10400:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   10404:	e3130004 	tst	r3, #4
   10408:	1a00001d 	bne	10484 <Xil_L1DCacheInvalidate+0x94>
   1040c:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
   10410:	e7e806d3 	ubfx	r0, r3, #13, #9
   10414:	e7e641d3 	ubfx	r4, r3, #3, #7
   10418:	e2800001 	add	r0, r0, #1
   1041c:	e2033007 	and	r3, r3, #7
   10420:	e2836004 	add	r6, r3, #4
   10424:	e1a00380 	lsl	r0, r0, #7
   10428:	e2841001 	add	r1, r4, #1
   1042c:	fa000263 	blx	10dc0 <__udivsi3>
   10430:	e1b0c630 	lsrs	ip, r0, r6
   10434:	e3a0e001 	mov	lr, #1
   10438:	e1a0e61e 	lsl	lr, lr, r6
   1043c:	0a00000d 	beq	10478 <Xil_L1DCacheInvalidate+0x88>
   10440:	e3a06000 	mov	r6, #0
   10444:	e1a00006 	mov	r0, r6
   10448:	e3a03000 	mov	r3, #0
   1044c:	e1a02003 	mov	r2, r3
   10450:	e1801002 	orr	r1, r0, r2
   10454:	ee071f56 	mcr	15, 0, r1, cr7, cr6, {2}
   10458:	e2833001 	add	r3, r3, #1
   1045c:	e082200e 	add	r2, r2, lr
   10460:	e15c0003 	cmp	ip, r3
   10464:	1afffff9 	bne	10450 <Xil_L1DCacheInvalidate+0x60>
   10468:	e1560004 	cmp	r6, r4
   1046c:	e2866001 	add	r6, r6, #1
   10470:	11a00f06 	lslne	r0, r6, #30
   10474:	1afffff3 	bne	10448 <Xil_L1DCacheInvalidate+0x58>
   10478:	f57ff04f 	dsb	sy
   1047c:	e129f005 	msr	CPSR_fc, r5
   10480:	e8bd8070 	pop	{r4, r5, r6, pc}
   10484:	e30d1400 	movw	r1, #54272	; 0xd400
   10488:	e3000000 	movw	r0, #0
   1048c:	e34f0fff 	movt	r0, #65535	; 0xffff
   10490:	e34f1fff 	movt	r1, #65535	; 0xffff
   10494:	e0411000 	sub	r1, r1, r0
   10498:	ebffff2a 	bl	10148 <Xil_DCacheFlushRange>
   1049c:	eaffffda 	b	1040c <Xil_L1DCacheInvalidate+0x1c>

000104a0 <Xil_L1DCacheEnable>:
   104a0:	e92d4010 	push	{r4, lr}
   104a4:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
   104a8:	e3140004 	tst	r4, #4
   104ac:	18bd8010 	popne	{r4, pc}
   104b0:	e3844004 	orr	r4, r4, #4
   104b4:	ebffffcd 	bl	103f0 <Xil_L1DCacheInvalidate>
   104b8:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
   104bc:	e8bd8010 	pop	{r4, pc}

000104c0 <Xil_L1DCacheInvalidateLine>:
   104c0:	e3a03000 	mov	r3, #0
   104c4:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   104c8:	e3c0001f 	bic	r0, r0, #31
   104cc:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
   104d0:	f57ff04f 	dsb	sy
   104d4:	e12fff1e 	bx	lr

000104d8 <Xil_L1DCacheInvalidateRange>:
   104d8:	e10f3000 	mrs	r3, CPSR
   104dc:	e38320c0 	orr	r2, r3, #192	; 0xc0
   104e0:	e129f002 	msr	CPSR_fc, r2
   104e4:	e3510000 	cmp	r1, #0
   104e8:	0a00000f 	beq	1052c <Xil_L1DCacheInvalidateRange+0x54>
   104ec:	e0901001 	adds	r1, r0, r1
   104f0:	e3c0001f 	bic	r0, r0, #31
   104f4:	2a00000e 	bcs	10534 <Xil_L1DCacheInvalidateRange+0x5c>
   104f8:	e1500001 	cmp	r0, r1
   104fc:	2a000009 	bcs	10528 <Xil_L1DCacheInvalidateRange+0x50>
   10500:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
   10504:	e3700020 	cmn	r0, #32
   10508:	1a000003 	bne	1051c <Xil_L1DCacheInvalidateRange+0x44>
   1050c:	ea000005 	b	10528 <Xil_L1DCacheInvalidateRange+0x50>
   10510:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
   10514:	e3700021 	cmn	r0, #33	; 0x21
   10518:	8a000002 	bhi	10528 <Xil_L1DCacheInvalidateRange+0x50>
   1051c:	e2800020 	add	r0, r0, #32
   10520:	e1500001 	cmp	r0, r1
   10524:	3afffff9 	bcc	10510 <Xil_L1DCacheInvalidateRange+0x38>
   10528:	f57ff04f 	dsb	sy
   1052c:	e129f003 	msr	CPSR_fc, r3
   10530:	e12fff1e 	bx	lr
   10534:	e3e01000 	mvn	r1, #0
   10538:	eafffff0 	b	10500 <Xil_L1DCacheInvalidateRange+0x28>

0001053c <Xil_L1DCacheFlush>:
   1053c:	e92d4070 	push	{r4, r5, r6, lr}
   10540:	e10f5000 	mrs	r5, CPSR
   10544:	e38530c0 	orr	r3, r5, #192	; 0xc0
   10548:	e129f003 	msr	CPSR_fc, r3
   1054c:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
   10550:	e7e806d3 	ubfx	r0, r3, #13, #9
   10554:	e7e641d3 	ubfx	r4, r3, #3, #7
   10558:	e2800001 	add	r0, r0, #1
   1055c:	e2033007 	and	r3, r3, #7
   10560:	e2836004 	add	r6, r3, #4
   10564:	e1a00380 	lsl	r0, r0, #7
   10568:	e2841001 	add	r1, r4, #1
   1056c:	fa000213 	blx	10dc0 <__udivsi3>
   10570:	e1b0c630 	lsrs	ip, r0, r6
   10574:	e3a0e001 	mov	lr, #1
   10578:	e1a0e61e 	lsl	lr, lr, r6
   1057c:	0a00000d 	beq	105b8 <Xil_L1DCacheFlush+0x7c>
   10580:	e3a06000 	mov	r6, #0
   10584:	e1a00006 	mov	r0, r6
   10588:	e3a03000 	mov	r3, #0
   1058c:	e1a02003 	mov	r2, r3
   10590:	e1801002 	orr	r1, r0, r2
   10594:	ee071f5e 	mcr	15, 0, r1, cr7, cr14, {2}
   10598:	e2833001 	add	r3, r3, #1
   1059c:	e082200e 	add	r2, r2, lr
   105a0:	e15c0003 	cmp	ip, r3
   105a4:	1afffff9 	bne	10590 <Xil_L1DCacheFlush+0x54>
   105a8:	e1560004 	cmp	r6, r4
   105ac:	e2866001 	add	r6, r6, #1
   105b0:	11a00f06 	lslne	r0, r6, #30
   105b4:	1afffff3 	bne	10588 <Xil_L1DCacheFlush+0x4c>
   105b8:	f57ff04f 	dsb	sy
   105bc:	e129f005 	msr	CPSR_fc, r5
   105c0:	e8bd8070 	pop	{r4, r5, r6, pc}

000105c4 <Xil_L1DCacheDisable>:
   105c4:	e92d4010 	push	{r4, lr}
   105c8:	ebffffdb 	bl	1053c <Xil_L1DCacheFlush>
   105cc:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   105d0:	e3c33004 	bic	r3, r3, #4
   105d4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   105d8:	e8bd8010 	pop	{r4, pc}

000105dc <Xil_DCacheFlush>:
   105dc:	e92d4010 	push	{r4, lr}
   105e0:	e10f4000 	mrs	r4, CPSR
   105e4:	e38430c0 	orr	r3, r4, #192	; 0xc0
   105e8:	e129f003 	msr	CPSR_fc, r3
   105ec:	ebffffd2 	bl	1053c <Xil_L1DCacheFlush>
   105f0:	e3a02a02 	mov	r2, #8192	; 0x2000
   105f4:	e3a01003 	mov	r1, #3
   105f8:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   105fc:	e30f3fff 	movw	r3, #65535	; 0xffff
   10600:	e5821f40 	str	r1, [r2, #3904]	; 0xf40
   10604:	e58237fc 	str	r3, [r2, #2044]	; 0x7fc
   10608:	e59237fc 	ldr	r3, [r2, #2044]	; 0x7fc
   1060c:	e6ff3073 	uxth	r3, r3
   10610:	e3530000 	cmp	r3, #0
   10614:	1afffffb 	bne	10608 <Xil_DCacheFlush+0x2c>
   10618:	e3a03a02 	mov	r3, #8192	; 0x2000
   1061c:	e3a02000 	mov	r2, #0
   10620:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10624:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10628:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   1062c:	f57ff04f 	dsb	sy
   10630:	e129f004 	msr	CPSR_fc, r4
   10634:	e8bd8010 	pop	{r4, pc}

00010638 <Xil_DCacheDisable>:
   10638:	e3a02a02 	mov	r2, #8192	; 0x2000
   1063c:	e92d4010 	push	{r4, lr}
   10640:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   10644:	e5923100 	ldr	r3, [r2, #256]	; 0x100
   10648:	e3130001 	tst	r3, #1
   1064c:	1a000004 	bne	10664 <Xil_DCacheDisable+0x2c>
   10650:	ebffffb9 	bl	1053c <Xil_L1DCacheFlush>
   10654:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   10658:	e3c33004 	bic	r3, r3, #4
   1065c:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   10660:	e8bd8010 	pop	{r4, pc}
   10664:	e3a01003 	mov	r1, #3
   10668:	e30f3fff 	movw	r3, #65535	; 0xffff
   1066c:	e5821f40 	str	r1, [r2, #3904]	; 0xf40
   10670:	e58237fc 	str	r3, [r2, #2044]	; 0x7fc
   10674:	e59237fc 	ldr	r3, [r2, #2044]	; 0x7fc
   10678:	e6ff3073 	uxth	r3, r3
   1067c:	e3530000 	cmp	r3, #0
   10680:	1afffffb 	bne	10674 <Xil_DCacheDisable+0x3c>
   10684:	e3a03a02 	mov	r3, #8192	; 0x2000
   10688:	e3a02000 	mov	r2, #0
   1068c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10690:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10694:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10698:	f57ff04f 	dsb	sy
   1069c:	e5932100 	ldr	r2, [r3, #256]	; 0x100
   106a0:	e3c22001 	bic	r2, r2, #1
   106a4:	e5832100 	str	r2, [r3, #256]	; 0x100
   106a8:	f57ff04f 	dsb	sy
   106ac:	eaffffe7 	b	10650 <Xil_DCacheDisable+0x18>

000106b0 <Xil_L1DCacheFlushLine>:
   106b0:	e3a03000 	mov	r3, #0
   106b4:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   106b8:	e3c0001f 	bic	r0, r0, #31
   106bc:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
   106c0:	f57ff04f 	dsb	sy
   106c4:	e12fff1e 	bx	lr

000106c8 <Xil_L1DCacheFlushRange>:
   106c8:	e10f3000 	mrs	r3, CPSR
   106cc:	e38320c0 	orr	r2, r3, #192	; 0xc0
   106d0:	e129f002 	msr	CPSR_fc, r2
   106d4:	e3510000 	cmp	r1, #0
   106d8:	0a00000f 	beq	1071c <Xil_L1DCacheFlushRange+0x54>
   106dc:	e0901001 	adds	r1, r0, r1
   106e0:	e3c0001f 	bic	r0, r0, #31
   106e4:	2a00000e 	bcs	10724 <Xil_L1DCacheFlushRange+0x5c>
   106e8:	e1500001 	cmp	r0, r1
   106ec:	2a000009 	bcs	10718 <Xil_L1DCacheFlushRange+0x50>
   106f0:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
   106f4:	e3700020 	cmn	r0, #32
   106f8:	1a000003 	bne	1070c <Xil_L1DCacheFlushRange+0x44>
   106fc:	ea000005 	b	10718 <Xil_L1DCacheFlushRange+0x50>
   10700:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
   10704:	e3700021 	cmn	r0, #33	; 0x21
   10708:	8a000002 	bhi	10718 <Xil_L1DCacheFlushRange+0x50>
   1070c:	e2800020 	add	r0, r0, #32
   10710:	e1500001 	cmp	r0, r1
   10714:	3afffff9 	bcc	10700 <Xil_L1DCacheFlushRange+0x38>
   10718:	f57ff04f 	dsb	sy
   1071c:	e129f003 	msr	CPSR_fc, r3
   10720:	e12fff1e 	bx	lr
   10724:	e3e01000 	mvn	r1, #0
   10728:	eafffff0 	b	106f0 <Xil_L1DCacheFlushRange+0x28>

0001072c <Xil_L1DCacheStoreLine>:
   1072c:	e3a03000 	mov	r3, #0
   10730:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   10734:	e3c0001f 	bic	r0, r0, #31
   10738:	ee070f3a 	mcr	15, 0, r0, cr7, cr10, {1}
   1073c:	f57ff04f 	dsb	sy
   10740:	e12fff1e 	bx	lr

00010744 <Xil_L1ICacheEnable>:
   10744:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   10748:	e2132a01 	ands	r2, r3, #4096	; 0x1000
   1074c:	112fff1e 	bxne	lr
   10750:	ee072f15 	mcr	15, 0, r2, cr7, cr5, {0}
   10754:	e3833a01 	orr	r3, r3, #4096	; 0x1000
   10758:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   1075c:	e12fff1e 	bx	lr

00010760 <Xil_L1ICacheDisable>:
   10760:	f57ff04f 	dsb	sy
   10764:	e3a03000 	mov	r3, #0
   10768:	ee073f15 	mcr	15, 0, r3, cr7, cr5, {0}
   1076c:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   10770:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
   10774:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   10778:	e12fff1e 	bx	lr

0001077c <Xil_L1ICacheInvalidate>:
   1077c:	e3a03001 	mov	r3, #1
   10780:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   10784:	e3a03000 	mov	r3, #0
   10788:	ee073f15 	mcr	15, 0, r3, cr7, cr5, {0}
   1078c:	f57ff04f 	dsb	sy
   10790:	e12fff1e 	bx	lr

00010794 <Xil_L1ICacheInvalidateLine>:
   10794:	e3a03001 	mov	r3, #1
   10798:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   1079c:	e3c0001f 	bic	r0, r0, #31
   107a0:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   107a4:	f57ff04f 	dsb	sy
   107a8:	e12fff1e 	bx	lr

000107ac <Xil_L1ICacheInvalidateRange>:
   107ac:	e10f3000 	mrs	r3, CPSR
   107b0:	e38320c0 	orr	r2, r3, #192	; 0xc0
   107b4:	e129f002 	msr	CPSR_fc, r2
   107b8:	e3510000 	cmp	r1, #0
   107bc:	0a00000f 	beq	10800 <Xil_L1ICacheInvalidateRange+0x54>
   107c0:	e0901001 	adds	r1, r0, r1
   107c4:	e3c0001f 	bic	r0, r0, #31
   107c8:	2a00000e 	bcs	10808 <Xil_L1ICacheInvalidateRange+0x5c>
   107cc:	e1500001 	cmp	r0, r1
   107d0:	2a000009 	bcs	107fc <Xil_L1ICacheInvalidateRange+0x50>
   107d4:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   107d8:	e3700020 	cmn	r0, #32
   107dc:	1a000003 	bne	107f0 <Xil_L1ICacheInvalidateRange+0x44>
   107e0:	ea000005 	b	107fc <Xil_L1ICacheInvalidateRange+0x50>
   107e4:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
   107e8:	e3700021 	cmn	r0, #33	; 0x21
   107ec:	8a000002 	bhi	107fc <Xil_L1ICacheInvalidateRange+0x50>
   107f0:	e2800020 	add	r0, r0, #32
   107f4:	e1500001 	cmp	r0, r1
   107f8:	3afffff9 	bcc	107e4 <Xil_L1ICacheInvalidateRange+0x38>
   107fc:	f57ff04f 	dsb	sy
   10800:	e129f003 	msr	CPSR_fc, r3
   10804:	e12fff1e 	bx	lr
   10808:	e3e01000 	mvn	r1, #0
   1080c:	eafffff0 	b	107d4 <Xil_L1ICacheInvalidateRange+0x28>

00010810 <Xil_L2CacheDisable>:
   10810:	e3a02a02 	mov	r2, #8192	; 0x2000
   10814:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   10818:	e5923100 	ldr	r3, [r2, #256]	; 0x100
   1081c:	e3130001 	tst	r3, #1
   10820:	012fff1e 	bxeq	lr
   10824:	e3a01003 	mov	r1, #3
   10828:	e30f3fff 	movw	r3, #65535	; 0xffff
   1082c:	e5821f40 	str	r1, [r2, #3904]	; 0xf40
   10830:	e58237fc 	str	r3, [r2, #2044]	; 0x7fc
   10834:	e59237fc 	ldr	r3, [r2, #2044]	; 0x7fc
   10838:	e6ff3073 	uxth	r3, r3
   1083c:	e3530000 	cmp	r3, #0
   10840:	1afffffb 	bne	10834 <Xil_L2CacheDisable+0x24>
   10844:	e3a03a02 	mov	r3, #8192	; 0x2000
   10848:	e3a02000 	mov	r2, #0
   1084c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10850:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10854:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10858:	f57ff04f 	dsb	sy
   1085c:	e5932100 	ldr	r2, [r3, #256]	; 0x100
   10860:	e3c22001 	bic	r2, r2, #1
   10864:	e5832100 	str	r2, [r3, #256]	; 0x100
   10868:	f57ff04f 	dsb	sy
   1086c:	e12fff1e 	bx	lr

00010870 <Xil_L2CacheInvalidate>:
   10870:	e3a03a02 	mov	r3, #8192	; 0x2000
   10874:	e92d4010 	push	{r4, lr}
   10878:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   1087c:	e5933100 	ldr	r3, [r3, #256]	; 0x100
   10880:	e3130001 	tst	r3, #1
   10884:	1a00000d 	bne	108c0 <Xil_L2CacheInvalidate+0x50>
   10888:	e3a02a02 	mov	r2, #8192	; 0x2000
   1088c:	e30f3fff 	movw	r3, #65535	; 0xffff
   10890:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   10894:	e582377c 	str	r3, [r2, #1916]	; 0x77c
   10898:	e592377c 	ldr	r3, [r2, #1916]	; 0x77c
   1089c:	e6ff3073 	uxth	r3, r3
   108a0:	e3530000 	cmp	r3, #0
   108a4:	1afffffb 	bne	10898 <Xil_L2CacheInvalidate+0x28>
   108a8:	e3a03a02 	mov	r3, #8192	; 0x2000
   108ac:	e3a02000 	mov	r2, #0
   108b0:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   108b4:	e5832730 	str	r2, [r3, #1840]	; 0x730
   108b8:	f57ff04f 	dsb	sy
   108bc:	e8bd8010 	pop	{r4, pc}
   108c0:	e30d1400 	movw	r1, #54272	; 0xd400
   108c4:	e3000000 	movw	r0, #0
   108c8:	e34f0fff 	movt	r0, #65535	; 0xffff
   108cc:	e34f1fff 	movt	r1, #65535	; 0xffff
   108d0:	e0411000 	sub	r1, r1, r0
   108d4:	ebfffe1b 	bl	10148 <Xil_DCacheFlushRange>
   108d8:	eaffffea 	b	10888 <Xil_L2CacheInvalidate+0x18>

000108dc <Xil_DCacheInvalidate>:
   108dc:	e92d4010 	push	{r4, lr}
   108e0:	e10f4000 	mrs	r4, CPSR
   108e4:	e38430c0 	orr	r3, r4, #192	; 0xc0
   108e8:	e129f003 	msr	CPSR_fc, r3
   108ec:	ebffffdf 	bl	10870 <Xil_L2CacheInvalidate>
   108f0:	ebfffebe 	bl	103f0 <Xil_L1DCacheInvalidate>
   108f4:	e129f004 	msr	CPSR_fc, r4
   108f8:	e8bd8010 	pop	{r4, pc}

000108fc <Xil_ICacheInvalidate>:
   108fc:	e92d4010 	push	{r4, lr}
   10900:	e10f4000 	mrs	r4, CPSR
   10904:	e38430c0 	orr	r3, r4, #192	; 0xc0
   10908:	e129f003 	msr	CPSR_fc, r3
   1090c:	ebffffd7 	bl	10870 <Xil_L2CacheInvalidate>
   10910:	e3a03001 	mov	r3, #1
   10914:	ee403f10 	mcr	15, 2, r3, cr0, cr0, {0}
   10918:	e3a03000 	mov	r3, #0
   1091c:	ee073f15 	mcr	15, 0, r3, cr7, cr5, {0}
   10920:	f57ff04f 	dsb	sy
   10924:	e129f004 	msr	CPSR_fc, r4
   10928:	e8bd8010 	pop	{r4, pc}

0001092c <Xil_L2CacheEnable>:
   1092c:	e92d4070 	push	{r4, r5, r6, lr}
   10930:	e3a04a02 	mov	r4, #8192	; 0x2000
   10934:	e34f48f0 	movt	r4, #63728	; 0xf8f0
   10938:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   1093c:	e2135001 	ands	r5, r3, #1
   10940:	18bd8070 	popne	{r4, r5, r6, pc}
   10944:	e5943104 	ldr	r3, [r4, #260]	; 0x104
   10948:	e3001111 	movw	r1, #273	; 0x111
   1094c:	e3002121 	movw	r2, #289	; 0x121
   10950:	e3c3380e 	bic	r3, r3, #917504	; 0xe0000
   10954:	e3833472 	orr	r3, r3, #1912602624	; 0x72000000
   10958:	e3833836 	orr	r3, r3, #3538944	; 0x360000
   1095c:	e5843104 	str	r3, [r4, #260]	; 0x104
   10960:	e5841108 	str	r1, [r4, #264]	; 0x108
   10964:	e584210c 	str	r2, [r4, #268]	; 0x10c
   10968:	e594321c 	ldr	r3, [r4, #540]	; 0x21c
   1096c:	e5843220 	str	r3, [r4, #544]	; 0x220
   10970:	ebffffbe 	bl	10870 <Xil_L2CacheInvalidate>
   10974:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   10978:	e3833001 	orr	r3, r3, #1
   1097c:	e5843100 	str	r3, [r4, #256]	; 0x100
   10980:	e5845730 	str	r5, [r4, #1840]	; 0x730
   10984:	f57ff04f 	dsb	sy
   10988:	e8bd8070 	pop	{r4, r5, r6, pc}

0001098c <Xil_ICacheEnable>:
   1098c:	e92d4070 	push	{r4, r5, r6, lr}
   10990:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   10994:	e2132a01 	ands	r2, r3, #4096	; 0x1000
   10998:	1a000002 	bne	109a8 <Xil_ICacheEnable+0x1c>
   1099c:	ee072f15 	mcr	15, 0, r2, cr7, cr5, {0}
   109a0:	e3833a01 	orr	r3, r3, #4096	; 0x1000
   109a4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   109a8:	e3a04a02 	mov	r4, #8192	; 0x2000
   109ac:	e34f48f0 	movt	r4, #63728	; 0xf8f0
   109b0:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   109b4:	e2135001 	ands	r5, r3, #1
   109b8:	18bd8070 	popne	{r4, r5, r6, pc}
   109bc:	e5943104 	ldr	r3, [r4, #260]	; 0x104
   109c0:	e3001111 	movw	r1, #273	; 0x111
   109c4:	e3002121 	movw	r2, #289	; 0x121
   109c8:	e3c3380e 	bic	r3, r3, #917504	; 0xe0000
   109cc:	e3833472 	orr	r3, r3, #1912602624	; 0x72000000
   109d0:	e3833836 	orr	r3, r3, #3538944	; 0x360000
   109d4:	e5843104 	str	r3, [r4, #260]	; 0x104
   109d8:	e5841108 	str	r1, [r4, #264]	; 0x108
   109dc:	e584210c 	str	r2, [r4, #268]	; 0x10c
   109e0:	e594321c 	ldr	r3, [r4, #540]	; 0x21c
   109e4:	e5843220 	str	r3, [r4, #544]	; 0x220
   109e8:	ebffffa0 	bl	10870 <Xil_L2CacheInvalidate>
   109ec:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   109f0:	e3833001 	orr	r3, r3, #1
   109f4:	e5843100 	str	r3, [r4, #256]	; 0x100
   109f8:	e5845730 	str	r5, [r4, #1840]	; 0x730
   109fc:	f57ff04f 	dsb	sy
   10a00:	e8bd8070 	pop	{r4, r5, r6, pc}

00010a04 <Xil_DCacheEnable>:
   10a04:	e92d4070 	push	{r4, r5, r6, lr}
   10a08:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
   10a0c:	e3140004 	tst	r4, #4
   10a10:	1a000002 	bne	10a20 <Xil_DCacheEnable+0x1c>
   10a14:	ebfffe75 	bl	103f0 <Xil_L1DCacheInvalidate>
   10a18:	e3844004 	orr	r4, r4, #4
   10a1c:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
   10a20:	e3a04a02 	mov	r4, #8192	; 0x2000
   10a24:	e34f48f0 	movt	r4, #63728	; 0xf8f0
   10a28:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   10a2c:	e2135001 	ands	r5, r3, #1
   10a30:	18bd8070 	popne	{r4, r5, r6, pc}
   10a34:	e5943104 	ldr	r3, [r4, #260]	; 0x104
   10a38:	e3001111 	movw	r1, #273	; 0x111
   10a3c:	e3002121 	movw	r2, #289	; 0x121
   10a40:	e3c3380e 	bic	r3, r3, #917504	; 0xe0000
   10a44:	e3833472 	orr	r3, r3, #1912602624	; 0x72000000
   10a48:	e3833836 	orr	r3, r3, #3538944	; 0x360000
   10a4c:	e5843104 	str	r3, [r4, #260]	; 0x104
   10a50:	e5841108 	str	r1, [r4, #264]	; 0x108
   10a54:	e584210c 	str	r2, [r4, #268]	; 0x10c
   10a58:	e594321c 	ldr	r3, [r4, #540]	; 0x21c
   10a5c:	e5843220 	str	r3, [r4, #544]	; 0x220
   10a60:	ebffff82 	bl	10870 <Xil_L2CacheInvalidate>
   10a64:	e5943100 	ldr	r3, [r4, #256]	; 0x100
   10a68:	e3833001 	orr	r3, r3, #1
   10a6c:	e5843100 	str	r3, [r4, #256]	; 0x100
   10a70:	e5845730 	str	r5, [r4, #1840]	; 0x730
   10a74:	f57ff04f 	dsb	sy
   10a78:	e8bd8070 	pop	{r4, r5, r6, pc}

00010a7c <Xil_L2CacheInvalidateLine>:
   10a7c:	e3a03a02 	mov	r3, #8192	; 0x2000
   10a80:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10a84:	e5830770 	str	r0, [r3, #1904]	; 0x770
   10a88:	f57ff04f 	dsb	sy
   10a8c:	e12fff1e 	bx	lr

00010a90 <Xil_L2CacheInvalidateRange>:
   10a90:	e10fc000 	mrs	ip, CPSR
   10a94:	e38c30c0 	orr	r3, ip, #192	; 0xc0
   10a98:	e129f003 	msr	CPSR_fc, r3
   10a9c:	e3510000 	cmp	r1, #0
   10aa0:	0a00001b 	beq	10b14 <Xil_L2CacheInvalidateRange+0x84>
   10aa4:	e0901001 	adds	r1, r0, r1
   10aa8:	e3a03a02 	mov	r3, #8192	; 0x2000
   10aac:	e3c0001f 	bic	r0, r0, #31
   10ab0:	2a00001a 	bcs	10b20 <Xil_L2CacheInvalidateRange+0x90>
   10ab4:	e1500001 	cmp	r0, r1
   10ab8:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10abc:	e3a02003 	mov	r2, #3
   10ac0:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10ac4:	2a00000e 	bcs	10b04 <Xil_L2CacheInvalidateRange+0x74>
   10ac8:	e3a03a02 	mov	r3, #8192	; 0x2000
   10acc:	e3700020 	cmn	r0, #32
   10ad0:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10ad4:	e3a02000 	mov	r2, #0
   10ad8:	e5830770 	str	r0, [r3, #1904]	; 0x770
   10adc:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10ae0:	1a000004 	bne	10af8 <Xil_L2CacheInvalidateRange+0x68>
   10ae4:	ea000006 	b	10b04 <Xil_L2CacheInvalidateRange+0x74>
   10ae8:	e3700021 	cmn	r0, #33	; 0x21
   10aec:	e5830770 	str	r0, [r3, #1904]	; 0x770
   10af0:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10af4:	8a000002 	bhi	10b04 <Xil_L2CacheInvalidateRange+0x74>
   10af8:	e2800020 	add	r0, r0, #32
   10afc:	e1500001 	cmp	r0, r1
   10b00:	3afffff8 	bcc	10ae8 <Xil_L2CacheInvalidateRange+0x58>
   10b04:	e3a03a02 	mov	r3, #8192	; 0x2000
   10b08:	e3a02000 	mov	r2, #0
   10b0c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10b10:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10b14:	f57ff04f 	dsb	sy
   10b18:	e129f00c 	msr	CPSR_fc, ip
   10b1c:	e12fff1e 	bx	lr
   10b20:	e3a02003 	mov	r2, #3
   10b24:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10b28:	e3e01000 	mvn	r1, #0
   10b2c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10b30:	eaffffe4 	b	10ac8 <Xil_L2CacheInvalidateRange+0x38>

00010b34 <Xil_L2CacheFlush>:
   10b34:	e3a02a02 	mov	r2, #8192	; 0x2000
   10b38:	e3a01003 	mov	r1, #3
   10b3c:	e34f28f0 	movt	r2, #63728	; 0xf8f0
   10b40:	e30f3fff 	movw	r3, #65535	; 0xffff
   10b44:	e5821f40 	str	r1, [r2, #3904]	; 0xf40
   10b48:	e58237fc 	str	r3, [r2, #2044]	; 0x7fc
   10b4c:	e59237fc 	ldr	r3, [r2, #2044]	; 0x7fc
   10b50:	e6ff3073 	uxth	r3, r3
   10b54:	e3530000 	cmp	r3, #0
   10b58:	1afffffb 	bne	10b4c <Xil_L2CacheFlush+0x18>
   10b5c:	e3a03a02 	mov	r3, #8192	; 0x2000
   10b60:	e3a02000 	mov	r2, #0
   10b64:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10b68:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10b6c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10b70:	f57ff04f 	dsb	sy
   10b74:	e12fff1e 	bx	lr

00010b78 <Xil_L2CacheFlushLine>:
   10b78:	e3a03a02 	mov	r3, #8192	; 0x2000
   10b7c:	e3a02000 	mov	r2, #0
   10b80:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10b84:	e58307b0 	str	r0, [r3, #1968]	; 0x7b0
   10b88:	e5830770 	str	r0, [r3, #1904]	; 0x770
   10b8c:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10b90:	e12fff1e 	bx	lr

00010b94 <Xil_L2CacheFlushRange>:
   10b94:	e10fc000 	mrs	ip, CPSR
   10b98:	e38c30c0 	orr	r3, ip, #192	; 0xc0
   10b9c:	e129f003 	msr	CPSR_fc, r3
   10ba0:	e3510000 	cmp	r1, #0
   10ba4:	0a00001b 	beq	10c18 <Xil_L2CacheFlushRange+0x84>
   10ba8:	e0901001 	adds	r1, r0, r1
   10bac:	e3a03a02 	mov	r3, #8192	; 0x2000
   10bb0:	e3c0001f 	bic	r0, r0, #31
   10bb4:	2a000019 	bcs	10c20 <Xil_L2CacheFlushRange+0x8c>
   10bb8:	e1500001 	cmp	r0, r1
   10bbc:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10bc0:	e3a02003 	mov	r2, #3
   10bc4:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10bc8:	2a00000e 	bcs	10c08 <Xil_L2CacheFlushRange+0x74>
   10bcc:	e3a03a02 	mov	r3, #8192	; 0x2000
   10bd0:	e3700020 	cmn	r0, #32
   10bd4:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10bd8:	e3a02000 	mov	r2, #0
   10bdc:	e58307f0 	str	r0, [r3, #2032]	; 0x7f0
   10be0:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10be4:	1a000004 	bne	10bfc <Xil_L2CacheFlushRange+0x68>
   10be8:	ea000006 	b	10c08 <Xil_L2CacheFlushRange+0x74>
   10bec:	e3700021 	cmn	r0, #33	; 0x21
   10bf0:	e58307f0 	str	r0, [r3, #2032]	; 0x7f0
   10bf4:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10bf8:	8a000002 	bhi	10c08 <Xil_L2CacheFlushRange+0x74>
   10bfc:	e2800020 	add	r0, r0, #32
   10c00:	e1500001 	cmp	r0, r1
   10c04:	3afffff8 	bcc	10bec <Xil_L2CacheFlushRange+0x58>
   10c08:	e3a03a02 	mov	r3, #8192	; 0x2000
   10c0c:	e3a02000 	mov	r2, #0
   10c10:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10c14:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10c18:	e129f00c 	msr	CPSR_fc, ip
   10c1c:	e12fff1e 	bx	lr
   10c20:	e3a02003 	mov	r2, #3
   10c24:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10c28:	e3e01000 	mvn	r1, #0
   10c2c:	e5832f40 	str	r2, [r3, #3904]	; 0xf40
   10c30:	eaffffe5 	b	10bcc <Xil_L2CacheFlushRange+0x38>

00010c34 <Xil_L2CacheStoreLine>:
   10c34:	e3a03a02 	mov	r3, #8192	; 0x2000
   10c38:	e3a02000 	mov	r2, #0
   10c3c:	e34f38f0 	movt	r3, #63728	; 0xf8f0
   10c40:	e58307b0 	str	r0, [r3, #1968]	; 0x7b0
   10c44:	e5832730 	str	r2, [r3, #1840]	; 0x730
   10c48:	e12fff1e 	bx	lr

00010c4c <Xil_MemCpy>:
   10c4c:	e180c001 	orr	ip, r0, r1
   10c50:	e3520003 	cmp	r2, #3
   10c54:	e7e1305c 	ubfx	r3, ip, #0, #2
   10c58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   10c5c:	93a0e000 	movls	lr, #0
   10c60:	83a0e001 	movhi	lr, #1
   10c64:	e3530000 	cmp	r3, #0
   10c68:	e1a03001 	mov	r3, r1
   10c6c:	13a0e000 	movne	lr, #0
   10c70:	e35e0000 	cmp	lr, #0
   10c74:	0a00000c 	beq	10cac <Xil_MemCpy+0x60>
   10c78:	e4931004 	ldr	r1, [r3], #4
   10c7c:	e2422004 	sub	r2, r2, #4
   10c80:	e3520003 	cmp	r2, #3
   10c84:	e4801004 	str	r1, [r0], #4
   10c88:	e180c003 	orr	ip, r0, r3
   10c8c:	e7e1e05c 	ubfx	lr, ip, #0, #2
   10c90:	93a01000 	movls	r1, #0
   10c94:	83a01001 	movhi	r1, #1
   10c98:	e35e0000 	cmp	lr, #0
   10c9c:	13a01000 	movne	r1, #0
   10ca0:	e3510000 	cmp	r1, #0
   10ca4:	1afffff3 	bne	10c78 <Xil_MemCpy+0x2c>
   10ca8:	e1a01003 	mov	r1, r3
   10cac:	e1e0c00c 	mvn	ip, ip
   10cb0:	e3520001 	cmp	r2, #1
   10cb4:	93a0c000 	movls	ip, #0
   10cb8:	820cc001 	andhi	ip, ip, #1
   10cbc:	e35c0000 	cmp	ip, #0
   10cc0:	0a000008 	beq	10ce8 <Xil_MemCpy+0x9c>
   10cc4:	e0d1c0b2 	ldrh	ip, [r1], #2
   10cc8:	e2422002 	sub	r2, r2, #2
   10ccc:	e3520001 	cmp	r2, #1
   10cd0:	93a03000 	movls	r3, #0
   10cd4:	83a03001 	movhi	r3, #1
   10cd8:	e0c0c0b2 	strh	ip, [r0], #2
   10cdc:	e180c001 	orr	ip, r0, r1
   10ce0:	e1d3300c 	bics	r3, r3, ip
   10ce4:	1afffff6 	bne	10cc4 <Xil_MemCpy+0x78>
   10ce8:	e3520000 	cmp	r2, #0
   10cec:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
   10cf0:	e2411001 	sub	r1, r1, #1
   10cf4:	e0802002 	add	r2, r0, r2
   10cf8:	e5f13001 	ldrb	r3, [r1, #1]!
   10cfc:	e4c03001 	strb	r3, [r0], #1
   10d00:	e1500002 	cmp	r0, r2
   10d04:	1afffffb 	bne	10cf8 <Xil_MemCpy+0xac>
   10d08:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00010d0c <FIQInterrupt>:
   10d0c:	e3043314 	movw	r3, #17172	; 0x4314
   10d10:	e3403001 	movt	r3, #1
   10d14:	e5932030 	ldr	r2, [r3, #48]	; 0x30
   10d18:	e5930034 	ldr	r0, [r3, #52]	; 0x34
   10d1c:	e12fff12 	bx	r2

00010d20 <IRQInterrupt>:
   10d20:	e3043314 	movw	r3, #17172	; 0x4314
   10d24:	e3403001 	movt	r3, #1
   10d28:	e5932028 	ldr	r2, [r3, #40]	; 0x28
   10d2c:	e593002c 	ldr	r0, [r3, #44]	; 0x2c
   10d30:	e12fff12 	bx	r2

00010d34 <UndefinedException>:
   10d34:	e3043314 	movw	r3, #17172	; 0x4314
   10d38:	e3403001 	movt	r3, #1
   10d3c:	e5932008 	ldr	r2, [r3, #8]
   10d40:	e593000c 	ldr	r0, [r3, #12]
   10d44:	e12fff12 	bx	r2

00010d48 <SWInterrupt>:
   10d48:	e3043314 	movw	r3, #17172	; 0x4314
   10d4c:	e3403001 	movt	r3, #1
   10d50:	e5932010 	ldr	r2, [r3, #16]
   10d54:	e5930014 	ldr	r0, [r3, #20]
   10d58:	e12fff12 	bx	r2

00010d5c <DataAbortInterrupt>:
   10d5c:	e3043314 	movw	r3, #17172	; 0x4314
   10d60:	e3403001 	movt	r3, #1
   10d64:	e5932020 	ldr	r2, [r3, #32]
   10d68:	e5930024 	ldr	r0, [r3, #36]	; 0x24
   10d6c:	e12fff12 	bx	r2

00010d70 <PrefetchAbortInterrupt>:
   10d70:	e3043314 	movw	r3, #17172	; 0x4314
   10d74:	e3403001 	movt	r3, #1
   10d78:	e5932018 	ldr	r2, [r3, #24]
   10d7c:	e593001c 	ldr	r0, [r3, #28]
   10d80:	e12fff12 	bx	r2

00010d84 <__cpu_init>:
   10d84:	e3a00000 	mov	r0, #0
   10d88:	ee050f10 	mcr	15, 0, r0, cr5, cr0, {0}
   10d8c:	ee050f30 	mcr	15, 0, r0, cr5, cr0, {1}
   10d90:	ee060f10 	mcr	15, 0, r0, cr6, cr0, {0}
   10d94:	ee060f50 	mcr	15, 0, r0, cr6, cr0, {2}
   10d98:	ee090f5d 	mcr	15, 0, r0, cr9, cr13, {2}
   10d9c:	ee0d0f50 	mcr	15, 0, r0, cr13, cr0, {2}
   10da0:	ee0d0f70 	mcr	15, 0, r0, cr13, cr0, {3}
   10da4:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
   10da8:	ee092f7c 	mcr	15, 0, r2, cr9, cr12, {3}
   10dac:	e3a0200d 	mov	r2, #13
   10db0:	ee092f1c 	mcr	15, 0, r2, cr9, cr12, {0}
   10db4:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
   10db8:	ee092f3c 	mcr	15, 0, r2, cr9, cr12, {1}
   10dbc:	e12fff1e 	bx	lr

00010dc0 <__udivsi3>:
   10dc0:	1e4a      	subs	r2, r1, #1
   10dc2:	bf08      	it	eq
   10dc4:	4770      	bxeq	lr
   10dc6:	f0c0 8124 	bcc.w	11012 <__udivsi3+0x252>
   10dca:	4288      	cmp	r0, r1
   10dcc:	f240 8116 	bls.w	10ffc <__udivsi3+0x23c>
   10dd0:	4211      	tst	r1, r2
   10dd2:	f000 8117 	beq.w	11004 <__udivsi3+0x244>
   10dd6:	fab0 f380 	clz	r3, r0
   10dda:	fab1 f281 	clz	r2, r1
   10dde:	eba2 0303 	sub.w	r3, r2, r3
   10de2:	f1c3 031f 	rsb	r3, r3, #31
   10de6:	a204      	add	r2, pc, #16	; (adr r2, 10df8 <__udivsi3+0x38>)
   10de8:	eb02 1303 	add.w	r3, r2, r3, lsl #4
   10dec:	f04f 0200 	mov.w	r2, #0
   10df0:	469f      	mov	pc, r3
   10df2:	bf00      	nop
   10df4:	f3af 8000 	nop.w
   10df8:	ebb0 7fc1 	cmp.w	r0, r1, lsl #31
   10dfc:	bf00      	nop
   10dfe:	eb42 0202 	adc.w	r2, r2, r2
   10e02:	bf28      	it	cs
   10e04:	eba0 70c1 	subcs.w	r0, r0, r1, lsl #31
   10e08:	ebb0 7f81 	cmp.w	r0, r1, lsl #30
   10e0c:	bf00      	nop
   10e0e:	eb42 0202 	adc.w	r2, r2, r2
   10e12:	bf28      	it	cs
   10e14:	eba0 7081 	subcs.w	r0, r0, r1, lsl #30
   10e18:	ebb0 7f41 	cmp.w	r0, r1, lsl #29
   10e1c:	bf00      	nop
   10e1e:	eb42 0202 	adc.w	r2, r2, r2
   10e22:	bf28      	it	cs
   10e24:	eba0 7041 	subcs.w	r0, r0, r1, lsl #29
   10e28:	ebb0 7f01 	cmp.w	r0, r1, lsl #28
   10e2c:	bf00      	nop
   10e2e:	eb42 0202 	adc.w	r2, r2, r2
   10e32:	bf28      	it	cs
   10e34:	eba0 7001 	subcs.w	r0, r0, r1, lsl #28
   10e38:	ebb0 6fc1 	cmp.w	r0, r1, lsl #27
   10e3c:	bf00      	nop
   10e3e:	eb42 0202 	adc.w	r2, r2, r2
   10e42:	bf28      	it	cs
   10e44:	eba0 60c1 	subcs.w	r0, r0, r1, lsl #27
   10e48:	ebb0 6f81 	cmp.w	r0, r1, lsl #26
   10e4c:	bf00      	nop
   10e4e:	eb42 0202 	adc.w	r2, r2, r2
   10e52:	bf28      	it	cs
   10e54:	eba0 6081 	subcs.w	r0, r0, r1, lsl #26
   10e58:	ebb0 6f41 	cmp.w	r0, r1, lsl #25
   10e5c:	bf00      	nop
   10e5e:	eb42 0202 	adc.w	r2, r2, r2
   10e62:	bf28      	it	cs
   10e64:	eba0 6041 	subcs.w	r0, r0, r1, lsl #25
   10e68:	ebb0 6f01 	cmp.w	r0, r1, lsl #24
   10e6c:	bf00      	nop
   10e6e:	eb42 0202 	adc.w	r2, r2, r2
   10e72:	bf28      	it	cs
   10e74:	eba0 6001 	subcs.w	r0, r0, r1, lsl #24
   10e78:	ebb0 5fc1 	cmp.w	r0, r1, lsl #23
   10e7c:	bf00      	nop
   10e7e:	eb42 0202 	adc.w	r2, r2, r2
   10e82:	bf28      	it	cs
   10e84:	eba0 50c1 	subcs.w	r0, r0, r1, lsl #23
   10e88:	ebb0 5f81 	cmp.w	r0, r1, lsl #22
   10e8c:	bf00      	nop
   10e8e:	eb42 0202 	adc.w	r2, r2, r2
   10e92:	bf28      	it	cs
   10e94:	eba0 5081 	subcs.w	r0, r0, r1, lsl #22
   10e98:	ebb0 5f41 	cmp.w	r0, r1, lsl #21
   10e9c:	bf00      	nop
   10e9e:	eb42 0202 	adc.w	r2, r2, r2
   10ea2:	bf28      	it	cs
   10ea4:	eba0 5041 	subcs.w	r0, r0, r1, lsl #21
   10ea8:	ebb0 5f01 	cmp.w	r0, r1, lsl #20
   10eac:	bf00      	nop
   10eae:	eb42 0202 	adc.w	r2, r2, r2
   10eb2:	bf28      	it	cs
   10eb4:	eba0 5001 	subcs.w	r0, r0, r1, lsl #20
   10eb8:	ebb0 4fc1 	cmp.w	r0, r1, lsl #19
   10ebc:	bf00      	nop
   10ebe:	eb42 0202 	adc.w	r2, r2, r2
   10ec2:	bf28      	it	cs
   10ec4:	eba0 40c1 	subcs.w	r0, r0, r1, lsl #19
   10ec8:	ebb0 4f81 	cmp.w	r0, r1, lsl #18
   10ecc:	bf00      	nop
   10ece:	eb42 0202 	adc.w	r2, r2, r2
   10ed2:	bf28      	it	cs
   10ed4:	eba0 4081 	subcs.w	r0, r0, r1, lsl #18
   10ed8:	ebb0 4f41 	cmp.w	r0, r1, lsl #17
   10edc:	bf00      	nop
   10ede:	eb42 0202 	adc.w	r2, r2, r2
   10ee2:	bf28      	it	cs
   10ee4:	eba0 4041 	subcs.w	r0, r0, r1, lsl #17
   10ee8:	ebb0 4f01 	cmp.w	r0, r1, lsl #16
   10eec:	bf00      	nop
   10eee:	eb42 0202 	adc.w	r2, r2, r2
   10ef2:	bf28      	it	cs
   10ef4:	eba0 4001 	subcs.w	r0, r0, r1, lsl #16
   10ef8:	ebb0 3fc1 	cmp.w	r0, r1, lsl #15
   10efc:	bf00      	nop
   10efe:	eb42 0202 	adc.w	r2, r2, r2
   10f02:	bf28      	it	cs
   10f04:	eba0 30c1 	subcs.w	r0, r0, r1, lsl #15
   10f08:	ebb0 3f81 	cmp.w	r0, r1, lsl #14
   10f0c:	bf00      	nop
   10f0e:	eb42 0202 	adc.w	r2, r2, r2
   10f12:	bf28      	it	cs
   10f14:	eba0 3081 	subcs.w	r0, r0, r1, lsl #14
   10f18:	ebb0 3f41 	cmp.w	r0, r1, lsl #13
   10f1c:	bf00      	nop
   10f1e:	eb42 0202 	adc.w	r2, r2, r2
   10f22:	bf28      	it	cs
   10f24:	eba0 3041 	subcs.w	r0, r0, r1, lsl #13
   10f28:	ebb0 3f01 	cmp.w	r0, r1, lsl #12
   10f2c:	bf00      	nop
   10f2e:	eb42 0202 	adc.w	r2, r2, r2
   10f32:	bf28      	it	cs
   10f34:	eba0 3001 	subcs.w	r0, r0, r1, lsl #12
   10f38:	ebb0 2fc1 	cmp.w	r0, r1, lsl #11
   10f3c:	bf00      	nop
   10f3e:	eb42 0202 	adc.w	r2, r2, r2
   10f42:	bf28      	it	cs
   10f44:	eba0 20c1 	subcs.w	r0, r0, r1, lsl #11
   10f48:	ebb0 2f81 	cmp.w	r0, r1, lsl #10
   10f4c:	bf00      	nop
   10f4e:	eb42 0202 	adc.w	r2, r2, r2
   10f52:	bf28      	it	cs
   10f54:	eba0 2081 	subcs.w	r0, r0, r1, lsl #10
   10f58:	ebb0 2f41 	cmp.w	r0, r1, lsl #9
   10f5c:	bf00      	nop
   10f5e:	eb42 0202 	adc.w	r2, r2, r2
   10f62:	bf28      	it	cs
   10f64:	eba0 2041 	subcs.w	r0, r0, r1, lsl #9
   10f68:	ebb0 2f01 	cmp.w	r0, r1, lsl #8
   10f6c:	bf00      	nop
   10f6e:	eb42 0202 	adc.w	r2, r2, r2
   10f72:	bf28      	it	cs
   10f74:	eba0 2001 	subcs.w	r0, r0, r1, lsl #8
   10f78:	ebb0 1fc1 	cmp.w	r0, r1, lsl #7
   10f7c:	bf00      	nop
   10f7e:	eb42 0202 	adc.w	r2, r2, r2
   10f82:	bf28      	it	cs
   10f84:	eba0 10c1 	subcs.w	r0, r0, r1, lsl #7
   10f88:	ebb0 1f81 	cmp.w	r0, r1, lsl #6
   10f8c:	bf00      	nop
   10f8e:	eb42 0202 	adc.w	r2, r2, r2
   10f92:	bf28      	it	cs
   10f94:	eba0 1081 	subcs.w	r0, r0, r1, lsl #6
   10f98:	ebb0 1f41 	cmp.w	r0, r1, lsl #5
   10f9c:	bf00      	nop
   10f9e:	eb42 0202 	adc.w	r2, r2, r2
   10fa2:	bf28      	it	cs
   10fa4:	eba0 1041 	subcs.w	r0, r0, r1, lsl #5
   10fa8:	ebb0 1f01 	cmp.w	r0, r1, lsl #4
   10fac:	bf00      	nop
   10fae:	eb42 0202 	adc.w	r2, r2, r2
   10fb2:	bf28      	it	cs
   10fb4:	eba0 1001 	subcs.w	r0, r0, r1, lsl #4
   10fb8:	ebb0 0fc1 	cmp.w	r0, r1, lsl #3
   10fbc:	bf00      	nop
   10fbe:	eb42 0202 	adc.w	r2, r2, r2
   10fc2:	bf28      	it	cs
   10fc4:	eba0 00c1 	subcs.w	r0, r0, r1, lsl #3
   10fc8:	ebb0 0f81 	cmp.w	r0, r1, lsl #2
   10fcc:	bf00      	nop
   10fce:	eb42 0202 	adc.w	r2, r2, r2
   10fd2:	bf28      	it	cs
   10fd4:	eba0 0081 	subcs.w	r0, r0, r1, lsl #2
   10fd8:	ebb0 0f41 	cmp.w	r0, r1, lsl #1
   10fdc:	bf00      	nop
   10fde:	eb42 0202 	adc.w	r2, r2, r2
   10fe2:	bf28      	it	cs
   10fe4:	eba0 0041 	subcs.w	r0, r0, r1, lsl #1
   10fe8:	ebb0 0f01 	cmp.w	r0, r1
   10fec:	bf00      	nop
   10fee:	eb42 0202 	adc.w	r2, r2, r2
   10ff2:	bf28      	it	cs
   10ff4:	eba0 0001 	subcs.w	r0, r0, r1
   10ff8:	4610      	mov	r0, r2
   10ffa:	4770      	bx	lr
   10ffc:	bf0c      	ite	eq
   10ffe:	2001      	moveq	r0, #1
   11000:	2000      	movne	r0, #0
   11002:	4770      	bx	lr
   11004:	fab1 f281 	clz	r2, r1
   11008:	f1c2 021f 	rsb	r2, r2, #31
   1100c:	fa20 f002 	lsr.w	r0, r0, r2
   11010:	4770      	bx	lr
   11012:	b108      	cbz	r0, 11018 <__udivsi3+0x258>
   11014:	f04f 30ff 	mov.w	r0, #4294967295
   11018:	f000 b80e 	b.w	11038 <__aeabi_idiv0>

0001101c <__aeabi_uidivmod>:
   1101c:	2900      	cmp	r1, #0
   1101e:	d0f8      	beq.n	11012 <__udivsi3+0x252>
   11020:	e92d 4003 	stmdb	sp!, {r0, r1, lr}
   11024:	f7ff fecc 	bl	10dc0 <__udivsi3>
   11028:	e8bd 4006 	ldmia.w	sp!, {r1, r2, lr}
   1102c:	fb02 f300 	mul.w	r3, r2, r0
   11030:	eba1 0103 	sub.w	r1, r1, r3
   11034:	4770      	bx	lr
   11036:	bf00      	nop

00011038 <__aeabi_idiv0>:
   11038:	4770      	bx	lr
   1103a:	bf00      	nop

0001103c <__aeabi_uldivmod>:
   1103c:	b953      	cbnz	r3, 11054 <__aeabi_uldivmod+0x18>
   1103e:	b94a      	cbnz	r2, 11054 <__aeabi_uldivmod+0x18>
   11040:	2900      	cmp	r1, #0
   11042:	bf08      	it	eq
   11044:	2800      	cmpeq	r0, #0
   11046:	bf1c      	itt	ne
   11048:	f04f 31ff 	movne.w	r1, #4294967295
   1104c:	f04f 30ff 	movne.w	r0, #4294967295
   11050:	f7ff bff2 	b.w	11038 <__aeabi_idiv0>
   11054:	f1ad 0c08 	sub.w	ip, sp, #8
   11058:	e96d ce04 	strd	ip, lr, [sp, #-16]!
   1105c:	f000 f806 	bl	1106c <__udivmoddi4>
   11060:	f8dd e004 	ldr.w	lr, [sp, #4]
   11064:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
   11068:	b004      	add	sp, #16
   1106a:	4770      	bx	lr

0001106c <__udivmoddi4>:
   1106c:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
   11070:	4290      	cmp	r0, r2
   11072:	460d      	mov	r5, r1
   11074:	eb75 0103 	sbcs.w	r1, r5, r3
   11078:	4604      	mov	r4, r0
   1107a:	bf38      	it	cc
   1107c:	2000      	movcc	r0, #0
   1107e:	9f07      	ldr	r7, [sp, #28]
   11080:	bf38      	it	cc
   11082:	4601      	movcc	r1, r0
   11084:	d364      	bcc.n	11150 <__udivmoddi4+0xe4>
   11086:	fab3 f683 	clz	r6, r3
   1108a:	2b00      	cmp	r3, #0
   1108c:	d069      	beq.n	11162 <__udivmoddi4+0xf6>
   1108e:	fab5 f185 	clz	r1, r5
   11092:	2d00      	cmp	r5, #0
   11094:	d061      	beq.n	1115a <__udivmoddi4+0xee>
   11096:	1a76      	subs	r6, r6, r1
   11098:	f1a6 0c20 	sub.w	ip, r6, #32
   1109c:	f1c6 0e20 	rsb	lr, r6, #32
   110a0:	40b3      	lsls	r3, r6
   110a2:	fa02 f10c 	lsl.w	r1, r2, ip
   110a6:	fa02 f806 	lsl.w	r8, r2, r6
   110aa:	430b      	orrs	r3, r1
   110ac:	fa22 f20e 	lsr.w	r2, r2, lr
   110b0:	4544      	cmp	r4, r8
   110b2:	ea43 0302 	orr.w	r3, r3, r2
   110b6:	eb75 0203 	sbcs.w	r2, r5, r3
   110ba:	bf3c      	itt	cc
   110bc:	2000      	movcc	r0, #0
   110be:	4601      	movcc	r1, r0
   110c0:	d30a      	bcc.n	110d8 <__udivmoddi4+0x6c>
   110c2:	2001      	movs	r0, #1
   110c4:	ebb4 0408 	subs.w	r4, r4, r8
   110c8:	eb65 0503 	sbc.w	r5, r5, r3
   110cc:	fa00 f10c 	lsl.w	r1, r0, ip
   110d0:	fa20 f20e 	lsr.w	r2, r0, lr
   110d4:	4311      	orrs	r1, r2
   110d6:	40b0      	lsls	r0, r6
   110d8:	b3d6      	cbz	r6, 11150 <__udivmoddi4+0xe4>
   110da:	ea4f 0258 	mov.w	r2, r8, lsr #1
   110de:	46b0      	mov	r8, r6
   110e0:	ea42 72c3 	orr.w	r2, r2, r3, lsl #31
   110e4:	085b      	lsrs	r3, r3, #1
   110e6:	e00a      	b.n	110fe <__udivmoddi4+0x92>
   110e8:	1aa4      	subs	r4, r4, r2
   110ea:	eb65 0503 	sbc.w	r5, r5, r3
   110ee:	1924      	adds	r4, r4, r4
   110f0:	416d      	adcs	r5, r5
   110f2:	3401      	adds	r4, #1
   110f4:	f145 0500 	adc.w	r5, r5, #0
   110f8:	f1b8 0801 	subs.w	r8, r8, #1
   110fc:	d008      	beq.n	11110 <__udivmoddi4+0xa4>
   110fe:	4294      	cmp	r4, r2
   11100:	eb75 0903 	sbcs.w	r9, r5, r3
   11104:	d2f0      	bcs.n	110e8 <__udivmoddi4+0x7c>
   11106:	1924      	adds	r4, r4, r4
   11108:	416d      	adcs	r5, r5
   1110a:	f1b8 0801 	subs.w	r8, r8, #1
   1110e:	d1f6      	bne.n	110fe <__udivmoddi4+0x92>
   11110:	1900      	adds	r0, r0, r4
   11112:	fa05 fe0e 	lsl.w	lr, r5, lr
   11116:	fa24 f406 	lsr.w	r4, r4, r6
   1111a:	eb41 0105 	adc.w	r1, r1, r5
   1111e:	fa25 fc0c 	lsr.w	ip, r5, ip
   11122:	ea44 040e 	orr.w	r4, r4, lr
   11126:	ea44 040c 	orr.w	r4, r4, ip
   1112a:	40f5      	lsrs	r5, r6
   1112c:	f1a6 0c20 	sub.w	ip, r6, #32
   11130:	f1c6 0320 	rsb	r3, r6, #32
   11134:	fa05 f206 	lsl.w	r2, r5, r6
   11138:	fa04 fc0c 	lsl.w	ip, r4, ip
   1113c:	fa24 f303 	lsr.w	r3, r4, r3
   11140:	ea42 020c 	orr.w	r2, r2, ip
   11144:	431a      	orrs	r2, r3
   11146:	fa04 f306 	lsl.w	r3, r4, r6
   1114a:	1ac0      	subs	r0, r0, r3
   1114c:	eb61 0102 	sbc.w	r1, r1, r2
   11150:	b10f      	cbz	r7, 11156 <__udivmoddi4+0xea>
   11152:	e9c7 4500 	strd	r4, r5, [r7]
   11156:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
   1115a:	fab4 f184 	clz	r1, r4
   1115e:	3120      	adds	r1, #32
   11160:	e799      	b.n	11096 <__udivmoddi4+0x2a>
   11162:	fab2 f682 	clz	r6, r2
   11166:	fab5 f185 	clz	r1, r5
   1116a:	3620      	adds	r6, #32
   1116c:	2d00      	cmp	r5, #0
   1116e:	d192      	bne.n	11096 <__udivmoddi4+0x2a>
   11170:	e7f3      	b.n	1115a <__udivmoddi4+0xee>
   11172:	bf00      	nop

00011174 <exit>:
   11174:	b508      	push	{r3, lr}
   11176:	2100      	movs	r1, #0
   11178:	4604      	mov	r4, r0
   1117a:	f000 fd8d 	bl	11c98 <__call_exitprocs>
   1117e:	f24f 630c 	movw	r3, #62988	; 0xf60c
   11182:	f2c0 0301 	movt	r3, #1
   11186:	681b      	ldr	r3, [r3, #0]
   11188:	b103      	cbz	r3, 1118c <exit+0x18>
   1118a:	4798      	blx	r3
   1118c:	4620      	mov	r0, r4
   1118e:	f000 ee58 	blx	11e40 <_exit>
   11192:	bf00      	nop

00011194 <memcmp>:
   11194:	2a03      	cmp	r2, #3
   11196:	b430      	push	{r4, r5}
   11198:	d915      	bls.n	111c6 <memcmp+0x32>
   1119a:	ea41 0400 	orr.w	r4, r1, r0
   1119e:	4684      	mov	ip, r0
   111a0:	460b      	mov	r3, r1
   111a2:	07a4      	lsls	r4, r4, #30
   111a4:	d004      	beq.n	111b0 <memcmp+0x1c>
   111a6:	1e54      	subs	r4, r2, #1
   111a8:	e00f      	b.n	111ca <memcmp+0x36>
   111aa:	3a04      	subs	r2, #4
   111ac:	2a03      	cmp	r2, #3
   111ae:	d908      	bls.n	111c2 <memcmp+0x2e>
   111b0:	4619      	mov	r1, r3
   111b2:	4660      	mov	r0, ip
   111b4:	f853 4b04 	ldr.w	r4, [r3], #4
   111b8:	f85c 5b04 	ldr.w	r5, [ip], #4
   111bc:	42a5      	cmp	r5, r4
   111be:	d0f4      	beq.n	111aa <memcmp+0x16>
   111c0:	e7f1      	b.n	111a6 <memcmp+0x12>
   111c2:	4660      	mov	r0, ip
   111c4:	4619      	mov	r1, r3
   111c6:	1e54      	subs	r4, r2, #1
   111c8:	b17a      	cbz	r2, 111ea <memcmp+0x56>
   111ca:	1e43      	subs	r3, r0, #1
   111cc:	3901      	subs	r1, #1
   111ce:	1902      	adds	r2, r0, r4
   111d0:	e001      	b.n	111d6 <memcmp+0x42>
   111d2:	429a      	cmp	r2, r3
   111d4:	d009      	beq.n	111ea <memcmp+0x56>
   111d6:	f813 0f01 	ldrb.w	r0, [r3, #1]!
   111da:	f811 cf01 	ldrb.w	ip, [r1, #1]!
   111de:	4560      	cmp	r0, ip
   111e0:	d0f7      	beq.n	111d2 <memcmp+0x3e>
   111e2:	eba0 000c 	sub.w	r0, r0, ip
   111e6:	bc30      	pop	{r4, r5}
   111e8:	4770      	bx	lr
   111ea:	2000      	movs	r0, #0
   111ec:	bc30      	pop	{r4, r5}
   111ee:	4770      	bx	lr

000111f0 <memmove>:
   111f0:	4288      	cmp	r0, r1
   111f2:	d90e      	bls.n	11212 <memmove+0x22>
   111f4:	188b      	adds	r3, r1, r2
   111f6:	4283      	cmp	r3, r0
   111f8:	d90b      	bls.n	11212 <memmove+0x22>
   111fa:	eb00 0c02 	add.w	ip, r0, r2
   111fe:	2a00      	cmp	r2, #0
   11200:	d071      	beq.n	112e6 <memmove+0xf6>
   11202:	4662      	mov	r2, ip
   11204:	f813 cd01 	ldrb.w	ip, [r3, #-1]!
   11208:	f802 cd01 	strb.w	ip, [r2, #-1]!
   1120c:	4299      	cmp	r1, r3
   1120e:	d1f9      	bne.n	11204 <memmove+0x14>
   11210:	4770      	bx	lr
   11212:	2a0f      	cmp	r2, #15
   11214:	d80f      	bhi.n	11236 <memmove+0x46>
   11216:	4603      	mov	r3, r0
   11218:	f102 3cff 	add.w	ip, r2, #4294967295
   1121c:	2a00      	cmp	r2, #0
   1121e:	d062      	beq.n	112e6 <memmove+0xf6>
   11220:	f10c 0c01 	add.w	ip, ip, #1
   11224:	3b01      	subs	r3, #1
   11226:	448c      	add	ip, r1
   11228:	f811 2b01 	ldrb.w	r2, [r1], #1
   1122c:	f803 2f01 	strb.w	r2, [r3, #1]!
   11230:	4561      	cmp	r1, ip
   11232:	d1f9      	bne.n	11228 <memmove+0x38>
   11234:	4770      	bx	lr
   11236:	ea40 0301 	orr.w	r3, r0, r1
   1123a:	079b      	lsls	r3, r3, #30
   1123c:	bf1c      	itt	ne
   1123e:	f102 3cff 	addne.w	ip, r2, #4294967295
   11242:	4603      	movne	r3, r0
   11244:	d1ec      	bne.n	11220 <memmove+0x30>
   11246:	f1a2 0310 	sub.w	r3, r2, #16
   1124a:	b570      	push	{r4, r5, r6, lr}
   1124c:	f101 0c20 	add.w	ip, r1, #32
   11250:	f023 060f 	bic.w	r6, r3, #15
   11254:	f101 0410 	add.w	r4, r1, #16
   11258:	f100 0510 	add.w	r5, r0, #16
   1125c:	44b4      	add	ip, r6
   1125e:	ea4f 1e13 	mov.w	lr, r3, lsr #4
   11262:	f854 3c10 	ldr.w	r3, [r4, #-16]
   11266:	3410      	adds	r4, #16
   11268:	f845 3c10 	str.w	r3, [r5, #-16]
   1126c:	3510      	adds	r5, #16
   1126e:	f854 3c1c 	ldr.w	r3, [r4, #-28]
   11272:	f845 3c1c 	str.w	r3, [r5, #-28]
   11276:	f854 3c18 	ldr.w	r3, [r4, #-24]
   1127a:	f845 3c18 	str.w	r3, [r5, #-24]
   1127e:	f854 3c14 	ldr.w	r3, [r4, #-20]
   11282:	4564      	cmp	r4, ip
   11284:	f845 3c14 	str.w	r3, [r5, #-20]
   11288:	d1eb      	bne.n	11262 <memmove+0x72>
   1128a:	f10e 0301 	add.w	r3, lr, #1
   1128e:	f002 050f 	and.w	r5, r2, #15
   11292:	f012 0f0c 	tst.w	r2, #12
   11296:	ea4f 1303 	mov.w	r3, r3, lsl #4
   1129a:	bf08      	it	eq
   1129c:	462a      	moveq	r2, r5
   1129e:	4419      	add	r1, r3
   112a0:	4403      	add	r3, r0
   112a2:	d012      	beq.n	112ca <memmove+0xda>
   112a4:	3d04      	subs	r5, #4
   112a6:	1f1c      	subs	r4, r3, #4
   112a8:	f025 0e03 	bic.w	lr, r5, #3
   112ac:	468c      	mov	ip, r1
   112ae:	08ad      	lsrs	r5, r5, #2
   112b0:	449e      	add	lr, r3
   112b2:	f85c 6b04 	ldr.w	r6, [ip], #4
   112b6:	f844 6f04 	str.w	r6, [r4, #4]!
   112ba:	4574      	cmp	r4, lr
   112bc:	d1f9      	bne.n	112b2 <memmove+0xc2>
   112be:	1c6c      	adds	r4, r5, #1
   112c0:	f002 0203 	and.w	r2, r2, #3
   112c4:	00a4      	lsls	r4, r4, #2
   112c6:	4423      	add	r3, r4
   112c8:	4421      	add	r1, r4
   112ca:	f102 3cff 	add.w	ip, r2, #4294967295
   112ce:	3b01      	subs	r3, #1
   112d0:	f10c 0c01 	add.w	ip, ip, #1
   112d4:	448c      	add	ip, r1
   112d6:	b12a      	cbz	r2, 112e4 <memmove+0xf4>
   112d8:	f811 2b01 	ldrb.w	r2, [r1], #1
   112dc:	f803 2f01 	strb.w	r2, [r3, #1]!
   112e0:	4561      	cmp	r1, ip
   112e2:	d1f9      	bne.n	112d8 <memmove+0xe8>
   112e4:	bd70      	pop	{r4, r5, r6, pc}
   112e6:	4770      	bx	lr

000112e8 <memset>:
   112e8:	b530      	push	{r4, r5, lr}
   112ea:	0783      	lsls	r3, r0, #30
   112ec:	d04b      	beq.n	11386 <memset+0x9e>
   112ee:	1e54      	subs	r4, r2, #1
   112f0:	2a00      	cmp	r2, #0
   112f2:	d043      	beq.n	1137c <memset+0x94>
   112f4:	b2ca      	uxtb	r2, r1
   112f6:	4603      	mov	r3, r0
   112f8:	e001      	b.n	112fe <memset+0x16>
   112fa:	3c01      	subs	r4, #1
   112fc:	d33e      	bcc.n	1137c <memset+0x94>
   112fe:	f803 2b01 	strb.w	r2, [r3], #1
   11302:	079d      	lsls	r5, r3, #30
   11304:	d1f9      	bne.n	112fa <memset+0x12>
   11306:	2c03      	cmp	r4, #3
   11308:	d931      	bls.n	1136e <memset+0x86>
   1130a:	b2cd      	uxtb	r5, r1
   1130c:	f04f 3201 	mov.w	r2, #16843009	; 0x1010101
   11310:	2c0f      	cmp	r4, #15
   11312:	fb02 f505 	mul.w	r5, r2, r5
   11316:	d939      	bls.n	1138c <memset+0xa4>
   11318:	f1a4 0210 	sub.w	r2, r4, #16
   1131c:	f103 0c10 	add.w	ip, r3, #16
   11320:	f022 0e0f 	bic.w	lr, r2, #15
   11324:	44f4      	add	ip, lr
   11326:	ea4f 1e12 	mov.w	lr, r2, lsr #4
   1132a:	461a      	mov	r2, r3
   1132c:	e9c2 5500 	strd	r5, r5, [r2]
   11330:	e9c2 5502 	strd	r5, r5, [r2, #8]
   11334:	3210      	adds	r2, #16
   11336:	4562      	cmp	r2, ip
   11338:	d1f8      	bne.n	1132c <memset+0x44>
   1133a:	f10e 0201 	add.w	r2, lr, #1
   1133e:	f014 0f0c 	tst.w	r4, #12
   11342:	f004 0e0f 	and.w	lr, r4, #15
   11346:	eb03 1302 	add.w	r3, r3, r2, lsl #4
   1134a:	d018      	beq.n	1137e <memset+0x96>
   1134c:	461a      	mov	r2, r3
   1134e:	eb03 0c0e 	add.w	ip, r3, lr
   11352:	f842 5b04 	str.w	r5, [r2], #4
   11356:	ebac 0402 	sub.w	r4, ip, r2
   1135a:	2c03      	cmp	r4, #3
   1135c:	d8f9      	bhi.n	11352 <memset+0x6a>
   1135e:	f1ae 0204 	sub.w	r2, lr, #4
   11362:	f00e 0403 	and.w	r4, lr, #3
   11366:	f022 0203 	bic.w	r2, r2, #3
   1136a:	3204      	adds	r2, #4
   1136c:	4413      	add	r3, r2
   1136e:	b12c      	cbz	r4, 1137c <memset+0x94>
   11370:	b2c9      	uxtb	r1, r1
   11372:	441c      	add	r4, r3
   11374:	f803 1b01 	strb.w	r1, [r3], #1
   11378:	42a3      	cmp	r3, r4
   1137a:	d1fb      	bne.n	11374 <memset+0x8c>
   1137c:	bd30      	pop	{r4, r5, pc}
   1137e:	4674      	mov	r4, lr
   11380:	2c00      	cmp	r4, #0
   11382:	d1f5      	bne.n	11370 <memset+0x88>
   11384:	e7fa      	b.n	1137c <memset+0x94>
   11386:	4603      	mov	r3, r0
   11388:	4614      	mov	r4, r2
   1138a:	e7bc      	b.n	11306 <memset+0x1e>
   1138c:	46a6      	mov	lr, r4
   1138e:	e7dd      	b.n	1134c <memset+0x64>

00011390 <strchr>:
   11390:	4603      	mov	r3, r0
   11392:	f000 0203 	and.w	r2, r0, #3
   11396:	f011 01ff 	ands.w	r1, r1, #255	; 0xff
   1139a:	d039      	beq.n	11410 <strchr+0x80>
   1139c:	bb8a      	cbnz	r2, 11402 <strchr+0x72>
   1139e:	b510      	push	{r4, lr}
   113a0:	f04f 3e01 	mov.w	lr, #16843009	; 0x1010101
   113a4:	6802      	ldr	r2, [r0, #0]
   113a6:	fb0e fe01 	mul.w	lr, lr, r1
   113aa:	f1a2 3301 	sub.w	r3, r2, #16843009	; 0x1010101
   113ae:	ea23 0302 	bic.w	r3, r3, r2
   113b2:	ea8e 0402 	eor.w	r4, lr, r2
   113b6:	f1a4 3201 	sub.w	r2, r4, #16843009	; 0x1010101
   113ba:	ea22 0204 	bic.w	r2, r2, r4
   113be:	4313      	orrs	r3, r2
   113c0:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
   113c4:	d10f      	bne.n	113e6 <strchr+0x56>
   113c6:	f850 4f04 	ldr.w	r4, [r0, #4]!
   113ca:	ea84 0c0e 	eor.w	ip, r4, lr
   113ce:	f1a4 3301 	sub.w	r3, r4, #16843009	; 0x1010101
   113d2:	f1ac 3201 	sub.w	r2, ip, #16843009	; 0x1010101
   113d6:	ea23 0304 	bic.w	r3, r3, r4
   113da:	ea22 020c 	bic.w	r2, r2, ip
   113de:	4313      	orrs	r3, r2
   113e0:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
   113e4:	d0ef      	beq.n	113c6 <strchr+0x36>
   113e6:	7803      	ldrb	r3, [r0, #0]
   113e8:	b923      	cbnz	r3, 113f4 <strchr+0x64>
   113ea:	e036      	b.n	1145a <strchr+0xca>
   113ec:	f810 3f01 	ldrb.w	r3, [r0, #1]!
   113f0:	2b00      	cmp	r3, #0
   113f2:	d032      	beq.n	1145a <strchr+0xca>
   113f4:	4299      	cmp	r1, r3
   113f6:	d1f9      	bne.n	113ec <strchr+0x5c>
   113f8:	bd10      	pop	{r4, pc}
   113fa:	428a      	cmp	r2, r1
   113fc:	d028      	beq.n	11450 <strchr+0xc0>
   113fe:	079a      	lsls	r2, r3, #30
   11400:	d029      	beq.n	11456 <strchr+0xc6>
   11402:	781a      	ldrb	r2, [r3, #0]
   11404:	4618      	mov	r0, r3
   11406:	3301      	adds	r3, #1
   11408:	2a00      	cmp	r2, #0
   1140a:	d1f6      	bne.n	113fa <strchr+0x6a>
   1140c:	4610      	mov	r0, r2
   1140e:	4770      	bx	lr
   11410:	b9ca      	cbnz	r2, 11446 <strchr+0xb6>
   11412:	6802      	ldr	r2, [r0, #0]
   11414:	f1a2 3301 	sub.w	r3, r2, #16843009	; 0x1010101
   11418:	ea23 0302 	bic.w	r3, r3, r2
   1141c:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
   11420:	d108      	bne.n	11434 <strchr+0xa4>
   11422:	f850 2f04 	ldr.w	r2, [r0, #4]!
   11426:	f1a2 3301 	sub.w	r3, r2, #16843009	; 0x1010101
   1142a:	ea23 0302 	bic.w	r3, r3, r2
   1142e:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
   11432:	d0f6      	beq.n	11422 <strchr+0x92>
   11434:	7803      	ldrb	r3, [r0, #0]
   11436:	b15b      	cbz	r3, 11450 <strchr+0xc0>
   11438:	f810 3f01 	ldrb.w	r3, [r0, #1]!
   1143c:	2b00      	cmp	r3, #0
   1143e:	d1fb      	bne.n	11438 <strchr+0xa8>
   11440:	4770      	bx	lr
   11442:	0799      	lsls	r1, r3, #30
   11444:	d005      	beq.n	11452 <strchr+0xc2>
   11446:	4618      	mov	r0, r3
   11448:	f813 2b01 	ldrb.w	r2, [r3], #1
   1144c:	2a00      	cmp	r2, #0
   1144e:	d1f8      	bne.n	11442 <strchr+0xb2>
   11450:	4770      	bx	lr
   11452:	4618      	mov	r0, r3
   11454:	e7dd      	b.n	11412 <strchr+0x82>
   11456:	4618      	mov	r0, r3
   11458:	e7a1      	b.n	1139e <strchr+0xe>
   1145a:	4618      	mov	r0, r3
   1145c:	bd10      	pop	{r4, pc}
   1145e:	bf00      	nop

00011460 <strncat>:
   11460:	0783      	lsls	r3, r0, #30
   11462:	b430      	push	{r4, r5}
   11464:	bf18      	it	ne
   11466:	4603      	movne	r3, r0
   11468:	d111      	bne.n	1148e <strncat+0x2e>
   1146a:	6804      	ldr	r4, [r0, #0]
   1146c:	f1a4 3301 	sub.w	r3, r4, #16843009	; 0x1010101
   11470:	ea23 0304 	bic.w	r3, r3, r4
   11474:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
   11478:	4603      	mov	r3, r0
   1147a:	d108      	bne.n	1148e <strncat+0x2e>
   1147c:	f853 5f04 	ldr.w	r5, [r3, #4]!
   11480:	f1a5 3401 	sub.w	r4, r5, #16843009	; 0x1010101
   11484:	ea24 0405 	bic.w	r4, r4, r5
   11488:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
   1148c:	d0f6      	beq.n	1147c <strncat+0x1c>
   1148e:	781c      	ldrb	r4, [r3, #0]
   11490:	b11c      	cbz	r4, 1149a <strncat+0x3a>
   11492:	f813 4f01 	ldrb.w	r4, [r3, #1]!
   11496:	2c00      	cmp	r4, #0
   11498:	d1fb      	bne.n	11492 <strncat+0x32>
   1149a:	b162      	cbz	r2, 114b6 <strncat+0x56>
   1149c:	3901      	subs	r1, #1
   1149e:	eb03 0c02 	add.w	ip, r3, r2
   114a2:	f811 2f01 	ldrb.w	r2, [r1, #1]!
   114a6:	f803 2b01 	strb.w	r2, [r3], #1
   114aa:	b122      	cbz	r2, 114b6 <strncat+0x56>
   114ac:	459c      	cmp	ip, r3
   114ae:	d1f8      	bne.n	114a2 <strncat+0x42>
   114b0:	2300      	movs	r3, #0
   114b2:	f88c 3000 	strb.w	r3, [ip]
   114b6:	bc30      	pop	{r4, r5}
   114b8:	4770      	bx	lr
   114ba:	bf00      	nop

000114bc <strnlen>:
   114bc:	4603      	mov	r3, r0
   114be:	eb00 0c01 	add.w	ip, r0, r1
   114c2:	b911      	cbnz	r1, 114ca <strnlen+0xe>
   114c4:	e00a      	b.n	114dc <strnlen+0x20>
   114c6:	4563      	cmp	r3, ip
   114c8:	d006      	beq.n	114d8 <strnlen+0x1c>
   114ca:	461a      	mov	r2, r3
   114cc:	3301      	adds	r3, #1
   114ce:	7811      	ldrb	r1, [r2, #0]
   114d0:	2900      	cmp	r1, #0
   114d2:	d1f8      	bne.n	114c6 <strnlen+0xa>
   114d4:	1a10      	subs	r0, r2, r0
   114d6:	4770      	bx	lr
   114d8:	1a18      	subs	r0, r3, r0
   114da:	4770      	bx	lr
   114dc:	4608      	mov	r0, r1
   114de:	4770      	bx	lr

000114e0 <__libc_init_array>:
   114e0:	b570      	push	{r4, r5, r6, lr}
   114e2:	f24c 0308 	movw	r3, #49160	; 0xc008
   114e6:	f2c0 0301 	movt	r3, #1
   114ea:	f24c 0508 	movw	r5, #49160	; 0xc008
   114ee:	f2c0 0501 	movt	r5, #1
   114f2:	1b5e      	subs	r6, r3, r5
   114f4:	42ab      	cmp	r3, r5
   114f6:	d007      	beq.n	11508 <__libc_init_array+0x28>
   114f8:	10b6      	asrs	r6, r6, #2
   114fa:	2400      	movs	r4, #0
   114fc:	f855 3b04 	ldr.w	r3, [r5], #4
   11500:	3401      	adds	r4, #1
   11502:	4798      	blx	r3
   11504:	42a6      	cmp	r6, r4
   11506:	d8f9      	bhi.n	114fc <__libc_init_array+0x1c>
   11508:	f000 fce4 	bl	11ed4 <_init>
   1150c:	f24c 0508 	movw	r5, #49160	; 0xc008
   11510:	f2c0 0501 	movt	r5, #1
   11514:	f24c 0310 	movw	r3, #49168	; 0xc010
   11518:	f2c0 0301 	movt	r3, #1
   1151c:	1b5e      	subs	r6, r3, r5
   1151e:	42ab      	cmp	r3, r5
   11520:	ea4f 06a6 	mov.w	r6, r6, asr #2
   11524:	d006      	beq.n	11534 <__libc_init_array+0x54>
   11526:	2400      	movs	r4, #0
   11528:	f855 3b04 	ldr.w	r3, [r5], #4
   1152c:	3401      	adds	r4, #1
   1152e:	4798      	blx	r3
   11530:	42a6      	cmp	r6, r4
   11532:	d8f9      	bhi.n	11528 <__libc_init_array+0x48>
   11534:	bd70      	pop	{r4, r5, r6, pc}
   11536:	bf00      	nop

00011538 <__libc_fini_array>:
   11538:	b538      	push	{r3, r4, r5, lr}
   1153a:	f24c 0514 	movw	r5, #49172	; 0xc014
   1153e:	f2c0 0501 	movt	r5, #1
   11542:	f24c 0410 	movw	r4, #49168	; 0xc010
   11546:	f2c0 0401 	movt	r4, #1
   1154a:	1b2c      	subs	r4, r5, r4
   1154c:	10a4      	asrs	r4, r4, #2
   1154e:	d005      	beq.n	1155c <__libc_fini_array+0x24>
   11550:	f855 3d04 	ldr.w	r3, [r5, #-4]!
   11554:	3c01      	subs	r4, #1
   11556:	4798      	blx	r3
   11558:	2c00      	cmp	r4, #0
   1155a:	d1f9      	bne.n	11550 <__libc_fini_array+0x18>
   1155c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
   11560:	f000 bcbe 	b.w	11ee0 <_fini>

00011564 <__retarget_lock_init>:
   11564:	4770      	bx	lr
   11566:	bf00      	nop

00011568 <__retarget_lock_init_recursive>:
   11568:	4770      	bx	lr
   1156a:	bf00      	nop

0001156c <__retarget_lock_close>:
   1156c:	4770      	bx	lr
   1156e:	bf00      	nop

00011570 <__retarget_lock_close_recursive>:
   11570:	4770      	bx	lr
   11572:	bf00      	nop

00011574 <__retarget_lock_acquire>:
   11574:	4770      	bx	lr
   11576:	bf00      	nop

00011578 <__retarget_lock_acquire_recursive>:
   11578:	4770      	bx	lr
   1157a:	bf00      	nop

0001157c <__retarget_lock_try_acquire>:
   1157c:	2001      	movs	r0, #1
   1157e:	4770      	bx	lr

00011580 <__retarget_lock_try_acquire_recursive>:
   11580:	2001      	movs	r0, #1
   11582:	4770      	bx	lr

00011584 <__retarget_lock_release>:
   11584:	4770      	bx	lr
   11586:	bf00      	nop

00011588 <__retarget_lock_release_recursive>:
   11588:	4770      	bx	lr
   1158a:	bf00      	nop
	...

000115c0 <memcpy>:
   115c0:	e1a0c000 	mov	ip, r0
   115c4:	e3520040 	cmp	r2, #64	; 0x40
   115c8:	aa000028 	bge	11670 <memcpy+0xb0>
   115cc:	e202303c 	and	r3, r2, #60	; 0x3c
   115d0:	e08cc003 	add	ip, ip, r3
   115d4:	e0811003 	add	r1, r1, r3
   115d8:	e263303a 	rsb	r3, r3, #58	; 0x3a
   115dc:	e08ff083 	add	pc, pc, r3, lsl #1
   115e0:	e511303c 	ldr	r3, [r1, #-60]	; 0xffffffc4
   115e4:	e50c303c 	str	r3, [ip, #-60]	; 0xffffffc4
   115e8:	e5113038 	ldr	r3, [r1, #-56]	; 0xffffffc8
   115ec:	e50c3038 	str	r3, [ip, #-56]	; 0xffffffc8
   115f0:	e5113034 	ldr	r3, [r1, #-52]	; 0xffffffcc
   115f4:	e50c3034 	str	r3, [ip, #-52]	; 0xffffffcc
   115f8:	e5113030 	ldr	r3, [r1, #-48]	; 0xffffffd0
   115fc:	e50c3030 	str	r3, [ip, #-48]	; 0xffffffd0
   11600:	e511302c 	ldr	r3, [r1, #-44]	; 0xffffffd4
   11604:	e50c302c 	str	r3, [ip, #-44]	; 0xffffffd4
   11608:	e5113028 	ldr	r3, [r1, #-40]	; 0xffffffd8
   1160c:	e50c3028 	str	r3, [ip, #-40]	; 0xffffffd8
   11610:	e5113024 	ldr	r3, [r1, #-36]	; 0xffffffdc
   11614:	e50c3024 	str	r3, [ip, #-36]	; 0xffffffdc
   11618:	e5113020 	ldr	r3, [r1, #-32]	; 0xffffffe0
   1161c:	e50c3020 	str	r3, [ip, #-32]	; 0xffffffe0
   11620:	e511301c 	ldr	r3, [r1, #-28]	; 0xffffffe4
   11624:	e50c301c 	str	r3, [ip, #-28]	; 0xffffffe4
   11628:	e5113018 	ldr	r3, [r1, #-24]	; 0xffffffe8
   1162c:	e50c3018 	str	r3, [ip, #-24]	; 0xffffffe8
   11630:	e5113014 	ldr	r3, [r1, #-20]	; 0xffffffec
   11634:	e50c3014 	str	r3, [ip, #-20]	; 0xffffffec
   11638:	e5113010 	ldr	r3, [r1, #-16]
   1163c:	e50c3010 	str	r3, [ip, #-16]
   11640:	e511300c 	ldr	r3, [r1, #-12]
   11644:	e50c300c 	str	r3, [ip, #-12]
   11648:	e5113008 	ldr	r3, [r1, #-8]
   1164c:	e50c3008 	str	r3, [ip, #-8]
   11650:	e5113004 	ldr	r3, [r1, #-4]
   11654:	e50c3004 	str	r3, [ip, #-4]
   11658:	e1b02f82 	lsls	r2, r2, #31
   1165c:	20d130b2 	ldrhcs	r3, [r1], #2
   11660:	15d11000 	ldrbne	r1, [r1]
   11664:	20cc30b2 	strhcs	r3, [ip], #2
   11668:	15cc1000 	strbne	r1, [ip]
   1166c:	e12fff1e 	bx	lr
   11670:	e52da020 	str	sl, [sp, #-32]!	; 0xffffffe0
   11674:	e201a007 	and	sl, r1, #7
   11678:	e20c3007 	and	r3, ip, #7
   1167c:	e153000a 	cmp	r3, sl
   11680:	1a0000f1 	bne	11a4c <memcpy+0x48c>
   11684:	eeb00a40 	vmov.f32	s0, s0
   11688:	e1b0ae8c 	lsls	sl, ip, #29
   1168c:	0a000008 	beq	116b4 <memcpy+0xf4>
   11690:	e27aa000 	rsbs	sl, sl, #0
   11694:	e0422eaa 	sub	r2, r2, sl, lsr #29
   11698:	44913004 	ldrmi	r3, [r1], #4
   1169c:	448c3004 	strmi	r3, [ip], #4
   116a0:	e1b0a10a 	lsls	sl, sl, #2
   116a4:	20d130b2 	ldrhcs	r3, [r1], #2
   116a8:	14d1a001 	ldrbne	sl, [r1], #1
   116ac:	20cc30b2 	strhcs	r3, [ip], #2
   116b0:	14cca001 	strbne	sl, [ip], #1
   116b4:	e252a040 	subs	sl, r2, #64	; 0x40
   116b8:	ba000017 	blt	1171c <memcpy+0x15c>
   116bc:	e35a0c02 	cmp	sl, #512	; 0x200
   116c0:	aa000032 	bge	11790 <memcpy+0x1d0>
   116c4:	ed910b00 	vldr	d0, [r1]
   116c8:	e25aa040 	subs	sl, sl, #64	; 0x40
   116cc:	ed911b02 	vldr	d1, [r1, #8]
   116d0:	ed8c0b00 	vstr	d0, [ip]
   116d4:	ed910b04 	vldr	d0, [r1, #16]
   116d8:	ed8c1b02 	vstr	d1, [ip, #8]
   116dc:	ed911b06 	vldr	d1, [r1, #24]
   116e0:	ed8c0b04 	vstr	d0, [ip, #16]
   116e4:	ed910b08 	vldr	d0, [r1, #32]
   116e8:	ed8c1b06 	vstr	d1, [ip, #24]
   116ec:	ed911b0a 	vldr	d1, [r1, #40]	; 0x28
   116f0:	ed8c0b08 	vstr	d0, [ip, #32]
   116f4:	ed910b0c 	vldr	d0, [r1, #48]	; 0x30
   116f8:	ed8c1b0a 	vstr	d1, [ip, #40]	; 0x28
   116fc:	ed911b0e 	vldr	d1, [r1, #56]	; 0x38
   11700:	ed8c0b0c 	vstr	d0, [ip, #48]	; 0x30
   11704:	e2811040 	add	r1, r1, #64	; 0x40
   11708:	ed8c1b0e 	vstr	d1, [ip, #56]	; 0x38
   1170c:	e28cc040 	add	ip, ip, #64	; 0x40
   11710:	aaffffeb 	bge	116c4 <memcpy+0x104>
   11714:	e31a003f 	tst	sl, #63	; 0x3f
   11718:	0a00001a 	beq	11788 <memcpy+0x1c8>
   1171c:	e20a3038 	and	r3, sl, #56	; 0x38
   11720:	e08cc003 	add	ip, ip, r3
   11724:	e0811003 	add	r1, r1, r3
   11728:	e2633034 	rsb	r3, r3, #52	; 0x34
   1172c:	e08ff003 	add	pc, pc, r3
   11730:	ed110b0e 	vldr	d0, [r1, #-56]	; 0xffffffc8
   11734:	ed0c0b0e 	vstr	d0, [ip, #-56]	; 0xffffffc8
   11738:	ed110b0c 	vldr	d0, [r1, #-48]	; 0xffffffd0
   1173c:	ed0c0b0c 	vstr	d0, [ip, #-48]	; 0xffffffd0
   11740:	ed110b0a 	vldr	d0, [r1, #-40]	; 0xffffffd8
   11744:	ed0c0b0a 	vstr	d0, [ip, #-40]	; 0xffffffd8
   11748:	ed110b08 	vldr	d0, [r1, #-32]	; 0xffffffe0
   1174c:	ed0c0b08 	vstr	d0, [ip, #-32]	; 0xffffffe0
   11750:	ed110b06 	vldr	d0, [r1, #-24]	; 0xffffffe8
   11754:	ed0c0b06 	vstr	d0, [ip, #-24]	; 0xffffffe8
   11758:	ed110b04 	vldr	d0, [r1, #-16]
   1175c:	ed0c0b04 	vstr	d0, [ip, #-16]
   11760:	ed110b02 	vldr	d0, [r1, #-8]
   11764:	ed0c0b02 	vstr	d0, [ip, #-8]
   11768:	e31a0004 	tst	sl, #4
   1176c:	14913004 	ldrne	r3, [r1], #4
   11770:	148c3004 	strne	r3, [ip], #4
   11774:	e1b0af8a 	lsls	sl, sl, #31
   11778:	20d130b2 	ldrhcs	r3, [r1], #2
   1177c:	15d1a000 	ldrbne	sl, [r1]
   11780:	20cc30b2 	strhcs	r3, [ip], #2
   11784:	15cca000 	strbne	sl, [ip]
   11788:	e49da020 	ldr	sl, [sp], #32
   1178c:	e12fff1e 	bx	lr
   11790:	ed913b00 	vldr	d3, [r1]
   11794:	ed914b10 	vldr	d4, [r1, #64]	; 0x40
   11798:	ed915b20 	vldr	d5, [r1, #128]	; 0x80
   1179c:	ed916b30 	vldr	d6, [r1, #192]	; 0xc0
   117a0:	ed917b40 	vldr	d7, [r1, #256]	; 0x100
   117a4:	ed910b02 	vldr	d0, [r1, #8]
   117a8:	ed911b04 	vldr	d1, [r1, #16]
   117ac:	ed912b06 	vldr	d2, [r1, #24]
   117b0:	e2811020 	add	r1, r1, #32
   117b4:	e25aad0a 	subs	sl, sl, #640	; 0x280
   117b8:	ba000055 	blt	11914 <memcpy+0x354>
   117bc:	ed8c3b00 	vstr	d3, [ip]
   117c0:	ed913b00 	vldr	d3, [r1]
   117c4:	ed8c0b02 	vstr	d0, [ip, #8]
   117c8:	ed910b02 	vldr	d0, [r1, #8]
   117cc:	ed8c1b04 	vstr	d1, [ip, #16]
   117d0:	ed911b04 	vldr	d1, [r1, #16]
   117d4:	ed8c2b06 	vstr	d2, [ip, #24]
   117d8:	ed912b06 	vldr	d2, [r1, #24]
   117dc:	ed8c3b08 	vstr	d3, [ip, #32]
   117e0:	ed913b48 	vldr	d3, [r1, #288]	; 0x120
   117e4:	ed8c0b0a 	vstr	d0, [ip, #40]	; 0x28
   117e8:	ed910b0a 	vldr	d0, [r1, #40]	; 0x28
   117ec:	ed8c1b0c 	vstr	d1, [ip, #48]	; 0x30
   117f0:	ed911b0c 	vldr	d1, [r1, #48]	; 0x30
   117f4:	ed8c2b0e 	vstr	d2, [ip, #56]	; 0x38
   117f8:	ed912b0e 	vldr	d2, [r1, #56]	; 0x38
   117fc:	ed8c4b10 	vstr	d4, [ip, #64]	; 0x40
   11800:	ed914b10 	vldr	d4, [r1, #64]	; 0x40
   11804:	ed8c0b12 	vstr	d0, [ip, #72]	; 0x48
   11808:	ed910b12 	vldr	d0, [r1, #72]	; 0x48
   1180c:	ed8c1b14 	vstr	d1, [ip, #80]	; 0x50
   11810:	ed911b14 	vldr	d1, [r1, #80]	; 0x50
   11814:	ed8c2b16 	vstr	d2, [ip, #88]	; 0x58
   11818:	ed912b16 	vldr	d2, [r1, #88]	; 0x58
   1181c:	ed8c4b18 	vstr	d4, [ip, #96]	; 0x60
   11820:	ed914b58 	vldr	d4, [r1, #352]	; 0x160
   11824:	ed8c0b1a 	vstr	d0, [ip, #104]	; 0x68
   11828:	ed910b1a 	vldr	d0, [r1, #104]	; 0x68
   1182c:	ed8c1b1c 	vstr	d1, [ip, #112]	; 0x70
   11830:	ed911b1c 	vldr	d1, [r1, #112]	; 0x70
   11834:	ed8c2b1e 	vstr	d2, [ip, #120]	; 0x78
   11838:	ed912b1e 	vldr	d2, [r1, #120]	; 0x78
   1183c:	ed8c5b20 	vstr	d5, [ip, #128]	; 0x80
   11840:	ed915b20 	vldr	d5, [r1, #128]	; 0x80
   11844:	ed8c0b22 	vstr	d0, [ip, #136]	; 0x88
   11848:	ed910b22 	vldr	d0, [r1, #136]	; 0x88
   1184c:	ed8c1b24 	vstr	d1, [ip, #144]	; 0x90
   11850:	ed911b24 	vldr	d1, [r1, #144]	; 0x90
   11854:	ed8c2b26 	vstr	d2, [ip, #152]	; 0x98
   11858:	ed912b26 	vldr	d2, [r1, #152]	; 0x98
   1185c:	ed8c5b28 	vstr	d5, [ip, #160]	; 0xa0
   11860:	ed915b68 	vldr	d5, [r1, #416]	; 0x1a0
   11864:	ed8c0b2a 	vstr	d0, [ip, #168]	; 0xa8
   11868:	ed910b2a 	vldr	d0, [r1, #168]	; 0xa8
   1186c:	ed8c1b2c 	vstr	d1, [ip, #176]	; 0xb0
   11870:	ed911b2c 	vldr	d1, [r1, #176]	; 0xb0
   11874:	ed8c2b2e 	vstr	d2, [ip, #184]	; 0xb8
   11878:	ed912b2e 	vldr	d2, [r1, #184]	; 0xb8
   1187c:	e28cc0c0 	add	ip, ip, #192	; 0xc0
   11880:	e28110c0 	add	r1, r1, #192	; 0xc0
   11884:	ed8c6b00 	vstr	d6, [ip]
   11888:	ed916b00 	vldr	d6, [r1]
   1188c:	ed8c0b02 	vstr	d0, [ip, #8]
   11890:	ed910b02 	vldr	d0, [r1, #8]
   11894:	ed8c1b04 	vstr	d1, [ip, #16]
   11898:	ed911b04 	vldr	d1, [r1, #16]
   1189c:	ed8c2b06 	vstr	d2, [ip, #24]
   118a0:	ed912b06 	vldr	d2, [r1, #24]
   118a4:	ed8c6b08 	vstr	d6, [ip, #32]
   118a8:	ed916b48 	vldr	d6, [r1, #288]	; 0x120
   118ac:	ed8c0b0a 	vstr	d0, [ip, #40]	; 0x28
   118b0:	ed910b0a 	vldr	d0, [r1, #40]	; 0x28
   118b4:	ed8c1b0c 	vstr	d1, [ip, #48]	; 0x30
   118b8:	ed911b0c 	vldr	d1, [r1, #48]	; 0x30
   118bc:	ed8c2b0e 	vstr	d2, [ip, #56]	; 0x38
   118c0:	ed912b0e 	vldr	d2, [r1, #56]	; 0x38
   118c4:	ed8c7b10 	vstr	d7, [ip, #64]	; 0x40
   118c8:	ed917b10 	vldr	d7, [r1, #64]	; 0x40
   118cc:	ed8c0b12 	vstr	d0, [ip, #72]	; 0x48
   118d0:	ed910b12 	vldr	d0, [r1, #72]	; 0x48
   118d4:	ed8c1b14 	vstr	d1, [ip, #80]	; 0x50
   118d8:	ed911b14 	vldr	d1, [r1, #80]	; 0x50
   118dc:	ed8c2b16 	vstr	d2, [ip, #88]	; 0x58
   118e0:	ed912b16 	vldr	d2, [r1, #88]	; 0x58
   118e4:	ed8c7b18 	vstr	d7, [ip, #96]	; 0x60
   118e8:	ed917b58 	vldr	d7, [r1, #352]	; 0x160
   118ec:	ed8c0b1a 	vstr	d0, [ip, #104]	; 0x68
   118f0:	ed910b1a 	vldr	d0, [r1, #104]	; 0x68
   118f4:	ed8c1b1c 	vstr	d1, [ip, #112]	; 0x70
   118f8:	ed911b1c 	vldr	d1, [r1, #112]	; 0x70
   118fc:	ed8c2b1e 	vstr	d2, [ip, #120]	; 0x78
   11900:	ed912b1e 	vldr	d2, [r1, #120]	; 0x78
   11904:	e28cc080 	add	ip, ip, #128	; 0x80
   11908:	e2811080 	add	r1, r1, #128	; 0x80
   1190c:	e25aad05 	subs	sl, sl, #320	; 0x140
   11910:	aaffffa9 	bge	117bc <memcpy+0x1fc>
   11914:	ed8c3b00 	vstr	d3, [ip]
   11918:	ed913b00 	vldr	d3, [r1]
   1191c:	ed8c0b02 	vstr	d0, [ip, #8]
   11920:	ed910b02 	vldr	d0, [r1, #8]
   11924:	ed8c1b04 	vstr	d1, [ip, #16]
   11928:	ed911b04 	vldr	d1, [r1, #16]
   1192c:	ed8c2b06 	vstr	d2, [ip, #24]
   11930:	ed912b06 	vldr	d2, [r1, #24]
   11934:	ed8c3b08 	vstr	d3, [ip, #32]
   11938:	ed8c0b0a 	vstr	d0, [ip, #40]	; 0x28
   1193c:	ed910b0a 	vldr	d0, [r1, #40]	; 0x28
   11940:	ed8c1b0c 	vstr	d1, [ip, #48]	; 0x30
   11944:	ed911b0c 	vldr	d1, [r1, #48]	; 0x30
   11948:	ed8c2b0e 	vstr	d2, [ip, #56]	; 0x38
   1194c:	ed912b0e 	vldr	d2, [r1, #56]	; 0x38
   11950:	ed8c4b10 	vstr	d4, [ip, #64]	; 0x40
   11954:	ed914b10 	vldr	d4, [r1, #64]	; 0x40
   11958:	ed8c0b12 	vstr	d0, [ip, #72]	; 0x48
   1195c:	ed910b12 	vldr	d0, [r1, #72]	; 0x48
   11960:	ed8c1b14 	vstr	d1, [ip, #80]	; 0x50
   11964:	ed911b14 	vldr	d1, [r1, #80]	; 0x50
   11968:	ed8c2b16 	vstr	d2, [ip, #88]	; 0x58
   1196c:	ed912b16 	vldr	d2, [r1, #88]	; 0x58
   11970:	ed8c4b18 	vstr	d4, [ip, #96]	; 0x60
   11974:	ed8c0b1a 	vstr	d0, [ip, #104]	; 0x68
   11978:	ed910b1a 	vldr	d0, [r1, #104]	; 0x68
   1197c:	ed8c1b1c 	vstr	d1, [ip, #112]	; 0x70
   11980:	ed911b1c 	vldr	d1, [r1, #112]	; 0x70
   11984:	ed8c2b1e 	vstr	d2, [ip, #120]	; 0x78
   11988:	ed912b1e 	vldr	d2, [r1, #120]	; 0x78
   1198c:	ed8c5b20 	vstr	d5, [ip, #128]	; 0x80
   11990:	ed915b20 	vldr	d5, [r1, #128]	; 0x80
   11994:	ed8c0b22 	vstr	d0, [ip, #136]	; 0x88
   11998:	ed910b22 	vldr	d0, [r1, #136]	; 0x88
   1199c:	ed8c1b24 	vstr	d1, [ip, #144]	; 0x90
   119a0:	ed911b24 	vldr	d1, [r1, #144]	; 0x90
   119a4:	ed8c2b26 	vstr	d2, [ip, #152]	; 0x98
   119a8:	ed912b26 	vldr	d2, [r1, #152]	; 0x98
   119ac:	ed8c5b28 	vstr	d5, [ip, #160]	; 0xa0
   119b0:	ed8c0b2a 	vstr	d0, [ip, #168]	; 0xa8
   119b4:	ed910b2a 	vldr	d0, [r1, #168]	; 0xa8
   119b8:	ed8c1b2c 	vstr	d1, [ip, #176]	; 0xb0
   119bc:	ed911b2c 	vldr	d1, [r1, #176]	; 0xb0
   119c0:	ed8c2b2e 	vstr	d2, [ip, #184]	; 0xb8
   119c4:	ed912b2e 	vldr	d2, [r1, #184]	; 0xb8
   119c8:	e28110c0 	add	r1, r1, #192	; 0xc0
   119cc:	e28cc0c0 	add	ip, ip, #192	; 0xc0
   119d0:	ed8c6b00 	vstr	d6, [ip]
   119d4:	ed916b00 	vldr	d6, [r1]
   119d8:	ed8c0b02 	vstr	d0, [ip, #8]
   119dc:	ed910b02 	vldr	d0, [r1, #8]
   119e0:	ed8c1b04 	vstr	d1, [ip, #16]
   119e4:	ed911b04 	vldr	d1, [r1, #16]
   119e8:	ed8c2b06 	vstr	d2, [ip, #24]
   119ec:	ed912b06 	vldr	d2, [r1, #24]
   119f0:	ed8c6b08 	vstr	d6, [ip, #32]
   119f4:	ed8c0b0a 	vstr	d0, [ip, #40]	; 0x28
   119f8:	ed910b0a 	vldr	d0, [r1, #40]	; 0x28
   119fc:	ed8c1b0c 	vstr	d1, [ip, #48]	; 0x30
   11a00:	ed911b0c 	vldr	d1, [r1, #48]	; 0x30
   11a04:	ed8c2b0e 	vstr	d2, [ip, #56]	; 0x38
   11a08:	ed912b0e 	vldr	d2, [r1, #56]	; 0x38
   11a0c:	ed8c7b10 	vstr	d7, [ip, #64]	; 0x40
   11a10:	ed917b10 	vldr	d7, [r1, #64]	; 0x40
   11a14:	ed8c0b12 	vstr	d0, [ip, #72]	; 0x48
   11a18:	ed910b12 	vldr	d0, [r1, #72]	; 0x48
   11a1c:	ed8c1b14 	vstr	d1, [ip, #80]	; 0x50
   11a20:	ed911b14 	vldr	d1, [r1, #80]	; 0x50
   11a24:	ed8c2b16 	vstr	d2, [ip, #88]	; 0x58
   11a28:	ed912b16 	vldr	d2, [r1, #88]	; 0x58
   11a2c:	ed8c7b18 	vstr	d7, [ip, #96]	; 0x60
   11a30:	e2811060 	add	r1, r1, #96	; 0x60
   11a34:	ed8c0b1a 	vstr	d0, [ip, #104]	; 0x68
   11a38:	ed8c1b1c 	vstr	d1, [ip, #112]	; 0x70
   11a3c:	ed8c2b1e 	vstr	d2, [ip, #120]	; 0x78
   11a40:	e28cc080 	add	ip, ip, #128	; 0x80
   11a44:	e28aad05 	add	sl, sl, #320	; 0x140
   11a48:	eaffff1d 	b	116c4 <memcpy+0x104>
   11a4c:	f5d1f000 	pld	[r1]
   11a50:	f5d1f040 	pld	[r1, #64]	; 0x40
   11a54:	e1b0ae8c 	lsls	sl, ip, #29
   11a58:	f5d1f080 	pld	[r1, #128]	; 0x80
   11a5c:	0a000008 	beq	11a84 <memcpy+0x4c4>
   11a60:	e27aa000 	rsbs	sl, sl, #0
   11a64:	e0422eaa 	sub	r2, r2, sl, lsr #29
   11a68:	44913004 	ldrmi	r3, [r1], #4
   11a6c:	448c3004 	strmi	r3, [ip], #4
   11a70:	e1b0a10a 	lsls	sl, sl, #2
   11a74:	14d13001 	ldrbne	r3, [r1], #1
   11a78:	20d1a0b2 	ldrhcs	sl, [r1], #2
   11a7c:	14cc3001 	strbne	r3, [ip], #1
   11a80:	20cca0b2 	strhcs	sl, [ip], #2
   11a84:	f5d1f0c0 	pld	[r1, #192]	; 0xc0
   11a88:	e2522040 	subs	r2, r2, #64	; 0x40
   11a8c:	449da020 	ldrmi	sl, [sp], #32
   11a90:	4afffecd 	bmi	115cc <memcpy+0xc>
   11a94:	f5d1f100 	pld	[r1, #256]	; 0x100
   11a98:	e2411004 	sub	r1, r1, #4
   11a9c:	e24cc008 	sub	ip, ip, #8
   11aa0:	e252a040 	subs	sl, r2, #64	; 0x40
   11aa4:	e5912004 	ldr	r2, [r1, #4]
   11aa8:	e5913008 	ldr	r3, [r1, #8]
   11aac:	e1cd40f8 	strd	r4, [sp, #8]
   11ab0:	e591400c 	ldr	r4, [r1, #12]
   11ab4:	e5915010 	ldr	r5, [r1, #16]
   11ab8:	e1cd61f0 	strd	r6, [sp, #16]
   11abc:	e5916014 	ldr	r6, [r1, #20]
   11ac0:	e5917018 	ldr	r7, [r1, #24]
   11ac4:	e1cd81f8 	strd	r8, [sp, #24]
   11ac8:	e591801c 	ldr	r8, [r1, #28]
   11acc:	e5b19020 	ldr	r9, [r1, #32]!
   11ad0:	ea000018 	b	11b38 <memcpy+0x578>
   11ad4:	e1a00000 	nop			; (mov r0, r0)
   11ad8:	e1a00000 	nop			; (mov r0, r0)
   11adc:	e1a00000 	nop			; (mov r0, r0)
   11ae0:	e1a00000 	nop			; (mov r0, r0)
   11ae4:	e1a00000 	nop			; (mov r0, r0)
   11ae8:	e1a00000 	nop			; (mov r0, r0)
   11aec:	e1a00000 	nop			; (mov r0, r0)
   11af0:	e1a00000 	nop			; (mov r0, r0)
   11af4:	e1a00000 	nop			; (mov r0, r0)
   11af8:	e1a00000 	nop			; (mov r0, r0)
   11afc:	e1a00000 	nop			; (mov r0, r0)
   11b00:	f5d1f124 	pld	[r1, #292]	; 0x124
   11b04:	e1cc22f8 	strd	r2, [ip, #40]	; 0x28
   11b08:	e5912024 	ldr	r2, [r1, #36]	; 0x24
   11b0c:	e5913028 	ldr	r3, [r1, #40]	; 0x28
   11b10:	e1cc43f0 	strd	r4, [ip, #48]	; 0x30
   11b14:	e591402c 	ldr	r4, [r1, #44]	; 0x2c
   11b18:	e5915030 	ldr	r5, [r1, #48]	; 0x30
   11b1c:	e1cc63f8 	strd	r6, [ip, #56]	; 0x38
   11b20:	e5916034 	ldr	r6, [r1, #52]	; 0x34
   11b24:	e5917038 	ldr	r7, [r1, #56]	; 0x38
   11b28:	e1ec84f0 	strd	r8, [ip, #64]!	; 0x40
   11b2c:	e591803c 	ldr	r8, [r1, #60]	; 0x3c
   11b30:	e5b19040 	ldr	r9, [r1, #64]!	; 0x40
   11b34:	e25aa040 	subs	sl, sl, #64	; 0x40
   11b38:	e1cc20f8 	strd	r2, [ip, #8]
   11b3c:	e5912004 	ldr	r2, [r1, #4]
   11b40:	e5913008 	ldr	r3, [r1, #8]
   11b44:	e1cc41f0 	strd	r4, [ip, #16]
   11b48:	e591400c 	ldr	r4, [r1, #12]
   11b4c:	e5915010 	ldr	r5, [r1, #16]
   11b50:	e1cc61f8 	strd	r6, [ip, #24]
   11b54:	e5916014 	ldr	r6, [r1, #20]
   11b58:	e5917018 	ldr	r7, [r1, #24]
   11b5c:	e1cc82f0 	strd	r8, [ip, #32]
   11b60:	e591801c 	ldr	r8, [r1, #28]
   11b64:	e5919020 	ldr	r9, [r1, #32]
   11b68:	2affffe4 	bcs	11b00 <memcpy+0x540>
   11b6c:	e1cc22f8 	strd	r2, [ip, #40]	; 0x28
   11b70:	e2811024 	add	r1, r1, #36	; 0x24
   11b74:	e1cc43f0 	strd	r4, [ip, #48]	; 0x30
   11b78:	e1cd40d8 	ldrd	r4, [sp, #8]
   11b7c:	e1cc63f8 	strd	r6, [ip, #56]	; 0x38
   11b80:	e1cd61d0 	ldrd	r6, [sp, #16]
   11b84:	e1cc84f0 	strd	r8, [ip, #64]	; 0x40
   11b88:	e1cd81d8 	ldrd	r8, [sp, #24]
   11b8c:	e28cc048 	add	ip, ip, #72	; 0x48
   11b90:	e21a203f 	ands	r2, sl, #63	; 0x3f
   11b94:	e49da020 	ldr	sl, [sp], #32
   11b98:	1afffe8b 	bne	115cc <memcpy+0xc>
   11b9c:	e12fff1e 	bx	lr
	...

00011bc0 <strlen>:
   11bc0:	b430      	push	{r4, r5}
   11bc2:	f890 f000 	pld	[r0]
   11bc6:	f020 0107 	bic.w	r1, r0, #7
   11bca:	f06f 0c00 	mvn.w	ip, #0
   11bce:	f010 0407 	ands.w	r4, r0, #7
   11bd2:	f891 f020 	pld	[r1, #32]
   11bd6:	f040 8048 	bne.w	11c6a <strlen+0xaa>
   11bda:	f04f 0400 	mov.w	r4, #0
   11bde:	f06f 0007 	mvn.w	r0, #7
   11be2:	e9d1 2300 	ldrd	r2, r3, [r1]
   11be6:	f891 f040 	pld	[r1, #64]	; 0x40
   11bea:	f100 0008 	add.w	r0, r0, #8
   11bee:	fa82 f24c 	uadd8	r2, r2, ip
   11bf2:	faa4 f28c 	sel	r2, r4, ip
   11bf6:	fa83 f34c 	uadd8	r3, r3, ip
   11bfa:	faa2 f38c 	sel	r3, r2, ip
   11bfe:	bb4b      	cbnz	r3, 11c54 <strlen+0x94>
   11c00:	e9d1 2302 	ldrd	r2, r3, [r1, #8]
   11c04:	fa82 f24c 	uadd8	r2, r2, ip
   11c08:	f100 0008 	add.w	r0, r0, #8
   11c0c:	faa4 f28c 	sel	r2, r4, ip
   11c10:	fa83 f34c 	uadd8	r3, r3, ip
   11c14:	faa2 f38c 	sel	r3, r2, ip
   11c18:	b9e3      	cbnz	r3, 11c54 <strlen+0x94>
   11c1a:	e9d1 2304 	ldrd	r2, r3, [r1, #16]
   11c1e:	fa82 f24c 	uadd8	r2, r2, ip
   11c22:	f100 0008 	add.w	r0, r0, #8
   11c26:	faa4 f28c 	sel	r2, r4, ip
   11c2a:	fa83 f34c 	uadd8	r3, r3, ip
   11c2e:	faa2 f38c 	sel	r3, r2, ip
   11c32:	b97b      	cbnz	r3, 11c54 <strlen+0x94>
   11c34:	e9d1 2306 	ldrd	r2, r3, [r1, #24]
   11c38:	f101 0120 	add.w	r1, r1, #32
   11c3c:	fa82 f24c 	uadd8	r2, r2, ip
   11c40:	f100 0008 	add.w	r0, r0, #8
   11c44:	faa4 f28c 	sel	r2, r4, ip
   11c48:	fa83 f34c 	uadd8	r3, r3, ip
   11c4c:	faa2 f38c 	sel	r3, r2, ip
   11c50:	2b00      	cmp	r3, #0
   11c52:	d0c6      	beq.n	11be2 <strlen+0x22>
   11c54:	2a00      	cmp	r2, #0
   11c56:	bf04      	itt	eq
   11c58:	3004      	addeq	r0, #4
   11c5a:	461a      	moveq	r2, r3
   11c5c:	ba12      	rev	r2, r2
   11c5e:	fab2 f282 	clz	r2, r2
   11c62:	eb00 00d2 	add.w	r0, r0, r2, lsr #3
   11c66:	bc30      	pop	{r4, r5}
   11c68:	4770      	bx	lr
   11c6a:	e9d1 2300 	ldrd	r2, r3, [r1]
   11c6e:	f004 0503 	and.w	r5, r4, #3
   11c72:	f1c4 0000 	rsb	r0, r4, #0
   11c76:	ea4f 05c5 	mov.w	r5, r5, lsl #3
   11c7a:	f014 0f04 	tst.w	r4, #4
   11c7e:	f891 f040 	pld	[r1, #64]	; 0x40
   11c82:	fa0c f505 	lsl.w	r5, ip, r5
   11c86:	ea62 0205 	orn	r2, r2, r5
   11c8a:	bf1c      	itt	ne
   11c8c:	ea63 0305 	ornne	r3, r3, r5
   11c90:	4662      	movne	r2, ip
   11c92:	f04f 0400 	mov.w	r4, #0
   11c96:	e7aa      	b.n	11bee <strlen+0x2e>

00011c98 <__call_exitprocs>:
   11c98:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   11c9c:	f244 354c 	movw	r5, #17228	; 0x434c
   11ca0:	f2c0 0501 	movt	r5, #1
   11ca4:	b083      	sub	sp, #12
   11ca6:	f24f 6930 	movw	r9, #63024	; 0xf630
   11caa:	f2c0 0901 	movt	r9, #1
   11cae:	468a      	mov	sl, r1
   11cb0:	9000      	str	r0, [sp, #0]
   11cb2:	6828      	ldr	r0, [r5, #0]
   11cb4:	f7ff fc60 	bl	11578 <__retarget_lock_acquire_recursive>
   11cb8:	f8d9 6000 	ldr.w	r6, [r9]
   11cbc:	b37e      	cbz	r6, 11d1e <__call_exitprocs+0x86>
   11cbe:	f04f 0800 	mov.w	r8, #0
   11cc2:	2701      	movs	r7, #1
   11cc4:	46b3      	mov	fp, r6
   11cc6:	9501      	str	r5, [sp, #4]
   11cc8:	f8db 4004 	ldr.w	r4, [fp, #4]
   11ccc:	1e66      	subs	r6, r4, #1
   11cce:	d425      	bmi.n	11d1c <__call_exitprocs+0x84>
   11cd0:	3401      	adds	r4, #1
   11cd2:	eb0b 0484 	add.w	r4, fp, r4, lsl #2
   11cd6:	f1ba 0f00 	cmp.w	sl, #0
   11cda:	d126      	bne.n	11d2a <__call_exitprocs+0x92>
   11cdc:	6822      	ldr	r2, [r4, #0]
   11cde:	f8db 3004 	ldr.w	r3, [fp, #4]
   11ce2:	3b01      	subs	r3, #1
   11ce4:	42b3      	cmp	r3, r6
   11ce6:	bf0c      	ite	eq
   11ce8:	f8cb 6004 	streq.w	r6, [fp, #4]
   11cec:	f8c4 8000 	strne.w	r8, [r4]
   11cf0:	b182      	cbz	r2, 11d14 <__call_exitprocs+0x7c>
   11cf2:	f8db 1188 	ldr.w	r1, [fp, #392]	; 0x188
   11cf6:	fa07 f306 	lsl.w	r3, r7, r6
   11cfa:	f8db 5004 	ldr.w	r5, [fp, #4]
   11cfe:	420b      	tst	r3, r1
   11d00:	d11c      	bne.n	11d3c <__call_exitprocs+0xa4>
   11d02:	4790      	blx	r2
   11d04:	f8db 2004 	ldr.w	r2, [fp, #4]
   11d08:	f8d9 3000 	ldr.w	r3, [r9]
   11d0c:	42aa      	cmp	r2, r5
   11d0e:	d123      	bne.n	11d58 <__call_exitprocs+0xc0>
   11d10:	455b      	cmp	r3, fp
   11d12:	d121      	bne.n	11d58 <__call_exitprocs+0xc0>
   11d14:	3e01      	subs	r6, #1
   11d16:	3c04      	subs	r4, #4
   11d18:	1c73      	adds	r3, r6, #1
   11d1a:	d1dc      	bne.n	11cd6 <__call_exitprocs+0x3e>
   11d1c:	9d01      	ldr	r5, [sp, #4]
   11d1e:	6828      	ldr	r0, [r5, #0]
   11d20:	b003      	add	sp, #12
   11d22:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   11d26:	f7ff bc2f 	b.w	11588 <__retarget_lock_release_recursive>
   11d2a:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
   11d2e:	4553      	cmp	r3, sl
   11d30:	d0d4      	beq.n	11cdc <__call_exitprocs+0x44>
   11d32:	3e01      	subs	r6, #1
   11d34:	3c04      	subs	r4, #4
   11d36:	1c72      	adds	r2, r6, #1
   11d38:	d1f7      	bne.n	11d2a <__call_exitprocs+0x92>
   11d3a:	e7ef      	b.n	11d1c <__call_exitprocs+0x84>
   11d3c:	f8db 018c 	ldr.w	r0, [fp, #396]	; 0x18c
   11d40:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
   11d44:	4203      	tst	r3, r0
   11d46:	d10b      	bne.n	11d60 <__call_exitprocs+0xc8>
   11d48:	9800      	ldr	r0, [sp, #0]
   11d4a:	4790      	blx	r2
   11d4c:	f8db 2004 	ldr.w	r2, [fp, #4]
   11d50:	f8d9 3000 	ldr.w	r3, [r9]
   11d54:	42aa      	cmp	r2, r5
   11d56:	d0db      	beq.n	11d10 <__call_exitprocs+0x78>
   11d58:	2b00      	cmp	r3, #0
   11d5a:	d0df      	beq.n	11d1c <__call_exitprocs+0x84>
   11d5c:	469b      	mov	fp, r3
   11d5e:	e7b3      	b.n	11cc8 <__call_exitprocs+0x30>
   11d60:	4608      	mov	r0, r1
   11d62:	4790      	blx	r2
   11d64:	e7ce      	b.n	11d04 <__call_exitprocs+0x6c>
   11d66:	bf00      	nop

00011d68 <XUartPs_SendByte>:
   11d68:	e280202c 	add	r2, r0, #44	; 0x2c
   11d6c:	e5923000 	ldr	r3, [r2]
   11d70:	e3130010 	tst	r3, #16
   11d74:	1afffffc 	bne	11d6c <XUartPs_SendByte+0x4>
   11d78:	e5801030 	str	r1, [r0, #48]	; 0x30
   11d7c:	e12fff1e 	bx	lr

00011d80 <XUartPs_RecvByte>:
   11d80:	e280202c 	add	r2, r0, #44	; 0x2c
   11d84:	e5923000 	ldr	r3, [r2]
   11d88:	e3130002 	tst	r3, #2
   11d8c:	1afffffc 	bne	11d84 <XUartPs_RecvByte+0x4>
   11d90:	e5900030 	ldr	r0, [r0, #48]	; 0x30
   11d94:	e6ef0070 	uxtb	r0, r0
   11d98:	e12fff1e 	bx	lr

00011d9c <XUartPs_ResetHw>:
   11d9c:	e3031fff 	movw	r1, #16383	; 0x3fff
   11da0:	e3a0c028 	mov	ip, #40	; 0x28
   11da4:	e580100c 	str	r1, [r0, #12]
   11da8:	e3a02020 	mov	r2, #32
   11dac:	e580c000 	str	ip, [r0]
   11db0:	e3a03000 	mov	r3, #0
   11db4:	e3a0c003 	mov	ip, #3
   11db8:	e580c000 	str	ip, [r0]
   11dbc:	e300c28b 	movw	ip, #651	; 0x28b
   11dc0:	e5801014 	str	r1, [r0, #20]
   11dc4:	e3a0100f 	mov	r1, #15
   11dc8:	e5803004 	str	r3, [r0, #4]
   11dcc:	e5802020 	str	r2, [r0, #32]
   11dd0:	e5802044 	str	r2, [r0, #68]	; 0x44
   11dd4:	e3a02f4a 	mov	r2, #296	; 0x128
   11dd8:	e580301c 	str	r3, [r0, #28]
   11ddc:	e580c018 	str	ip, [r0, #24]
   11de0:	e5801034 	str	r1, [r0, #52]	; 0x34
   11de4:	e5802000 	str	r2, [r0]
   11de8:	e12fff1e 	bx	lr

00011dec <XUartPs_WaitTransmitDone>:
   11dec:	e280002c 	add	r0, r0, #44	; 0x2c
   11df0:	e5903000 	ldr	r3, [r0]
   11df4:	e3130008 	tst	r3, #8
   11df8:	0afffffc 	beq	11df0 <XUartPs_WaitTransmitDone+0x4>
   11dfc:	e5903000 	ldr	r3, [r0]
   11e00:	e3130b02 	tst	r3, #2048	; 0x800
   11e04:	1afffffc 	bne	11dfc <XUartPs_WaitTransmitDone+0x10>
   11e08:	e12fff1e 	bx	lr

00011e0c <outbyte>:
   11e0c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
   11e10:	e592302c 	ldr	r3, [r2, #44]	; 0x2c
   11e14:	e3130010 	tst	r3, #16
   11e18:	1afffffc 	bne	11e10 <outbyte+0x4>
   11e1c:	e5820030 	str	r0, [r2, #48]	; 0x30
   11e20:	e12fff1e 	bx	lr

00011e24 <inbyte>:
   11e24:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
   11e28:	e592302c 	ldr	r3, [r2, #44]	; 0x2c
   11e2c:	e3130002 	tst	r3, #2
   11e30:	1afffffc 	bne	11e28 <inbyte+0x4>
   11e34:	e5920030 	ldr	r0, [r2, #48]	; 0x30
   11e38:	e6ef0070 	uxtb	r0, r0
   11e3c:	e12fff1e 	bx	lr

00011e40 <_exit>:
   11e40:	eafffffe 	b	11e40 <_exit>

00011e44 <xtimerinit>:
   11e44:	e92d4010 	push	{r4, lr}
   11e48:	e30e4944 	movw	r4, #59716	; 0xe944
   11e4c:	e3404001 	movt	r4, #1
   11e50:	e1a00004 	mov	r0, r4
   11e54:	ebffcd95 	bl	54b0 <XilSleepTimer_Init>
   11e58:	e1a00004 	mov	r0, r4
   11e5c:	e8bd4010 	pop	{r4, lr}
   11e60:	eaffcda3 	b	54f4 <XilTickTimer_Init>

Disassembly of section .handoff:

00011e64 <FsblHandoffJtagExit>:
   11e64:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}
   11e68:	ee070fd5 	mcr	15, 0, r0, cr7, cr5, {6}
   11e6c:	f57ff04f 	dsb	sy
   11e70:	f57ff06f 	isb	sy
   11e74:	e3a04000 	mov	r4, #0
   11e78:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
   11e7c:	f57ff06f 	isb	sy

00011e80 <Loop>:
   11e80:	e320f002 	wfe
   11e84:	eafffffd 	b	11e80 <Loop>

00011e88 <FsblHandoffExit>:
   11e88:	e1a0e000 	mov	lr, r0
   11e8c:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}
   11e90:	ee070fd5 	mcr	15, 0, r0, cr7, cr5, {6}
   11e94:	f57ff04f 	dsb	sy
   11e98:	f57ff06f 	isb	sy
   11e9c:	e3a04000 	mov	r4, #0
   11ea0:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
   11ea4:	f57ff06f 	isb	sy
   11ea8:	e12fff1e 	bx	lr
   11eac:	eafffffe 	b	11eac <FsblHandoffExit+0x24>

Disassembly of section .init:

00011ed4 <_init>:
   11ed4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
   11ed6:	bf00      	nop
   11ed8:	bcf8      	pop	{r3, r4, r5, r6, r7}
   11eda:	bc08      	pop	{r3}
   11edc:	469e      	mov	lr, r3
   11ede:	4770      	bx	lr

Disassembly of section .fini:

00011ee0 <_fini>:
   11ee0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
   11ee2:	bf00      	nop
   11ee4:	bcf8      	pop	{r3, r4, r5, r6, r7}
   11ee6:	bc08      	pop	{r3}
   11ee8:	469e      	mov	lr, r3
   11eea:	4770      	bx	lr
