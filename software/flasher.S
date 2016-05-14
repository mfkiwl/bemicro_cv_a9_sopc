
#define IO_BASE     0x11000000
#define IN_WORD_0   0x0
#define IN_WORD_1   0x4
#define OUT_WORD_0  0x8
#define OUT_WORD_1  0xc

#define LOOP_DELAY  1000000

start:
        l.movhi r0, 0
        l.movhi r4, hi(IO_BASE)
        l.movhi r3, 0xffff
        l.ori   r3, r3, 0xffff
        l.movhi r5, 0
        
lp2:    l.xor   r5, r5, r3
        l.sw    OUT_WORD_0(r4), r5

        /* Loop delay */
        l.movhi r2, hi(LOOP_DELAY)
        l.ori r2, r2, lo(LOOP_DELAY)
lp1:    l.sfeqi r2, 0
        l.bnf lp1
        l.addi r2, r2, -1

        l.sfeqi r0, 0
        l.bf lp2
        l.nop

