.section .text
.global _start
_start:
and x0, x0, x0
and x0, x0, x0 
li x1, 0x5f555555
csrw 0x7c0, x1
and x0, x0, x0
and x0, x0, x0
rep:
addi x31, x31, 0x1
and x0, x0, x0

and x0, x0, x0
and x0, x0, x0

and x0, x0, x0
and x0, x0, x0

and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

and x0, x0, x0

##########################

# x2 = a0, x3 = a1, x4 = b0, x5 = b1, x6 = R
and x0, x0, x0
and x0, x0, x0

# a0 & b0
and x7, x2, x4
and x0, x0, x0

# (a0 & b0) ^ R
xor x8, x7, x6
and x0, x0, x0


and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

# a1 & b1
and x9, x3, x5
and x0, x0, x0

# (a1 & b1) ^ R
xor x10, x9, x6
and x0, x0, x0

and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

# a0 & b1
and x11, x2, x5
and x0, x0, x0

#  ((a0 & b0) ^ R) ^ (a0 & b1) 
xor x12, x8, x11
and x0, x0, x0


and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

# a1 & b0
and x13, x3, x4
and x0, x0, x0

 #  ((a1 & b1) ^ R) ^ (a1 & b0) 
xor x14, x13, x10



##########################
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
beqz x0, rep