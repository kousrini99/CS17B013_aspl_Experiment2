	.file	1 "ev_od_pr.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	isprime
	.set	nomips16
	.set	nomicromips
	.ent	isprime
	.type	isprime, @function
isprime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16			;add immediately unsigned int; sp <- sp -16; sp- program stack;
	sw	$fp,12($sp)			;store word; [sp +12] <- fp;
	move	$fp,$sp				;store one value into the other; fp <- sp;
	sw	$4,16($fp)
	li	$2,2			# 0x2	;load integer; $2 <- 2;
	sw	$2,4($fp)
	b	$L2				;branch into $L2(function call);
	nop					;no operation;

$L5:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7				;trap if equal; exception handling;if $2 == $0 trap 7;
	div	$0,$3,$2			;divide; $0 <- $3 / 42;
	mfhi	$2				; $2 <- hi;
	bne	$2,$0,$L3			;branch if not equal; if $2 != $0 call function L3;
	nop

	move	$2,$0
	b	$L4
	nop

$L3:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L2:
	lw	$2,16($fp)
	srl	$3,$2,31			;shift right logical;$3 = right shift $2 31 times;
	addu	$2,$3,$2
	sra	$2,$2,1				;shift right arithmetic; $2 <- right shift $2 1 time;
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$3,$2			;set on less than; $2 <- truth value of ($3 < $2);
	beq	$2,$0,$L5			;branch if equal; if $2 == $0 call function L5;
	nop

	li	$2,1			# 0x1
$L4:
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31				;
	nop

	.set	macro
	.set	reorder
	.end	isprime
	.size	isprime, .-isprime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	li	$2,7			# 0x7
	sw	$2,36($fp)
	lw	$3,36($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1			;bitwise or ; $2 <- $2 | [0x1];
	and	$2,$3,$2
	bgez	$2,$L7				;branch on greater than or equal to zero; if $2 >= 0 call function L7;
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3			;bitwise logical or operation; $2 <- $2 | $3;
	addiu	$2,$2,1
$L7:
	beq	$2,$0,$L9
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L10
	nop

	b	$L8
	nop

$L9:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
	b	$L8
	nop

$L10:
	lw	$4,36($fp)
	.option	pic0
	jal	isprime				;jump to subroutine isprime;
	nop

	.option	pic2
	beq	$2,$0,$L11
	nop

	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
	b	$L8
	nop

$L11:
	lw	$2,36($fp)
	addiu	$2,$2,2
	sw	$2,32($fp)
	lw	$2,36($fp)
	addiu	$2,$2,-2
	sw	$2,28($fp)
$L14:
	lw	$4,32($fp)
	.option	pic0
	jal	isprime
	nop

	.option	pic2
	beq	$2,$0,$L12
	nop

	lw	$2,32($fp)
	sw	$2,36($fp)
	b	$L8
	nop

$L12:
	lw	$4,28($fp)
	.option	pic0
	jal	isprime
	nop

	.option	pic2
	beq	$2,$0,$L13
	nop

	lw	$2,28($fp)
	sw	$2,36($fp)
	b	$L8
	nop

$L13:
	lw	$2,32($fp)
	addiu	$2,$2,-2
	sw	$2,32($fp)
	lw	$2,28($fp)
	addiu	$2,$2,-2
	sw	$2,28($fp)
	b	$L14
	nop

$L8:
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31					;jump ; temination statement ;
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
