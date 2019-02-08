	.file	1 "prime_gen.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,256,$31		# vars= 224, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-256                    ;add immediately unsigned int; sp <- sp -256; sp- program stack;
	sw	$31,252($sp)                    ;store word;[sp + 252] <- $31;
	sw	$fp,248($sp)
	move	$fp,$sp                         ;stores one value to the other; fp <- sp;
	lui	$28,%hi(__gnu_local_gp)         ;load upper immediate; %hi is loaded into top 16 bits of $28;
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2) 			;load word; $2 <- [$2 + 0];
	sw	$2,244($fp)
	li	$2,2			# 0x2   ;load integer; $2 <- 2;
	sw	$2,44($fp)
	li	$2,3			# 0x3
	sw	$2,28($fp)
	li	$2,1			# 0x1
	sw	$2,32($fp)
	sw	$0,40($fp)			
	b	$L2				;branch into $L2(function call);
	nop					;no operation;

$L8:
	li	$2,2			# 0x2
	sw	$2,36($fp)
	b	$L3
	nop

$L6:
	lw	$3,28($fp)
	lw	$2,36($fp)
	teq	$2,$0,7				;trap if equal; exception handling;if $2 == $0 trap 7;
	div	$0,$3,$2			;division; $0 <- $3 / $2;
	mfhi	$2                              ;$2 <- hi;
	bne	$2,$0,$L4                       ;
	nop

	li	$2,1			# 0x1
	sw	$2,40($fp)
	b	$L5
	nop

$L4:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L3:
	lw	$2,28($fp)
	srl	$3,$2,31 			;shift right logical; $3 <- shift $2 right 31 times;
	addu	$2,$3,$2			;add unsigned int; $2 <- $3 + $2;
	sra	$2,$2,1				;shift right arithmetic; $2 <- shift $2 right 1 time;
	move	$3,$2
	lw	$2,36($fp)
	slt	$2,$3,$2			;set on less than; $2 <- truth value of($3 < $2);
	beq	$2,$0,$L6			;branch if equal; if $2 == $3 call function L6;
	nop

$L5:
	lw	$2,40($fp)
	bne	$2,$0,$L7
	nop

	lw	$2,32($fp)
	addiu	$3,$2,1
	sw	$3,32($fp)
	sll	$2,$2,2				;shift left logical; $2 <- ($2 left shifted by two positions);
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$3,28($fp)
	sw	$3,-204($2)
$L7:
	sw	$0,40($fp)
	lw	$2,28($fp)
	addiu	$2,$2,2
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,100
	bne	$2,$0,$L8
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,244($fp)
	lw	$3,0($3)
	beq	$4,$3,$L10
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25				;jump to subroutine $25;
	nop

$L10:
	move	$sp,$fp
	lw	$31,252($sp)
	lw	$fp,248($sp)
	addiu	$sp,$sp,256
	j	$31				;jump ; temination statement ;
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
