"""
N293 — is KAB=[slotA u1,slotB 1] itself a slot matrix? And what is the octonion-associativity
requirement for innerMul(slotA u1)(slotB 1)=adE(KAB)? Characterize KAB,KBC,KCA,KfA,KfB,KfC exactly.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,flat,unflat)
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))
def named(v):
    names=['1','u1','u2','u3','u4','u5','u6','u7']
    terms=[f"{v[i]}*{names[i]}" for i in range(8) if v[i]!=0]
    return "+".join(terms) if terms else "0"
def showmat(K,nm):
    print(f"  {nm}:")
    for i in range(3):
        print("    ", [named(flat(K[i][j])) for j in range(3)])

KAB=mcomm(sA(u1),sB(one))
KBC=mcomm(sB(u1),sC(one))
KCA=mcomm(sC(u1),sA(one))
KfA=mcomm(sB(one),sC(one))
KfB=mcomm(sC(one),sA(one))
KfC=mcomm(sA(one),sB(one))
showmat(KAB,"KAB=[slotA u1,slotB 1]")
showmat(KBC,"KBC=[slotB u1,slotC 1]")
showmat(KCA,"KCA=[slotC u1,slotA 1]")
showmat(KfA,"KfA=[slotB 1,slotC 1]")
showmat(KfB,"KfB=[slotC 1,slotA 1]")
showmat(KfC,"KfC=[slotA 1,slotB 1]")

# Is KAB a slot? slotC(d): (1,2)=d,(2,1)=star d, rest 0.
def is_slotC(K):
    d=K[1][2]
    return all(flat(K[i][j])==[F(0)]*8 for i in range(3) for j in range(3) if (i,j) not in [(1,2),(2,1)]) and flat(K[2][1])==flat(ostar(d))
print("KAB is slotC(d)?", is_slotC(KAB), " d=",named(flat(KAB[1][2])))
print("KfB is slotB(d)?", all(flat(KfB[i][j])==[F(0)]*8 for i in range(3) for j in range(3) if (i,j) not in [(0,2),(2,0)]), " d=",named(flat(KfB[0][2])))
