"""
N2d-hard-backward — find the EXACT identity that, under Nrm-multiplicativity on
CD A (= CD(CD B)), forces the inner associator [ia, ib, e2]_{CD B} to vanish
(which by banked iota_iota_e2_assoc_iff == B commutative).

Concrete: B = H (assoc, NON-comm), A = CD B = O, CD A = S.  Here B IS non-commutative
so Nrm is NOT mult on S -- we use this concrete setting to DISCOVER the algebraic
identity linking an outer alternative-law / Nrm defect to the inner [.,.,e2] associator.

We compute, in CD A = S, the LEFT/RIGHT alternative defects and full associators of
elements built from iota_A(alpha) (alpha in A=O) and E2 (= e2 of S), and check which
equal iota_A( [inner associator in A] ) or surface a base commutator.
"""
from fractions import Fraction as Fr
import random

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
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def rnd(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flat(u),flat(v)))

# A = O ; CD A = S
A=O
def iotaA(alpha): return (alpha, A.zero)   # iota_A : A -> S
E2=(A.zero, A.one)                          # e2 of S
def AS(K,X,Y,Z): return K.sub(K.mul(K.mul(X,Y),Z), K.mul(X,K.mul(Y,Z)))

# inner: B = H, A = CD B = O.  ia,ib = iota_B a, iota_B b in A=O ; e2A = e2 of O.
B=H
def iotaB(a): return (a, B.zero)            # iota_B : H -> O
e2A=(B.zero, B.one)                         # e2 of O  (in A)
def innerAssoc(a,b):  # [iota_B a, iota_B b, e2A] in A=O  (==B-commutator carrier)
    return AS(A, iotaB(a), iotaB(b), e2A)

random.seed(7)
a=rnd(B); b=rnd(B)        # a,b in H (non-commuting generally)
ia=iotaB(a); ib=iotaB(b)  # in A=O
inner=innerAssoc(a,b)     # in A=O ; nonzero iff a,b don't commute (banked iff)
comm=B.sub(B.mul(a,b),B.mul(b,a))
print("a,b in H; [a,b] nonzero:", not eq(B,comm,B.zero))
print("inner assoc [ia,ib,e2A]_O nonzero:", not eq(A,inner,A.zero))

# Now search S-level expressions surfacing iotaA(inner)
targets={'iotaA(inner)':iotaA(inner)}
def match(D, target, K=S):
    ft=flat(target); fd=flat(D)
    ks=set()
    for x,y in zip(fd,ft):
        if y==0:
            if x!=0: return None
        else: ks.add(x/y)
    if len(ks)==1:
        k=ks.pop(); return k if k!=0 else None
    return None

# pool of S elements from iotaA(ia), iotaA(ib), E2, products
IA=iotaA(ia); IB=iotaA(ib)
IAe2=S.mul(IA,E2); IBe2=S.mul(IB,E2)
pool={'IA':IA,'IB':IB,'E2':E2,'IAe2':IAe2,'IBe2':IBe2,
      'IA+E2':S.add(IA,E2),'IB+E2':S.add(IB,E2)}
keys=list(pool)
print("\n=== S-associators [X,Y,Z] == iotaA(k*inner) ? ===")
hits=[]
for X in keys:
 for Y in keys:
  for Z in keys:
    D=AS(S,pool[X],pool[Y],pool[Z])
    if eq(S,D,S.zero): continue
    k=match(D, iotaA(inner))
    if k is not None: hits.append((X,Y,Z,k)); print(f"  [{X},{Y},{Z}] == iotaA({k}*inner)")
print(f"clean: {len(hits)}")

# left-alt L(x,y)=(xx)y - x(xy) ; right Rt(x,y)=(yx)x - y(xx); surfacing iotaA(inner)
def L(x,y): return S.sub(S.mul(S.mul(x,x),y), S.mul(x,S.mul(x,y)))
def Rt(x,y): return S.sub(S.mul(S.mul(y,x),x), S.mul(y,S.mul(x,x)))
print("\n=== left/right alt defects == iotaA(k*inner) ? ===")
hits2=[]
for X in keys:
 for Y in keys:
   for tag,D in (("L",L(pool[X],pool[Y])),("Rt",Rt(pool[X],pool[Y]))):
     if eq(S,D,S.zero): continue
     k=match(D, iotaA(inner))
     if k is not None: hits2.append((tag,X,Y,k)); print(f"  {tag}({X},{Y}) == iotaA({k}*inner)")
print(f"clean: {len(hits2)}")
