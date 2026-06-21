"""
Find the SIMPLEST concrete (x,y,z) in S Q where P1 conclusion fails, z allowed to be
a 2-basis sum (zero-divisor-like).  x,y basis singletons; z = e_i+e_j.
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
def basisS(i):
    v=[Fr(0)]*16; v[i]=Fr(1)
    def build(vs):
        if len(vs)==1: return vs[0]
        h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
    return build(v)
def Nrm(z): return S.mul(z,S.star(z))[0]
def bilin(x,y): return S.add(S.mul(x,S.star(y)), S.mul(y,S.star(x)))[0]
def eqO(a,b): return flat(a)==flat(b)
B=[basisS(i) for i in range(16)]
best=None
for zi,zj in itertools.combinations(range(16),2):
  z=S.add(B[zi],B[zj])
  for i in range(16):
    x=B[i]
    for j in range(16):
      y=B[j]
      L=bilin(S.mul(x,z),S.mul(y,z)); R=O.mul(bilin(x,y),Nrm(z))
      if not eqO(L,R):
        fl=flat(L); fr=flat(R)
        d=sum(1 for a,b in zip(fl,fr) if a!=b)
        cand=(d,i,j,zi,zj,fl,fr)
        if best is None or cand[0]<best[0]: best=cand
  if best and best[0]<=2 and zi>2: break
if best:
    d,i,j,zi,zj,fl,fr=best
    print(f"SIMPLEST P1 failure: x=e{i} y=e{j} z=e{zi}+e{zj}  (differ in {d} O-coords)")
    print(f"  bilin(xz,yz)     = {[int(v) for v in fl]}")
    print(f"  bilin(x,y)*Nrm z = {[int(v) for v in fr]}")
    print(f"  base-proj: L={int(fl[0])}  R={int(fr[0])}")
else:
    print("none found")
