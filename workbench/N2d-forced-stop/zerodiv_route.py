"""
N2d-hard-backward — THE ZERO-DIVISOR route (most theory-native; leverages banked
zero_divisor_breaks_composition directly).

BANKED: zero_divisor_breaks_composition: x*y=0 with Nrm x, Nrm y != 0  ==>  Nrm(xy) != Nrm x Nrm y.
NEED (generic): A non-associative  ==>  CD A has a zero divisor with nondegenerate norms.

Classical Cayley-Dickson fact: if A is alternative but NOT associative (e.g. O), then in
CD A there are zero divisors. The cleanest construction from a non-associating triple:
given a,b in A with the associator nonzero against e2 (i.e. (ab)e2 != a(be2) in CD A,
which by banked iota_iota_e2_assoc_iff means a*b != b*a in... no, that's for CD A assoc).

Let me find the EXPLICIT uniform zero divisor in CD A built from a non-commuting/non-assoc
pair, over the concrete tower A=O, CD A=S, and check the construction is uniform &
expressible from base data. THEN check if x*y=0 reduces to the base associator/structure.

We test the ansatz family: x = iota(u) + iota(v)*e2 ; y = iota(w) + iota(t)*e2  in CD A,
searching over base units u,v,w,t in O for x*y=0 with Nrm x,Nrm y != 0, and report the
pattern (which is the generic witness form).
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
def flatten(z):
    if isinstance(z,(Fr,int)): return [Fr(z)]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def Ob(k):
    v=[Fr(0)]*8; v[k]=Fr(1); return build(v)
def is0(z): return all(x==0 for x in flatten(z))

A=O; CDA=S
def iota(u): return (u,A.zero)        # A -> CD A
e2=(A.zero,A.one)
def Nrm(z): return CDA.mul(z,CDA.star(z))[0]
def Nrm0(z): return all(x==0 for x in flatten(Nrm(z)))

# the standard sedenion zero divisor: (e_i + e_j) where indices pair O-units with the new gen.
# Search ansatz x = iota(u) + (iota v)*e2, y = iota(w) + (iota t)*e2, u,v,w,t in basis units.
units=[Ob(k) for k in range(8)]   # e0..e7 of O (e0=1)
def mk(u,v): return CDA.add(iota(u), CDA.mul(iota(v),e2))
found=[]
for ui in range(8):
  for vi in range(8):
    x=mk(units[ui],units[vi])
    if is0(x) or Nrm0(x): continue
    for wi in range(8):
      for ti in range(8):
        y=mk(units[wi],units[ti])
        if is0(y) or Nrm0(y): continue
        if is0(CDA.mul(x,y)):
            found.append((ui,vi,wi,ti))
print(f"zero divisors x=iota(e{{u}})+iota(e{{v}})e2, y=iota(e{{w}})+iota(e{{t}})e2: {len(found)}")
for u,v,w,t in found[:20]:
    print(f"  x=e{u}+e{v}*e2  y=e{w}+e{t}*e2")
# the relation among (u,v,w,t): characterize
if found:
    print("\nrelations (does (u,v,w,t) encode a non-associating triple?):")
    for u,v,w,t in found[:8]:
        # associator of the three base units e_u,e_v,e_w in O
        assoc=O.sub(O.mul(O.mul(units[u],units[v]),units[w]), O.mul(units[u],O.mul(units[v],units[w])))
        print(f"  (u,v,w,t)=({u},{v},{w},{t})  assoc(e{u},e{v},e{w})!=0: {not is0(assoc)}")
