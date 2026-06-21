"""
N2d-hard-backward — THE STRUCTURED TOWER witness (return to the trunk).

The bare-ring span test FAILED (no linear extraction) -- that is the DRIFT (a bare
*-ring is more general than the cascade). THE ONE LAW: return to the trunk. The
cascade base carries CENTRAL self-overlap (Born positivity), and its non-associativity
has ONE cause: the complex unit a != star a (iota_e2_comm_iff / iota_iota_e2_assoc_iff).

Setup matching the banked forward half exactly:
  B = free COMMUTATIVE *-ring on one generator a (star a = A; a,A commute freely).
  M = CD B           (associative; non-commutative iff a != A, by iota_e2_comm_iff)
  A_alg = CD M = CD(CD B)   (non-associative iff M non-commutative, iff a != A)
  Top = CD A_alg = CD(CD(CD B))   (the 'sedenion' level)

Forward (banked Nrm_mul_of_doubled_base, B commutative): Nrm mult on CD(CD B)=CD M=A_alg.
Backward (THIS node): A_alg = CD M non-associative ==> Nrm NOT mult on CD A_alg = Top.
We search a UNIFORM witness x,y over Top whose defect (in A_alg) has a flat coordinate
equal to a clean nonzero multiple of (a - A) -- so defect=0 forces a=A forces M comm
forces A_alg associative. Then a=A is the SINGLE CAUSE, exactly J vs star J.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# B = free commutative *-ring on a (and A=star a). Monomials: (i,j) = a^i A^j, commutative.
def E(d): return {m:v for m,v in d.items() if v}
def badd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def bneg(x): return {m:-v for m,v in x.items()}
def bsub(x,y): return badd(x,bneg(y))
def bmul(x,y):
    r=defaultdict(Fr)
    for (i1,j1),c1 in x.items():
        for (i2,j2),c2 in y.items():
            r[(i1+i2,j1+j2)]+=c1*c2
    return E(dict(r))
def bstar(x):
    # star a = A: swaps exponents (a^i A^j)* = A^i a^j = a^j A^i
    r=defaultdict(Fr)
    for (i,j),c in x.items(): r[(j,i)]+=c
    return E(dict(r))
BZ={}; bOne={(0,0):Fr(1)}; ba={(1,0):Fr(1)}; bA={(0,1):Fr(1)}
diff=bsub(ba,bA)   # a - A, the single cause

# generic CD over a *-structure given (add,neg,mul,star,zero,one)
class Ring:
    def __init__(s,add,neg,mul,star,zero,one,is0):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star; s.zero=zero; s.one=one; s.is0=is0
    def sub(s,x,y): return s.add(x,s.neg(y))

def make_CD(R):
    Z=(R.zero,R.zero)
    def add(z,w): return (R.add(z[0],w[0]),R.add(z[1],w[1]))
    def neg(z): return (R.neg(z[0]),R.neg(z[1]))
    def sub(z,w): return add(z,neg(w))
    def mul(z,w):
        a,b=z;c,d=w
        return (R.sub(R.mul(a,c),R.mul(R.star(d),b)), R.add(R.mul(d,a),R.mul(b,R.star(c))))
    def star(z): return (R.star(z[0]),R.neg(z[1]))
    def is0(z): return R.is0(z[0]) and R.is0(z[1])
    one=(R.one,R.zero)
    return Ring(add,neg,mul,star,Z,one,is0)

Bring=Ring(badd,bneg,bmul,bstar,BZ,bOne,lambda x:not E(x))
M=make_CD(Bring)          # M = CD B
Aalg=make_CD(M)           # A_alg = CD M = CD(CD B)
Top=make_CD(Aalg)         # Top = CD A_alg

def Nrm(u): return Top.mul(u,Top.star(u))[0]   # element of A_alg
def defect(x,y): return Aalg.sub(Nrm(Top.mul(x,y)), Aalg.mul(Nrm(x),Nrm(y)))

# flatten an A_alg element to flat B-coords: A_alg = ((Bpair),(Bpair)) => 4 B-polys
def flat_Aalg(z):
    # z in A_alg = CD M; z=(m0,m1), each m in M=CD B = (b,b)
    (m0,m1)=z
    return [m0[0],m0[1],m1[0],m1[1]]
def is_pm_diff(poly):
    """return lam if poly == lam*(a-A) exactly else None"""
    if not E(poly): return None
    ca=poly.get((1,0),Fr(0)); cA=poly.get((0,1),Fr(0))
    rem={m:v for m,v in poly.items() if m not in ((1,0),(0,1))}
    if rem: return None
    if ca==-cA and ca!=0: return ca
    return None

# build elements of Top from sparse base data. Base building blocks in A_alg:
# embed a in B -> M -> A_alg ; e2 of M, e2 of A_alg, 1's.
def iB_to_M(b): return (b, BZ)          # iota: B->M
def iM_to_A(m): return (m, M.zero)      # iota: M->A_alg
e2M=(BZ,bOne)                            # e2 in M
e2A=(M.zero,(bOne,BZ))                   # e2 in A_alg ; 1_M=(bOne,BZ)
def iA_to_T(z): return (z, Aalg.zero)    # iota: A_alg->Top
e2T=(Aalg.zero,(M.zero[0] if False else (bOne,BZ), M.zero))  # 1_M=(bOne,BZ); e2_T=(0,(1_M,0))... careful
# 1 of A_alg = (1_M, 0_M) = ((bOne,BZ),(BZ,BZ)); e2 of Top = (0_A, 1_A)
oneA=( (bOne,BZ), (BZ,BZ) )
e2T=(Aalg.zero, oneA)

# A_alg elements pool (sparse, built from a single base element a and generators)
ia=iM_to_A(iB_to_M(ba))           # iota_M(iota_B a) : the embedded a in A_alg
iiae2=Aalg.mul(ia, (M.zero,(bOne,BZ)) if False else iM_to_A(e2M))  # not needed precisely
poolA={
  '0':Aalg.zero,'1':oneA,
  'a':ia,
  'ae2M':iM_to_A(M.mul(iB_to_M(ba),e2M)),   # iota_M( (iota_B a)*e2_M )
  'e2A':e2A,
  'a*':Aalg.star(ia),
}
# Top elements = (re,im) with re,im in poolA
keysA=list(poolA.keys())
def mkT(r,i): return (poolA[r],poolA[i])

hits=[]
for r in keysA:
  for i in keysA:
    x=mkT(r,i)
    if Top.is0(x): continue
    for r2 in keysA:
      for i2 in keysA:
        y=mkT(r2,i2)
        if Top.is0(y): continue
        d=defect(x,y)
        if Aalg.is0(d): continue
        for ci,poly in enumerate(flat_Aalg(d)):
            lam=is_pm_diff(poly)
            if lam is not None:
                hits.append(((r,i),(r2,i2),ci,lam,d))
print(f"witnesses with a flat coord = lam*(a-A): {len(hits)}")
seen=set()
for xf,yf,ci,lam,d in hits:
    key=(xf,yf)
    if key in seen: continue
    seen.add(key)
    print(f"  x=<{xf[0]}|{xf[1]}> y=<{yf[0]}|{yf[1]}>  coord{ci} = {lam}*(a-A)")
    if len(seen)>=25: break
