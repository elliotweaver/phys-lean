"""
N2d-hard — PRECISE forward hypothesis check.

Claim: over an ASSOCIATIVE *-ring A where for every a the self-overlap σ(a)=a·star(a)
is CENTRAL and equals star(a)·a, the norm Nrm is multiplicative on CD A.

Verify symbolically: free ASSOCIATIVE *-ring (flat monomials). Compute the 12-term
defect D. Then reduce using the rewrite system:
  - centrality: a self-overlap block (g g*) or (g* g) commutes with everything -> we
    canonicalize by allowing it to move to a fixed position;
  - symmetry: g g* = g* g;
  - DERIVED base composition: (uv)(uv)* = (u u*)(v v*) i.e. for products too.
We test by BRUTE numeric substitution into the symplectic-2x2 algebra (assoc, central)
that D==0, AND that dropping centrality (transpose-2x2) makes D!=0. Already shown in
min_hypothesis. Here: extract the EXACT cancellation so I can mirror it in Lean.

Strategy for Lean: D = sum of 12 monomials. Pair them using star-anti-mult + assoc to
write each as (self-overlap)·(stuff) or use the identity. Print the pairing.
"""
from collections import defaultdict

# flat associative monomials, factor=(k,conj)
def gen(k): return {((k,False),):1}
def aadd(x,y):
    r=defaultdict(int,x)
    for m,c in y.items():
        r[m]+=c
        if r[m]==0: del r[m]
    return dict(r)
def aneg(x): return {m:-c for m,c in x.items()}
def asub(x,y): return aadd(x,aneg(y))
def amul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            r[mx+my]+=cx*cy
            if r[mx+my]==0: del r[mx+my]
    return dict(r)
def sfac(f): return (f[0],not f[1])
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm=tuple(sfac(f) for f in reversed(m)); r[sm]+=c
        if r[sm]==0: del r[sm]
    return dict(r)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)),aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z;return aadd(amul(a,astar(a)),amul(astar(b),b))
def D_of(x,y): return asub(Nrm(cd_mul(x,y)),amul(Nrm(x),Nrm(y)))
a,b,c,d=gen(0),gen(1),gen(2),gen(3)
def fmt(m): return ''.join(f"{'*' if f[1] else ''}{chr(97+f[0])}" for f in m) if m else "1"

# The 12-term D from x=(a,b),y=(c,d):
D=D_of((a,b),(c,d))
print("D (12 terms):")
for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
    print(f"   {co:+d} {fmt(m)}")

# Nrm(x)Nrm(y) = (a a* + b* b)(c c* + d* d). Nrm(xy): xy=(ac - d* b, d a + b c*).
# Let me instead VERIFY the cancellation grouping:
# Group A: terms with self-overlap (a a*) factor central:
#   from Nrm(x)Nrm(y): -(a a*)(c c*), -(a a*)(d* d), -(b* b)(c c*), -(b* b)(d* d)
#   from Nrm(xy) = (ac-d*b)(ac-d*b)* + (da+bc*)*(da+bc*)
#     re-part self-overlap: (ac-d*b)(c*a* - b* d) 
#       = ac c* a* - ac b* d - d* b c* a* + d* b b* d
#     im-part: (a* d* + c b*)(da+bc*)
#       = a* d* d a + a* d* b c* + c b* d a + c b* b c*
print("\nGrouping (associative+central self-overlaps):")
print("  ac c* a*  =(assoc) a (c c*) a* =(central) (c c*)(a a*)  cancels -(a a*)(c c*)")
print("  d* b b* d =(assoc) d* (b b*) d =(central) (b b*)(d* d); need b b*=b* b (sym) -> (b* b)(d* d) cancels -(b* b)(d* d)")
print("  a* d* d a =(assoc) a*(d* d)a =(central)(d* d)(a* a)=(sym)(a a*)(d* d) cancels -(a a*)(d* d)")
print("  c b* b c* =(assoc) c(b* b)c* =(central)(b* b)(c c*); need c c*=c* c? -> cancels -(b* b)(c c*)")
print("  REMAINING cross terms: -ac b* d - d* b c* a* + a* d* b c* + c b* d a")
# verify these 4 cross terms sum to zero under associativity+central+symmetric? They don't pairwise obviously.
print("\n  The 4 cross terms — do they cancel? test numerically on symplectic 2x2 (assoc+central):")

from fractions import Fraction as Fr
import random
def mmul(A,B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def madd(A,B): return tuple(tuple(A[i][j]+B[i][j] for j in range(2)) for i in range(2))
def mneg(A): return tuple(tuple(-A[i][j] for j in range(2)) for i in range(2))
def mstar(A): return ((A[1][1],-A[0][1]),(-A[1][0],A[0][0]))  # symplectic
def mrand(): return tuple(tuple(Fr(random.randint(-3,3)) for _ in range(2)) for _ in range(2))
def cross(a,b,c,d):
    # -a c b* d - d* b c* a* + a* d* b c* + c b* d a
    t1=mneg(mmul(mmul(mmul(a,c),mstar(b)),d))
    t2=mneg(mmul(mmul(mmul(mstar(d),b),mstar(c)),mstar(a)))
    t3=mmul(mmul(mmul(mstar(a),mstar(d)),b),mstar(c))
    t4=mmul(mmul(mmul(c,mstar(b)),d),a)
    return madd(madd(t1,t2),madd(t3,t4))
mzero=((Fr(0),Fr(0)),(Fr(0),Fr(0)))
fails=sum(1 for _ in range(500) if cross(mrand(),mrand(),mrand(),mrand())!=mzero)
print(f"   4 cross terms sum != 0 in {fails}/500 symplectic samples")
