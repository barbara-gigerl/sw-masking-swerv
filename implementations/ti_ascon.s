#define a0_lsb 0x8
#define b0_lsb 0x20
#define c0_lsb 0x48
#define d0_lsb 0x60
#define e0_lsb 0x88

#define a0_msb 0xc
#define b0_msb 0x24
#define c0_msb 0x4c
#define d0_msb 0x64
#define e0_msb 0x8c

#define a1_lsb 0x10
#define b1_lsb 0x28
#define c1_lsb 0x50
#define d1_lsb 0x68
#define e1_lsb 0x90

#define a1_msb 0x14
#define b1_msb 0x2c
#define c1_msb 0x54
#define d1_msb 0x6c
#define e1_msb 0x94

#define a2_lsb 0x18
#define b2_lsb 0x30
#define c2_lsb 0x58
#define d2_lsb 0x70
#define e2_lsb 0x98

#define a2_msb 0x1c
#define b2_msb 0x34
#define c2_msb 0x5c
#define d2_msb 0x74
#define e2_msb 0x9c


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
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
    

##########################

li x17, a0_lsb
li x18, e0_lsb
jal x29, load_data
xori x8, x8, 0x4b
jal x29, sbox
and x0, x0, x0
and x0, x0, x0
li x17, a0_lsb
li x18, e0_lsb
jal x29, store_data

li x17, a0_msb
li x18, e0_msb
jal x29, load_data
jal x29, sbox
and x0, x0, x0
and x0, x0, x0
li x17, a0_msb
li x18, e0_msb
jal x29, store_data


jal x29, clear_regs



li x19, a0_lsb
li x20, b0_lsb
li x21, c0_lsb
li x22, d0_lsb
li x23, e0_lsb
jal x30, linpart
li x19, a1_lsb
li x20, b1_lsb
li x21, c1_lsb
li x22, d1_lsb
li x23, e1_lsb
jal x30, linpart
li x19, a2_lsb
li x20, b2_lsb
li x21, c2_lsb
li x22, d2_lsb
li x23, e2_lsb
jal x30, linpart
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0
and x0, x0, x0

end: 
and x0, x0, x0
beqz x0, rep


######################################################



linpart:
    jal x29, load_share
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    li x25, 0xffffffff
    li x26, 0x3ff
    li x28, 0xfffff
    li x24, 0x1fffffff
    li x27, 0x3f
    jal x29, lindiff
    jal x29, store_share
    jal x29, clear_regs
    jalr x0, x30


clear_regs:
    and x1, x0, x0
    and x2, x0, x0
    and x3, x0, x0
    and x4, x0, x0
    and x5, x0, x0
    and x6, x0, x0
    and x7, x0, x0
    and x8, x0, x0
    and x9, x0, x0
    and x10, x0, x0
    and x11, x0, x0
    and x12, x0, x0
    and x13, x0, x0
    and x14, x0, x0
    and x15, x0, x0
    and x16, x0, x0
    and x17, x0, x0
    and x18, x0, x0
    jalr x0, x29

