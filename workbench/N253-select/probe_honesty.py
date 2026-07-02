#!/usr/bin/env python3
"""
N253 SELECT — final honesty checks before fixing the target.

CHECK A: is B(A,B)=tr(A o B) on the fundamental 7 g2-INVARIANT? (needed to call the ratio
         'convention-free / frame-independent'). Test B([D,A],B)+B(A,[D,B]) == 0 for the g2 gen D=imRep DI etc.
CHECK B: does the ratio 3:8 depend on WHICH isospin generator (DI vs DJ vs DK) or WHICH charge
         normalization? Q is fully fixed (crossOp u1, u1 forced unique N252). Isospin Cartan DI fixed.
         Report B(Q,Q):B(DI,DI) and also compare to the g2-Killing form N204 value.
CHECK C: the DANGER — 3/8 = SU(5) sin^2(theta_W). We must NOT claim we derived sin^2 theta_W.
         What we HAVE: a convention-free invariant-length ratio |Q|^2:|T3|^2 = 3:8 of two forced
         so(7) elements. Whether that EQUALS the physical weak mixing angle is a SEPARATE, downstream,
         and much harder claim (needs the coupling/ full generation embedding). Scope honestly.
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
E=[basis(i) for i in range(8)]; ImO=list(range(1,8))
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
u1=(hI,h_zero)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
Q=mat(lambda x: octCrossO(u1,x)); TI=mat(lambda x:innerDeriv(hI,x))
TJ=mat(lambda x:innerDeriv(hJ,x)); TK=mat(lambda x:innerDeriv(hK,x))
def mm(A,B): return [[sum(A[i][k]*B[k][j] for k in range(7)) for j in range(7)] for i in range(7)]
def sub(A,B): return [[A[i][j]-B[i][j] for j in range(7)] for i in range(7)]
def comm(A,B): return sub(mm(A,B),mm(B,A))
def tr(A): return sum(A[i][i] for i in range(7))
def Bf(A,B): return tr(mm(A,B))

print("CHECK A — g2-invariance of B(A,B)=tr(AB): B([D,A],B)+B(A,[D,B]) should be 0")
for Dn,D in [("DI",TI),("DJ",TJ),("DK",TK)]:
    for An,A in [("Q",Q)]:
        for Bn,B in [("Q",Q),("TI",TI)]:
            val=Bf(comm(D,A),B)+Bf(A,comm(D,B))
            print(f"  D={Dn} B([D,{An}],{Bn})+B({An},[D,{Bn}]) = {val}")

print("\nCHECK B — the forced ratio (Q fully fixed, isospin Cartan DI fixed):")
print(f"  B(Q,Q)={Bf(Q,Q)}  B(DI,DI)={Bf(TI,TI)}  ratio={F(Bf(Q,Q),Bf(TI,TI))}")
print(f"  same for DJ,DK: B(DJ,DJ)={Bf(TJ,TJ)} B(DK,DK)={Bf(TK,TK)} (isotropic => ratio frame-indep within su(2))")
print(f"  B(Q,DI)={Bf(Q,TI)} B(Q,DJ)={Bf(Q,TJ)} B(Q,DK)={Bf(Q,TK)}  (orthogonality to the whole su(2)?)")

print("\nCHECK C — SCOPE. The convention-free datum is |Q|^2:|T3|^2 = 3:8 in the fundamental-7 form.")
print("  This is NOT a claim that 3/8 = physical sin^2(theta_W). It is the invariant-length ratio of")
print("  two forced so(7) elements (gather charge vs isospin Cartan). The physical mixing angle")
print("  identification is a SEPARATE downstream node (needs coupling/embedding). Note-not-claim.")
