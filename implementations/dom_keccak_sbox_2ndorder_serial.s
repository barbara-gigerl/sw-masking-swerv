#define a0 0x8
#define a1 0x10
#define a2 0x18

#define b0 0xc
#define b1 0x14
#define b2 0x1c

#define c0 0x20
#define c1 0x28
#define c2 0x30

#define d0 0x24
#define d1 0x2c
#define d2 0x34

#define e0 0x38
#define e1 0x40
#define e2 0x48

#define Ra0 0x88
#define Rb0 0x8c
#define Rc0 0xa0
#define Rd0 0xa4
#define Re0 0xb8

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
#################################################### 

li x20, a0
li x21, b0
li x22, e0
li x23, Ra0
jal x24, part

li x20, b0
li x21, c0
li x22, a0
li x23, Rb0
jal x24, part

li x20, c0
li x21, d0
li x22, b0
li x23, Rc0
jal x24, part

li x20, d0
li x21, e0
li x22, c0
li x23, Rd0
jal x24, part

li x20, e0
li x21, a0
li x22, d0
li x23, Re0
jal x24, part

  
####################################################
end: 
and x0, x0, x0
beqz x0, rep

part:
jal x29, load_data
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
jal x29, dom_and2
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
jal x29, clear_regs
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
jalr x0, x24

load_data:
fence
lw x1, (x20)
lw x11, (x21)
lw x26, (x22)
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
fence
lw x2, 8(x20)
lw x12, 8(x21)
lw x27, 8(x22)
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
fence
lw x3, 16(x20)
lw x13, 16(x21)
lw x28, 16(x22)
fence
lw x0, (x0)
lw x0, (x0)
lw x0, (x0)
fence
lw x4, (x23)
fence 
lw x0, (x0)
fence
lw x5, 8(x23)
fence
lw x0, (x0)
fence
lw x30, 16(x23)
fence
lw x0, (x0)
fence
jalr x0, x29 
dom_and2:
#input: 0x8 = x1, 0x10 = x2, 0x18 = x3
# 0xc = x11, 0x14 = x12, 0x1c = x13
# R0 = x4, R1 =x5, R2 = x30

#output: 0x20 = x6, 0x28 = x9, 0x30 = x15
#tmp: x6, x7, x8, x9, x14, x6, x17, x18, x19
#address:x29
# START
not x1, x1
and x0, x0, x0
and x18, x1, x12
and x0, x0, x0
xor x7, x18, x4
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x6, x1, x11
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x19, x1, x13
and x0, x0, x0
xor x8, x19, x5
and x0, x0, x0
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

xor x6, x6, x7
and x0, x0, x0
xor x6, x6, x8
and x0, x0, x0
xor x6, x6, x26
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# bq = bx&ay xor bx&by xor bx&cy
# 0x30 = (0x18&0x14 xor R1) xor 0x18&0x1c xor (0x18&b3 xor R2)
and x9, x2, x11
and x0, x0, x0
xor x9, x9, x4
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x10, x2, x12
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x14, x2, x13
xor x14, x14, x30
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x9, x9, x10
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x9, x9, x14
and x0, x0, x0
xor x9, x9, x27
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
# cq = cy&ay xor cx&by xor cx&cy
# c3 = (a3&0x14 xor R1) xor (a3&0x1c xor R) xor a3&b3
and x15, x3, x11
and x0, x0, x0
xor x15, x15, x5
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x17, x3, x13
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x21, x3, x12
xor x16, x21, x30
and x0, x0, x0
jal x20, zero
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

xor x15, x15, x16
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
xor x15, x15, x17
and x0, x0, x0
xor x15, x15, x28
jalr x0, x29

clear_regs:
mv x1, x0
mv x2, x0
mv x3, x0
mv x4, x0
mv x5, x0
mv x6, x0
mv x7, x0
mv x8, x0
mv x9, x0
mv x10, x0
mv x11, x0
mv x12, x0
mv x13, x0
mv x14, x0
mv x15, x0
mv x16, x0
mv x17, x0
mv x18, x0
mv x19, x0
mv x21, x0
mv x26, x0
mv x27, x0
mv x28, x0
mv x30, x0
jalr x0, x29

zero:
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
jalr x0, x20