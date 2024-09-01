
/home/hassan/riscv_dv_out_0/asm_test/Arithmetic_Basic_Test_0.o:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	f14022f3          	csrr	t0,mhartid
80000004:	4301                	li	t1,0
80000006:	00628263          	beq	t0,t1,8000000a <_start+0xa>
8000000a:	00000f97          	auipc	t6,0x0
8000000e:	00cf8f93          	add	t6,t6,12 # 80000016 <h0_start>
80000012:	000f8067          	jr	t6

80000016 <h0_start>:
80000016:	40001b37          	lui	s6,0x40001
8000001a:	12db0b13          	add	s6,s6,301 # 4000112d <_start-0x3fffeed3>
8000001e:	301b1073          	csrw	misa,s6

80000022 <kernel_sp>:
80000022:	0000bf17          	auipc	t5,0xb
80000026:	c62f0f13          	add	t5,t5,-926 # 8000ac84 <kernel_stack_end>

8000002a <trap_vec_init>:
8000002a:	00000b17          	auipc	s6,0x0
8000002e:	21ab0b13          	add	s6,s6,538 # 80000244 <mtvec_handler>
80000032:	000b6b13          	or	s6,s6,0
80000036:	305b1073          	csrw	mtvec,s6

8000003a <mepc_setup>:
8000003a:	00000b17          	auipc	s6,0x0
8000003e:	020b0b13          	add	s6,s6,32 # 8000005a <init>
80000042:	341b1073          	csrw	mepc,s6

80000046 <init_machine_mode>:
80000046:	6b09                	lui	s6,0x2
80000048:	c00b0b13          	add	s6,s6,-1024 # 1c00 <_start-0x7fffe400>
8000004c:	300b1073          	csrw	mstatus,s6
80000050:	4b01                	li	s6,0
80000052:	304b1073          	csrw	mie,s6
80000056:	30200073          	mret

8000005a <init>:
8000005a:	80000037          	lui	zero,0x80000
8000005e:	0001                	nop
80000060:	40b1                	li	ra,12
80000062:	fde90137          	lui	sp,0xfde90
80000066:	88510113          	add	sp,sp,-1915 # fde8f885 <_end+0x7de84bfd>
8000006a:	4189                	li	gp,2
8000006c:	94194237          	lui	tp,0x94194
80000070:	d9c20213          	add	tp,tp,-612 # 94193d9c <_end+0x14189114>
80000074:	f82ba2b7          	lui	t0,0xf82ba
80000078:	6fe28293          	add	t0,t0,1790 # f82ba6fe <_end+0x782afa76>
8000007c:	430d                	li	t1,3
8000007e:	f0a753b7          	lui	t2,0xf0a75
80000082:	64538393          	add	t2,t2,1605 # f0a75645 <_end+0x70a6a9bd>
80000086:	c2bd5437          	lui	s0,0xc2bd5
8000008a:	eff40413          	add	s0,s0,-257 # c2bd4eff <_end+0x42bca277>
8000008e:	44b1                	li	s1,12
80000090:	4531                	li	a0,12
80000092:	fce345b7          	lui	a1,0xfce34
80000096:	a4958593          	add	a1,a1,-1463 # fce33a49 <_end+0x7ce28dc1>
8000009a:	38e47637          	lui	a2,0x38e47
8000009e:	4b960613          	add	a2,a2,1209 # 38e474b9 <_start-0x471b8b47>
800000a2:	2bcbd6b7          	lui	a3,0x2bcbd
800000a6:	ca768693          	add	a3,a3,-857 # 2bcbcca7 <_start-0x54343359>
800000aa:	8c7fe737          	lui	a4,0x8c7fe
800000ae:	0de70713          	add	a4,a4,222 # 8c7fe0de <_end+0xc7f3456>
800000b2:	800007b7          	lui	a5,0x80000
800000b6:	f5a7b837          	lui	a6,0xf5a7b
800000ba:	9e180813          	add	a6,a6,-1567 # f5a7a9e1 <_end+0x75a6fd59>
800000be:	4889                	li	a7,2
800000c0:	f1eb4937          	lui	s2,0xf1eb4
800000c4:	c6c90913          	add	s2,s2,-916 # f1eb3c6c <_end+0x71ea8fe4>
800000c8:	06b8a9b7          	lui	s3,0x6b8a
800000cc:	f0b98993          	add	s3,s3,-245 # 6b89f0b <_start-0x794760f5>
800000d0:	80000a37          	lui	s4,0x80000
800000d4:	4a81                	li	s5,0
800000d6:	80000b37          	lui	s6,0x80000
800000da:	f82c6bb7          	lui	s7,0xf82c6
800000de:	ed3b8b93          	add	s7,s7,-301 # f82c5ed3 <_end+0x782bb24b>
800000e2:	f0d52c37          	lui	s8,0xf0d52
800000e6:	f9bc0c13          	add	s8,s8,-101 # f0d51f9b <_end+0x70d47313>
800000ea:	4c81                	li	s9,0
800000ec:	80000db7          	lui	s11,0x80000
800000f0:	710ffe37          	lui	t3,0x710ff
800000f4:	059e0e13          	add	t3,t3,89 # 710ff059 <_start-0xef00fa7>
800000f8:	bce4ceb7          	lui	t4,0xbce4c
800000fc:	0d3e8e93          	add	t4,t4,211 # bce4c0d3 <_end+0x3ce4144b>
80000100:	4f85                	li	t6,1
80000102:	00006d17          	auipc	s10,0x6
80000106:	d62d0d13          	add	s10,s10,-670 # 80005e64 <user_stack_end>

