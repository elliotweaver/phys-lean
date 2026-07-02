#!/usr/bin/env python3
"""
N253 SELECT — THE CRUX TEST (anti-bullshit / THE ONE LAW / repeated-deferral dissolution):

The hypercharge NORMALIZATION has been deferred >=5 times for "no convention-free anchor
inside the rank-2 g2". REFRAME: Q=crossOp u1 (7-summand) and isospin T3=innerDeriv hI
(14=g2-summand) BOTH live in the ambient so(7)=14+7 (N225), which is SIMPLE. A simple Lie
algebra has a UNIQUE invariant bilinear form up to overall scale => RATIOS of so(7) trace-form
values on Q and T3 are CONVENTION-FREE (independent of the arbitrary overall scale).

If B_so7(Q,Q) : B_so7(T3,T3) : B_so7(Q,T3) are clean rationals, the relative normalization the
field must IMPORT from a GUT embedding is DERIVED here from the ambient simple so(7). Test it.
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
Q=mat(lambda x: octCrossO(u1,x))
TI=mat(lambda x: innerDeriv(hI,x))
TJ=mat(lambda x: innerDeriv(hJ,x))
TK=mat(lambda x: innerDeriv(hK,x))
def tr_prod(A,B): return sum(A[i][k]*B[k][i] for i in range(7) for k in range(7))
def Bform(A,B): return tr_prod(A,B)  # so(7) trace form (unique up to scale on simple so(7))

print("=== so(7) trace-form B(A,B)=tr(AB) on Q (charge, 7-summand) and isospin (14-summand) ===")
BQQ=Bform(Q,Q); BTT=Bform(TI,TI); BQT=Bform(Q,TI)
print(f"  B(Q,Q)   = {BQQ}")
print(f"  B(T3,T3) = {BTT}   (T3=innerDeriv hI)")
print(f"  B(Q,T3)  = {BQT}")
print(f"  RATIO B(Q,Q)/B(T3,T3) = {F(BQQ,BTT)}   (convention-free: so(7) is simple)")
print(f"  B(Q,T3)=0 => Q, T3 ORTHOGONAL in the so(7) form: {BQT==0}")

# All three isospin Gram in so(7) form:
print("\n=== isospin Gram in so(7) trace form (compare N204's g2 form B=-16) ===")
for n,A in [("TI",TI),("TJ",TJ),("TK",TK)]:
    print(f"  B({n},{n}) = {Bform(A,A)}")
print("  B(TI,TJ)=",Bform(TI,TJ)," B(TJ,TK)=",Bform(TJ,TK)," B(TK,TI)=",Bform(TK,TI))

# The convention-free weak-mixing-type ratio.
# In the canonical (single invariant form) normalization, define the properly-normalized
# charge/isospin and read the mixing.  The key number: |Q|^2 / |T3|^2 in the so(7) form.
print("\n=== THE CONVENTION-FREE RATIO (dissolves the repeated hypercharge deferral?) ===")
print(f"  |Q|^2_so7 : |T3|^2_so7  =  {BQQ} : {BTT}  =  {F(BQQ,BTT)}")
# a candidate sin^2 theta = |Q_hypercharge-part|^2/(|Q|^2+...) — but Q here is total charge.
# We instead report the raw invariant ratio; the physics reading is a downstream step.

# CRITICAL HONESTY CHECK: is B(Q,Q) computed on the SAME footing as B(T3,T3)?
# Both Q and TI are genuine elements of so(7) (skew wrt Born). Verify skew:
def is_skew(A): return all(A[i][j]==-A[j][i] for i in range(7) for j in range(7))
print("\n  Q skew(in so(7))? ", is_skew(Q), "  T3 skew? ", is_skew(TI))
print("  => both bona-fide so(7) elements; the trace-form ratio is a single-form invariant.")

# Also: does Q lie OUTSIDE g2 (confirming the field's 'no g2 anchor')? and inside so(7)?
# We know from N246 chargeOp not in g2. Here just re-report Q^2 vs a g2 element to show different summand.
print("\n  (context) Q^2 trace:", tr_prod(Q,Q), " T3^2 trace:", tr_prod(TI,TI))
