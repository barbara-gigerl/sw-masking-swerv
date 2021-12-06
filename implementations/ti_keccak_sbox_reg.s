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
# START
##########################
not x17, x6
and x18, x6, x10
and x19, x17, x9
and x20, x7, x9
xor x21, x3, x19
xor x22, x18, x20
xor x23, x21, x22  # a0o
and x0, x0, x0     # alignment

not x17, x9
and x18, x9, x13
and x19, x17, x12
and x20, x10, x12
xor x21, x6, x19
xor x22, x18, x20
xor x23, x21, x22  # b0o
and x0, x0, x0     # alignment

not x17, x12
and x18, x12, x16
and x19, x17, x15
and x20, x13, x15
xor x21, x9, x19
xor x22, x18, x20
xor x23, x21, x22  # c0o
and x0, x0, x0     # alignment

not x17, x15
and x18, x15, x4
and x19, x17, x3
and x20, x16, x3
xor x21, x12, x19
xor x22, x18, x20
xor x23, x21, x22  # d0o
and x0, x0, x0     # alignment

not x17, x3
and x18, x3, x7
and x19, x17, x6
and x20, x4, x6
xor x21, x15, x19
xor x22, x18, x20
xor x23, x21, x22  # e0o
and x0, x0, x0     # alignment

##########################
and x21, x0, x0
and x22, x0, x0

not x17, x10
and x18, x10, x11
and x19, x17, x13
and x20, x8, x13
xor x21, x7, x19
xor x22, x18, x20
xor x23, x21, x22  # b1o
and x0, x0, x0     # alignment

not x17, x13
and x18, x13, x14
and x19, x17, x16
and x20, x11, x16
xor x21, x10, x19
xor x22, x18, x20
xor x23, x21, x22  # c1o
and x0, x0, x0     # alignment

not x17, x7        
and x18, x7, x8
and x19, x17, x10
and x20, x5, x10
xor x21, x4, x19
xor x22, x18, x20
xor x23, x21, x22  # a1o
and x0, x0, x0     # alignment

not x17, x16      
and x18, x16, x2
and x19, x17, x4
and x20, x14, x4
xor x21, x13, x19
xor x22, x18, x20
xor x23, x21, x22  # d1o
and x0, x0, x0     # alignment

not x17, x4
and x18, x4, x5
and x19, x17, x7
and x20, x2, x7
xor x21, x16, x19
xor x22, x18, x20
xor x23, x21, x22  # e1o
and x0, x0, x0     # alignment

##########################

and x21, x0, x0
and x22, x0, x0
and x20, x0, x0
and x19, x0, x0


not x17, x8
and x18, x8, x12
and x19, x17, x11
and x20, x9, x11
xor x21, x5, x19
xor x22, x18, x20
xor x23, x21, x22  # b20
and x0, x0, x0     # alignment

not x17, x5
and x18, x5, x9
and x19, x17, x8
and x20, x6, x8
xor x21, x2, x19
xor x22, x18, x20
xor x23, x21, x22  # a20
and x0, x0, x0     # alignment

not x17, x11
and x18, x11, x15
and x19, x17, x14
and x20, x12, x14
xor x21, x8, x19
xor x22, x18, x20
xor x23, x21, x22  # c2o
and x0, x0, x0     # alignment

not x17, x14
and x18, x14, x3
and x19, x17, x2
and x20, x15, x2
xor x21, x11, x19
xor x22, x18, x20
xor x23, x21, x22  # d2o
and x0, x0, x0     # alignment

not x17, x2
and x18, x2, x6
and x19, x17, x5
and x20, x3, x5
xor x21, x14, x19
xor x22, x18, x20
xor x23, x21, x22  # e2o
and x0, x0, x0     # alignment

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