8000010a <main>:
8000010a:	002f1133          	sll	sp,t5,sp
8000010e:	0282a533          	mulhsu	a0,t0,s0
80000112:	01bddbb3          	srl	s7,s11,s11
80000116:	0810                	add	a2,sp,16
80000118:	f990c193          	xor	gp,ra,-103
8000011c:	002c9a13          	sll	s4,s9,0x2
80000120:	616d                	add	sp,sp,240
80000122:	8dd9                	or	a1,a1,a4
80000124:	4136d833          	sra	a6,a3,s3
80000128:	f727bb13          	sltiu	s6,a5,-142
8000012c:	8279                	srl	a2,a2,0x1e
8000012e:	93fc3893          	sltiu	a7,s8,-1729
80000132:	0001                	nop
80000134:	519d0cb7          	lui	s9,0x519d0
80000138:	41f389b3          	sub	s3,t2,t6
8000013c:	75428693          	add	a3,t0,1876
80000140:	2f8f3eb7          	lui	t4,0x2f8f3
80000144:	cc6e8e93          	add	t4,t4,-826 # 2f8f2cc6 <_start-0x5070d33a>
80000148:	4e01                	li	t3,0
8000014a:	4d81                	li	s11,0
8000014c:	4b81                	li	s7,0
8000014e:	614093b7          	lui	t2,0x61409
80000152:	66d38393          	add	t2,t2,1645 # 6140966d <_start-0x1ebf6993>
80000156:	4c01                	li	s8,0
80000158:	4501                	li	a0,0
8000015a:	4c81                	li	s9,0
8000015c:	4401                	li	s0,0
8000015e:	4981                	li	s3,0
80000160:	0389a4b3          	mulhsu	s1,s3,s8
80000164:	899e                	mv	s3,t2
80000166:	40990b33          	sub	s6,s2,s1
8000016a:	0714                	add	a3,sp,896
8000016c:	40be8433          	sub	s0,t4,a1
80000170:	8e95                	sub	a3,a3,a3
80000172:	00830b33          	add	s6,t1,s0
80000176:	0001                	nop
80000178:	d4bb9037          	lui	zero,0xd4bb9
8000017c:	0258aa33          	mulhsu	s4,a7,t0
80000180:	8e95                	sub	a3,a3,a3
80000182:	02b954b3          	divu	s1,s2,a1
80000186:	02386a33          	rem	s4,a6,gp
8000018a:	6129                	add	sp,sp,192
8000018c:	0094                	add	a3,sp,64
8000018e:	034bac33          	mulhsu	s8,s7,s4
80000192:	9e12                	add	t3,t3,tp
80000194:	02d313b3          	mulh	t2,t1,a3
80000198:	41af0033          	sub	zero,t5,s10
8000019c:	0001                	nop
8000019e:	027fa7b3          	mulhsu	a5,t6,t2
800001a2:	01128c33          	add	s8,t0,a7
800001a6:	8df5                	and	a1,a1,a3
800001a8:	0138ab33          	slt	s6,a7,s3
800001ac:	03788533          	mul	a0,a7,s7
800001b0:	0001                	nop
800001b2:	8ef5                	and	a3,a3,a3
800001b4:	4675                	li	a2,29
800001b6:	4ab5                	li	s5,13
800001b8:	8ec5                	or	a3,a3,s1
800001ba:	8aed                	and	a3,a3,27
800001bc:	0111fcb3          	and	s9,gp,a7
800001c0:	418ed233          	sra	tp,t4,s8
800001c4:	9afd                	and	a3,a3,-1
800001c6:	0e8d                	add	t4,t4,3
800001c8:	002043b3          	xor	t2,zero,sp
800001cc:	4042d233          	sra	tp,t0,tp
800001d0:	209fa7b7          	lui	a5,0x209fa
800001d4:	03e9a5b3          	mulhsu	a1,s3,t5
800001d8:	40565813          	sra	a6,a2,0x5
800001dc:	03e2d7b3          	divu	a5,t0,t5
800001e0:	01d8d793          	srl	a5,a7,0x1d
800001e4:	02f92333          	mulhsu	t1,s2,a5
800001e8:	4fa78893          	add	a7,a5,1274 # 209fa4fa <_start-0x5f605b06>
800001ec:	8ed5                	or	a3,a3,a3
800001ee:	9de63913          	sltiu	s2,a2,-1570
800001f2:	1094                	add	a3,sp,96
800001f4:	401b0ab3          	sub	s5,s6,ra
800001f8:	013168b3          	or	a7,sp,s3
800001fc:	8eb5                	xor	a3,a3,a3
800001fe:	037a6033          	rem	zero,s4,s7
80000202:	623d                	lui	tp,0xf
80000204:	0373abb3          	mulhsu	s7,t2,s7
80000208:	8fe9                	and	a5,a5,a0
8000020a:	de7ae893          	or	a7,s5,-537
8000020e:	022523b3          	mulhsu	t2,a0,sp
80000212:	0b66                	sll	s6,s6,0x19
80000214:	0526e593          	or	a1,a3,82
80000218:	62a5                	lui	t0,0x9
8000021a:	0309a333          	mulhsu	t1,s3,a6
8000021e:	86f9                	sra	a3,a3,0x1e
80000220:	2185f3b7          	lui	t2,0x2185f
80000224:	00000f97          	auipc	t6,0x0
80000228:	00cf8f93          	add	t6,t6,12 # 80000230 <test_done>
8000022c:	000f8067          	jr	t6

