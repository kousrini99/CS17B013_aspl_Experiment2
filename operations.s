	.file	1 "operations.c"
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
	.frame	$fp,48,$31		# vars= 40, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48            ;add immediately unsigned integer;sp <- sp - 48;sp - stack pointer;
	sw	$fp,44($sp)            ;store word; [sp + 44] <- fp;
	move	$fp,$sp                ;move one value to other;fp <- sp;
	li	$2,10			# 0xa;load integer; $2 is a register; $2 <- 10;
	sw	$2,4($fp)             
	li	$2,3			# 0x3
	sw	$2,8($fp)
	lw	$3,4($fp)             ;load word; $3 <- [fp + 4];
	lw	$2,8($fp)
	addu	$2,$3,$2              ;add unsigned integer;$2 <- $3 + $2;
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	subu	$2,$3,$2              ;subtract unsigned integer; $2 <- $3 - $2;
	sw	$2,16($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	mul	$2,$3,$2              ;multiply; $2 <- $3 * $2;
	sw	$2,20($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	teq	$2,$0,7               ;trap if equal; exception handling;if $2 == $0 trap 7;
	div	$0,$3,$2              ;division; $0 <- $3 / $2;
	mfhi	$2                    ;multiplication and division results are stored in general purpose registers; $2 <- hi;
	mflo	$2                    ; $2 <- lo;
	sw	$2,24($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	sw	$2,28($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	and	$2,$3,$2              ;logical bitwise and operation ; $2 <- $3 & $2;
	sw	$2,32($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	or	$2,$3,$2              ;logical bitwise or operation ; $2 <- $3 | $2;
	sw	$2,36($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,44($sp)
	addiu	$sp,$sp,48
	j	$31                  ;jump ; temination statement ;
	nop                          ;no operation;

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
