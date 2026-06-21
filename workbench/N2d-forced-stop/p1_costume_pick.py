"""
N2d-hard-backward — pick a CONCRETE S Q witness where P1's conclusion FAILS, for the
anti-vacuity costume C13.  P1: bilin(xz,yz) = bilin(x,y)*Nrm z  REQUIRES Nrm mult.
Over S=CD(O Q) (Nrm NOT mult) it should FAIL.  bilin/Nrm valued in A=O Q; project
with .re.re.re.re? No: A=O Q, an O-element; project base scalar via .re.re.re.
We compute LHS=bilin(xz,yz), RHS=bilin(x,y)*Nrm z in A=O Q and project both fully to Q,
seeking simple witnesses with small DIFFERENT integer projections.
"""
from fractions import Fraction as Fr
import itertools

class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,Z,one,2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flat(z):
    if isinstance(z,Fr): return [z]
    return flat(z[0])+flat(z[1])
def basisS(i):  # i-th basis vector of S (16-dim)
    v=[Fr(0)]*16; v[i]=Fr(1)
    def build(vs):
        if len(vs)==1: return vs[0]
        h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
    return build(v)
def projO(a):  # O element -> Q  (base scalar .re.re.re)
    return flat(a)[0]
def Nrm(z): return S.mul(z,S.star(z))[0]    # in O
def bilin(x,y): return S.add(S.mul(x,S.star(y)), S.mul(y,S.star(x)))[0]  # in O
def eqO(a,b): return all(x==y for x,y in zip(flat(a),flat(b)))

# search simple witnesses, comparing FULL O-elements (not just projected scalar)
singles=[(basisS(i),f'e{i}') for i in range(16)]
# also a few 2-element sums
sums=[]
for i,j in itertools.combinations(range(8),2):
    sums.append((S.add(basisS(i),basisS(j)),f'e{i}+e{j}'))
pool=singles+sums
found=[]
for (x,xn) in pool:
 for (y,yn) in pool:
  for (z,zn) in pool:
    L=bilin(S.mul(x,z),S.mul(y,z))      # O element
    R=O.mul(bilin(x,y),Nrm(z))          # O element
    if not eqO(L,R):
        # measure how different (term count) + projected scalars
        fl=flat(L); fr=flat(R)
        diff=sum(1 for a,b in zip(fl,fr) if a!=b)
        found.append((diff,xn,yn,zn,projO(L),projO(R),fl,fr))
found.sort()
print("simplest P1-FAILURE witnesses over S Q (FULL O comparison):")
for d,xn,yn,zn,Lp,Rp,fl,fr in found[:8]:
    print(f"  x={xn:7s} y={yn:7s} z={zn:7s}: differ in {d} O-coords; base-proj L={Lp} R={Rp}")
print(f"total P1 failures (full): {len(found)}")
# print the very simplest one's full vectors
if found:
    d,xn,yn,zn,Lp,Rp,fl,fr=found[0]
    print(f"\nsimplest: x={xn} y={yn} z={zn}")
    print(f"  LHS bilin(xz,yz) O-coords: {[int(v) for v in fl]}")
    print(f"  RHS bilin(x,y)Nrm z O-coords: {[int(v) for v in fr]}")
