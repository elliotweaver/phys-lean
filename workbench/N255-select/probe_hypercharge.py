#!/usr/bin/env python3
"""
N255 SELECT probe — ground the theory-native next beat AFTER N254 (forced second neutral direction).

N254 banked: chargeOp=crossOp u1 (Q) and imRep DI (T3) form a rank-2 abelian torus of so(7) with
MISALIGNED gradings of the 7, joint kernel span{u1}. A SECOND neutral direction is FORCED.

The deep theory-native question: is there a CANONICAL/DERIVED hypercharge Y? In the SM, Y is the UNIQUE
(up to scale) generator commuting with ALL of su(2)_L (a separate factor), while Q,T3 do NOT commute
with T1,T2. So:

 (Q1) Which derived neutral operators COMMUTE with the FULL weak isospin su(2)_L = {DI,DJ,DK}?
      Candidates: chargeOp, imRep DI (=T3), and Cartans of the OTHER commuting su(2) in so(4)⊂g2 (N191).
      Physics predicts: Q and T3 do NOT commute with all of su(2)_L; the hypercharge Y (if present) DOES.
 (Q2) Is g2's so(4)=su(2)_S x su(2)_T structure such that one su(2) = weak isospin and the OTHER
      supplies a commuting Cartan = hypercharge candidate?
 (Q3) The JOINT WEIGHT structure of the 7 under the commuting pair (Q, T3): the 2-planes and their
      (q,t3) eigenvalue pairs = the actual quantum numbers of one generation's 7 = 1 + 3 + 3bar.
 (Q4) If a Y commuting with all su(2)_L exists in span{Q,T3,...}: is Q = a*T3 + b*Y forced, and what
      normalization falls out CONVENTION-FREE (e.g. Y fixed by a canonical property, no free scale)?
"""
from fractions import Fraction as F

# ---- faithful exact-Q octonion model (byte-for-byte the banked CD product) ----
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
u1=(hI,h_zero)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(len(B))) for c in range(len(B[0]))] for r in range(len(A))]
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def add(A,B): return [[A[r][c]+B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def smul(s,A): return [[s*A[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)

def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
def leftImDeriv(Q,x):
    a,b=x; return (h_zero, h_mul(Q,b))
def secondSU2(P,x):
    a,b=x
    return (ad_H(P,a), h_add(ad_H(P,b), h_neg(h_mul(P,b))))

chargeM=mat(lambda x: octCrossO(u1,x))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))
# other su(2) families
LI=mat(lambda x:leftImDeriv(hI,x)); LJ=mat(lambda x:leftImDeriv(hJ,x)); LK=mat(lambda x:leftImDeriv(hK,x))
SI=mat(lambda x:secondSU2(hI,x)); SJ=mat(lambda x:secondSU2(hJ,x)); SK=mat(lambda x:secondSU2(hK,x))

isospin={'DI':DI,'DJ':DJ,'DK':DK}
print("=== (Q1) which operators commute with the FULL weak isospin su(2)_L={DI,DJ,DK} ? ===")
cands={'chargeOp(Q)':chargeM,'DI(T3)':DI,'LI':LI,'LJ':LJ,'LK':LK,'SI':SI,'SJ':SJ,'SK':SK}
for nm,A in cands.items():
    flags={k:iszero(comm(A,B)) for k,B in isospin.items()}
    allc = all(flags.values())
    print(f"  {nm:14s} commutes with DI,DJ,DK = {flags}   ALL={allc}")

print("\n=== does su(2)_L = diagonal {DI,DJ,DK} equal one of the so(4) factors? bracket checks ===")
def bracket_closes(fam):
    A,B,C=fam
    # [A,B] should be +-2C etc (su2); just report the commutators vs 2*third
    return
# check [DI,LI] etc to see which families commute with weak isospin as a WHOLE su(2)
print("  [DI,LI]==0:",iszero(comm(DI,LI)),"  [DJ,LI]==0:",iszero(comm(DJ,LI)),"  [DK,LI]==0:",iszero(comm(DK,LI)))
print("  [DI,SI]==0:",iszero(comm(DI,SI)),"  [DJ,SI]==0:",iszero(comm(DJ,SI)),"  [DK,SI]==0:",iszero(comm(DK,SI)))

# ---- (Q3) joint weight structure of the 7 under commuting pair (Q, T3) ----
# Both skew; work over Q by finding the common invariant 2-planes and the (q,t3) scalar on each
# via the action X^2 = -(scalar)*I on each plane. Compute Q^2 and T3^2.
print("\n=== (Q3) joint spectrum: Q^2 and T3^2 (skew => -sum of squares of weights on invariant planes) ===")
Q2=matmul(chargeM,chargeM); T2=matmul(DI,DI)
def diag(A): return [A[i][i] for i in range(len(A))]
print("  diag(Q^2):",diag(Q2))
print("  diag(T3^2):",diag(T2))
# joint kernel = intersection of kernels
def kernel_dim(A):
    return 7-rank(A)
def rank(A):
    M=[row[:] for row in A]; n=len(M);m=len(M[0]);r=0
    for c in range(m):
        piv=next((i for i in range(r,n) if M[i][c]!=0),None)
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(n):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(m)]
        r+=1
    return r
print("  rank Q =",rank(chargeM)," rank T3 =",rank(DI))

# ---- (Q4) candidate hypercharge Y that commutes with full su(2)_L ----
# If some combination a*Q + b*(something) commutes with DJ,DK too. Search integer combos of the
# operators that individually commute with DI, to find one commuting with DJ,DK as well.
print("\n=== (Q4) search: integer combo of {chargeOp, LI, SI, ...} commuting with ALL of su(2)_L ===")
pool={'Q':chargeM,'DI':DI}
# add any candidate that commutes with DI at least
for nm,A in [('LI',LI),('SI',SI),('LJ',LJ),('LK',LK),('SJ',SJ),('SK',SK)]:
    if iszero(comm(A,DI)): pool[nm]=A
print("  pool (commute with DI):", list(pool.keys()))
# brute small integer search over pool for [.,DJ]=[.,DK]=0 and !=0
import itertools
names=list(pool.keys()); mats=[pool[n] for n in names]
found=[]
rng=[F(k) for k in range(-2,3)]
for coeffs in itertools.product(rng,repeat=len(names)):
    if all(c==0 for c in coeffs): continue
    M=[[F(0)]*7 for _ in range(7)]
    for c,A in zip(coeffs,mats): 
        if c!=0: M=add(M,smul(c,A))
    if iszero(comm(M,DJ)) and iszero(comm(M,DK)) and not iszero(M):
        found.append(coeffs)
# dedup up to scale
def norm_scale(c):
    nz=[x for x in c if x!=0]
    if not nz: return c
    g=nz[0]
    return tuple(x/g for x in c)
seen=set(); uniq=[]
for c in found:
    s=norm_scale(c)
    if s not in seen: seen.add(s); uniq.append(c)
print(f"  found {len(found)} combos, {len(uniq)} up-to-scale, commuting with ALL su(2)_L:")
for c in uniq[:12]:
    print("    ", dict(zip(names,c)))
