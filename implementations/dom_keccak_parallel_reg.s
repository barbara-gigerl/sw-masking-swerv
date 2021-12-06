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
# START
# a0n = ~ a0
not x27, x2
not x28, x4
not x29, x6
not x30, x8
not x1, x10

# t1 = a0n & b0
and x17, x27, x4
and x18, x28, x6
and x19, x29, x8
and x20, x30, x10
and x21, x1, x2 #i1


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

# t2 = a0n & b1
# t2 = t2 ^ R 
# t2 = t2 ^ t1 
# t2 = t2 ^ e0 

and x22, x27, x5 
and x24, x29, x9
xor x22, x22, x12
xor x24, x24, x14

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

and x25, x30, x11
xor x25, x25, x15

    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0

and x23, x28, x7  
and x26, x1, x3
xor x23, x23, x13
xor x26, x26, x16

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

xor x22, x22, x17
xor x23, x23, x18
xor x24, x24, x19
xor x25, x25, x20
xor x26, x26, x21

xor x27, x22, x10
xor x28, x23, x2
xor x29, x24, x4
xor x30, x25, x6
xor x1, x26, x8
##########################################
# t4 = a1 & b1
and x17, x0, x0
and x18, x0, x0
and x19, x0, x0
and x20, x0, x0
and x21, x0, x0

and x17, x3, x5
and x18, x5, x7
and x19, x7, x9
and x20, x9, x11
and x21, x11, x3

    and x24, x0, x0
    and x22, x0, x0
    and x25, x0, x0
    and x26, x0, x0
    and x23, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0

# t3 = a1 & b0
# t3 = t3 ^ R
and x22, x3, x4
and x24, x7, x8
xor x22, x22, x12
xor x24, x24, x14

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

and x25, x9, x10
xor x25, x25, x15

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

and x23, x5, x6
and x26, x11, x2
xor x23, x23, x13
xor x26, x26, x16

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

# t3 = t3 ^ t4
xor x22, x22, x17
xor x23, x23, x18
xor x24, x24, x19
xor x25, x25, x20
xor x26, x26, x21

# t3 = t3 ^ e1
xor x22, x22, x11
xor x23, x23, x3
xor x24, x24, x5
xor x25, x25, x7
xor x26, x26, x9

##########################
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


