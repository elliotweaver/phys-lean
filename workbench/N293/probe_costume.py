"""
N293 costume — find a clean coordinate certificate for the closure ⁅kAB,kBC⁆=famB.
famB = innerMul(slotC 1)(slotA 1). Its action on a witness: famB(slotA 1) = ? (rotation).
Pick the witness + coordinate where famB gives a clean ±1 that ties to the closure.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,flat,innerMul_apply,DIM,m2v,comm_cols,Lmul,innerMul,unflat)
def op_apply(cols,M):
    v=m2v(M); res=[F(0)]*DIM
    for k in range(DIM):
        if v[k]!=0:
            for r in range(DIM): res[r]+=v[k]*cols[k][r]
    # unflatten to 3x3x8
    Mout=M0(); idx=0
    for i in range(3):
        for j in range(3):
            Mout[i][j]=unflat(res[idx:idx+8]); idx+=8
    return Mout
kAB=innerMul(sA(u1),sB(one)); kBC=innerMul(sB(u1),sC(one))
famB=innerMul(sC(one),sA(one))
brkt=comm_cols(kAB,kBC)
# famB(slotA 1) and ⁅kAB,kBC⁆(slotA 1)
for wit_name,wit in [("slotA 1",sA(one)),("slotB 1",sB(one)),("slotC 1",sC(one))]:
    fb=op_apply(famB,wit)
    bk=op_apply(brkt,wit)
    # show nonzero entries
    def nz(M):
        return {(i,j):flat(M[i][j]) for i in range(3) for j in range(3) if any(x!=0 for x in flat(M[i][j]))}
    print(f"famB({wit_name}) nz:",nz(fb))
    print(f"⁅kAB,kBC⁆({wit_name}) nz:",nz(bk), " (match famB?)", nz(fb)==nz(bk))
    print()
# best certificate: famB(slotA 1)=slotC 1? famB=innerMul(slotC1)(slotA1); by N289 famB(slotA a)=slotC a
# so famB(slotA 1) has (1,2)=1. coordinate ((⁅kAB,kBC⁆(slotA 1)) 1 2).re.re.re = 1.
fb=op_apply(famB,sA(one))
print("famB(slotA 1) (1,2) entry:",flat(fb[1][2]), "-> .re.re.re =",flat(fb[1][2])[0])
