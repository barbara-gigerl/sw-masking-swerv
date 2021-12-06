#define a0 0x8
#define a1 0x10
#define b0 0xc
#define b1 0x14
#define c0 0x18
#define c1 0x20
#define d0 0x1c
#define d1 0x24
#define e0 0x28
#define e1 0x30
#define Ra 0x48
#define Rb 0x4c
#define Rc 0x50
#define Rd 0x54
#define Re 0x58
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
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)     
lw x0, (x0)     
lw x0, (x0) 
lw x0, (x0)
sw x0, (x0)
fence 
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
#################################################### 
ori x1, x0, a0
ori x2, x0, a1
ori x3, x0, b0
ori x4, x0, b1
ori x5, x0, Ra
ori x6, x0, e0
ori x7, x0, e1
jal x30, load_shares
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
jal x30, part
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
##########################
ori x1, x0, b0
ori x2, x0, b1
ori x3, x0, c0
ori x4, x0, c1
ori x5, x0, Rb
ori x6, x0, a0
ori x7, x0, a1
jal x30, load_shares
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
jal x30, part
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
##########################
ori x1, x0, c0
ori x2, x0, c1
ori x3, x0, d0
ori x4, x0, d1
ori x5, x0, Rc
ori x6, x0, b0
ori x7, x0, b1
jal x30, load_shares
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
jal x30, part
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
##########################
ori x1, x0, d0
ori x2, x0, d1
ori x3, x0, e0
ori x4, x0, e1
ori x5, x0, Rd
ori x6, x0, c0
ori x7, x0, c1
jal x30, load_shares
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
jal x30, part
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
##########################
ori x1, x0, e0
ori x2, x0, e1
ori x3, x0, a0
ori x4, x0, a1
ori x5, x0, Re
ori x6, x0, d0
ori x7, x0, d1
jal x30, load_shares
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
jal x30, part
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
##########################
jal x30, end

load_shares:
fence
lw x17, (x1)
lw x19, (x3)
lw x21, (x5)
lw x0, (x0)
lw x22, (x6)
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
fence
lw x18, (x2)
lw x20, (x4)
lw x23, (x7)
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
#lw x0, (x0)
#lw x0, (x0)
#lw x0, (x0)
jalr x0, x30

part: 
# x17: a0n
# x18: a1
# x19: b0
# x20: b1
# x21: R
# x22: e0
# x23: e1
and x0, x0, x0
not x17, x17
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