80000230 <test_done>:
80000230:	4185                	li	gp,1
80000232:	00000073          	ecall

80000236 <write_tohost>:
80000236:	00001f17          	auipc	t5,0x1
8000023a:	dc3f2523          	sw	gp,-566(t5) # 80001000 <tohost>

8000023e <_exit>:
8000023e:	bfe5                	j	80000236 <write_tohost>

80000240 <instr_end>:
80000240:	0001                	nop
80000242:	0001                	nop

80000244 <mtvec_handler>:
80000244:	340d1d73          	csrrw	s10,mscratch,s10
80000248:	000f0d33          	add	s10,t5,zero
8000024c:	f84d0d13          	add	s10,s10,-124
80000250:	001d2223          	sw	ra,4(s10)
80000254:	002d2423          	sw	sp,8(s10)
80000258:	003d2623          	sw	gp,12(s10)
8000025c:	004d2823          	sw	tp,16(s10)
80000260:	005d2a23          	sw	t0,20(s10)
80000264:	006d2c23          	sw	t1,24(s10)
80000268:	007d2e23          	sw	t2,28(s10)
8000026c:	028d2023          	sw	s0,32(s10)
80000270:	029d2223          	sw	s1,36(s10)
80000274:	02ad2423          	sw	a0,40(s10)
80000278:	02bd2623          	sw	a1,44(s10)
8000027c:	02cd2823          	sw	a2,48(s10)
80000280:	02dd2a23          	sw	a3,52(s10)
80000284:	02ed2c23          	sw	a4,56(s10)
80000288:	02fd2e23          	sw	a5,60(s10)
8000028c:	050d2023          	sw	a6,64(s10)
80000290:	051d2223          	sw	a7,68(s10)
80000294:	052d2423          	sw	s2,72(s10)
80000298:	053d2623          	sw	s3,76(s10)
8000029c:	054d2823          	sw	s4,80(s10)
800002a0:	055d2a23          	sw	s5,84(s10)
800002a4:	056d2c23          	sw	s6,88(s10)
800002a8:	057d2e23          	sw	s7,92(s10)
800002ac:	078d2023          	sw	s8,96(s10)
800002b0:	079d2223          	sw	s9,100(s10)
800002b4:	07ad2423          	sw	s10,104(s10)
800002b8:	07bd2623          	sw	s11,108(s10)
800002bc:	07cd2823          	sw	t3,112(s10)
800002c0:	07dd2a23          	sw	t4,116(s10)
800002c4:	07ed2c23          	sw	t5,120(s10)
800002c8:	07fd2e23          	sw	t6,124(s10)
800002cc:	30002b73          	csrr	s6,mstatus
800002d0:	34202b73          	csrr	s6,mcause
800002d4:	01fb5b13          	srl	s6,s6,0x1f
800002d8:	140b1a63          	bnez	s6,8000042c <mmode_intr_handler>

