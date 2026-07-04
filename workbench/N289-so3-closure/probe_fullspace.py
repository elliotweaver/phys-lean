"""
N289 CRUX: is ⁅FC,FA⁆=FB a FULL-SPACE End identity, or only on the Hermitian subspace?
Test on an arbitrary NON-Hermitian matrix X (all 9 octonion entries free & independent).
If full-space: the coord-bash is the only literal route; the Hermitian spanning set is INSUFFICIENT.
If Hermitian-only: the theory-native statement is the action on the Jordan algebra H3(O),
and LinearMap.ext-on-slots would need a restriction-to-Hermitian framing.
"""
from fractions import Fraction as F
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)),add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
Cx=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cx); Ol=make_level(*Hl); O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
ZERO=unflat([F(0)]*8); ONE=unflat([F(1)]+[F(0)]*7)
def ostar(x): return O_star(x)
def mget(M,i,j): return M.get((i,j),ZERO)
def mmul(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            acc=ZERO
            for k in range(3): acc=O_add(acc,O_mul(mget(A,i,k),mget(B,k,j)))
            R[(i,j)]=acc
    return R
def madd(A,B): return {(i,j):O_add(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def msub(A,B): return {(i,j):O_sub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)
def FA(X): return innerMul(sB1,sC1,X)
def FB(X): return innerMul(sC1,sA1,X)
def FC(X): return innerMul(sA1,sB1,X)
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
def br(f,g): return lambda X: msub(f(g(X)),g(f(X)))
BR=br(FC,FA)

import random; random.seed(42)
def randO(): return unflat([F(random.randint(-5,5)) for _ in range(8)])
# arbitrary FULL matrix (9 independent octonion entries, NON-Hermitian)
def randfull():
    return {(i,j):randO() for i in range(3) for j in range(3)}
allok=True
for t in range(6):
    X=randfull()
    ok=iszero(msub(BR(X),FB(X)))
    if not ok: allok=False
    print(f"  full random X #{t}: [FC,FA]X == FB X ?", ok)
print("FULL-SPACE identity holds on arbitrary non-Hermitian matrices?", allok)