lindiff: 
   
    
    # msb x1
    # lsb x2 -->a
    # rotr19
    and x11, x2, x28
    slli x11, x11, 13 
    srli x12, x1, 19
    or x11, x11, x12
    and x11, x11, x25

    and x13, x1, x28
    slli x13, x13, 13
    srli x14, x2, 19
    or x13, x13, x14
    and x13, x13, x25

    # rotr28
    and x15, x2, x24
    slli x15, x15, 4
    srli x16, x1, 28
    or x15, x15, x16 
    and x15, x15, x25

    and x17, x1, x24
    slli x17, x17, 4
    srli x18, x2, 28
    or x17, x17, x18
    and x17, x17, x25

    xor x1, x1, x11
    xor x1, x1, x15
    xor x2, x2, x13
    xor x2, x2, x17
    #######

    # msb x3
    # lsb x4 --> b
    # rotr61
    and x11, x3, x24
    slli x11, x11, 3
    srli x12, x4, 29
    or x11, x11, x12
    and x11, x11, x25
    and x13, x4, x24
    slli x13, x13, 3
    srli x14, x3, 29
    or x13, x13, x14
    and x13, x13, x25

    # rotr39
    li x24, 0x7f
    and x15, x3, x24
    slli x15, x15, 25
    srli x16, x4, 7
    or x15, x15, x16
    and x15, x15, x25
    and x17, x4, x24
    slli x17, x17, 25
    srli x18, x3, 7
    or x17, x17, x18
    and x17, x17, x25

    xor x3, x3, x11
    xor x3, x3, x15
    xor x4, x4, x13
    xor x4, x4, x17
    ########

    # msb x5
    # lsb x6 --> c

    # rotr1
    andi x11, x6, 0x1
    slli x11, x11, 31
    srli x12, x5, 1
    or x11, x11, x12
    and x11, x11, x25

    andi x13, x5, 0x1
    slli x13, x13, 31
    srli x14, x6, 1
    or x13, x13, x14
    and x13, x13, x25

    # rotr6
    and x15, x6, x27
    slli x15, x15, 26
    srli x16, x5, 6
    or x15, x15, x16
    and x15, x15, x25

    and x17, x5, x27  
    slli x17, x17, 26
    srli x18, x6, 6
    or x17, x17, x18
    and x17, x17, x25

    xor x5, x5, x11
    xor x5, x5, x15
    xor x6, x6, x13
    xor x6, x6, x17

    #########

    # msb  x7
    # lsb  x8  --> d
    # rotr10
    and x11, x8, x26
    slli x11, x11, 22
    srli x12, x7, 10
    or x11, x11, x12
    and x11, x11, x25

    and x13, x7, x26
    slli x13, x13, 22
    srli x14, x8, 10
    or x13, x13, x14
    and x13, x13, x25

    # rotr17
    li x27, 0x1ffff
    and x15, x8, x27
    slli x15, x15, 15
    srli x16, x7, 17
    or x15, x15, x16
    and x15, x15, x25

    and x17, x7, x27
    slli x17, x17, 15
    srli x18, x8, 17
    or x17, x17, x18
    and x17, x17, x25

    xor x7, x7, x11
    xor x7, x7, x15
    xor x8, x8, x13
    xor x8, x8, x17


    ########

    # msb  x9
    # lsb  x10 --> e
    # rotr7
    and x11, x10, x24
    slli x11, x11, 25
    srli x12, x9, 7
    or x11, x11, x12
    and x11, x11, x25

    and x13, x9, x24
    slli x13, x13, 25
    srli x14, x10, 7
    or x13, x13, x14
    and x13, x13, x25
    
    # rotr41
    li x28, 0x1ff
    and x15, x9, x28
    slli x15, x15, 23
    srli x16, x10, 9
    or x15, x15, x16
    and x15, x15, x25

    and x17, x10, x28
    slli x17, x17, 23
    srli x18, x9, 9
    or x17, x17, x18
    and x17, x17, x25

    xor x9, x9, x11
    xor x9, x9, x15
    xor x10, x10, x13
    xor x10, x10, x17

    #########

    jalr x0, x29    

load_data:
    lw x2, (x17)
    lw x5, 24(x17)
    lw x8, 64(x17)
    lw x11, 88(x17)
    lw x14, (x18)
    addi x17, x17, 8
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    fence
    lw x3, (x17)
    lw x6, 24(x17)
    lw x9, 64(x17)
    lw x12, 88(x17)
    lw x15, 8(x18)
    addi x17, x17, 8
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    fence
    lw x4, (x17)
    lw x7, 24(x17)
    lw x10, 64(x17)
    lw x13, 88(x17)
    lw x16, 16(x18)
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    fence
    jalr x0, x29

load_share:
    lw x1, 4(x19)
    lw x2, (x19)
    lw x3, 4(x20)
    lw x4, (x20)
    lw x5, 4(x21)
    lw x6, (x21)
    lw x7, 4(x22)
    lw x8, (x22)
    lw x9, 4(x23)
    lw x10, (x23)
    jalr x0, x29


store_share:
    sw x2, (x19)
    sw x1, 4(x19)
    sw x0, (x0)
    sw x4, (x20)
    sw x3, 4(x20)
    sw x0, (x0)
    sw x6, (x21)
    sw x5, 4(x21)
    sw x0, (x0)
    sw x8, (x22)
    sw x7, 4(x22)
    sw x0, (x0)
    sw x10, (x23)
    sw x9, 4(x23)
    lw x0, (x0)
    fence
    jalr x0, x29

store_data:
    fence
    sw x0, (x17)
    sw x0, 24(x17)
    sw x0, 64(x17)
    sw x0, 88(x17)
    sw x0, (x18)

    sw x0, 8(x17)
    sw x0, 32(x17)
    sw x0, 72(x17)
    sw x0, 96(x17)
    sw x0, 8(x18)
    
    sw x0, 8(x17)
    sw x0, 40(x17)
    sw x0, 80(x17)
    sw x0, 104(x17)
    sw x0, 16(x18)
    fence
    sw x23, (x17)
    sw x24, 24(x17)
    sw x25, 64(x17)
    sw x26, 88(x17)
    sw x27, (x18)
    addi x17, x17, 8
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    sw x0, (x0)
    fence
    sw x10, (x17)
    sw x0, (x0)
    sw x28, 24(x17)
    sw x0, (x0)
    sw x1, 64(x17)
    sw x0, (x0)
    sw x13, 88(x17)
    sw x4, 8(x18)
    addi x17, x17, 8
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    sw x0, (x0)
    fence
    sw x9, (x17)
    sw x0, (x0)
    sw x7, 24(x17)
    sw x0, (x0)
    sw x12, 64(x17)
    sw x0, (x0)
    sw x8, 88(x17)
    sw x0, (x0)
    sw x2, 16(x18)
    fence 
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    lw x0, (x0)
    sw x0, (x0)
    fence
    jalr x0, x29


