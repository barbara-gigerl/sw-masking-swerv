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

and x8, x3, x6
and x0, x0, x0

and x9, x3, x7
and x0, x0, x0

and x10, x4, x6
and x0, x0, x0

xor x11, x8, x9
and x0, x0, x0

xor x12, x11, x10
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

and x13, x2, x5
and x0, x0, x0

and x14, x2, x6
and x0, x0, x0

and x15, x3, x5
and x0, x0, x0

xor x16, x13, x14
and x0, x0, x0

xor x17, x16, x15
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

and x18, x4, x7
and x0, x0, x0

and x19, x4, x5
and x0, x0, x0

and x20, x2, x7
and x0, x0, x0

xor x21, x18, x19
and x0, x0, x0

xor x22, x20, x21
and x0, x0, x0




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