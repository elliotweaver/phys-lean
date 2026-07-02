#!/usr/bin/env python3
"""
N253 SELECT — CLEAN confirmatory probe of the candidate theory-native target:

  The gather charge operator Q = crossOp u1 (fundamental 7) is NOT contained in
  the image of the weak-isospin su(2) acting on ImO. WITNESS (convention-free,
  rank/kernel fact, NO normalization): the su(2)-singlet e4 = kappaO(1) is
  annihilated by the ENTIRE embedded weak-isospin su(2) (innerDeriv hI/hJ/hK),
  yet Q e4 = e5 != 0.  Hence electric charge is NOT exhausted by weak isospin:
  a residual U(1) (hypercharge) is forced by the gather. DIRECTION/EXISTENCE only,
  NOT the coupling normalization (which stays open, the repeated-deferral).
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
e4 = (h_zero, ((F(1),F(0)),(F(0),F(0))))   # kappaO(1) = <0, 1_H>
print("e4 coords:", o_to_vec(e4), " == E[4]?", o_to_vec(e4)==o_to_vec(E[4]))

print("\n=== the ENTIRE weak-isospin su(2) annihilates e4 (the su(2)-singlet, N190) ===")
for name,P in [("innerDeriv hI",hI),("innerDeriv hJ",hJ),("innerDeriv hK",hK)]:
    val=o_to_vec(innerDeriv(P,e4))
    print(f"  {name}(e4) = {val}  -> zero? {all(x==0 for x in val)}")

print("\n=== but the gather charge operator MOVES e4 ===")
qe4=o_to_vec(octCrossO(u1,e4))
print(f"  Q(e4) = crossOp u1 (e4) = {qe4}  -> nonzero? {any(x!=0 for x in qe4)}  (== e5? {qe4==o_to_vec(E[5])})")

print("\n=== CONCLUSION: Q moves the su(2)-singlet that all of isospin fixes ===")
print("  => Q is NOT in span{imRep(innerDeriv hI/hJ/hK)} (every su(2) elt fixes e4, Q does not)")
print("  => electric charge is not exhausted by weak isospin: hypercharge forced, convention-free.")

# Extra: confirm this is genuinely about the SINGLET, and that Q's action there is
# the SAME complex structure as elsewhere (uniform ±i) -> the singlet is a charged state.
print("\n=== Q^2 on e4 (should be -e4, the complex structure => e4 is a charged eigen-plane) ===")
q2e4=o_to_vec(octCrossO(u1,octCrossO(u1,e4)))
print(f"  Q^2(e4) = {q2e4}  (== -e4? {q2e4==[(-x) for x in o_to_vec(e4)]})")

# Independence dimension: dim span of {Q, imRep hI, imRep hJ, imRep hK} as operators on ImO
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def flat(A): return [x for r in A for x in r]
mats=[mat(lambda x: octCrossO(u1,x)), mat(lambda x:innerDeriv(hI,x)),
      mat(lambda x:innerDeriv(hJ,x)), mat(lambda x:innerDeriv(hK,x))]
rows=[flat(m) for m in mats]
def rank_rows(rows):
    R=[r[:] for r in rows]; n=len(R); m=len(R[0]); rk=0
    for c in range(m):
        piv=next((i for i in range(rk,n) if R[i][c]!=0),None)
        if piv is None: continue
        R[rk],R[piv]=R[piv],R[rk]; pv=R[rk][c]; R[rk]=[x/pv for x in R[rk]]
        for i in range(n):
            if i!=rk and R[i][c]!=0:
                f=R[i][c]; R[i]=[R[i][j]-f*R[rk][j] for j in range(m)]
        rk+=1
    return rk
print("\n dim span{Q, imRep hI, hJ, hK} as operators on ImO:", rank_rows(rows), " (4 => Q independent of su(2))")