sbox:


    and x0, x0, x0
    and x0, x0, x0

xor x4, x4, x16 #b
    xor x16, x16, x13#b
    xor x3, x3, x15
    xor x15, x15, x12
    xor x9, x9, x6

    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0

    not x17, x6
    xor x10, x10, x7 #b
    and x19, x17, x9
    and x18, x6, x10
    and x20, x7, x9
    xor x21, x3, x19
    xor x22, x18, x20
    xor x23, x21, x22 # a0o
    and x0, x0, x0 # alignment

    not x17, x9
    and x18, x9, x13
    and x19, x17, x12
    and x20, x10, x12
    xor x21, x6, x19
    xor x22, x18, x20
    xor x24, x21, x22 # b0o
    xor x24, x24, x23

    and x0, x0, x0 # alignment

    not x17, x12
    and x18, x12, x16
    and x19, x17, x15
    and x20, x13, x15
    xor x21, x9, x19
    xor x22, x18, x20
    xor x25, x21, x22 # c0o
    and x0, x0, x0 # alignment

    not x17, x15
    and x18, x15, x4
    and x19, x17, x3
    and x20, x16, x3
    xor x21, x12, x19
    xor x22, x18, x20
    xor x26, x21, x22 # d0o
    xor x26, x26, x25
    not x25, x25
    and x0, x0, x0 # alignment

    not x17, x3
    and x18, x3, x7
    and x19, x17, x6
    and x20, x4, x6
    xor x21, x15, x19
    xor x22, x18, x20
    xor x27, x21, x22 # e0o
    xor x23, x23, x27
    and x0, x0, x0 # alignment

    ##########################
    and x21, x0, x0
    and x22, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    xor x2, x2, x14 #b
    xor x14, x14, x11 #b
    xor x8, x8, x5 #b

    not x17, x10
    and x18, x10, x11
    and x19, x17, x13
    and x20, x8, x13
    xor x21, x7, x19
    xor x22, x18, x20
    xor x28, x21, x22 # b1o
    and x0, x0, x0 # alignment

    not x17, x13
    and x18, x13, x14
    and x19, x17, x16
    and x20, x11, x16
    xor x21, x10, x19
    xor x22, x18, x20
    xor x1, x21, x22 # c1o
    and x0, x0, x0 # alignment

    not x17, x7
    and x18, x7, x8
    and x19, x17, x10
    and x20, x5, x10
    xor x21, x4, x19
    xor x22, x18, x20
    xor x10, x21, x22 # a1o
    xor x28, x28, x10

    and x0, x0, x0 # alignment

    not x17, x16
    and x18, x16, x2
    and x19, x17, x4
    and x20, x14, x4
    xor x21, x13, x19
    xor x22, x18, x20
    xor x13, x21, x22 # d1o
    xor x13, x13, x1
    and x0, x0, x0 # alignment

    not x17, x4
    and x18, x4, x5
    and x19, x17, x7
    and x20, x2, x7
    xor x21, x16, x19
    xor x22, x18, x20
    xor x4, x21, x22 # e1o
    xor x10, x10, x4
    and x0, x0, x0 # alignment
    ##########################

    and x21, x0, x0
    and x22, x0, x0
    and x20, x0, x0
    and x19, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0

    not x17, x8
    and x18, x8, x12
    and x19, x17, x11
    and x20, x9, x11
    xor x21, x5, x19
    xor x22, x18, x20
    xor x7, x21, x22 # b20

    and x0, x0, x0 # alignment

    not x17, x5
    and x18, x5, x9
    and x19, x17, x8
    and x20, x6, x8
    xor x21, x2, x19
    xor x22, x18, x20
    xor x9, x21, x22 # a20

    and x0, x0, x0 # alignment

    not x17, x11
    and x18, x11, x15
    and x19, x17, x14
    and x20, x12, x14
    xor x21, x8, x19
    xor x22, x18, x20
    xor x12, x21, x22 # c2o
    and x0, x0, x0 # alignment

    not x17, x14
    and x18, x14, x3
    and x19, x17, x2
    and x20, x15, x2
    xor x21, x11, x19
    xor x22, x18, x20
    xor x8, x21, x22 # d2o
    xor x8, x8, x12
    and x0, x0, x0 # alignment

    not x17, x2
    and x18, x2, x6
    and x19, x17, x5
    and x20, x3, x5
    xor x21, x14, x19
    xor x22, x18, x20
    xor x2, x21, x22 # e2o
    xor x7, x7, x9
    xor x9, x9, x2
    and x0, x0, x0 # alignment

    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    and x0, x0, x0
    jalr x0, x29