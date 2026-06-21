"""
Fast pick: a SINGLE concrete (x,y,z) in S Q where P1's conclusion
  bilin(xz,yz) = bilin(x,y)*Nrm z   FAILS (full O comparison).
Search only basis singletons for x,y,z (16^3=4096), full O compare.
"""
from fractions import Fraction as Fr

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
for i in range(16):
 for j in range(16):
  for k in range(16):
    x,y,z=B[i],B[j],B[k]
    L=bilin(S.mul(x,z),S.mul(y,z))
    R=O.mul(bilin(x,y),Nrm(z))
    if not eqO(L,R):
        print(f"FOUND: x=e{i} y=e{j} z=e{k}")
        print(f"  bilin(xz,yz) = {[int(v) for v in flat(L)]}")
        print(f"  bilin(x,y)*Nrm z = {[int(v) for v in flat(R)]}")
        print(f"  base-proj: L={int(flat(L)[0])} R={int(flat(R)[0])}")
        import sys; sys.exit(0)
print("NO basis-singleton P1 failure found")
