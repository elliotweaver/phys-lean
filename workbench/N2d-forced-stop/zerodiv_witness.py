"""
N2d-hard-backward — THE TRUNK ROUTE: a GENERIC ZERO DIVISOR in CD(CD B) from a
non-commuting pair p,q in B (return to "one fact, both terminations", the banked
trunk structure of the sedenion stop).

If x*y = 0 in CD(CD B) with Nrm(x), Nrm(y) NON-degenerate, then
  Nrm(x*y) = Nrm(0) = 0   but   Nrm(x)*Nrm(y) != 0,
so Nrm is NOT multiplicative -- exactly zero_divisor_breaks_composition, generalized.

Search: over concrete quaternions B=H (the first non-commutative cascade base),
find a UNIFORM x = x(p,q), y = y(p,q) in CD(CD B) = sedenions, built from a
non-commuting pair p,q, with x*y = 0 and Nrm(x),Nrm(y) != 0. Then lift to generic B.
"""
from fractions import Fraction as Fr
import itertools, random

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
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)   # dims 2,4,8,16
def flatten(z):
    if isinstance(z,(Fr,int)): return [Fr(z)]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def Hbasis(k):
    v=[Fr(0)]*4; v[k]=Fr(1); return build(v)
# B = H. CD(CD B) = CD(CD H) = CD O = S. p,q in H noncommuting: e.g. i=e1, j=e2.
# Build elements of S from H-data. S element = nested depth-4 = 16 coords.
# We embed via the tower: H -> O = CD H -> S = CD O.
def iO(h): return (h, H.zero)       # H -> O (iota)
def iS(o): return (o, O.zero)       # O -> S (iota)
e2O=(H.zero,H.one)                   # e2 of O
e2S=(O.zero,O.one)                   # e2 of S
# Nrm on S = (z * star z).re  (element of O)
def Nrm(z): return S.mul(z,S.star(z))[0]
def Sflat(z): return flatten(z)
def is0S(z): return all(v==0 for v in Sflat(z))
def is0O(o): return all(v==0 for v in flatten(o))

p=Hbasis(1); q=Hbasis(2)   # i, j : noncommuting in H
# building blocks in S from p,q:
ip=iS(iO(p)); iq=iS(iO(q))            # iota_S(iota_O p)
pe2O=iS(O.mul(iO(p),e2O))             # iota_S( (iota_O p) * e2_O )
qe2O=iS(O.mul(iO(q),e2O))
blocks={'0':S.zero,'ip':ip,'iq':iq,'pe2':pe2O,'qe2':qe2O,'e2S':e2S,
        'ipe2S':S.mul(ip,e2S),'iqe2S':S.mul(iq,e2S),
        'pe2e2S':S.mul(pe2O,e2S),'qe2e2S':S.mul(qe2O,e2S)}
bk=list(blocks.keys())
# search x = sum of <=2 blocks, y = sum of <=2 blocks, x*y=0, Nrm!=0
def combos():
    out=[]
    for b in bk:
        if b=='0': continue
        out.append((b,))
    for b1,b2 in itertools.combinations([b for b in bk if b!='0'],2):
        out.append((b1,b2))
    return out
cs=combos()
def elt(c):
    z=S.zero
    for b in c: z=S.add(z,blocks[b])
    return z
print(f"candidate elements: {len(cs)}")
found=[]
for cx in cs:
    x=elt(cx)
    if is0S(x): continue
    nx=Nrm(x)
    if is0O(nx): continue
    for cy in cs:
        y=elt(cy)
        if is0S(y): continue
        ny=Nrm(y)
        if is0O(ny): continue
        if is0S(S.mul(x,y)):
            found.append((cx,cy))
print(f"zero-divisor witnesses x*y=0 with Nrm(x),Nrm(y)!=0: {len(found)}")
for cx,cy in found[:20]:
    print(f"  x={'+'.join(cx)}  y={'+'.join(cy)}")
