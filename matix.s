	.file	1 "matix.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.word	1
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
	.align	2
$LC1:
	.word	3
	.word	3
	.word	3
	.word	2
	.word	2
	.word	2
	.word	1
	.word	1
	.word	1
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,160,$31		# vars= 128, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160				;add immediately unsigned int; sp <- sp -160; sp- program stack;
	sw	$31,156($sp)     			;store word; [sp + 1560 <- $31;
	sw	$fp,152($sp)
	move	$fp,$sp    				;store one value in other; fp <- sp;
	lui	$28,%hi(__gnu_local_gp)			;load upper immediate; %hi is loaded into top 16 bits of $28;
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)				;load word; $2 <- [$2 + 0];
	sw	$2,148($fp)
	lui	$2,%hi($LC0)
	addiu	$3,$fp,40
	addiu	$2,$2,%lo($LC0)
	li	$4,36			# 0x24		;load integer; $4 <- 36;
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25					;jump to subroutine $25;
	nop						;no operation;

	lw	$28,16($fp)
	lui	$2,%hi($LC1)
	addiu	$3,$fp,76
	addiu	$2,$2,%lo($LC1)
	li	$4,36			# 0x24
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,3			# 0x3
	sw	$2,36($fp)
	sw	$0,28($fp)
	b	$L2					;branch into $L2(function call);

$L5:
	sw	$0,32($fp)
	b	$L3
	nop

$L4:
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1					;shift left logical; $2 <- ($2 left shifted by one positions);
	addu	$2,$2,$3				;add unsigned; $2 <- $2 + $3;
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,152
	addu	$2,$3,$2
	lw	$4,-112($2)
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,152
	addu	$2,$3,$2
	lw	$2,-76($2)
	addu	$4,$4,$2
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,152
	addu	$2,$3,$2
	sw	$4,-40($2)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L3:
	lw	$3,32($fp)
	lw	$2,36($fp)				
	slt	$2,$3,$2					;set on less than; $2 <- truth value of($3 < $2);
	bne	$2,$0,$L4					;branch if not equal; if $2 != $0 call function L4;
	nop					

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$3,28($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L5
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,148($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7					;branch if equal ; if $4 == $3 call function L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25						
	nop

$L7:
	move	$sp,$fp
	lw	$31,156($sp)
	lw	$fp,152($sp)
	addiu	$sp,$sp,160
	j	$31						;jump ; temination statement ;
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
