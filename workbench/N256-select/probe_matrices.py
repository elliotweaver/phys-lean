#!/usr/bin/env python3
"""Compute Imat, Jmat, Kmat (integer 7x7 matrices of imRep DI/DJ/DK on ImO) from the faithful
model, and confirm Imat matches the BANKED Imat (TowerGatherChargeIsospinRatio.lean lines 80-87).
Also confirm the joint-kernel ⊆ span{e4} coordinate reading for the pair {DI,DJ}."""
from fractions import Fraction as F
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DZ=(F(0),F(0))
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DZ)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)
def o_from_vec(v):
    def dbl(b): return (v[b+0],v[b+1])
    def h(b): return (dbl(b+0),dbl(b+2))
    return (h(0),h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1): v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]
ImO=list(range(1,8))
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
def mat(op):
    A=[[0]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=int(out[i])
    return A
Imat=mat(lambda x:innerDeriv(hI,x)); Jmat=mat(lambda x:innerDeriv(hJ,x)); Kmat=mat(lambda x:innerDeriv(hK,x))
def show(name,M):
    print(f"{name} =")
    for row in M: print("   ", row)
show("Imat",Imat); show("Jmat",Jmat); show("Kmat",Kmat)
banked_Imat=[[0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],[0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]]
print("\nImat matches BANKED Imat?", Imat==banked_Imat)
# joint kernel {DI,DJ}: read which coords are forced 0. e4 -> index 3.
# x in ker Imat AND ker Jmat. Stack rows, find nullspace.
def nullspace(rows):
    nr=len(rows); nc=7; M=[[F(x) for x in r] for r in rows]; piv=[]; r=0
    for c in range(nc):
        p=next((i for i in range(r,nr) if M[i][c]!=0),None)
        if p is None: continue
        M[r],M[p]=M[p],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(nr):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(nc)]
        piv.append(c); r+=1
    free=[c for c in range(nc) if c not in piv]
    return piv,free
piv,free=nullspace(Imat+Jmat)
print("joint ker {DI,DJ}: pivot cols",piv,"free cols",free,"-> 1-dim, free col = index 3 (e4)")
piv3,free3=nullspace(Imat+Jmat+Kmat)
print("joint ker {DI,DJ,DK}: free cols",free3)