800002dc <mmode_exception_handler>:
800002dc:	34102b73          	csrr	s6,mepc
800002e0:	34202b73          	csrr	s6,mcause
800002e4:	44ad                	li	s1,11
800002e6:	009b0d63          	beq	s6,s1,80000300 <ecall_handler>
800002ea:	4489                	li	s1,2
800002ec:	0a9b0463          	beq	s6,s1,80000394 <illegal_instr_handler>
800002f0:	343024f3          	csrr	s1,mtval
800002f4:	00000f97          	auipc	t6,0x0
800002f8:	f3cf8f93          	add	t6,t6,-196 # 80000230 <test_done>
800002fc:	000f80e7          	jalr	t6

80000300 <ecall_handler>:
80000300:	00000b17          	auipc	s6,0x0
80000304:	d00b0b13          	add	s6,s6,-768 # 80000000 <_start>
80000308:	000b2023          	sw	zero,0(s6)
8000030c:	001b2223          	sw	ra,4(s6)
80000310:	002b2423          	sw	sp,8(s6)
80000314:	003b2623          	sw	gp,12(s6)
80000318:	004b2823          	sw	tp,16(s6)
8000031c:	005b2a23          	sw	t0,20(s6)
80000320:	006b2c23          	sw	t1,24(s6)
80000324:	007b2e23          	sw	t2,28(s6)
80000328:	028b2023          	sw	s0,32(s6)
8000032c:	029b2223          	sw	s1,36(s6)
80000330:	02ab2423          	sw	a0,40(s6)
80000334:	02bb2623          	sw	a1,44(s6)
80000338:	02cb2823          	sw	a2,48(s6)
8000033c:	02db2a23          	sw	a3,52(s6)
80000340:	02eb2c23          	sw	a4,56(s6)
80000344:	02fb2e23          	sw	a5,60(s6)
80000348:	050b2023          	sw	a6,64(s6)
8000034c:	051b2223          	sw	a7,68(s6)
80000350:	052b2423          	sw	s2,72(s6)
80000354:	053b2623          	sw	s3,76(s6)
80000358:	054b2823          	sw	s4,80(s6)
8000035c:	055b2a23          	sw	s5,84(s6)
80000360:	056b2c23          	sw	s6,88(s6)
80000364:	057b2e23          	sw	s7,92(s6)
80000368:	078b2023          	sw	s8,96(s6)
8000036c:	079b2223          	sw	s9,100(s6)
80000370:	07ab2423          	sw	s10,104(s6)
80000374:	07bb2623          	sw	s11,108(s6)
80000378:	07cb2823          	sw	t3,112(s6)
8000037c:	07db2a23          	sw	t4,116(s6)
80000380:	07eb2c23          	sw	t5,120(s6)
80000384:	07fb2e23          	sw	t6,124(s6)
80000388:	00000f97          	auipc	t6,0x0
8000038c:	eaef8f93          	add	t6,t6,-338 # 80000236 <write_tohost>
80000390:	000f8067          	jr	t6

