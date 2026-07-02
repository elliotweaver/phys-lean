#!/usr/bin/env python3
"""
N253 SELECT probe v2 — CORRECT banked su(2): the N187 embedded weak-isospin
generators are the COMPONENTWISE H-adjoint on O = CD(H):
   innerDeriv P : <a,b> |-> <ad_P a, ad_P b>,  ad_P a = P*a - a*P in H.
Check the real relationship between chargeOp = crossOp u1 (gather) and the
banked su(2) = <innerDeriv hI, hJ, hK> (doubling).
"""
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
ImO_idx=list(range(1,8))

# H units
hI=((F(0),F(1)),(F(0),F(0)))   # <J,0> in H  -> oct e1 via iotaO
hJ=((F(0),F(0)),(F(1),F(0)))   # <0,1> in H  -> oct e2
hK=h_mul(hI,hJ)                # -> oct e3
u1=(hI, h_zero)                # iotaO(hI) = oct e1

# --- banked componentwise su(2): innerDeriv P acts on O=<a,b> as <ad_P a, ad_P b>
def ad_H(P, a):  # P*a - a*P in H
    return h_add(h_mul(P,a), h_neg(h_mul(a,P)))
def innerDeriv(P_H, x_oct):
    a,b = x_oct
    return (ad_H(P_H,a), ad_H(P_H,b))

def mat_on_ImO(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO_idx):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO_idx): A[ic][jc]=out[i]
    return A

def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b):
    return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))

chargeM = mat_on_ImO(lambda x: octCrossO(u1,x))
TI = mat_on_ImO(lambda x: innerDeriv(hI,x))
TJ = mat_on_ImO(lambda x: innerDeriv(hJ,x))
TK = mat_on_ImO(lambda x: innerDeriv(hK,x))

def matmul(A,B):
    return [[sum(A[r][t]*B[t][c] for t in range(len(B))) for c in range(len(B[0]))] for r in range(len(A))]
def matsub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def matscale(A,s): return [[s*x for x in r] for r in A]
def comm(A,B): return matsub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def eq(A,B): return iszero(matsub(A,B))

print("u1 == e1 == iotaO(hI):", o_to_vec(u1)==o_to_vec(E[1]))
print("\n=== chargeOp = crossOp u1 (columns e1..e7) ===")
for r in chargeM: print("  ",[int(x) for x in r])
print("\n=== T_I = innerDeriv hI (banked su(2) Cartan candidate) ===")
for r in TI: print("  ",[int(x) for x in r])

print("\n=== commutation of chargeOp with the banked su(2) generators ===")
print("  [chargeOp, T_I(hI)] == 0 ?", iszero(comm(chargeM,TI)))
print("  [chargeOp, T_J(hJ)] == 0 ?", iszero(comm(chargeM,TJ)))
print("  [chargeOp, T_K(hK)] == 0 ?", iszero(comm(chargeM,TK)))

print("\n=== is chargeOp a scalar multiple of T_I? (same axis, different operator?) ===")
print("  chargeOp == T_I ?", eq(chargeM,TI))
print("  chargeOp == (1/2)T_I ?", eq(chargeM,matscale(TI,F(1,2))))
print("  chargeOp == 2 T_I ?", eq(chargeM,matscale(TI,2)))
# find scalar if proportional: compare first nonzero entries
def proportional(A,B):
    s=None
    for r in range(7):
        for c in range(7):
            if B[r][c]!=0:
                cand=A[r][c]/B[r][c]
                if s is None: s=cand
                elif cand!=s: return (False,None)
            elif A[r][c]!=0:
                return (False,None)
    return (True,s)
print("  chargeOp proportional to T_I?", proportional(chargeM,TI))

print("\n=== T_I^2, chargeOp^2 (both complex structures on the 6-dim complement?) ===")
TI2=matmul(TI,TI); CM2=matmul(chargeM,chargeM)
print("  T_I^2 diag:", [TI2[i][i] for i in range(7)])
print("  chargeOp^2 diag:", [CM2[i][i] for i in range(7)])

print("\n=== the TWO operators on the SAME axis u1: crossOp u1 vs innerDeriv u1 ===")
print("  Are they equal?", eq(chargeM,TI), " proportional?", proportional(chargeM,TI))
print("  [crossOp u1, innerDeriv hI] == 0 ?", iszero(comm(chargeM,TI)))
# rank of each
def rank(A):
    import copy
    M=[row[:] for row in A]; n=len(M); m=len(M[0]); r=0
    for c in range(m):
        piv=None
        for i in range(r,n):
            if M[i][c]!=0: piv=i;break
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]
        pv=M[r][c]
        M[r]=[x/pv for x in M[r]]
        for i in range(n):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(m)]
        r+=1
    return r
print("  rank(chargeOp)=",rank(chargeM)," rank(T_I)=",rank(TI))
