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

##########################

#        label_map = ({X2:"share 1", X3: "share 1", a0 a1
#                     X4: "share 2", X5: "share 2", b0 b1
#                     X6: "share 3", X7: "share 3", c0 c1
#                     X8: "share 4", X9: "share 4",  
#                     X10: "share 5", X11: "share 5", 
#                     X12: "mask", X13: "mask", X14: "mask", X15: "mask", X16: "mask" })

# input: a0, a1, b0, b1, e0, e1, R
       # a0: x29
       # a1: x28
       # b0: x27
       # b1: x26
       # R x25
  

not x17, x2
xor x19, x4, x0

xor x22, x10, x0
xor x21, x12, x0

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

xor x18, x3, x0
xor x20, x5, x0

xor x23, x11, x0
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
jal x30, part
##############################################################

and x0, x0, x0
and x0, x0, x0

not x17, x4
xor x19, x6, x0

xor x22, x2, x0
xor x21, x13, x0

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

xor x18, x5, x0
xor x20, x7, x0

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

xor x23, x3, x0

jal x30, part

and x0, x0, x0
and x0, x0, x0
##############################################################
not x17, x6
xor x19, x8, x0

xor x22, x4, x0
xor x21, x14, x0

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

xor x18, x7, x0
xor x20, x9, x0

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

xor x23, x5, x0

jal x30, part


and x0, x0, x0
and x0, x0, x0
##############################################################

not x17, x8
xor x19, x10, x0
xor x22, x6, x0
xor x21, x15, x0

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

xor x18, x9, x0
xor x20, x11, x0

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

xor x23, x7, x0
jal x30, part


and x0, x0, x0
and x0, x0, x0
##############################################################

not x17, x10
xor x19, x2, x0
xor x22, x8, x0
xor x21, x16, x0

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

xor x18, x11, x0
xor x20, x3, x0

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

xor x23, x9, x0
jal x30, part


and x0, x0, x0
and x0, x0, x0
##############################################################

jal x30, end

part: 
and x0, x0, x0
and x24, x17, x20

and x0, x0, x0
xor x24, x24, x21

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

and x25, x18, x19
and x0, x0, x0

xor x25, x25, x21
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

and x27, x17, x19
and x0, x0, x0

xor x27, x27, x24
and x0, x0, x0

xor x27, x27, x22
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

and x28, x18, x20
and x0, x0, x0

xor x28, x28, x25
and x0, x0, x0

xor x28, x28, x23
and x0, x0, x0

jalr x0, x30

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


