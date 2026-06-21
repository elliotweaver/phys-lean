from fractions import Fraction as Fr
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,(K.zero,K.zero),(K.one,K.zero),2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flatten(z):
    if isinstance(z,Fr): return [z]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def basis(K,i):
    v=[Fr(0)]*K.dim; v[i]=Fr(1); return build(v)
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def iota(K,a): return (a, K.zero[0])
# scaling defect L(x,y)=x*(star x*y)-iota(Nrm x)*y, find simplest basis witness on S
def L(K,x,y): return K.sub(K.mul(x,K.mul(K.star(x),y)), K.mul(iota(K,Nrm(K,x)),y))
print("dim S =",S.dim)
found=[]
for i in range(S.dim):
    for j in range(S.dim):
        x=basis(S,i); y=basis(S,j)
        d=L(S,x,y)
        nz=[(k,c) for k,c in enumerate(flatten(d)) if c!=0]
        if nz:
            found.append((i,j,nz))
# simplest (fewest nonzero coords)
found.sort(key=lambda t:len(t[2]))
print("simplest single-basis-pair scaling-law failures on S:")
for i,j,nz in found[:5]:
    print(f"  x=e{i}, y=e{j}:  L has nonzero coords {nz}")
# Also give the full LHS.im vs RHS structure for the simplest, for Lean costume
i,j,nz=found[0]
x=basis(S,i); y=basis(S,j)
lhs=S.mul(x,S.mul(S.star(x),y)); rhs=S.mul(iota(S,Nrm(S,x)),y)
print(f"\nWITNESS x=e{i}, y=e{j}:")
print("  LHS = x*(star x*y) flat:", flatten(lhs))
print("  RHS = iota(Nrm x)*y flat:", flatten(rhs))
print("  first differing coord:", next(k for k,(a,b) in enumerate(zip(flatten(lhs),flatten(rhs))) if a!=b))
