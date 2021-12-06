.section .text
.global _start
_start:
and x0, x0, x0
and x0, x0, x0 
li x31, 0x5f555555
csrw 0x7c0, x31
and x0, x0, x0
and x0, x0, x0
and x31, x0, x0

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
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
####################################################
# START
# Compute c0
# tmp0 = (a0 & b0)
and x15, x10, x20
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp1 = (a0 & b1)
# tmp1 = tmp1 ^ R0
and x16, x10, x21
and x0, x0, x0
xor x16, x16, x1
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# tmp2 = (a0 & b2)
# tmp2 = tmp2 ^ R1
and x17, x10, x22
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x17, x17, x2
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# tmp3 = (a0 & b3)
# tmp3 = tmp3 ^ R3
and x18, x10, x23
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x18, x18, x4
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# c0 = tmp0 ^ tmp1
# c0 = c0 ^ tmp2
# c0 = c0 ^ tmp3
xor x15, x15, x16
and x0, x0, x0
xor x15, x15, x17
and x16, x0, x0
xor x15, x15, x18
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# Compute c1 
# c1 = ((a1&b0)^R0) ^ (a1&b1)      ^ ((a1&b2)^R2) ^ ((a1&b3)^R4
# tmp0 = (a1&b0)
# tmp0 = tmp0 ^ R0
and x24, x11, x21
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# tmp1 = (a1&b1)
and x19, x11, x20
and x0, x0, x0
xor x19, x19, x1
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp2 = (a1&b2)
# tmp2 = tmp2 ^ R2
and x25, x11, x22
and x0, x0, x0
xor x25, x25, x3
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp3 = (a1&b3)
# tmp3 = tmp3 ^ R4
and x26, x11, x23
and x0, x0, x0
xor x26, x26, x5
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# c1 = tmp0 ^ tmp1
# c1 = c1 ^ tmp2
# c1 = c1 ^ tmp3
xor x19, x19, x24
and x0, x0, x0
xor x19, x19, x25
and x0, x0, x0
xor x19, x19, x26 
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x26, x0, x0
and x0, x0, x0
and x0, x0, x0
# Compute c2
# c2 = ((a2&b0)^R1) ^ ((a2&b1)^R2) ^ (a2&b2)      ^ ((a2&b3)^R5)
# tmp0 = (a2&b0)
# tmp0 = tmp0 ^ R1
and x27, x12, x20
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x27, x27, x2
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# tmp1 = (a2&b1)
# tmp1  = tmp1 ^ R2
and x28, x12, x21
and x0, x0, x0
xor x28, x28, x3
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp2 = (a2&b2)
and x29, x12, x22
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# tmp3 = (a2&b3)
# tmp3 = tmp3 ^ R5
and x26, x12, x23
and x0, x0, x0
xor x26, x26, x6
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# c2 = tmp0 ^ tmp1
# c2 = c2 ^ tmp2
# c2 = c2 ^ tmp3
xor x27, x27, x28
xor x27, x27, x29
xor x27, x27, x26
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# Compute c3
#c3 = ((a3&b0)^R3) ^ ((a3&b1)^R4) ^ ((a3&b2)^R5) ^ (a3&b3)
# tmp0 = (a3&b0)
# tmp0 = tmp0 ^ R3
and x16, x13, x20
and x0, x0, x0
xor x16, x16, x4
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp1 = (a3&b1)
# tmp1  = tmp1 ^ R4
and x7, x13, x21
and x0, x0, x0
xor x7, x7, x5
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp2 = (a3&b2)
# tmp2 = tmp2 ^ R5
and x8, x13, x22
and x0, x0, x0
xor x8, x8, x6
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# tmp3 = (a3&b3)
and x9, x13, x23
and x0, x0, x0
jal x30, zero
and x0, x0, x0
and x0, x0, x0
# c3 = tmp0 ^ tmp1
# c3 = c3 ^ tmp2
# c3 = c3 ^ tmp3 
xor x16, x16, x7
xor x16, x16, x8
xor x16, x16, x9
####################################################
end: 
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

zero:
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
jalr x0, x30