80000394 <illegal_instr_handler>:
80000394:	34102b73          	csrr	s6,mepc
80000398:	0b11                	add	s6,s6,4
8000039a:	341b1073          	csrw	mepc,s6
8000039e:	004d2083          	lw	ra,4(s10)
800003a2:	008d2103          	lw	sp,8(s10)
800003a6:	00cd2183          	lw	gp,12(s10)
800003aa:	010d2203          	lw	tp,16(s10)
800003ae:	014d2283          	lw	t0,20(s10)
800003b2:	018d2303          	lw	t1,24(s10)
800003b6:	01cd2383          	lw	t2,28(s10)
800003ba:	020d2403          	lw	s0,32(s10)
800003be:	024d2483          	lw	s1,36(s10)
800003c2:	028d2503          	lw	a0,40(s10)
800003c6:	02cd2583          	lw	a1,44(s10)
800003ca:	030d2603          	lw	a2,48(s10)
800003ce:	034d2683          	lw	a3,52(s10)
800003d2:	038d2703          	lw	a4,56(s10)
800003d6:	03cd2783          	lw	a5,60(s10)
800003da:	040d2803          	lw	a6,64(s10)
800003de:	044d2883          	lw	a7,68(s10)
800003e2:	048d2903          	lw	s2,72(s10)
800003e6:	04cd2983          	lw	s3,76(s10)
800003ea:	050d2a03          	lw	s4,80(s10)
800003ee:	054d2a83          	lw	s5,84(s10)
800003f2:	058d2b03          	lw	s6,88(s10)
800003f6:	05cd2b83          	lw	s7,92(s10)
800003fa:	060d2c03          	lw	s8,96(s10)
800003fe:	064d2c83          	lw	s9,100(s10)
80000402:	068d2d03          	lw	s10,104(s10)
80000406:	06cd2d83          	lw	s11,108(s10)
8000040a:	070d2e03          	lw	t3,112(s10)
8000040e:	074d2e83          	lw	t4,116(s10)
80000412:	078d2f03          	lw	t5,120(s10)
80000416:	07cd2f83          	lw	t6,124(s10)
8000041a:	07cd0d13          	add	s10,s10,124
8000041e:	000d0f33          	add	t5,s10,zero
80000422:	340d1d73          	csrrw	s10,mscratch,s10
80000426:	30200073          	mret

8000042a <pt_fault_handler>:
8000042a:	0001                	nop

8000042c <mmode_intr_handler>:
8000042c:	30002b73          	csrr	s6,mstatus
80000430:	30402b73          	csrr	s6,mie
80000434:	34402b73          	csrr	s6,mip
80000438:	344b3b73          	csrrc	s6,mip,s6
8000043c:	004d2083          	lw	ra,4(s10)
80000440:	008d2103          	lw	sp,8(s10)
80000444:	00cd2183          	lw	gp,12(s10)
80000448:	010d2203          	lw	tp,16(s10)
8000044c:	014d2283          	lw	t0,20(s10)
80000450:	018d2303          	lw	t1,24(s10)
80000454:	01cd2383          	lw	t2,28(s10)
80000458:	020d2403          	lw	s0,32(s10)
8000045c:	024d2483          	lw	s1,36(s10)
80000460:	028d2503          	lw	a0,40(s10)
80000464:	02cd2583          	lw	a1,44(s10)
80000468:	030d2603          	lw	a2,48(s10)
8000046c:	034d2683          	lw	a3,52(s10)
80000470:	038d2703          	lw	a4,56(s10)
80000474:	03cd2783          	lw	a5,60(s10)
80000478:	040d2803          	lw	a6,64(s10)
8000047c:	044d2883          	lw	a7,68(s10)
80000480:	048d2903          	lw	s2,72(s10)
80000484:	04cd2983          	lw	s3,76(s10)
80000488:	050d2a03          	lw	s4,80(s10)
8000048c:	054d2a83          	lw	s5,84(s10)
80000490:	058d2b03          	lw	s6,88(s10)
80000494:	05cd2b83          	lw	s7,92(s10)
80000498:	060d2c03          	lw	s8,96(s10)
8000049c:	064d2c83          	lw	s9,100(s10)
800004a0:	068d2d03          	lw	s10,104(s10)
800004a4:	06cd2d83          	lw	s11,108(s10)
800004a8:	070d2e03          	lw	t3,112(s10)
800004ac:	074d2e83          	lw	t4,116(s10)
800004b0:	078d2f03          	lw	t5,120(s10)
800004b4:	07cd2f83          	lw	t6,124(s10)
800004b8:	07cd0d13          	add	s10,s10,124
800004bc:	000d0f33          	add	t5,s10,zero
800004c0:	340d1d73          	csrrw	s10,mscratch,s10
800004c4:	30200073          	mret

800004c8 <kernel_instr_end>:
800004c8:	0001                	nop
800004ca:	0001                	nop
