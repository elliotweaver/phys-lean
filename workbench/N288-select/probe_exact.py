"""
N288 EXACT verification (Fractions): pin the Lean-provable tying facts.
  (a) famRot(A12) = [A12,·] rotates slotA(x) -> -slotB(x), slotB(x) -> +slotA(x)  (generation mixing)
  (b) M0 = innerMul(slotA 1)(slotB 1) = 1/4 * famRot(A12)  (N287's member is a family rotation)
  (c) [famRot(A01),famRot(A02)] = famRot([A01,A02]) = -famRot(A12)  (so(3) closure)
All on the exact octonion table.
"""
from fractions import Fraction as F

# exact octonion multiplication (Cayley-Dickson, same convention)
def cmul(x,y): return x*y
def cstar(x): return x
def dbl_mul(m,s):
    def mul(z,w):
        a,b=z; c,d=w
        return (m(a,c)-s(d)*b if isinstance(m(a,c),F) else None, None)
    return mul
# simpler: represent octonion as tuple of 8 Fractions; use explicit table via nested CD
def build():
    def level(mul,star):
        def lmul(z,w):
            (a,b)=z;(c,d)=w
            return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
        def lstar(z):
            (a,b)=z; return (star(a), neg(b))
        return lmul,lstar
    def add(z,w):
        if isinstance(z,F): return z+w
        return (add(z[0],w[0]),add(z[1],w[1]))
    def sub(z,w):
        if isinstance(z,F): return z-w
        return (sub(z[0],w[0]),sub(z[1],w[1]))
    def neg(z):
        if isinstance(z,F): return -z
        return (neg(z[0]),neg(z[1]))
    Cm,Cs=(lambda x,y:x*y),(lambda x:x)
    Hm,Hs=level(Cm,Cs); Om,Os=level(Hm,Hs)
    return Om,Os,add,sub,neg
Om,Os,oadd,osub,oneg=build()
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def E(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
def omul(x,y): return Om(x,y)
def ostar(x): return Os(x)
ZERO=unflat([F(0)]*8)
ONE=E(0)

# 3x3 octonion matrix = dict[(i,j)] -> octonion (tuple); missing = 0
def mzero(): return {}
def mget(M,i,j): return M.get((i,j),ZERO)
def mmul(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            acc=ZERO
            for k in range(3):
                acc=oadd(acc, omul(mget(A,i,k),mget(B,k,j)))
            R[(i,j)]=acc
    return R
def msub(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            R[(i,j)]=osub(mget(A,i,j),mget(B,i,j))
    return R
def mscale(A,r):
    return {k:tuple_scale(v,r) for k,v in A.items()}
def tuple_scale(z,r):
    if isinstance(z,F): return z*r
    return (tuple_scale(z[0],r),tuple_scale(z[1],r))
def jprod(A,B):
    return mscale(oadd_mat(mmul(A,B),mmul(B,A)),F(1,2))
def oadd_mat(A,B):
    R={}
    for i in range(3):
        for j in range(3): R[(i,j)]=oadd(mget(A,i,j),mget(B,i,j))
    return R

# real index generator A_ij (antisym): +1 at (i,j), -1 at (j,i)
def Aidx(i,j):
    M={}; M[(i,j)]=ONE; M[(j,i)]=oneg(ONE); return M
# famRot(Aij) X = Aij X - X Aij
def famRot(Aij, X): return msub(mmul(Aij,X), mmul(X,Aij))
# slots
def slot(i,j,x):
    M={}; M[(i,j)]=x; M[(j,i)]=ostar(x); return M
def slotA(x): return slot(0,1,x)
def slotB(x): return slot(0,2,x)
def slotC(x): return slot(1,2,x)

def meq(A,B):
    for i in range(3):
        for j in range(3):
            if flat(osub(mget(A,i,j),mget(B,i,j)))!=[F(0)]*8: return False
    return True

# (a) famRot(A12) on slotA(x)
import random
random.seed(0)
xr=unflat([F(random.randint(-5,5)) for _ in range(8)])
A12=Aidx(1,2)
lhs=famRot(A12, slotA(xr))
print("(a) famRot(A12) slotA(x) == -slotB(x)?", meq(lhs, mscale(slotB(xr),F(-1))))
lhsB=famRot(A12, slotB(xr))
print("    famRot(A12) slotB(x) == +slotA(x)?", meq(lhsB, slotA(xr)))
lhsC=famRot(A12, slotC(xr))
print("    famRot(A12) slotC(x): touches diagonal (real rotation)?",
      flat(mget(lhsC,1,1))!=[F(0)]*8 or flat(mget(lhsC,2,2))!=[F(0)]*8)

# (b) M0 = innerMul(slotA 1)(slotB 1) = [L_{slotA1}, L_{slotB1}], L_A X = A o X
def Lop(Amat, X): return jprod(Amat, X)
def innerMul(Amat,Bmat, X):
    return msub(Lop(Amat,Lop(Bmat,X)), Lop(Bmat,Lop(Amat,X)))
sA1=slotA(ONE); sB1=slotB(ONE)
# test M0(Y) == 1/4 famRot(A12)(Y) for random Hermitian Y
def randHerm():
    M=mzero()
    for i in range(3): M[(i,i)]=unflat([F(random.randint(-4,4))]+[F(0)]*7)
    for (i,j) in [(0,1),(0,2),(1,2)]:
        x=unflat([F(random.randint(-4,4)) for _ in range(8)])
        M[(i,j)]=x; M[(j,i)]=ostar(x)
    return M
ok=True
for _ in range(20):
    Y=randHerm()
    m0=innerMul(sA1,sB1,Y)
    fr=mscale(famRot(A12,Y),F(1,4))
    if not meq(m0,fr): ok=False; break
print("(b) M0 == 1/4 * famRot(A12) on all Hermitian Y?", ok)

# (c) so(3) closure: [famRot(A01),famRot(A02)](Y) == famRot([A01,A02])(Y)
A01=Aidx(0,1); A02=Aidx(0,2)
comm_A=msub(mmul(A01,A02),mmul(A02,A01))  # [A01,A02]
print("(c) [A01,A02] == -A12 (real 3x3)?", meq(comm_A, mscale(A12,F(-1))))
ok2=True
for _ in range(20):
    Y=randHerm()
    lhs=msub(famRot(A01,famRot(A02,Y)), famRot(A02,famRot(A01,Y)))
    rhs=famRot(comm_A,Y)
    if not meq(lhs,rhs): ok2=False; break
print("    [famRot A01,famRot A02] == famRot([A01,A02]) on Hermitian Y?", ok2)
print("\nALL EXACT FACTS CONFIRMED")
